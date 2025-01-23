package com.tc.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tc.model.cppDAO;
import com.tc.model.cppDTO;

@WebServlet("/parChalService")
public class parChalService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String chalIdx = request.getParameter("chal_idx");
		String userID = request.getParameter("user_id");
		System.out.println("chal_idx : "+chalIdx);
		System.out.println("user_id : "+userID);
		
		if(chalIdx == null || chalIdx.isEmpty()) {
			System.out.println("chal_idx가 비어 있습니다.");
			response.sendRedirect("erroPage.jsp");
		}
		
		
		cppDTO parChal = new cppDTO();
		parChal.setChal_idx(Integer.parseInt(chalIdx));
		parChal.setUser_id(userID);

		cppDAO dao = new cppDAO();	
		dao.insertPar(parChal);
		
		response.sendRedirect("ChallengePage.jsp");
	}

}
