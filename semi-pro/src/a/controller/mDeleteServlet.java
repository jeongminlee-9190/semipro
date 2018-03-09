package a.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.MyException;
import service.AdminService;


@WebServlet("/mDeleteServlet")
public class mDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rownum = request.getParameter("rownum");
		String mId = request.getParameter("mId");
		AdminService service = new AdminService();
		String nextPage=null;
		try {
			service.m_delete(mId);
			nextPage="MemberListServlet";
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
