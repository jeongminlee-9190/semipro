package service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.SDTO;
import dto.SoDTO;
import exception.MyException;

public class SService {
	public void sAdd(SDTO dto) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n=session.insert("SMapper.sAdd",dto);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("상점 등록 에러");
		}finally {
			session.close();
		}
	}
	
	
	public SDTO sInfo(String soId) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		SDTO dto = null;
		try {
			dto=session.selectOne("SMapper.sInfo",soId);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("상점 정보 조회 에러");
		}finally {
			session.close();
		}
		return dto;
	}
	
	public String sCodeInfo(String soId) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		String sCode=null;
		try {
			sCode=session.selectOne("SMapper.sCodeInfo",soId);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("sCode 검색 에러");
		}finally {
			session.close();
		}
		return sCode;
	}
	
	public void sImageAdd(HashMap<String, String> map) throws MyException {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, String> map2 = new HashMap<>();
		String sCode = map.get("sCode");
		String sImage1 = map.get("fileName1");
		String sImage2 = map.get("fileName2");
		String sImage3 = map.get("fileName3");
		String sImage4 = map.get("fileName4");
		String sImage5 = map.get("fileName5");
		String sImage=sImage1+"/"+sImage2+"/"+sImage3+"/"+sImage4+"/"+sImage5;
		
		
		map2.put("sCode",sCode);
		map2.put("sImage", sImage);
		System.out.println(map2.get("sImage"));
		System.out.println(map2.get("sCode"));
		System.out.println(map2);
		
		try {
			int n=session.update("SMapper.sImageAdd",map2);
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("이미지 DB 등록 에러");
		}finally {
			
		}
	}
	
	public void sDel(String soId) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n=session.delete("SMapper.sDel",soId);
			int n2=session.delete("SMapper.simageDel",soId);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("상점 삭제 에러");
		}finally {
			session.close();
		}
	}
}
