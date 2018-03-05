package a.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.MemberDTO;
import exception.MyException;
import service.AdminService;

@WebServlet("/mUpdateUIServlet")
public class mUpdateUIServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rownum = request.getParameter("rownum");
		AdminService service = new AdminService();
		String nextPage=null;
		try {
			MemberDTO dto = new MemberDTO();
			dto = service.m_updatelist(Integer.parseInt(rownum));
			request.setAttribute("dto", dto);
			nextPage="admin/member/memberUpdateForm.jsp";
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			nextPage="error.jsp";
			 request.setAttribute("fail", e.getMessage());
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
