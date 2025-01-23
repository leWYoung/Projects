package com.tc.model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.tc.db.SQLSessionManager;

public class memberDAO {
	SqlSessionFactory sqlSessionFactory = SQLSessionManager.getFactory();

	public int join(memberDTO dto) {
		System.out.println("session 확인 : "+sqlSessionFactory);
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("join", dto);

		sqlSession.close();

		return cnt;
	}

	public memberDTO login(memberDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		memberDTO resultDTO = sqlSession.selectOne("login", dto);

		sqlSession.close();

		return resultDTO;
	}
	
	// 닉네임 비밀번호 수정
	public int update(memberDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int result = sqlSession.update("userUpdate", dto) ;
		
		System.out.println("update cnt : " + result);
		
		sqlSession.close();
		
		return result ;
	}
	
	public memberDTO updateMember(memberDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		memberDTO updateMember = sqlSession.selectOne("login", dto);

		sqlSession.close();

		return updateMember;
	}
	
	public int updateImg(memberDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.update("updateImg", dto) ;
		
		sqlSession.close();
		
		return cnt ;
	}
}
