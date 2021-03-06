package so.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.SoQnaDTO;
import service.SoQnaService;

@WebServlet("/soQnaRetrieveServlet")
public class SoQnaRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String qnaNum = request.getParameter("qnaNum");
		
		SoQnaService service = new SoQnaService();
		SoQnaDTO dto = service.retrieve(Integer.parseInt(qnaNum));
		
		session.setAttribute("soQnaRetrieve", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("soQnaRetrieve.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
