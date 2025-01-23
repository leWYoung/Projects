package com.tc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tc.model.memberDTO;
import com.tc.model.myPageDAO;
import com.tc.model.myPageDTO;

@WebServlet("/followListService")
public class followListService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession() ;
		myPageDAO dao = new myPageDAO() ;
		myPageDTO dto = new myPageDTO() ;
		
		memberDTO info = (memberDTO) session.getAttribute("info") ;
		String user_id = info.getUser_id() ;
		
		List<myPageDTO> followerList = dao.followerList(user_id) ;
		List<myPageDTO> followingList = dao.followingList(user_id) ;
		myPageDTO followerCnt = dao.followerCnt(user_id) ;
		myPageDTO followingCnt = dao.followingCnt(user_id) ;
		
		System.out.println("followerList : " + followerList);
		System.out.println("followingList : " + followingList);
		System.out.println("followerCnt : " + followerCnt);
		System.out.println("followingCnt : " + followingCnt);
		
		if(followerList != null && followingList != null) {
			session.setAttribute("follow", followerList);
			session.setAttribute("following", followingList);
			session.setAttribute("followCnt", followerCnt);
			session.setAttribute("followingCnt", followingCnt);
			
			RequestDispatcher rd = request.getRequestDispatcher("MyFeedService") ;
			rd.forward(request, response);
		}
		else {
			System.out.println("팔로워 불러오는 중 오류");
		}
	}
}
