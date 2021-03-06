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
			String sCode=dto.getsCode();
			System.out.println(sCode);
			int n=session.insert("SMapper.sAdd",dto);
			int n2=session.insert("SMapper.sScoreInsert1",sCode);
			int n3=session.insert("SMapper.sScoreInsert2",sCode);
			int n4=session.insert("SMapper.sScoreInsert3",sCode);
			int n5=session.insert("SMapper.sScoreInsert4",sCode);
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
		
		try {
			int n=session.update("SMapper.sImageAdd",map2);
			System.out.println(n);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("이미지 DB 등록 에러");
		}finally {
			
		}
	}
	
	
	public void sDelAll(String sCode) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n=session.delete("SMapper.sDelScore",sCode);
			int n2=session.delete("SMapper.sDelInterest",sCode);
			int n3=session.delete("SMapper.sDelReview",sCode);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("상점 삭제 에러1");
		}finally {
			session.close();
		}
	}
	
	public void sDel(String soId) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n=session.delete("SMapper.sDel",soId);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("상점 삭제 에러2");
		}finally {
			session.close();
		}
	}
	
	
}
