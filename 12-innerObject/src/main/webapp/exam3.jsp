<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	response.sendRedirect("exam3Pro.jsp");
	//위에서 이렇게 넣으면 아래 코드들은 실행되기전에 exam3Pro.jsp로 넘어가 버린다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	alert("현재 페이지는 exam.jsp 입니다.");

</script>
</head>
<body>
	<h2>response 내장 객체 - 리다이렉트</h2>
	
</body>
</html>