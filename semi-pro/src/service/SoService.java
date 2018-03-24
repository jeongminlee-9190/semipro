package service;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.SoDTO;
import dto.SoQnaDTO;
import exception.MyException;

public class SoService {
	public int soIdCheck(String oId) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		int count=0;
		try {
			//mapper에서 값 가져오기
			count=session.selectOne("SoMapper.soIdCheck",oId);
		}catch(Exception  e) {
			throw new MyException("아이디 체크 에러");
		}finally {
			session.close();
		}
		return count;
	}
	
	public void soAdd(SoDTO dto) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n=session.insert("SoMapper.soAdd",dto);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("회원가입 에러");
		}finally {
			session.close();
		}
	}
	
	public SoDTO login(HashMap<String, String> map) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		SoDTO dto=null;
		try {
			dto=session.selectOne("SoMapper.login", map);
		}catch(Exception e){
			
			e.printStackTrace();
			throw new MyException("로그인 에러");
		}finally {
			session.close();
		}
		return dto;
	}//end of login
	
	
	public SoDTO myPage(String soId) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		SoDTO dto=null;
		try {
			dto=session.selectOne("SoMapper.myPage", soId);
		}catch(Exception e){
			//e.printStackTrace();
			throw new MyException("mypage 접근 에러");
		}finally {
			session.close();
		}
		return dto;
	}//end of myPage
	
	
	public String findSoId(HashMap<String, String> map) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		String soId = null;
		try {
			soId= session.selectOne("SoMapper.findSoId",map);
			System.out.println(soId);
		}catch(Exception e) {
			throw new MyException("아이디 찾기 에러");
		}
		return soId;
	}//end of findSoId
	
	public String findSoPasswd(HashMap<String, String> map) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		String soPasswd = null;
		try {
			soPasswd= session.selectOne("SoMapper.findSoPasswd",map);
		}catch(Exception e) {
			throw new MyException("비밀번호 찾기 에러");
		}
		return soPasswd;
	}//end of findSoId
	
	public void soPasswdUpdate(HashMap<String, String> map) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("SoMapper.soPasswdUpdate",map);
			session.commit();
		}catch(Exception e){
			throw new MyException("shopowner 비밀번호 수정 에러");
		}finally {
			session.close();
		}
	}
	
	public void soPhoneUpdate(HashMap<String, String> map) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.update("SoMapper.soPhoneUpdate",map);
			session.commit();
		}catch(Exception e){
			throw new MyException("shopowner 전화번호 수정 에러");
		}finally {
			session.close();
		}
	}

	public void soLeave(String soId) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n=session.delete("SoMapper.soLeave",soId);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("상점 회원 탈퇴 에러");
		}finally {
			session.close();
		}
	}
	
	
	/*
	public void memberAdd(MemberDTO dto) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			
		}catch(Exception e){
			
		}finally {
			
		}
	}
	*/
}
