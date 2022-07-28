<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String name = "고길동";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>** include directive **</h3>
	<%@ include file="today.jsp" %> <%--jsp 파일 내용을 그대로 포함시킨다,
									 그래서 변수명 name이 충돌이 나서 에러 발생--%>
	<hr>
	
	<h3>** include JSP tag **</h3>
	<jsp:include page="image.jsp"/>	<%-- jsp파일의 동작 결과물인 html 문서를 포함시킴 
										그래서 변수명의 충돌이 없음 --%>
	<hr>
	
	exam.jsp : name =<%=name %><br>
</body>
</html>