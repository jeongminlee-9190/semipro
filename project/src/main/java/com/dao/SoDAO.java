package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.dto.SoDTO;

public class SoDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public SoDTO login(HashMap<String, String> map) {
		System.out.println("SoDAO1" + map);
		SoDTO sDTO = template.selectOne("SoMapper.login",map);
		System.out.println("sDTO"+sDTO);
		System.out.println("SoDAO2");
		return sDTO;
	}
}
