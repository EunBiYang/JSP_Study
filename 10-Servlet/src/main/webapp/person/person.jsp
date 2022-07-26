<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//1. 자바영역 : 데이터처리
//http://localhost:8080/10-Servlet/person/person.jsp?
//name=홍길동
//&gender=남자
//&hobby=독서
//&color=green
//&subject=Spring
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobby_arr = request.getParameterValues("hobby");
		String color = request.getParameter("color");
		String[] subject_arr = request.getParameterValues("subject");
		
		//결과값
		String hobby = "";
		for (int i = 0; i < hobby_arr.length; i++) {
			hobby += hobby_arr[i] + " ";
		}

		String subject = "";
		for (int i = 0; i < subject_arr.length; i++) {
			subject += subject_arr[i] + " ";
		}
%>

<!-- 2. HTML 영역 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	color: yellow;
}
a{
	color: yellow;
}
</style>
</head>
<body bgcolor="<%=color%>">
	<ul>
		<li>이름 : <%=name %></li>
		<li>성별 : <%=gender %></li>
		<li>취미 : <%=hobby %></li>
		<li>색깔 : <%=color %></li>
		<li>과목 : <%=subject %></li>
	</ul>
	<br>
	
	<a href="#" onclick="history.back()">뒤로</a>
</body>
</html>