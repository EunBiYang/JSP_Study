<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터 공유 (내장객체별)
	pageContext.setAttribute("apple1", "사과1");		//현재 페이지까지 데이터 공유
	request.setAttribute("apple2", "사과2");			//다음 페이지까지 데이터 공유, forward 방식으로 움직였을때만, sedRedirect는 x 
	session.setAttribute("apple3", "사과3");			//브라우저가 열려있는 동안 모든 페이지에서
	application.setAttribute("apple4", "사과4");		//서버가 동작되는 동안 모든 브라우저에서
	
	//페이지 이동
	response.sendRedirect("sendResult.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  jsp표현식 사용 -->
	<%=pageContext.getAttribute("apple1") %><br>
	<%=request.getAttribute("apple2") %><br>
	<%=session.getAttribute("apple3") %><br>
	<%=application.getAttribute("apple4") %><br>
	<hr>
	
	<!-- EL 표현식 사용 -->
	${pageScope.apple1 }<br>
	${requestScope.apple2 }<br>
	${sessionScope.apple3 }<br>
	${applicationScope.apple4 }<br>
	<hr>
	<!-- Scope생략 가능 -->
	${apple1 }<br>
	${apple2 }<br>
	${apple3 }<br>
	${apple4 }<br>
</body>
</html>