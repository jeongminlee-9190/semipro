package sevice;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.SoQnaDTO;
import exception.MyException;

public class SoQnaService {
	public List<SoQnaDTO> list(HashMap<String, String> map) throws MyException{
		//1. 세션 얻기
		SqlSession session = MySqlSessionFactory.getSession();
		//2. 변수선언
		List<SoQnaDTO> qnaList = null; //qna 목록
		try {
			qnaList = session.selectList("SoQnaMapper.soQnaList",map);
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
}
