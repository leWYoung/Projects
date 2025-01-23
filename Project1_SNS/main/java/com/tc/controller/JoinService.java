package com.tc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tc.model.memberDAO;
import com.tc.model.memberDTO;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		// id 객체 가져오기
		String id = request.getParameter("id") ;
		// pw 객체 가져오기
		String pw = request.getParameter("pw") ;
		// nick 객체 가져오기
		String nick = request.getParameter("nick") ;
		
		memberDTO dto = new memberDTO() ;			
		memberDAO dao = new memberDAO() ;
		
		dto.setUser_id(id);
		dto.setUser_pw(pw);
		dto.setUser_nick(nick);
		
		int cnt = dao.join(dto);
		
		if(cnt != 0) {
			System.out.println(id + "회원가입 성공!!");
			response.sendRedirect("LoginAndJoinPage.jsp");
		}
		else {
			System.out.println(id + "회원가입 실패");
		}
	}
}
