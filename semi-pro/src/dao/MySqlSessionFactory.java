package dao;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.ibatis.io.Resources;

public class MySqlSessionFactory {
	static SqlSessionFactory sqlSessionFactory;
	static {
		String resource = "jdbc/Configuration.xml";
		InputStream inputstream = null;
		try {
			inputstream = Resources.getResourceAsStream(resource);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		sqlSessionFactory= new SqlSessionFactoryBuilder().build(inputstream);
	}//end of static
	
	public static SqlSession getSession() {
		return sqlSessionFactory.openSession();
	}
	
}
