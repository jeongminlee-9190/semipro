package service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.MemberDTO;
import exception.MyException;

public class MemberService{
	
	public void mJoin(MemberDTO dto) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		System.out.println(dto);
		try {
			int n = session.insert("MemberMapper.memberJoin",dto);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("회원 가입 에러");
		}finally {
			session.close();
		}		
	}
	
	public int mIdCheck(String mId) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		int count=0;
		try {
			//mapper에서 값 가져오기
			count=session.selectOne("MemberMapper.mIdCheck",mId);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("아이디 체크 에러");
		}finally {
			session.close();
		}
		return count;
	}
	
	public int mNameCheck(String mName) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		int count=0;
		try {
			//mapper에서 값 가져오기
			count=session.selectOne("MemberMapper.mNameCheck",mName);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("닉네임 체크 에러");
		}finally {
			session.close();
		}
		return count;
	}
}
