package so.controller;

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
import service.SService;
import service.SoService;

/**
 * Servlet implementation class SoLeaveServlet
 */
@WebServlet("/SoLeaveServlet")
public class SoLeaveServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String nextPage = null;
		SoDTO dto = (SoDTO)session.getAttribute("login");
		SDTO dto2 = (SDTO)session.getAttribute("sinfo");
		
		if(dto==null) {
			nextPage="index_shopowner.jsp";
			session.setAttribute("mesg", "로그인이 되지 않았습니다.");
		}else {
			if(dto2==null) {
				String soId = dto.getSoId();
				SoService service = new SoService();
				try {
					service.soLeave(soId);
					session.invalidate();
					request.setAttribute("mesg", "회원 탈퇴가 완료되었습니다.");
					nextPage="index_shopowner.jsp";
				}catch(Exception e){
					e.printStackTrace();
					nextPage="error.jsp";
				}
			}else {
				String soId = dto.getSoId();
				String sCode = dto2.getsCode();
				SoService service = new SoService();
				SService service2 = new SService();
				
				try {
					service2.sDelAll(sCode);
					service2.sDel(soId);
					service.soLeave(soId);
					session.invalidate();
					request.setAttribute("mesg", "회원 탈퇴가 완료되었습니다.");
					nextPage="index_shopowner.jsp";
				}catch(Exception e){
					e.printStackTrace();
					nextPage="error.jsp";
				}
			}
		}//end of if
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
