package com.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.dto.SoDTO;

public class SoDAO {
	@Autowired
	SqlSessionTemplate template;
	
	public SoDTO login(HashMap<String, String> map) {
		SoDTO sDTO = template.selectOne("SoMapper.login",map);
		return sDTO;
	}
	
	public String findSoId(HashMap<String, String> map) {
		String soId = template.selectOne("SoMapper.findSoId",map);
		return soId;
	}
	
	public String findSoPasswd(HashMap<String, String> map) {
		String soPasswd = template.selectOne("SoMapper.findSoPasswd",map);
		return soPasswd;
	}
	public void soJoin(HashMap<String, String> map) {
		template.insert("SoMapper.soJoin",map);
	}
}
