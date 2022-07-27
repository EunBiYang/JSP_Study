<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>정보 입력 폼</h2>
	<form action="sessionExamPro.jsp" method="post">
		아이디 : <input type="text" name="id" maxlength="16"><br>
		패스워드 : <input type="password" name="pwd" maxlength="16"><br>
		<input type="submit" value="정보 입력" >
		
	</form>
</body>
</html>