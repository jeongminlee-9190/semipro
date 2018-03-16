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
import service.MemberService;
import service.SoService;

/**
 * 개인회원-마이페이지
 */
@WebServlet("/MMypageServlet")
public class MMypageServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String nextPage="main.jsp";
		MemberDTO dto = (MemberDTO) session.getAttribute("memberlogin");
		if(dto==null) {
			nextPage="mLoginForm.jsp";
			session.setAttribute("mesg", "로그인이 되지 않았습니다.");
		} else {
			try {
				nextPage="mMyPage.jsp";
			}catch(Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				nextPage="error.jsp";
			}
		}//end of if
		RequestDispatcher dis  = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
