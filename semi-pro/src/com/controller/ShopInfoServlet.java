package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ShopDTO;
import com.service.ShopService;

import exception.MyException;

@WebServlet("/ShopInfoServlet")
public class ShopInfoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String sCode = request.getParameter("sCode");
		
		String nextPage = "search/shopinfo0.jsp";
		
		ShopService service = new ShopService();
		
		try {
			ShopDTO dto = service.selectShop(sCode);
			String [] sBusinessHoursArr = dto.getsBusinessHours().split("/");
			request.setAttribute("businessHours", sBusinessHoursArr);
			request.setAttribute("shopdto", dto);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
