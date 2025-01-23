package com.tc.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.tc.db.SQLSessionManager;

public class chalDAO {

	SqlSessionFactory sqlSessionFactory = SQLSessionManager.getFactory();

//	메인 페이지 피드 
	public List<chalDTO> chalSelect() {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		List<chalDTO> chalList = sqlSession.selectList("chalSelect");
		sqlSession.close();

		return chalList;
	}

//	피드 상세 페이지
	public List<chalDTO> detailchal() {
		// 1) sqlSession 빌려오기
		SqlSession sqlSession = null;
		List<chalDTO> detailChalList = null; // 리턴할 리스트 변수를 try 밖에서 선언 및 초기화

		// 2) sqlSession 사용하기 (select 여러 개 값)
		try {
			sqlSession = sqlSessionFactory.openSession(true); // 자동 커밋 활성화
			detailChalList = sqlSession.selectList("detailchal"); // "detailchal"는 Mapper XML의 id
		} catch (Exception e) {
			e.printStackTrace(); // 예외 로그 출력
		} finally {
			if (sqlSession != null) {
				System.out.println("연결 성공");
				sqlSession.close(); // SQL 세션 닫기
			}
		}

		// resultList가 null이 아니면 데이터를 반환, 아니면 빈 리스트 반환
		return detailChalList != null ? detailChalList : new ArrayList<chalDTO>();
	}

//	피드 페이지에 값 가져오기
	public List<chalDTO> getchal() {
		// 1) sqlSession 빌려오기
		SqlSession sqlSession = null;
		List<chalDTO> resultChalList = null; // 리턴할 리스트 변수를 try 밖에서 선언 및 초기화

		// 2) sqlSession 사용하기 (select 여러 개 값)
		try {
			sqlSession = sqlSessionFactory.openSession(true); // 자동 커밋 활성화
			resultChalList = sqlSession.selectList("getchal"); // "getchal"는 Mapper XML의 id
		} catch (Exception e) {
			e.printStackTrace(); // 예외 로그 출력
		} finally {
			if (sqlSession != null) {
				System.out.println("연결 성공");
				sqlSession.close(); // SQL 세션 닫기
			}
		}

		// resultList가 null이 아니면 데이터를 반환, 아니면 빈 리스트 반환
		return resultChalList != null ? resultChalList : new ArrayList<chalDTO>();
	}

//	피드 등록
	public int chal_insert(chalDTO dto) {
		SqlSession sqlSession = null;
		int cnt = 0;
		try {
			sqlSession = sqlSessionFactory.openSession(true);
			cnt = sqlSession.insert("upload-chal", dto);
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

	public List<chalDTO> mychalSelect(chalDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		List<chalDTO> mychalList = sqlSession.selectList("mychalSelect", dto);

		sqlSession.close();

		return mychalList;

	}
	public chalDTO getChalDetail(String chal_idx) {
		SqlSession sqlSession = null;
		chalDTO chal = null; // 리턴할 DTO 변수를 초기화

		try

		{
			// SQL 세션을 오픈하여 자동 커밋 모드로 설정 (true)
			sqlSession = sqlSessionFactory.openSession(true);

			// chal_idx가 null이 아닌 경우에만 변환 및 쿼리 실행
			if (chal_idx != null && !chal_idx.isEmpty()) {
				try {
					// chal_idx를 Integer로 변환하여 SQL 쿼리 호출
					int chalIndex = Integer.parseInt(chal_idx);
					chal = sqlSession.selectOne("getChalDetail", chalIndex); // getChalDetail에 정수형 ID 전달
					System.out.println("DAO에서 가져온 chalDetail: " + chal);
				} catch (NumberFormatException e) {
					// Integer로 변환 시 오류 발생 처리
					System.err.println("chal_idx 변환 오류: " + chal_idx + "는 정수형이 아닙니다.");
					e.printStackTrace();
				}
			} else {
				// chal_idx가 null이거나 빈 문자열일 경우
				System.out.println("유효하지 않은 chal_idx: " + chal_idx);
			}
		} catch (Exception e) {
			// 예외 로그 출력
			System.err.println("getChalDetail 메서드 실행 중 예외 발생");
			e.printStackTrace();
		} finally {
			// SQL 세션을 닫아 자원 해제
			if (sqlSession != null) {
				System.out.println("연결 성공, SQL 세션을 닫습니다.");
				sqlSession.close();
			}
		}

		return chal; // 조회한 chalDTO 객체 반환
	}

	// 태그 별로 정렬
	public List<chalDTO> orderBy(String ob) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		List<chalDTO> orderByList = sqlSession.selectList("orderBy", ob);

		sqlSession.close();

		return orderByList;
	}

}
