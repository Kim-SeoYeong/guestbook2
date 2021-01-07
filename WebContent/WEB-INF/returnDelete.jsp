<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	
	int no = Integer.parseInt(request.getParameter("no")); 

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>잘못된 비밀번호입니다. 다시 입력해주세요</h1>
	<br>
	<a href="/guestbook2/gctrl?action=guestDelForm&no=<%=no%>">비밀번호 다시 입력하기</a><!-- guestDelForm에서 받을 no가 있어야하기 때문에 -->
</body>
</html>