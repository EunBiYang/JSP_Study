<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//읽어오기
String area = request.getParameter("area");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>권역</title>
</head>
<body>
	<p>선택하신 지역은 <%=area%>입니다.</p>
</body>
</html>