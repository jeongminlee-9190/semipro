package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MNoticeDTO;
import service.MBoardService;

/**
 * 공지사항 자세히 보기 
 */
@WebServlet("/MNoticeRetrieveServlet")
public class MNoticeRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String noticeNum = request.getParameter("num");
		MBoardService service = new MBoardService();
		MNoticeDTO dto = service.retrieve(Integer.parseInt(noticeNum));
		
		request.setAttribute("noticeretrieve", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("mNoticeRetrieve.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);	
	}

}
