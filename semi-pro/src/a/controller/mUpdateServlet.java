package a.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import exception.MyException;
import service.AdminService;

@WebServlet("/mUpdateServlet")
public class mUpdateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rownum = request.getParameter("rownum");
		String mName = request.getParameter("mName");
		String mPhone1 = request.getParameter("mPhone1");
		String mPhone2 = request.getParameter("mPhone2");
		String mPhone3 = request.getParameter("mPhone3");
		String mPasswd = request.getParameter("mPasswd");
		
		HashMap map = new HashMap(); 
		map.put("rownum",Integer.parseInt(rownum));
		map.put("mName", mName);
		map.put("mPhone1", mPhone1);
		map.put("mPhone2", mPhone2);
		map.put("mPhone3", mPhone3);
		map.put("mPasswd", mPasswd);
		AdminService service = new AdminService();
		String nextPage=null;
		try {
			service.m_update(map);
			nextPage="admin/member/memberListForm.jsp";
		} catch (MyException e) {
			e.printStackTrace();
			nextPage="error.jsp";
			request.setAttribute("fail",e.getMessage());
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
