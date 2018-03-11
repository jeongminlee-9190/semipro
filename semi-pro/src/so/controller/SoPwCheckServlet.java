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
import service.SoService;

/**
 * 마이페이지 접근 전 비밀번호 한번 더 체크
 */
@WebServlet("/SoPwCheckServlet")
public class SoPwCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//1. 세션 얻기
		HttpSession session = request.getSession();
		//2. 로그인이 되어있는 상태인지 확인하기 위함
		//object로 가져오기 때문에 형변환 필수
		SoDTO dto = (SoDTO)session.getAttribute("login"); 
		//3. 각 처리 단계마다 어느 페이지로 이동할 지 저장할 변수 선언
		String nextPage=null;
		if(dto==null) {
			session.setAttribute("mesg", "로그인이 되지 않았습니다.");
			nextPage="index_shopowner.jsp";
		}else { //비밀번호 재확인 용
			String pwCheck =(String)session.getAttribute("pwCheck");
			String soPasswdIn=request.getParameter("soPasswdchk");
			System.out.println(pwCheck);
			System.out.println(soPasswdIn);
			if(pwCheck.equals(soPasswdIn)) {
				nextPage="soMyPage.jsp";
			}else {
				nextPage="soPwCheck.jsp";
				session.setAttribute("mesg", "비밀번호가 일치하지 않습니다.");
			}
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}
}
