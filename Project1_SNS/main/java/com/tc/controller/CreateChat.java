package com.tc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tc.model.chatDAO;
import com.tc.model.chatDTO;
import com.tc.model.memberDTO;

@WebServlet("/CreateChat")
public class CreateChat extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		chatDAO dao = new chatDAO();
		chatDTO dto = new chatDTO();

		HttpSession session = request.getSession();
		memberDTO chatter = (memberDTO) session.getAttribute("info");
		String message = request.getParameter("message");
		String roomIdx = request.getParameter("curoom_idx");

		System.out.println("CreatChat roomIdx : " + roomIdx);
		System.out.println("CreatChat userId : " + chatter.getUser_id());

		dto.setRoom_idx(Integer.parseInt(roomIdx));
		dto.setChatter(chatter.getUser_id());
		dto.setChatting(message);

		int cnt = dao.chatInsert(dto);

		response.setCharacterEncoding("UTF-8");
		PrintWriter out =  response.getWriter();
		
		if (cnt > 0) {
			System.out.println("메세지 저장 성공");
			
			// 성공적인 저장 후, 클라이언트에 응답을 보냄
			 response.getWriter().write("메시지 저장 성공");
			
		} else {
			System.out.println("메세지 저장 실패");
			
			// 실패 시 응답
			response.getWriter().write("메시지 저장 실패");
		}

	}

}
