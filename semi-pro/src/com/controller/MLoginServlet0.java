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

<<<<<<< HEAD
import com.service.ShopService;

import dto.MemberDTO;
import exception.MyException;

@WebServlet("/MLoginServlet")
public class MLoginServlet0 extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String mId = request.getParameter("userid");
		String mPasswd = request.getParameter("userpw");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("mId", mId);
		map.put("mPasswd", mPasswd);
		
		ShopService service = new ShopService();
		MemberDTO dto = null;
		try {
			dto = service.login(map);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		session.setAttribute("loginInfo", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("main0.jsp");
		dis.forward(request, response);
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
=======
import dto.MemberDTO;
import service.MemberService;

/**
 * Servlet implementation class MLoginServlet
 */
@WebServlet("/MLoginServlet0")
public class MLoginServlet0 extends HttpServlet {

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
>>>>>>> branch 'master' of https://github.com/jeongminlee-9190/semipro.git
		doGet(request, response);
	}

}
