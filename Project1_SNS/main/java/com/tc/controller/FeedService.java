package com.tc.controller;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.tc.model.memberDAO;
import com.tc.model.feedDAO;
import com.tc.model.feedDTO;
import com.tc.model.memberDTO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/FeedService")
public class FeedService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		1. DAO 생성
		feedDAO dao = new feedDAO();

//		=> DB에서 전체 회원 조회하는 기능
		List<feedDTO> resultList = dao.getFeed();
		System.out.println("DAO에서 가져온 피드 리스트: " + resultList);  // 가져온 데이터 전체 출력
		System.out.println("resultList 크기: " + resultList.size());  // 리스트 크기 출력
		
//		3. request scope 에 전체 회원 정보 담기
		HttpSession session = request.getSession();

		session.setAttribute("resultList", resultList);
		System.out.println("전체 회원 정보 : " + session.getAttribute("resultList"));
		
		RequestDispatcher rd = request.getRequestDispatcher("FeedPage.jsp");
		rd.forward(request, response);
		

	}
}