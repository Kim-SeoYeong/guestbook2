<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--
<%
	request.setCharacterEncoding("UTF-8");
	//어차피 no만 필요하니까 아래에 내용은 할 필요가 없었음..
	//GuestVo guestVo = (GuestVo)request.getAttribute("gvo");	//Object타입이기 때문에 형변환 시켜줘야함.
	//toString() 출력해보자
	//System.out.println(guestVo);
	int no = Integer.parseInt(request.getParameter("no"));
%>
--%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/guestbook2/gctrl" method="post">
		비밀번호 : <input type="password" name="password">
		<button type="submit">확인</button>
		<input type="hidden" name="no" value="${param.no}">
		<input type="hidden" name="action" value="guestDelete"> <!-- action값을 전달하기 위해 hidden으로 표시 -->
		<br><br>
		<a href="/guestbook2/gctrl?action=guestList">메인으로 돌아가기</a>
	</form>
</body>
</html>