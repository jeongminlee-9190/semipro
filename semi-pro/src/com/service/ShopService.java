package com.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.ShopDTO;

import dao.MySqlSessionFactory;
import exception.MyException;

public class ShopService {
	
	public List<ShopDTO> selectAll()throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		
		List<ShopDTO> list = null; 
		try {
			list = session.selectList("ShopMapper.selectAll");
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("상점 정보 로딩 실패");
		}finally {
			session.close();
		}
		return list;
	}
	
	public ShopDTO selectShop(String sCode)throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		
		ShopDTO dto = null; 
		try {
			dto = session.selectOne("ShopMapper.selectShop",sCode);
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("상점 정보 로딩 실패");
		}finally {
			session.close();
		}
		return dto;
	}
	
	public List<ShopDTO> selectByStation(String station)throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		
		List<ShopDTO> list = null; 
		try {
			list = session.selectList("ShopMapper.selectByStation", station);
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("역으로 검색 로딩 실패");
		}finally {
			session.close();
		}
		return list;
	}

}
