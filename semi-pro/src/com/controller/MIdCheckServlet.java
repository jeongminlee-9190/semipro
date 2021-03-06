package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.MemberService;
import service.SoService;

@WebServlet("/MIdCheckServlet")
public class MIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.변수선언
		String mId=request.getParameter("mId");
		//2. service 생성
		MemberService service = new MemberService();
		String mesg = "아이디 사용 가능";
		
		try {
			int count=service.mIdCheck(mId);
			if(count==1) {
				mesg = "아이디 중복";
			}
		}catch(Exception e){
			mesg=e.getMessage();
		}
		//서블릿의 응답처리: mesg 전달
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(mesg);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
