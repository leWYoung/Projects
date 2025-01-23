package com.tc.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.tc.db.SQLSessionManager;

public class myPageDAO {

	SqlSessionFactory sqlSessionFactory = SQLSessionManager.getFactory();

	public List<myPageDTO> followerList(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		List<myPageDTO> list = sqlSession.selectList("followerList", user_id);

		sqlSession.close();

		return list;
	}

	public List<myPageDTO> followingList(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		List<myPageDTO> list = sqlSession.selectList("followingList", user_id);

		sqlSession.close();

		return list;
	}

	public myPageDTO followerCnt(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		myPageDTO cnt = sqlSession.selectOne("followercnt", user_id);
		
		sqlSession.close();
		
		return cnt ;
	}
	
	public myPageDTO followingCnt(String user_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		myPageDTO cnt = sqlSession.selectOne("followingcnt", user_id);
		
		sqlSession.close();
		
		return cnt ;
	}
}
