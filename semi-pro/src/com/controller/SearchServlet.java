package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.ScoreDTO;
import com.dto.SearchResultDTO;
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
		
		System.out.println(keywords);
		if(keywords == "") {
			keywordsList=null;
		}else {
			for(int i=0; i<keywordsArray.length; i++) {
				keywordsList.add(keywordsArray[i]);
			}
		}
		HashMap<String, Object> map = new HashMap<>();
		map.put("station", station);
		map.put("keyword", keywordsList);
		
		request.setAttribute("keywordsList", keywordsList);
		
		String nextPage = "search/searchresult0.jsp";
		ShopService service = new ShopService();
		
		try {
			List<SearchResultDTO> shopListByStation = service.search(map);
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
