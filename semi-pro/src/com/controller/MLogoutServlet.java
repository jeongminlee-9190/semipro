package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import dto.SoDTO;

/**
 * Servlet implementation class MLogoutServlet
 */
@WebServlet("/MLogoutServlet")
public class MLogoutServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO) session.getAttribute("memberlogin"); 
		String nextPage="main.jsp";
		if(dto==null) {
			nextPage="main.jsp";
			request.setAttribute("mesg", "로그인이 되지 않았습니다.");
		}else {
			session.invalidate();
			request.setAttribute("memberlogout", "로그아웃 되었습니다.");
		}//end of if
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
