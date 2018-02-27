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
import sevice.SoService;

/**
 * Servlet implementation class MemberAddServlet
 */
@WebServlet("/SoAddServlet")
public class SoAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oId= request.getParameter("oId");
		String oPasswd = request.getParameter("oPasswd");
		String oName = request.getParameter("oName");
		String oPhone1 = request.getParameter("oPhone1");
		String oPhone2 = request.getParameter("oPhone2");
		String oPhone3 = request.getParameter("oPhone3");
		String sName = request.getParameter("sName");
		String sPhone1= request.getParameter("sPhone1");
		String sPhone2 = request.getParameter("sPhone2");
		String sPhone3 = request.getParameter("sPhone3");
		String sLicense = request.getParameter("sLicense");
		String sPost = request.getParameter("post");
		String sAddr1 = request.getParameter("sAddr1");
		String sAddr2 = request.getParameter("sAddr2");
		
		
		String oPhone = oPhone1+"-"+oPhone2+"-"+oPhone3;
		String sPhone = sPhone1+"-"+sPhone2+"-"+sPhone3;
		String sAddr = sAddr1+"/"+sAddr2;
		SoDTO dto = new SoDTO(oId, oPasswd, oName, oPhone, sName, sPhone, sLicense, sPost, sAddr);
		SoService service = new SoService();
		String nextPage=null;
		try {
			service.soAdd(dto);
			nextPage="index_shopowner.jsp";
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
