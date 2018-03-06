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
 * shopowner 정보 변경 페이지
 */
@WebServlet("/soInfoUpdateServlet")
public class soInfoUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1. 세션 얻기		
		HttpSession session = request.getSession();
		//2. 처리 후 넘어갈 페이지 변수 선언 및 값 입력
		String nextPage="index_shopowner.jsp";
		//3. "login" 이라는 세션에 저장한 값을 가져온다.
		SoDTO dto = (SoDTO) session.getAttribute("login");
		//4. 변경할 값을 가져온다. 그리고 map에 저장한다.
		HashMap<String, String> map= new HashMap<>();
		String soPasswd = request.getParameter("soPasswd");
		String soPhone1 = request.getParameter("soPhone1");
		String soPhone2 = request.getParameter("soPhone2");
		String soPhone3 = request.getParameter("soPhone3");
		String soPhone = soPhone1+"-"+soPhone2+"-"+soPhone3;
		map.put("soPasswd",soPasswd);
		map.put("soPhone",soPhone);
		
		if(dto==null) {
			nextPage="SoLoginForm.jsp";
			session.setAttribute("mesg", "로그인이 되지 않았습니다.");
		} else { //로그인이 되어 있으면
			String soId=dto.getSoId();
			map.put("soId", soId);
			SoService service = new SoService();
			try {
				service.soUpdate(map);
				dto = service.myPage(soId);
				session.setAttribute("login", dto);
				session.setAttribute("soMyPage", "정보가 수정되었습니다.");
				nextPage="soMyPage.jsp";
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
