package sevice;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import dao.MySqlSessionFactory;

public class SFileService {
	public void upload(String fileName, String fileRealName) {
		SqlSession session = MySqlSessionFactory.getSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("fileName", fileName);
		map.put("fileRealName", fileRealName);
		try {
			int n = session.insert("fileUpload",map);//성공 여부 확인을 위한..
			session.commit();
		}finally {
			session.close();
		}
	}
}
