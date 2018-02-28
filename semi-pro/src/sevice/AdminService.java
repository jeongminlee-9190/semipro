package sevice;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import com.dao.MySqlSessionFactory;
import com.dto.AdminDTO;
import com.dto.MemberDTO;
import com.dto.PageDTO;
import com.exception.MyException;

public class AdminService {
	
	public MemberDTO m_updatelist(int rownum)throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();		
		MemberDTO dto = null;
		try {
			dto = session.selectOne("AdminMapper.m_updatelist",rownum);		
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("멤버 수정리스트 에러");
		}finally {
			session.close();
		}
		
		return dto;
	}
	
	//member 리스트
	public List<MemberDTO> memberlist()throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();		
		List<MemberDTO> list = null;
		try {
			list = session.selectList("AdminMapper.memberlist");
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("멤버리스트 에러");
		}finally {
			session.close();
		}
		
		return list;
	}//end list()
	
	//Admin 로그인
	public AdminDTO login(HashMap<String, String> map)throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		AdminDTO dto = null;
		try {
			dto = session.selectOne("AdminMapper.adminlogin",map);
		}catch(Exception e) {
			e.printStackTrace();
			throw new MyException("로그인 에러");
		}finally {
			session.close();
		}
		return dto;
	}


}//end
