package so.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.SoDTO;
import service.SoService;

/**
 * Servlet implementation class soQnaWriteServlet
 */
@WebServlet("/soQnaWriteServlet")
public class soQnaWriteServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String soQnaWrite = request.getParameter("soQnaWrite");
		System.out.println(soQnaWrite);
		String nextPage= null;
		if(soQnaWrite.equals("soQnaWriteLink")) {
			try {
				nextPage="soQnaWrite.jsp";
			}catch(Exception e) {
				nextPage="error.jsp";
			}
		}else if(soQnaWrite.equals("soQnaWriteForm")) {
			try {
				HashMap<String, String> map = new HashMap<>();
				SoDTO dto = (SoDTO)session.getAttribute("login");
				SoService service = new SoService();
				
				String soId = dto.getSoId();
				System.out.println(soId);
				
				String qnaTitle = request.getParameter("qnaTitle");
				String qnaContent = request.getParameter("qnaContent");
				String qnaCategory = request.getParameter("qnaCategory");
				System.out.println(qnaTitle+"\t"+qnaContent+"\t"+qnaCategory);
				map.put("soId",soId);
				map.put("qnaTitle", qnaTitle);
				map.put("qnaContent", qnaContent);
				map.put("qnaCategory", qnaCategory);
				service.soQnaWrite(map);
				nextPage="soQna.jsp";
			}catch(Exception e) {
				nextPage="error.jsp";
			}
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
