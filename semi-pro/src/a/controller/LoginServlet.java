package a.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.AdminDTO;
import exception.MyException;
import service.AdminService;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String aId = request.getParameter("aId");
		String aPasswd = request.getParameter("aPasswd");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("aId", aId);
		map.put("aPasswd", aPasswd);
		
		AdminService service = new AdminService();
		String nextPage= null;
		try {
			AdminDTO dto = service.login(map);
		if(dto !=null) {
			HttpSession session = request.getSession();
			session.setAttribute("login", dto);
			nextPage="admin/main.jsp";
		}else {
			nextPage="index_admin.jsp";
		}
		} catch (MyException e) {
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
