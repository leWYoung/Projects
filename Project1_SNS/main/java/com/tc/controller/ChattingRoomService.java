package com.tc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.tc.model.chatDAO;
import com.tc.model.chattingRoomDTO;
import com.tc.model.memberDAO;
import com.tc.model.memberDTO;

/**
 * Servlet implementation class ChattingRoomService
 */
@WebServlet("/ChattingRoomService")
public class ChattingRoomService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ChattingRoomService에 도착");
		
		request.setCharacterEncoding("UTF-8");

		String room_info = request.getParameter("member");
		
		System.out.println("ChattingRoomService member : " + room_info);

		chattingRoomDTO dto = new chattingRoomDTO();
		chatDAO dao = new chatDAO();

		// 세션에서 아이디 꺼내오기
		HttpSession session = request.getSession();
		memberDTO user = (memberDTO) session.getAttribute("info");
		
		System.out.println("ChattingRoomService User_id : " + user.getUser_id());

		dto.setUser_profile(user.getUser_profile());

		if (room_info != null) {
			
			dto.setRoom_info(room_info);
			dto.setUser_id(user.getUser_id());
			
			System.out.println("채팅방 db에 저장하기 전 마지막 테스트 userId : " + dto.getUser_id());
			System.out.println("채팅방 db에 저장하기 전 마지막 테스트 room_info : " + dto.getRoom_info());
			
			int cnt = dao.creatRoom(dto);
			
			if (cnt > 0) {
				System.out.println("채팅방 생성 성공");
			}
			else {
				System.out.println("채팅방 생성 실패");
				
			}
		}

		// dto에 꺼낸 아이디 넣기
		dto.setUser_id(user.getUser_id());
		List<chattingRoomDTO> chatRoom = dao.chattingRoom(dto);

		if (chatRoom != null) {
			request.setAttribute("chatRoom", chatRoom);
			System.out.println("채팅 목록 : " + chatRoom);

			RequestDispatcher rd = request.getRequestDispatcher("ChattingPage.jsp");
			rd.forward(request, response);
		} 
		else {
			response.sendRedirect("ChattingPage.jsp");
		}
		
	}

}
