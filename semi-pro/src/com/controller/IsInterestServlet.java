package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.InterestDTO;
import com.service.ShopService;

import exception.MyException;

@WebServlet("/IsInterestServlet")
public class IsInterestServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		PrintWriter out = response.getWriter();
		
		String sCode = request.getParameter("sCode");
		String mId = request.getParameter("mId");
		String iCode= mId+sCode;
		
		HashMap<String, String> map = new HashMap<>();
		map.put("iCode", iCode);
		map.put("mId", mId);
		map.put("sCode", sCode);
		
		ShopService service = new ShopService();
		InterestDTO dto = null;
		
		try {
			dto = service.isInterest(map);
		} catch (MyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(dto!=null) {
			out.print("1");
		}else {
			out.print("0");
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
