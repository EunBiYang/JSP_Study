<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//가져오기
String id = request.getParameter("ID");
String pw = request.getParameter("PW");
/*
if(id.equals("root") && pw.equals("1234")){
	out.print ("로그인에 성공했습니다.");
}else{
	out.print ("로그인에 실패했습니다.");
}
*/	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(id.equals("root") && pw.equals("1234")){%>
	<p>로그인에 성공했습니다.</p>
<%}else{ %>
	<p>로그인에 실패했습니다.</p>
<%}%>
</body>
</html>