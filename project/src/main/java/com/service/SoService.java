package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.SoDAO;
import com.dto.SoDTO;

public class SoService {
	@Autowired
	SoDAO dao;
	
	public SoDTO login(HashMap<String, String> map) {
		SoDTO sDTO = dao.login(map);
		return sDTO;
	}
	
	public String findSoId(HashMap<String, String> map) {
		String soId = dao.findSoId(map);
		return soId;
	}
	
	public String findSoPasswd(HashMap<String, String> map) {
		return dao.findSoPasswd(map);
	}
}
