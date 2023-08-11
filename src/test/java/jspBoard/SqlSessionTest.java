package jspBoard;

import static org.junit.jupiter.api.Assertions.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.jupiter.api.Test;

import mybatis.SqlSessionBean;

class SqlSessionTest {
	
	@Test
	void connect() {
		SqlSession sqlsession = SqlSessionBean.getSession();
		assertNotNull(sqlsession);
		
	}


}
