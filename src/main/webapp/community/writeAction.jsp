<%@page import="java.net.InetAddress"%>
<%@page import="java.net.Inet4Address"%>
<%@page import="org.iclass.dao.CommunityDao"%>
<%@page import="org.iclass.dto.BookUser"%>
<%@page import="org.iclass.dto.Community"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//    모든 POST 방식의 인코딩을 위해서 한 번에 처리하도록 함.
//    request.setCharacterEncoding("UTF-8");  //filter가 실행함.   

    BookUser writer = (BookUser) session.getAttribute("user");
//   세션 비교 코드 필요함.
    if (writer != null) {   // 로그인 상태일 때만
//    String writer = request.getParameter("writer");
	    String ip = request.getRemoteAddr();
	    String title = request.getParameter("title");
	    String content = request.getParameter("content");
	    CommunityDao dao = CommunityDao.getInstance();
	    long idx = dao.insert(Community.builder()
	          .writer(writer.getId())    // 세션에서 로그인 id 가져오기
	//        .writer(writer)   
	            .title(title)
	            .content(content)
	            .ip(ip)
	            .build());
	    //idx 확인 위한 
	    pageContext.setAttribute("idx", idx);
    }else {
    	response.sendRedirect("../login.jsp");
    }
    
%>
<script type="text/javascript">
   alert('${idx} 번 글 등록이 완료되었습니다.')
//  location.href='list.jsp'     
//  방금 작성한 글 상세보기로 이동하기
    location.href="read.jsp?idx=${idx}"
</script>





