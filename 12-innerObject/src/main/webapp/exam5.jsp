<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String info = application.getServerInfo();
	String path = application.getRealPath("/");
	application.log("로그 기록 : "+info);
	System.out.print("로그 기록 : "+info);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application 내장 객체</title>
</head>
<body>
	<h2>application 내장 객체</h2>
	<p>웹 컨테이너의 이름과 버전 : <%=info %></p>
	<p>웹 어플리케이션 폴더의 로컬 시스템 경로 : <%=path %></p>
</body>
</html>