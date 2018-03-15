package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ShopDTO;
import com.service.ShopService;

import exception.MyException;
@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String keywords = request.getParameter("search");
		String station = request.getParameter("station");
		
		String[] keywordsArray = keywords.split(",");

		List<String> keywordsList = new ArrayList<>();
		
		for(int i=0; i<keywordsArray.length; i++) {
			keywordsList.add(keywordsArray[i]);
		}
		
		request.setAttribute("keywordsList", keywordsList);
		
		String nextPage = "search/searchresult0.jsp";
		ShopService service = new ShopService();
		
		try {
			List<ShopDTO> shopListByStation = service.selectByStation(station) ;
			request.setAttribute("shopList", shopListByStation);
		} catch (MyException e) {
			e.printStackTrace();
			nextPage = "error.jsp";
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
