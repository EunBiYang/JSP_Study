<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>정말로 탈퇴하시겠습니까?</h2>
	<form action="memberDelete.do" name="frm">
		<input type="hidden" name="id" value="${memId}">
		<input type="submit" value="확인">
		<input type="button" value="취소" onclick="location.href='index.jsp'">
	</form>
</body>
</html>