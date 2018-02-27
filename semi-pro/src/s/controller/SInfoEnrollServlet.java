package s.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.SDTO;
import dto.SoDTO;
import exception.MyException;
import sevice.SService;
import sevice.SoService;

/**
 * 상점 기본정보 등록 
 */
@WebServlet("/SInfoEnrollServlet")
public class SInfoEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String soId= request.getParameter("soId");
		System.out.println(soId);
		String soLicense = request.getParameter("soLicense");
		System.out.println(soLicense);
		String sName = request.getParameter("sName");
		System.out.println(sName);
		String sPhone1 = request.getParameter("sPhone1");
		String sPhone2 = request.getParameter("sPhone2");
		String sPhone3 = request.getParameter("sPhone3");
		String sPost = request.getParameter("post");
		String sAddr1 = request.getParameter("sAddr1");
		String sAddr2 = request.getParameter("sAddr2");
		String sCategory2 = request.getParameter("sCategory");
		String sCategory=null;
		if(sCategory2.equals("c")){
			sCategory="cafe";
		}else if(sCategory2.equals("d")) {
			sCategory="dessert";
		}else if(sCategory2.equals("w")) {
			sCategory="wine";
		}
		
		String sPhone = sPhone1+"-"+sPhone2+"-"+sPhone3;
		String sAddr = sAddr1+"/"+sAddr2;
		String sCode = sCategory2+soLicense;
		
		SDTO dto = new SDTO(sCode, sName, soId, sPost, sAddr, sPhone, sCategory);
		SService service = new SService();
		String nextPage=null;
		try {
			service.sAdd(dto);
			nextPage="index_shopowner.jsp";
			request.setAttribute("success", "상점 등록 성공");
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
