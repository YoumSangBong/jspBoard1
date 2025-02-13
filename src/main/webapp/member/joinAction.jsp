<%@page import="org.iclass.dto.BookUser"%>
<%@page import="org.iclass.dao.BookUserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("userid");
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("email");
	
		BookUserDao dao = BookUserDao.getInstance();
// 		dao.insert (new BookUser(id,email,name,password,age,null));
		BookUser dto = BookUser.builder()
						.id(id)          // id() 메소드는 setId() 역할
						.email(email)
						.name(name)
						.password(password)
						.age(age)
						.build();

		dao.insert(dto);

	%>
	<script>
		alert('회원가입이 완료되었습니다.')
		if(confirm('로그인 하시겠습니까?')){
			location.href='../login.jsp'
		}else {
			location.href='/jspBoard/'
		}
	</script>
</body>
</html>