package sevice;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;
import dto.SDTO;
import dto.SFileDTO;
import exception.MyException;

public class SFileService {
	public void Imageupload(HashMap<String, String> map) throws MyException {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, String> map2 = new HashMap<>();
		String soId = map.get("soId");
		String sImage1 = map.get("fileName1");
		String sImage2 = map.get("fileName2");
		String sImage3 = map.get("fileName3");
		String sImage4 = map.get("fileName4");
		String sImage5 = map.get("fileName5");
		String fileName=sImage1+"/"+sImage2+"/"+sImage3+"/"+sImage4+"/"+sImage5;
		
		System.out.println(soId);
		SFileDTO dto = new SFileDTO(fileName, soId);
		
		try {
			int n=session.insert("SFileMapper.imageUpload",dto);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("이미지 DB 등록 에러");
		}finally {
			session.close();
		}
	}
	
	public SFileDTO sImageInfo(String sCode) throws MyException{
		SqlSession session = MySqlSessionFactory.getSession();
		SFileDTO dto = null;
		try {
			dto=session.selectOne("SFileMapper.sImageInfo",sCode);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new MyException("이미지 조회 에러");
		}finally {
			session.close();
		}
		return dto;
	}
}
