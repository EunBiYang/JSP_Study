<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "홍길동";
	out.println("출력되는 내용은 <b>"+name+"</b> 입니다.");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>out 내장객체 </title>
</head>
<body>
	<h2>out 내장객체 - out.println()</h2>
	<h2>JSP 표현식</h2>
	<p>출력되는 내용은 <b><%=name %></b> 입니다.</p>
</body>
</html>