<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="image/tumi.png" width="30" height="30"
		onclick="location.href='index.jsp'" 
		style="cursor: pointer;">
	
	${memName}님(${memId})이 로그인하셨습니다.
	<a href="#" onclick="location.href='index.jsp'">메인으로</a>
	
</body>
</html>