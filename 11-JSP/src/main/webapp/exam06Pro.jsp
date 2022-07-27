<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//가져오기
String name = request.getParameter("name");
String area = request.getParameter("area");
String num = request.getParameter("num");
String tel = area+"-"+num;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화번호</title>
</head>
<body>

</body>
 <p><%=name%>님 전화번호는 <%=tel%> 입니다.</p>
</html>