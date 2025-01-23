package com.tc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LogoutService")
public class LogoutService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//		# 로그아웃 -> 세선에 들어있는 데이터 전부 지우기
		
//		1. 세션을 꺼내와서 무효화	
	    request.getSession().invalidate();
	    
	/*	1-1. 세션 꺼내오기
		HttpSession session = request.getSession();
		1-2. 세션 무효화 - 모든 데이터 삭제
		session.invalidae(); */
	    
//		2. main.jsp로 이동
		response.sendRedirect("MainFeedService");
		
	}

}
