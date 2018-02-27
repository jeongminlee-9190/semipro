package so.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.SoDTO;
import sevice.SoService;

@WebServlet("/SoMyPageServlet")
public class SoMyPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		String nextPage="index_shopowner.jsp";
		SoDTO dto = (SoDTO) session.getAttribute("login");
		if(dto==null) {
			nextPage="SoLoginForm.jsp";
			session.setAttribute("mesg", "로그인이 되지 않았습니다.");
		} else {
			String soId=dto.getSoId();
			SoService service = new SoService();
			try {
				SoDTO xxx= service.myPage(soId);
				session.setAttribute("login",xxx);
				nextPage="soMyPage.jsp";
			}catch(Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				nextPage="error.jsp";
			}
		}//end of if
		RequestDispatcher dis  = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
