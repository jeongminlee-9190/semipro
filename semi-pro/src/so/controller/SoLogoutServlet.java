package so.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MySqlSessionFactory;
import dto.SoDTO;

@WebServlet("/SoLogoutServlet")
public class SoLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션얻기
		HttpSession session = request.getSession();
		SoDTO dto = (SoDTO) session.getAttribute("login"); //getAttribute는 항상 형변환을 해줘야 한다.
		String nextPage="index_shopowner.jsp";
		if(dto==null) {
			nextPage="index_shopowner.jsp";
			request.setAttribute("mesg", "로그인이 되지 않았습니다.");
		}else {
			session.invalidate();
			request.setAttribute("logout", "로그아웃 되었습니다.");
		}//end of if
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
