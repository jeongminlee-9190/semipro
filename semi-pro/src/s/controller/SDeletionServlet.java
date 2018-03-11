package s.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.SoDTO;
import exception.MyException;
import service.SService;

/**
 * 상점 삭제
 */
@WebServlet("/SDeletionServlet")
public class SDeletionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SoDTO dto = (SoDTO) session.getAttribute("login");
		String nextPage=null;
		String soId = dto.getSoId();
		SService service = new SService();
		try {
			service.sDel(soId);
			request.setAttribute("success", "상점 삭제 성공");
			session.setAttribute("sinfo", null);
			nextPage="shop/sManagement.jsp";
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			nextPage="error.jsp";
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
