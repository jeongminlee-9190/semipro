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

import dto.SDTO;
import dto.SFileDTO;
import dto.SoDTO;
import service.SFileService;
import service.SService;
import service.SoService;

@WebServlet("/SoLoginServlet")
public class SoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oId=request.getParameter("soId");
		String oPasswd=request.getParameter("soPasswd");
		HashMap<String, String> map = new HashMap<>();
		map.put("soId", oId);
		map.put("soPasswd", oPasswd);

		SoService service = new SoService();
		String nextPage=null;
		try {
			SoDTO dto = service.login(map);
			if (dto != null) {
				HttpSession session = request.getSession();
				session.setAttribute("login", dto);
				
				SService service2 = new SService();
				SDTO sDTO= service2.sInfo(oId);
				session.setAttribute("sinfo", sDTO);			
				
				nextPage = "main_shopowner.jsp";
			} else {
				nextPage = "index_shopowner.jsp";
			}
		}catch(Exception e) {
			nextPage = "error.jsp";
			request.setAttribute("fail", e.getMessage());
		}
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
