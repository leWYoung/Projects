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

import com.tc.model.chalDAO;
import com.tc.model.chalDTO;

@WebServlet("/detailChal")
public class detailChal extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	      // 1. DAO 생성
        chalDAO dao = new chalDAO();

        // 2. URL 파라미터에서 챌린지 ID 받기
        String chal_idx = request.getParameter("id");
        System.out.println("챌린지에서 가져오니?:"+chal_idx);

        // 3. DAO를 통해 특정 챌린지 정보 조회
        chalDTO chalDetail = dao.getChalDetail(chal_idx); // ID에 해당하는 챌린지 정보를 조회하는 메서드

        // 4. 요청 속성에 챌린지 정보 담기
        request.setAttribute("chalDetail", chalDetail);
        System.out.println("조회한 챌린지 정보: " + chalDetail);

        // 5. ChallengeContent.jsp로 이동 forward 방식
        RequestDispatcher rd = request.getRequestDispatcher("ChallengeContent.jsp");
        rd.forward(request, response);
	}

}
