package s.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.SDTO;
import dto.SoDTO;
import exception.MyException;
import service.SService;

/**
 * 상점 페이지 미리보기 기능 *아직 미완성
 */
@WebServlet("/SViewServlet")
public class SViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String nextPage=null;
		SoDTO dto = (SoDTO) session.getAttribute("login");
		if(dto==null) {
			nextPage="index_shopowner.jsp";
			session.setAttribute("mesg", "로그인이 되지 않았습니다.");
		} else {
			String soId = dto.getSoId();
			SService service = new SService();
			try {
				SDTO sDTO= service.sInfo(soId);
				session.setAttribute("sinfo", sDTO);
				nextPage="shop/sView.jsp";
			}catch(Exception e) {
				e.printStackTrace();
				nextPage="error.jsp";
			}
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
