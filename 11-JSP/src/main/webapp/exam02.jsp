<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Calendar cal = Calendar.getInstance();
	int yy = cal.get(Calendar.YEAR);
	int mm = cal.get(Calendar.MONTH)+1;
	int dd = cal.get(Calendar.DAY_OF_MONTH);
	
	String result = String.format("%d년 %d월 %d일", yy,mm,dd);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>오늘은 <%=result %> 입니다.</p>
</body>
</html>