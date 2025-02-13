package org.iclass.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.iclass.dto.BookUser;

import mybatis.SqlSessionBean;


public class BookUserDao {		
	
	private static BookUserDao dao = new BookUserDao();
	private BookUserDao() { }
	public static BookUserDao getInstance() {
		return dao;
	}
	
	public BookUser login(Map<String,String> map)  {
		SqlSession mapperSession = SqlSessionBean.getSession();
		BookUser vo = mapperSession.selectOne("bookuser.login",map);
		mapperSession.close();
		return vo;
	}
	
	public int insert(BookUser dto) {
		SqlSession mapperSession = SqlSessionBean.getSession();
		int result = mapperSession.insert("bookuser.insert",dto);
		mapperSession.commit();
		mapperSession.close();
		return result;
	}
}
