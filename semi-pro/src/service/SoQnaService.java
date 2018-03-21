package service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.SoQnaDTO;
import exception.MyException;

public class SoQnaService {
	public List<SoQnaDTO> list(String soId) throws MyException{
		//1. 세션 얻기
		SqlSession session = MySqlSessionFactory.getSession();
		//2. 변수선언
		List<SoQnaDTO> qnaList = null; //qna 목록
		try {
			qnaList = session.selectList("SoQnaMapper.soQnaList",soId);
		}finally {
			//세션 닫기
			session.close();
		}
		return qnaList;
	}
	
	//글자세히 보기
	public SoQnaDTO retrieve(int qnaNum){
		//1. 세션 얻기
		SqlSession session = MySqlSessionFactory.getSession();
		SoQnaDTO dto = null;
		try {
			dto = session.selectOne("soQnaRetrieve", qnaNum);
		}finally {
			session.close();
		}
		return dto;
	}//end list()
	
	public void soQnaWrite(HashMap<String, String> map) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.insert("SoQnaMapper.soQnaWrite",map);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("1:1문의 에러");
		}finally {
			session.close();
		}
	}
	
	public void soQnaModify(HashMap<String, Object> map) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		System.out.println("soQnaModify");
		try {
			int n = session.update("SoQnaMapper.soQnaModify",map);
			System.out.println("soQnaModify");
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("1:1문의 수정 에러");
		}finally {
			session.close();
		}
	}
	
	public void soQnaDelete(HashMap<String, Object> map) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		try {
			int n = session.delete("SoQnaMapper.soQnaDelete",map);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("1:1문의 삭제 에러");
		}finally {
			session.close();
		}
	}
}
