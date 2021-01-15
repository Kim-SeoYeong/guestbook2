<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- 
<%
	request.setCharacterEncoding("UTF-8");
	List<GuestVo> guestList = (List<GuestVo>)request.getAttribute("gList");
	
	System.out.println(guestList);	//toString() 찍어보자
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
		<table border="1" width="500">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value=""></td>
				<td>비밀번호</td>
				<td><input type="password" name="password" value=""></td>
			</tr>
			<tr>
				<td colspan="4">
					<textarea cols=60 rows=5 name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<button type="submit">확인</button>
				</td>
			</tr>
		</table>
		<input type="hidden" name="action" value="guestInsert">	<!-- action값을 넘겨줘야함. 안보이도록 hidden으로 처리 -->
	</form>
	
	<br><br>

	<c:forEach items="${requestScope.gList}" var="guestList">
		<table border="1" width="500">
			<tr>
				<td>${guestList.no}</td>
				<td>${guestList.name}</td>
				<td>${guestList.regDate}</td>
				<td><a href="/guestbook2/gctrl?action=guestDelForm&no=${guestList.no}">삭제</a></td>
			</tr>
			<tr>
				<td colspan="4">
					${guestList.content}
				</td>
			</tr>
		</table>
		<br>
	</c:forEach>
</body>
</html>