package com.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dto.InterestDTO;
import com.dto.ReviewDTO;
import com.dto.SearchResultDTO;
import com.dto.ShopDTO;

import dao.MySqlSessionFactory;
import dto.MemberDTO;
import exception.MyException;

public class ShopTrieveService {
	
	public String reviewWrite(HashMap<String,String> map)throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		
		ReviewDTO dto = session.selectOne("ShopTrieveMapper.reviewCheck",map);
		if(dto == null) {
			try {
				session.insert("ShopTrieveMapper.reviewWrite",map);
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
				throw new MyException("리뷰 저장 실패");
			}finally {
				session.close();
			}
			return "1";
		}
		return "0";
	}


}
