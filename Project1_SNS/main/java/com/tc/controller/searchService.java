package com.tc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tc.model.chalDAO;
import com.tc.model.chalDTO;
import com.tc.model.feedDAO;
import com.tc.model.feedDTO;

@WebServlet("/searchService")
public class searchService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		List<feedDTO> searchFeed = new ArrayList<>(); ;
		List<chalDTO> searchChal = new ArrayList<>(); ;
		
		String search = request.getParameter("search");

		feedDAO feeddao = new feedDAO();
		chalDAO chaldao = new chalDAO();

		List<feedDTO> feedList = feeddao.getFeed();
		List<chalDTO> chalList = chaldao.getchal();
		
		System.out.println("검색 전 피드 목록 : " + feedList);
		System.out.println("검색 전 챌린지 목록 : " + chalList);
		
		System.out.println("search : " + search);

		for (feedDTO feed : feedList) {
			if (feed.getFeed_title().contains(search)) {
				searchFeed.add(feed) ;
			}
		}

		for (chalDTO chal : chalList) {
			if (chal.getChal_title().contains(search)) {
				System.out.println("검색된 챌린지 제목 : " + chal.getChal_title());
				searchChal.add(chal) ;
			}
		}
		
		request.setAttribute("searchFeed", searchFeed);
		request.setAttribute("searchChal", searchChal);
		System.out.println("검색 피드 목록 : " + feedList);
		System.out.println("검색 챌린지 목록 : " + chalList);
		
		RequestDispatcher rd = request.getRequestDispatcher("SearchPage.jsp") ;
		rd.forward(request, response);
	}
}
