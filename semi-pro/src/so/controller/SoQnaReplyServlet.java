package so.controller;

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

import dto.SoDTO;
import dto.SoQnaDTO;
import exception.MyException;
import sevice.SoBoardService;
import sevice.SoQnaService;

/**
 * 1:1 문의 답변 (관리자)
 */
@WebServlet("/SoQnaReplyServlet")
public class SoQnaReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		SoBoardService service = new SoBoardService();
		List<SoQnaDTO> list=service.list(map);
		request.setAttribute("list", list);
		//RequestDispatcher dis  = request.getRequestDispatcher(nextPage);
		//dis.forward(request, response);
		 * 
		 */
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
