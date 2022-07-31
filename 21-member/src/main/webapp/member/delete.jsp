<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>삭제 성공</title>

</head>
<body>
	<c:if test="${result > 0 }">
		<p>회원 탈퇴 성공</p>
	</c:if>
	<c:if test="${result == 0 }">
		<p>회원 탈퇴 실패</p>
	</c:if>
</body>
</html>