package so.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.SoNoticeDTO;
import service.SoBoardService;

/**
 * 공지사항 자세히 보기 
 */
@WebServlet("/SoNoticeRetrieveServlet")
public class SoNoticeRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String noticeNum = request.getParameter("num");
		//System.out.println(noticeNum);
		SoBoardService service = new SoBoardService();
		SoNoticeDTO dto = service.retrieve(Integer.parseInt(noticeNum));
		
		request.setAttribute("noticeretrieve", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("soNoticeRetrieve.jsp");
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);	
	}

}
