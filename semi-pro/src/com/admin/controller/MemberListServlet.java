package com.admin.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dto.AdminDTO;
import com.dto.MemberDTO;
import com.exception.MyException;
import com.service.AdminService;


@WebServlet("/MemberListServlet")
public class MemberListServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDTO dto = new MemberDTO();
		AdminService service = new AdminService();
		String nextPage=null;
		try {
			List<MemberDTO> list = service.memberlist();
			request.setAttribute("list", list);
			 nextPage="admin/memberListForm.jsp";
		} catch (MyException e) {
			e.printStackTrace();
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
