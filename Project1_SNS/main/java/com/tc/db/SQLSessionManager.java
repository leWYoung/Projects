package com.tc.db;

import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SQLSessionManager {
	private static SqlSessionFactory sqlSessionFactory;

	static {
		try {
			String resource = "com/tc/db/Mybatis-config.xml";
			// 원하는 경로의 파일을 resource 에 담아줌.
			InputStream inputStream = Resources.getResourceAsStream(resource);
			// resource 를 다시 불러와서 inputStream에 담아줌.
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			// inputStream 을 통해 sqlSessionFactory를 짓겟다.
		} catch (Exception e) {
			// 오류가 발생되면 해당 내용을 출력하는 영역
			e.printStackTrace();
		}
	}

//	해당 클래스의 메소드를 호출하면 결과적으로 만들어진 sqlSessionFactory를 가져갈 수 있는
//	구조가 필요함! => DAO 에서 DB 접근을 위해 SqlSession을 대여/반납을 위한 기능!
//	public 타입 메소드명
	public static SqlSessionFactory getFactory() {
		return sqlSessionFactory;
	}
}
