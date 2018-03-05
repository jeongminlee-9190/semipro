package s.controller;

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
import exception.MyException;
import service.SService;
import service.SoService;

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
		String sBusinessDay = request.getParameter("sBusinessDay");
		String sOpenTime= request.getParameter("sOpenTime");
		String sEndTime= request.getParameter("sEndTime");
		String sParkinglot= request.getParameter("sParkinglot");
		String sTerrace= request.getParameter("sTerrace");
		String sMenu1= request.getParameter("sMenu1");
		String sPrice1= request.getParameter("sPrice1");
		String sMenu2= request.getParameter("sMenu2");
		String sPrice2= request.getParameter("sPrice2");
		String sMenu3= request.getParameter("sMenu3");
		String sPrice3= request.getParameter("sPrice3");
		String sMenu4= request.getParameter("sMenu4");
		String sPrice4= request.getParameter("sPrice4");
		String sMenu5= request.getParameter("sMenu5");
		String sPrice5= request.getParameter("sPrice5");
		String sCode = sCategory2+soLicense;
		
		////////////DTO에 맞게 재정의/////////////
		String sPhone = sPhone1+"-"+sPhone2+"-"+sPhone3;
		String sAddr = sAddr1+"/"+sAddr2;
		
		String sCategory=null;
		if(sCategory2.equals("c")){
			sCategory="cafe";
		}else if(sCategory2.equals("d")) {
			sCategory="dessert";
		}else if(sCategory2.equals("w")) {
			sCategory="wine";
		}
		
		String sBusinesshours = sBusinessDay+"/"+sOpenTime+"/"+sEndTime;
		String sMenu = sMenu1+":"+sPrice1+"/"+sMenu2+":"+sPrice2+"/"+sMenu3+":"+sPrice3+"/"+sMenu4+":"+sPrice4+"/"+sMenu5+":"+sPrice5;
		
		SDTO dto = new SDTO(sCode, sName, soId, sPost, sAddr, sPhone, sCategory, sBusinesshours, sParkinglot, sTerrace, sMenu);
		SService service = new SService();
		String nextPage=null;
		try {
			service.sAdd(dto);
			SDTO sDTO= service.sInfo(soId);
			HttpSession session=request.getSession();
			session.setAttribute("sinfo", sDTO);
			nextPage="sManagement.jsp";
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
