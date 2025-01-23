package com.tc.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.tc.db.SQLSessionManager;

public class cppDAO {
    SqlSessionFactory sqlSessionFactory = SQLSessionManager.getFactory();

    public void insertPar(cppDTO partChal) {
        SqlSession sqlSession = null;
        try {
            sqlSession = sqlSessionFactory.openSession(true); // 자동 커밋 활성화
            sqlSession.insert("insertPar", partChal); // MyBatis 쿼리 호출
        } catch (Exception e) {
            e.printStackTrace(); // 예외 처리
        } finally {
            if (sqlSession != null) {
                sqlSession.close(); // 세션 닫기
            }
        }
    }
    
	public List<cppDTO> getRank() {
		// 1) sqlSession 빌려오기
		SqlSession sqlSession = null;
		List<cppDTO> resultCppList = null; // 리턴할 리스트 변수를 try 밖에서 선언 및 초기화

		// 2) sqlSession 사용하기 (select 여러 개 값)
		try {
			sqlSession = sqlSessionFactory.openSession(true); // 자동 커밋 활성화
			resultCppList = sqlSession.selectList("getRank"); // "getchal"는 Mapper XML의 id
		} catch (Exception e) {
			e.printStackTrace(); // 예외 로그 출력
		} finally {
			if (sqlSession != null) {
				System.out.println("연결 성공");
				sqlSession.close(); // SQL 세션 닫기
			}
		}

		// resultList가 null이 아니면 데이터를 반환, 아니면 빈 리스트 반환
		return resultCppList != null ? resultCppList : new ArrayList<cppDTO>();
	}
}
