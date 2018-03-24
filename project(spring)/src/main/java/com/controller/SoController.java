package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dto.SoDTO;
import com.service.SoService;


@Controller
public class SoController {
	@Autowired
	SoService service;

	@RequestMapping(value = "/sologin", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(required=false, defaultValue="1") HashMap<String, String> map,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map);
		SoDTO sDTO = service.login(map);
		System.out.println(sDTO);
		if(sDTO==null) {
			request.setAttribute("fail", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}else {
			mav.addObject("SoLogin",sDTO);
			mav.setViewName("main_shopowner");
		}
		return mav;
	}
	
	@RequestMapping("/soJoinForm")
	public String soJoinForm() {
		return "so/soJoinForm";
	}
	
	@RequestMapping("/soFindIdForm")
	public String soFindIdForm() {
		return "so/soFindIdForm";
	}
	
	@RequestMapping("/soFindPwForm")
	public String soFindPwForm() {
		return "so/soFindPwForm";
	}
	
	@RequestMapping("/SoFind")
	public String SoFind(@RequestParam HashMap<String, String> map, HttpServletRequest request) {
		String soPhone1 = map.get("soPhone1");
		String soPhone2 = map.get("soPhone2");
		String soPhone3 = map.get("soPhone3");
		String soPhone = soPhone1+"-"+soPhone2+"-"+soPhone3;
		String find = map.get("find");
		String nextPage=null;
		map.remove("soPhone1");
		map.remove("soPhone2");
		map.remove("soPhone3");
		map.put("soPhone",soPhone);
	
		if(find.equals("soId")) {
			String soId = service.findSoId(map);
			if(soId!=null) {
				request.setAttribute("findSoIdResult", soId);
				nextPage="so/soResult";
			}else {
				request.setAttribute("findfail", "일치하는 정보가 없습니다.");
				nextPage="so/soFindIdForm";
			}
		}else {
			String soPasswd = service.findSoPasswd(map);
			if(soPasswd!=null) {
				request.setAttribute("findSoPasswdResult", soPasswd);
				nextPage="so/soResult";
			}else {
				request.setAttribute("findfail", "일치하는 정보가 없습니다.");
				nextPage="so/soFindPwForm";
			}
		}
		return nextPage;
	}
	
	@RequestMapping(value="/SoJoin",  method=RequestMethod.POST)
	public String SoJoin(@RequestParam HashMap<String, String> map, HttpServletRequest request) {
		System.out.println(map);
		String soPhone1 = map.get("soPhone1");
		String soPhone2 = map.get("soPhone2");
		String soPhone3 = map.get("soPhone3");
		String soPhone = soPhone1+"-"+soPhone2+"-"+soPhone3;
		String soAddr1 = map.get("soAddr1");
		String soAddr2 = map.get("soAddr2");
		String soAddr=soAddr1+"/"+soAddr2;
		map.remove("soPhone1");
		map.remove("soPhone2");
		map.remove("soPhone3");
		map.remove("soAddr1");
		map.remove("soAddr2");
		map.put("soPhone",soPhone);
		map.put("soAddr",soAddr);
		System.out.println(map);
		service.soJoin(map);
		request.setAttribute("success", "회원가입 성공, 로그인 페이지로 이동합니다.");
		return "index_shopowner";
	}
	
	/*
	@RequestMapping("/SoFindPw")
	public String SoFindPw(@RequestParam HashMap<String, String> map, HttpSession session) {
		String soPhone1 = map.get("soPhone1");
		String soPhone2 = map.get("soPhone2");
		String soPhone3 = map.get("soPhone3");
		String soPhone = soPhone1+"-"+soPhone2+"-"+soPhone3;
		String nextPage=null;
		map.remove("soPhone1");
		map.remove("soPhone2");
		map.remove("soPhone3");
		map.put("soPhone",soPhone);
		String soPasswd = service.findSoPasswd(map);
		if(soPasswd!=null) {
			session.setAttribute("findSoPasswdResult", soPasswd);
			nextPage="so/soResult";
		}else {
			session.setAttribute("fail", "일치하는 정보가 없습니다.");
			nextPage="so/soFindPwForm";
		}
		return nextPage;
	}*/
}
