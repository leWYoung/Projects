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
import com.tc.model.chalDAO;
import com.tc.model.chalDTO;
import com.tc.model.memberDTO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ChalService")
public class ChalService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		1. DAO 생성
		chalDAO dao = new chalDAO();

//		=> DB에서 전체 회원 조회하는 기능
		List<chalDTO> resultChalList = dao.getchal();
		System.out.println("chalDAO에서 가져온 피드 리스트: " + resultChalList);  // 가져온 데이터 전체 출력
		System.out.println("resultChalList 크기: " + resultChalList.size());  // 리스트 크기 출력
		
//		3. request scope 에 전체 회원 정보 담기
		HttpSession session = request.getSession();

		session.setAttribute("resultChalList", resultChalList);
		System.out.println("전체 회원 정보 : " + session.getAttribute("resultChalList"));
		
		RequestDispatcher rd = request.getRequestDispatcher("ChallengePage.jsp");
		rd.forward(request, response);
		

	}
}