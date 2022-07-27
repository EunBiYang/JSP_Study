<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String num1 = request.getParameter("num1");
	String num2 = request.getParameter("num2");
	int result = Integer.parseInt(num1) + Integer.parseInt(num2);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>두수의 합 구하기</h1>
	<br>
	<p><%=num1 %>+<%=num2 %> = <%=result %>
	
</body>
</html>