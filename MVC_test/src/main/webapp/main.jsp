<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	height: 100%;
}

#main {
	width: 800px;
	height: 600px;
	margin: 0 auto;
	/*위아래 마진 0, 좌우 오토*/
}

#header {
	color: white;
	width: 100%;
	height: 15%;
	text-align: center;
	border: 1px solid white;
	background: skyblue;
}

#container {
	width: 100%;
	height: 80%;
	border: 1px solid white;
}

#nav {
	width: 20%;
	height: 100%;
	background: orange;
	float: left;
	text-align: center;
}

#section {
	width: 80%;
	height: 100%;
	float: left;
}

#footer {
	clear: both;
	color: white;
	width: 100%;
	height: 10%;
	text-align: center;
	border: 1px solid white;
	background: lightgreen;
}

a {color: black;}
a:hover {color: green;}
</style>
</head>
<body>
<div id="main">
	<div id="header">
		<h1> 도서 관리 웹</h1>
	</div>

	<div id="container">
			<div id="nav">
				<h2 align="center">
					<a href="main.jsp">*메인화면*</a>
				</h2>
				
				<div align="center">					
						<a href="bookWriteForm.do">도서 입력</a><br>
						<a href="bookList.do?pg=1">도서 목록</a><br> 
				</div>
			</div>

			<div id="section">
				<c:if test="${req == null}">
					<img alt="징징이" src="2.png" width="100%" height="100%">
				</c:if>
				<c:if test="${req != null}">
					<jsp:include page="${req}" />
				</c:if>
			</div>
		</div>

	<div id="footer"><h4>Book2List MVC Test</h4></div>


</div>
</body>
</html>