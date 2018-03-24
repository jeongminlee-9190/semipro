package com.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;

import com.dao.SoDAO;
import com.dto.SoDTO;

public class SoService {
	@Autowired
	SoDAO dao;
	
	public SoDTO login(HashMap<String, String> map) {
		System.out.println("SoService " +map);
		SoDTO sDTO = dao.login(map);
		System.out.println("sDTO " +sDTO);
		return sDTO;
	}
}
