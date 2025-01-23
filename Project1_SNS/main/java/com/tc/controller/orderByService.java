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
import javax.servlet.http.HttpSession;

import com.tc.model.chalDAO;
import com.tc.model.chalDTO;

@WebServlet("/orderByService")
public class orderByService extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<chalDTO> dtoList = new ArrayList<>() ;
    	String ob = request.getParameter("ob") ;

    	chalDAO dao = new chalDAO() ;
    	
    	if(ob.equals("all")) {
    		dtoList =  dao.getchal() ;
    	}
    	else if(ob.equals("tak")) {
    		dtoList = dao.orderBy(ob) ;
    	}
    	else if(ob.equals("evn")) {
    		dtoList = dao.orderBy(ob) ;
    	}
    	else if(ob.equals("wtc")) {
    		dtoList = dao.orderBy(ob) ;
    	}
    	else if(ob.equals("asn")) {
    		dtoList = dao.orderBy(ob) ;
    	}
    	else if(ob.equals("gsu")) {
    		dtoList = dao.orderBy(ob) ;
    	}
    	else if(ob.equals("veg")) {
    		dtoList = dao.orderBy(ob) ;
    	}
    	else if(ob.equals("plt")) {
    		dtoList = dao.orderBy(ob) ;
    	}
    	else {
    		dtoList = dao.orderBy(ob) ;
    	}
    	
    	System.out.println("orderby dtoList user_img : " + dtoList);
    	
    	HttpSession session = request.getSession() ;
		session.setAttribute("orderByList", dtoList);
		
		RequestDispatcher rd = request.getRequestDispatcher("OrderByPage.jsp");
		rd.forward(request, response);
    }
}
