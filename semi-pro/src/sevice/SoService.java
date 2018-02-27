package sevice;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.SoDTO;
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
	}//end of login
	
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
