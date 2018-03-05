package so.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.SoDTO;
import exception.MyException;
import service.SoService;

/**
 * Servlet implementation class MemberAddServlet
 */
@WebServlet("/SoAddServlet")
public class SoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String soId= request.getParameter("soId");
		String soPasswd = request.getParameter("soPasswd");
		String soName = request.getParameter("soName");
		String soPhone1 = request.getParameter("soPhone1");
		String soPhone2 = request.getParameter("soPhone2");
		String soPhone3 = request.getParameter("soPhone3");
		String soLicense = request.getParameter("soLicense");
		String soPost = request.getParameter("post");
		String soAddr1 = request.getParameter("soAddr1");
		String soAddr2 = request.getParameter("soAddr2");
		
		
		String soPhone = soPhone1+"-"+soPhone2+"-"+soPhone3;
		String soAddr = soAddr1+"/"+soAddr2;
		SoDTO dto = new SoDTO(soId, soPasswd, soName, soPhone, soLicense, soPost, soAddr);
		SoService service = new SoService();
		String nextPage=null;
		try {
			service.soAdd(dto);
			nextPage="main_shopowner.jsp";
			request.setAttribute("success", "회원가입 성공");
		} catch (MyException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			nextPage="error.jsp";
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
