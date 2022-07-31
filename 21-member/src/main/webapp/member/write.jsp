<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<div>
		<c:if test="${result >0}">
			<p>회원 가입 성공</p>
		</c:if>
		<c:if test="${result == 0}">
			<p>회원 가입 실패</p>
		</c:if>
	</div>

	<input type="button" value="메인화면" onclick="location.href='index.jsp'">
</body>
</html>
