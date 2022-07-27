<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
   String name = request.getParameter("name");
   String age_str = request.getParameter("age");
   
   int age = Integer.parseInt(age_str);

   String str = name + " 님의 나이는 20세 ";

   str += (age>=20) ? "이상입니다.":"미만입니다.";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p><%=str %></p>>
</body>
</html>