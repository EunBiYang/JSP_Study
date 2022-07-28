<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//데이터 공유 (내장객체별)
	pageContext.setAttribute("apple1", "사과1");		//현재 페이지까지 데이터 공유
	request.setAttribute("apple2", "사과2");			//다음 페이지까지 데이터 공유, forward 방식으로 움직였을때만, sedRedirect는 x
	session.setAttribute("apple3", "사과3");			//브라우저가 열려있는 동안 모든 페이지에서
	application.setAttribute("apple4", "사과4");		//서버가 동작되는 동안 모든 브라우저에서

	
	//페이지이동
	//<jsp:forward page="forwardResult.jsp"/>코드 대신 아래코드 사용
	RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp");
	dispatcher.forward(request,response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 	<!-- 페이지 이동 -->
	<jsp:forward page="forwardResult.jsp"/> --%>
</body>
</html>