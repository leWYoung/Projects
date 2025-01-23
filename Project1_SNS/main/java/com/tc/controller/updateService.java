package com.tc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tc.model.memberDAO;
import com.tc.model.memberDTO;

@WebServlet("/updateService")
public class updateService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("비밀번호 수정 및 닉네임 수정");
		
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		memberDTO user = (memberDTO) session.getAttribute("info");

		String pw = request.getParameter("newPw");
		String nick = request.getParameter("newNick");
		
		System.out.println("newPw : " + pw);
		System.out.println("newNick : " + nick);

		memberDAO dao = new memberDAO();
		memberDTO dto = new memberDTO();

		dto.setUser_id(user.getUser_id());
		dto.setUser_nick(nick);
		dto.setUser_pw(pw);
		
		int cnt = dao.update(dto);
		
		if(cnt > 0) {
			if(pw == null) {
				dto.setUser_pw(user.getUser_pw());
			}
			
			dto.setUser_id(user.getUser_id());
			
			System.out.println("update dto : " + dto);
			
			memberDTO newUser = dao.updateMember(dto) ;
			
			System.out.println("옴 newUser : " + newUser);
			
			if (newUser != null) {
				session.removeAttribute("info");
				session.setAttribute("info", newUser);
				
				RequestDispatcher rd = request.getRequestDispatcher("MyPage.jsp");
				rd.forward(request, response);
			}
			else {
				System.out.println("수정 실패");
			}
		}
	}
}
