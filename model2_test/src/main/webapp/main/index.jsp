<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
	margin: 0;
	padding: 0;
	height: 100%;
}
#main{
	width: 1000px;
	height: 500x;
	margin: 0 auto; 
}
#header{
	color : white;
	width: 1000px;
	height: 10%;
	text-align: center;
	border: 1px solid white;
	background: brown;
}
#container{
	width: 70%;
	height: 80%;
	border: 1px solid white; 
	}
#nav{
	width: 30%;
	height: 500px;
	background: #FFA07A;
	float: left;
	text-align: center;
}
#section{
	width: 70%;
	height: 500; 
	float: left;
	
}
#footer{
	clear : both;
	color : white;
	width: 100%;
	height: 100px;
	text-align: center;
	border: 1px solid white;
	background: brown;
}
a {
	color: black;
	text-decoration: none;}
a:hover{color: green;}
</style>
</head>
<body>
<div id="main">
	<div id="header">
		<h1> 도서 관리 웹</h1>
	</div>

	<div id="container">
		<div id="nav">
			<h2><a href="../main/index.jsp"> ▷▶ 메뉴 ◀◁ </a></h2>
			<h3><a href="../main/index.jsp?req=writeForm">도서입력</a></h3>
			<h3><a href="../main/index.jsp?req=bookList&pg=1">도서목록</a></h3>
			
		</div>
		<div id="section" align="center">
			<c:if test = "${param.req == null}">
				<jsp:include page="body.jsp"/>
			</c:if>
			<c:if test = "${param.req == 'writeForm'}">
				<jsp:include page="../book/writeForm.jsp"/>
			</c:if>
			<c:if test="${param.req == 'writeResult' }">
				<jsp:include page="../book/writeResult.jsp"/>
			</c:if>
			<c:if test="${param.req == 'bookList' }">
				<jsp:include page="../book/bookList.jsp"/>
			</c:if>
			<c:if test="${param.req == 'bookListResult' }">
				<jsp:include page="../book/bookListResult.jsp"/>
			</c:if>
		</div>
	</div>

	<div id="footer"><h4>BookList Test</h4></div>


</div>
</body>
</html>