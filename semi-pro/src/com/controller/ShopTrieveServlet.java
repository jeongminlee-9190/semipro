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

@WebServlet("/ShopTrieveServlet")
public class ShopTrieveServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String nextPage = "search/shoptrieve0.jsp";
		String sCode = request.getParameter("sCode");
		
		ShopService service = new ShopService();
		
		try {
			ShopDTO dto = service.selectShop(sCode);
			String [] images = dto.getsImage().split("/");
			List<String> shopimages = new ArrayList<>();
			for (String string : images) {
				shopimages.add(string);
			}
			request.setAttribute("shopInfo", dto);
			request.setAttribute("shopImages", shopimages);
			for(String image : shopimages) {
				System.out.println(image);
			}
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
