package com.tc.controller;

import javax.servlet.http.HttpSession;
import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.PathParam;
import java.io.IOException;
import java.util.*;

@ServerEndpoint("/chat/{room}/{userId}")
public class Chatting {

	// 방 이름과 해당 방에 있는 클라이언트 세션을 저장하는 Map
	private static Map<String, Set<Session>> rooms = Collections.synchronizedMap(new HashMap<>());
	private static Map<Session, String> userIds = Collections.synchronizedMap(new HashMap<>());

	@OnOpen
	public void onOpen(Session session, @PathParam("room") String roomIdx, @PathParam("userId") String userId)
			throws IOException {
		System.out.println("userId : " + userId);
		// 방이 없으면 새로 생성하고, 세션을 추가
		rooms.computeIfAbsent(roomIdx, k -> Collections.synchronizedSet(new HashSet<>()));
		rooms.get(roomIdx).add(session);

		// 세션과 사용자 ID를 매핑
		userIds.put(session, userId);
	}

	@OnMessage
	public void onMessage(String message, @PathParam("room") String roomIdx, Session session) throws IOException {
		// 세션에 저장된 사용자 ID를 가져옴
		String userId = userIds.get(session);
		// "id: 메시지" 형식으로 메시지를 브로드캐스트
		broadcast(roomIdx, userId + ": " + message);
	}

	@OnError
	public void onError(Session session, Throwable throwable) {
		throwable.printStackTrace();
	}

	// 메시지를 방 내의 모든 클라이언트에게 전송
	private void broadcast(String room, String message) throws IOException {
		Set<Session> roomSessions = rooms.get(room);

		System.out.println("roomSessions" + roomSessions);
		if (roomSessions != null) {
			synchronized (roomSessions) {
				for (Session session : roomSessions) {
					if (session.isOpen()) {
						session.getBasicRemote().sendText(message);
					}
				}
			}
		}
	}

}
