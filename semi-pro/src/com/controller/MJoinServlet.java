package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import exception.MyException;
import service.MemberService;

/**
 * Servlet implementation class MJoinServlet
 */
@WebServlet("/MJoinServlet")
public class MJoinServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mId= request.getParameter("mId");
		String mPasswd = request.getParameter("mPasswd");
		String mName = request.getParameter("mName");
		String mPhone1 = request.getParameter("mPhone1");
		String mPhone2 = request.getParameter("mPhone2");
		String mPhone3 = request.getParameter("mPhone3");
		String mBirth = request.getParameter("mBirth");
		
		String mPhone = mPhone1+"-"+mPhone2+"-"+mPhone3;
		if(mBirth==null) {
			mBirth="없음";	
		}
		System.out.println("servlet!!");
		System.out.println(mId+"/"+mPasswd+"/"+mName+"/"+mPhone+"/"+mBirth);
		MemberDTO dto = new MemberDTO(mId, mPasswd, mName, mPhone, mBirth);
		MemberService service = new MemberService();
		String nextPage=null;
		try {
			service.mJoin(dto);
			nextPage="main.jsp";
			request.setAttribute("success", "회원가입 성공, 로그인을 해주세요.");
		} catch (MyException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			nextPage="error.jsp";
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
