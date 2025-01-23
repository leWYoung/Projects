package com.tc.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.tc.db.SQLSessionManager;

public class chatDAO {
	SqlSessionFactory sqlSessionFactory = SQLSessionManager.getFactory();

	public List<chattingRoomDTO> chattingRoom(chattingRoomDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		List<chattingRoomDTO> chatRoom = sqlSession.selectList("chattingroom", dto);

		sqlSession.close();

		return chatRoom ;
	}
	
	public int creatRoom(chattingRoomDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true) ;
		
		int cnt = sqlSession.insert("creat", dto) ;
	
		System.out.println("성공 여부 : " + cnt);
		
		sqlSession.close();
		
		return cnt;
	}

	public List<chatDTO> chatSelect(chatDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		List<chatDTO> chatList = sqlSession.selectList("chat", dto);

		sqlSession.close();

		return chatList ;
	}
	
	public int chatInsert(chatDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("chatting", dto);

		sqlSession.close();

		return cnt;
	}
}
