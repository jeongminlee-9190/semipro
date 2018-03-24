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
 * shopowner 전화번호 변경 
 */
@WebServlet("/soPhoneUpdateServlet")
public class soPhoneUpdateServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		SoDTO dto = (SoDTO)session.getAttribute("login");
		System.out.println(dto);
		String nextPage=null;
		HashMap<String, String> map= new HashMap<>();
		
		if(dto==null) {
			nextPage="index_shopowner.jsp";
			session.setAttribute("mesg", "로그인이 되지 않았습니다.");
		} else { //로그인이 되어 있으면
			String soId=dto.getSoId();
			String soPhone1 = request.getParameter("soPhone1");
			String soPhone2 = request.getParameter("soPhone2");
			String soPhone3 = request.getParameter("soPhone3");
			String soPhone = soPhone1+"-"+soPhone2+"-"+soPhone3;
			map.put("soId", soId);
			map.put("soPhone",soPhone);
			SoService service = new SoService();
			try {
				service.soPhoneUpdate(map);
				dto = service.myPage(soId);
				session.setAttribute("login", dto);
				session.setAttribute("result", "사업주 전화번호");
				nextPage="soResult.jsp";
			}catch(Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				nextPage="error.jsp";
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
