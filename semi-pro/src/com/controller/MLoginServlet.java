package com.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import service.MemberService;

/**
 * Servlet implementation class MLoginServlet
 */
@WebServlet("/MLoginServlet")
public class MLoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String mId = request.getParameter("mId");
		String mPasswd = request.getParameter("mPasswd");
		HashMap<String, String> map = new HashMap<>();
		map.put("mId", mId);
		map.put("mPasswd", mPasswd);
		String nextPage=null;
		MemberService service = new MemberService();
		try {
			
			MemberDTO dto = service.mLogin(map);
			if(dto!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("memberlogin", dto);
				nextPage = "main.jsp";
			}
			else {
				nextPage = "main.jsp";
			}
			
		}catch(Exception e){
			nextPage = "error.jsp";
			request.setAttribute("fail", e.getMessage());
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
