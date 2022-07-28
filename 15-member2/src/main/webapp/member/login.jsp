<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	//1.로그인창 데이터처리
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//2.로그인창 DB 처리
	MemberDAO dao = new MemberDAO();
	String name = dao.login(id, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(name != null){ %>
	<%=name%>(<%=id %>)님이 로그인 하셨습니다.
<%} else{ %>
	아이디 또는 비밀 번호가 틀렸습니다. 다시 로그인하세요.<br>
	<a href="#" onclick="history.back()">뒤로</a>
<%} %>
</body>
</html>