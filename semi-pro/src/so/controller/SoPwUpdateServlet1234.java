package so.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.SoDTO;

/**
 * soPasswd 변경
 */
@WebServlet("/SoPwUpdateServlet123")
public class SoPwUpdateServlet1234 extends HttpServlet {
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
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
