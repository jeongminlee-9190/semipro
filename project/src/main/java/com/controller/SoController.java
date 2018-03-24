package com.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public ModelAndView login(@RequestParam(required=false, defaultValue="1") HashMap<String, String> map,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(map);
		SoDTO sDTO = service.login(map);
		System.out.println(sDTO);
		if(sDTO==null) {
			session.setAttribute("fail", "아이디 또는 비밀번호가 일치하지 않습니다.");
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
	public String SoFind(@RequestParam HashMap<String, String> map, HttpSession session) {
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
				session.setAttribute("findSoIdResult", soId);
				nextPage="so/soResult";
			}else {
				session.setAttribute("findfail", "일치하는 정보가 없습니다.");
				nextPage="so/soFindIdForm";
			}
		}else {
			String soPasswd = service.findSoPasswd(map);
			if(soPasswd!=null) {
				session.setAttribute("findSoPasswdResult", soPasswd);
				nextPage="so/soResult";
			}else {
				session.setAttribute("findfail", "일치하는 정보가 없습니다.");
				nextPage="so/soFindPwForm";
			}
		}
		return nextPage;
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
