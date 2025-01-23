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

import com.tc.model.chatDAO;
import com.tc.model.chatDTO;

@WebServlet("/CreateRoom")
public class CreateRoom extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		chatDAO dao = new chatDAO() ;
		chatDTO dto = new chatDTO() ;
		
		String roomIdx = request.getParameter("room_idx") ;
		
		System.out.println("있니? :" + roomIdx);
		
		dto.setRoom_idx(Integer.parseInt(roomIdx));
		
		List<chatDTO> chatList = dao.chatSelect(dto) ;
		
		request.setAttribute("chatList", chatList);
		System.out.println("채팅 목록 : " + chatList);
		
		RequestDispatcher rd = request.getRequestDispatcher("ChattingPage.jsp") ;
		rd.forward(request, response);
	}

}
