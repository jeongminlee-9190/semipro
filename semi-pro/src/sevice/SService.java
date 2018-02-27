package sevice;

import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.SDTO;
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
	
}
