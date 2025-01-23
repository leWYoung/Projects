package com.tc.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.tc.db.SQLSessionManager;

public class feedDAO {

	SqlSessionFactory sqlSessionFactory = SQLSessionManager.getFactory();

//	메인 페이지 피드 
	public List<feedDTO> feedSelect() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<feedDTO> feedList = sqlSession.selectList("feedSelect");
		sqlSession.close();

		return feedList;
	}

//	피드 페이지에 값 가져오기
	public List<feedDTO> getFeed() {
		// 1) sqlSession 빌려오기
		SqlSession sqlSession = null;
		List<feedDTO> resultList = null; // 리턴할 리스트 변수를 try 밖에서 선언 및 초기화

		// 2) sqlSession 사용하기 (select 여러 개 값)
		try {
			sqlSession = sqlSessionFactory.openSession(true); // 자동 커밋 활성화
			resultList = sqlSession.selectList("getFeed"); // "getFeed"는 Mapper XML의 id
		} catch (Exception e) {
			e.printStackTrace(); // 예외 로그 출력
		} finally {
			if (sqlSession != null) {
				System.out.println("연결 성공");
				sqlSession.close(); // SQL 세션 닫기
			}
		}

		// resultList가 null이 아니면 데이터를 반환, 아니면 빈 리스트 반환
		return resultList != null ? resultList : new ArrayList<feedDTO>();
	}

//	피드 등록
	public int feed_insert(feedDTO dto) {
		SqlSession sqlSession = null;
		int cnt = 0;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			cnt = sqlSession.insert("upload-feed", dto);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 로그 출력
		} finally {
			if (sqlSession != null) {
				System.out.println("연결 성공");
				sqlSession.close();
			}
		}
		return cnt;
	}

	public List<feedDTO> myFeedSelect(feedDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		List<feedDTO> myfeedList = sqlSession.selectList("myFeedSelect", dto) ;
		
		sqlSession.close();
		
		return myfeedList;
	}

	// 특정 챌린지 정보 조회
		public feedDTO getFeedDetail(String feed_idx) {
			SqlSession sqlSession = null;
			feedDTO feed = null; // 리턴할 DTO 변수를 초기화

			try {
				sqlSession = sqlSessionFactory.openSession(true);
				if (feed_idx != null) {
					feed = sqlSession.selectOne("getFeedDetail", Integer.parseInt(feed_idx)); // Integer로 변환
				} else {
					System.out.println("feed_idx is null");
				}
			} catch (NumberFormatException e) {
				e.printStackTrace(); // ID 변환 오류 처리
			} catch (Exception e) {
				e.printStackTrace(); // 예외 로그 출력
			} finally {
				if (sqlSession != null) {
					System.out.println("연결 성공");
					sqlSession.close(); // SQL 세션 닫기
				}
			}

			return feed; // 조회한 chalDTO 객체 반환
		}
}
