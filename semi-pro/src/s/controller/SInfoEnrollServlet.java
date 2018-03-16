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
		String soLicense = request.getParameter("soLicense");
		String sName = request.getParameter("sName");
		String sPhone1 = request.getParameter("sPhone1");
		String sPhone2 = request.getParameter("sPhone2");
		String sPhone3 = request.getParameter("sPhone3");
		String sPost = request.getParameter("post");
		String sAddr1 = request.getParameter("sAddr1");
		String sAddr2 = request.getParameter("sAddr2");
		String sCategory2 = request.getParameter("sCategory");
		String sWeekday = request.getParameter("sWeekday");
		String sWeekend= request.getParameter("sWeekend");
		String sDayOff= request.getParameter("sDayOff");
		String sParkinglot= request.getParameter("sParkinglot");
		String sTerrace= request.getParameter("sTerrace");
		
		//메뉴판 카테고리1
		String sMenuCategory1= request.getParameter("sMenuCategory1");
		String sC1Menu1= request.getParameter("sC1Menu1");
		String sC1Menu1_info= request.getParameter("sC1Menu1_info");
		String sC1Price1= request.getParameter("sC1Price1");
		String sC1Menu2= request.getParameter("sC1Menu2");
		String sC1Menu2_info= request.getParameter("sC1Menu2_info");
		String sC1Price2= request.getParameter("sC1Price2");
		String sC1Menu3= request.getParameter("sC1Menu3");
		String sC1Menu3_info= request.getParameter("sC1Menu3_info");
		String sC1Price3= request.getParameter("sC1Price3");
		
		//메뉴판 카테고리2
		String sMenuCategory2= request.getParameter("sMenuCategory2");
		String sC2Menu1= request.getParameter("sC2Menu1");
		String sC2Menu1_info= request.getParameter("sC2Menu1_info");
		String sC2Price1= request.getParameter("sC2Price1");
		String sC2Menu2= request.getParameter("sC2Menu2");
		String sC2Menu2_info= request.getParameter("sC2Menu2_info");
		String sC2Price2= request.getParameter("sC2Price2");
		String sC2Menu3= request.getParameter("sC2Menu3");
		String sC2Menu3_info= request.getParameter("sC2Menu3_info");
		String sC2Price3= request.getParameter("sC2Price3");
		String sSubway=request.getParameter("sSubway2");
		System.out.println(sSubway);
		
		String sCode = sCategory2+soLicense;
		
		////////////DTO에 맞게 재정의/////////////
		String sPhone = sPhone1+"-"+sPhone2+"-"+sPhone3;
		String sAddr = sAddr1+"/"+sAddr2;
		String sMenu1= sMenuCategory1+"/"+sC1Menu1+":"+sC1Menu1_info+":"+sC1Price1+"/"+sC1Menu2+":"+sC1Menu2_info+":"+sC1Price2+"/"+sC1Menu3+":"+sC1Menu3_info+":"+sC1Price3;
		String sMenu2= sMenuCategory2+"/"+sC2Menu1+":"+sC2Menu1_info+":"+sC2Price1+"/"+sC2Menu2+":"+sC2Menu2_info+":"+sC2Price2+"/"+sC2Menu3+":"+sC2Menu3_info+":"+sC2Price3;	
		
		String sCategory=null;
		if(sCategory2.equals("c")){
			sCategory="Cafe";
		}else if(sCategory2.equals("d")) {
			sCategory="Dessert";
		}else if(sCategory2.equals("w")) {
			sCategory="Wine";
		}
		
		String sBusinesshours = sWeekday+"/"+sWeekend+"/"+sDayOff;		
		
		SDTO dto = new SDTO(sCode, sName, soId, sPost, sAddr, sPhone, sCategory, sBusinesshours, sParkinglot, sTerrace, sMenu1, sMenu2,sSubway);
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
