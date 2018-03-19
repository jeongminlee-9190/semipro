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

import com.service.ShopService;

import dto.MemberDTO;
import exception.MyException;


@WebServlet("/MLoginServlet")
public class MLoginServlet extends HttpServlet {

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
		// TODO Auto-generated method stub
	}

}
