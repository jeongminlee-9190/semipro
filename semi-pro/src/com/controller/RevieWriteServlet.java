package com.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.service.ShopTrieveService;

import exception.MyException;

@WebServlet("/RevieWriteServlet")
public class RevieWriteServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		
		String reviewContent = request.getParameter("reviewContent");
		String mName = request.getParameter("mName");
		String sCode = request.getParameter("sCode");
		String url = request.getParameter("url");
		
		String nextPage = "ShopTrieveServlet" + url;
		
		HashMap<String, String> map = new HashMap<>();
		map.put("reviewContent", reviewContent);
		map.put("mName", mName);
		map.put("sCode", sCode);
		
		System.out.print(mName);
		System.out.println(sCode);
		System.out.println(reviewContent);
		
		ShopTrieveService service = new ShopTrieveService();
		String result = null;
		try {
			 result = service.reviewWrite(map);
		} catch (MyException e) {
			nextPage = "error.jsp";
		}
		if(result.equals("1")) {
			request.setAttribute("result", "한줄평 쓰기 완료");
		}else {
			request.setAttribute("result", "이미 한줄평을 썼음");
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(nextPage);
		dis.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
