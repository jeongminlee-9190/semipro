package so.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.SoService;

/**
 * 아이디/비밀번호 찾기 
 */
@WebServlet("/SoFindServlet")
public class SoFindServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String find= request.getParameter("find");
		SoService service = new SoService();
		HashMap<String, String> map = new HashMap<>();
		String nextPage="soFindsoId.jsp";
		if(find.equals("soId")){
			String soLicense = request.getParameter("soLicense");
			String soName = request.getParameter("soName");
			String soPhone1 = request.getParameter("soPhone1");
			String soPhone2 = request.getParameter("soPhone2");
			String soPhone3 = request.getParameter("soPhone3");
			String soPhone= soPhone1+"-"+soPhone2+"-"+soPhone3;
			map.put("soLicense", soLicense);
			map.put("soName", soName);
			map.put("soPhone", soPhone);
			try {
				String soId=service.findSoId(map);
				request.setAttribute("findSoIdResult", soId);
				System.out.println("결과:"+soId);
				nextPage="soResult.jsp";
			}catch(Exception e){
				nextPage="soFindsoId.jsp";
			}
		}else if(find.equals("soPasswd")){
			String soId = request.getParameter("soId");
			String soLicense = request.getParameter("soLicense");
			String soName = request.getParameter("soName");
			String soPhone1 = request.getParameter("soPhone1");
			String soPhone2 = request.getParameter("soPhone2");
			String soPhone3 = request.getParameter("soPhone3");
			String soPhone= soPhone1+"-"+soPhone2+"-"+soPhone3;
			map.put("soId", soId);
			map.put("soLicense", soLicense);
			map.put("soName", soName);
			map.put("soPhone", soPhone);
			try {
				String soPasswd=service.findSoPasswd(map);
				request.setAttribute("findSoPasswdResult", soPasswd);
				System.out.println("결과:"+soPasswd);
				nextPage="soResult.jsp";
			}catch(Exception e){
				nextPage="soFindsoId.jsp";
			}
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
