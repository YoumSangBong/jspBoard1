<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	ul#header {
		list-style: none;
		padding: 10px 20px;
		display: flex;
		justify-content: center;
		margin: 0;
	}
	nav {
		padding : 5px;
		font-size: 0.7rem;
		display: flex;
		justify-content: flex-end;
		background-color: orange;
		color: white;
	}
	
	ul#header > li {
		padding: 20px;
	}
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
  <header>	
	<ul id="header">
		<li><a href="<%= request.getContextPath() %>">HOME</a></li>
		<li><a href="#">회사소개</a></li>
		<li><a href="#">도서</a></li>
		<!-- include 하는 header.jsp에서는 절대 경로로 지정합니다.
			 포함시키는 페이지의 경로가 모두 다르기 때문입니다.
		  -->
		<li><a href="<%= request.getContextPath() %>/community/list.jsp">커뮤니티</a></li>
		<li><a href="#">고객센터</a></li>
	</ul>
	<nav>
			<!-- "user" 라는 이름의 애트리뷰트 가져오기 -->
			<c:if test="${user !=null }">
				<h4><c:out value="${user.name }"/> 님 환영합니다.</h4>
				<p><a href="logout.jsp">로그아웃</a></p>
			</c:if>
			<c:if test="${user ==null }">
				<p><a href="login.jsp">로그인</a></p>
				<p><a href="member/join.jsp">회원가입</a></p>
			</c:if>
				<p><a href="community/list.jsp">커뮤니티</a></p>
	</nav>
   </header>	
</body>
</html>

