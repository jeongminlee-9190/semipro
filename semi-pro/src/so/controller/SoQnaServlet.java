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

import dto.PageDTO;
import dto.SoDTO;
import dto.SoQnaDTO;
import exception.MyException;
import sevice.SoQnaService;
import sevice.SoService;

/**
 * Servlet implementation class SoQnaServlet
 */
@WebServlet("/SoQnaServlet")
public class SoQnaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		SoDTO dto = (SoDTO) session.getAttribute("login"); 
		String nextPage=null;
		HashMap<String, String> map = new HashMap<>(); //oId를 저장하기 위한 변수
		List<SoQnaDTO> list=null;
		
		if(dto==null) {
			nextPage="SoLoginForm.jsp";
			session.setAttribute("mesg", "로그인이 되지 않았습니다.");
		} else {
			String soId=dto.getSoId();
			map.put("soId", soId);
			SoQnaService service = new SoQnaService();
			try {
				list = service.list(map);
				
			} catch (MyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("list", list);
			nextPage="soQna.jsp";
			
		}//end of if			
			
		RequestDispatcher dis  = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
