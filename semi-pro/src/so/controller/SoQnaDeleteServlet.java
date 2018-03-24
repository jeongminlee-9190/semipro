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
import service.SoQnaService;

/**
 * Servlet implementation class SoQnaDeleteServlet
 */
@WebServlet("/SoQnaDeleteServlet")
public class SoQnaDeleteServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nextPage=null;
		SoQnaService service = new SoQnaService();
		SoDTO dto = (SoDTO)session.getAttribute("login");
		SoQnaDTO dto2 = (SoQnaDTO)session.getAttribute("soQnaRetrieve");
		String soId = dto.getSoId();
		int qnaNum = dto2.getQnaNum();
		try {
			HashMap<String, Object> map = new HashMap<>();
			map.put("qnaNum", qnaNum);
			map.put("soId", soId);
			service.soQnaDelete(map);
			List<SoQnaDTO> list = service.list(soId);
			session.setAttribute("soQnaList", list);
			request.setAttribute("success", "1:1문의가 삭제되었습니다.");
			nextPage="soQna.jsp";
		}catch(Exception e) {
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
