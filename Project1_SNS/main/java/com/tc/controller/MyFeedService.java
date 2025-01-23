package com.tc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tc.model.feedDAO;
import com.tc.model.feedDTO;
import com.tc.model.memberDTO;

@WebServlet("/MyFeedService")
public class MyFeedService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("마이 피드 서비스 들어옴");
		
		HttpSession session = request.getSession();
		feedDAO dao = new feedDAO();
		feedDTO dto = new feedDTO();

		memberDTO mbdto = (memberDTO) session.getAttribute("info");

		dto.setUser_id(mbdto.getUser_id());

		List<feedDTO> myFeedList = dao.myFeedSelect(dto);

		System.out.println("나의 게시글 목록 : " + myFeedList);

		if (myFeedList != null) {
			// 1. session 영역 활용
			session.setAttribute("myFeedList", myFeedList);

			RequestDispatcher rd = request.getRequestDispatcher("MyPage.jsp");
			rd.forward(request, response);

		}
	}

}
