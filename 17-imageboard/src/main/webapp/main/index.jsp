<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
body{
	margin: 0;
	padding: 0;
	height: 100%;
}
#main{
	width: 700px;
	height: 600px;
	margin: 0 auto; 
	/*위아래 마진 0, 좌우 오토*/
}
#header{
	color : white;
	width: 100%;
	height: 10%;
	text-align: center;
	border: 1px solid white;
	background: skyblue;
}
#container{
	width: 100%;
	height: 80%;
	border: 1px solid white;
}
#nav{
	width: 20%;
	height: 100%;
	background: orange;
	float: left;
	text-align: center;
}
#section{
	width: 80%;
	height:100%; 
	float: left;
	
}
#footer{
	clear : both;
	color : white;
	width: 100%;
	height: 10%;
	text-align: center;
	border: 1px solid white;
	background: lightgreen;
}
a {color: black; text-decoration: none;}
a:hover{color: green;}
</style>
</head>
<body>
<div id="main">
	<div id="header">
	
		<h1>이미지 게시판</h1>
	</div>
	
	<div id="container">
		<div id="nav">
			<h3><a href="../main/index.jsp">** 메인화면 **</a></h3>
			<a href="#">회원가입</a><br>
			<a href="#">로그인</a><br>
			<a href="#">로그아웃</a><br>
			<a href="#">회원정보수정</a><br>
			<a href="#">글쓰기</a><br>
			<a href="#">글목록</a><br>
			<a href="../main/index.jsp?req=imageboardWriteForm">이미지 등록</a><br>
			<a href="../imageboard/imageboardList.jsp?pg=1">이미지 목록</a><br>
			
		</div>
	
		<div id="section">
			<c:if test="${param.req == null}">
				<jsp:include page="body.jsp"/>
			</c:if>
			
			<c:if test="${param.req =='imageboardWriteForm'}">
				<jsp:include page="../imageboard/imageboardWriteForm.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardWriteResult' }">
				<jsp:include page="../imageboard/imageboardWriteResult.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardListResult' }">
				<jsp:include page="../imageboard/imageboardListResult.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardViewResult' }">
				<jsp:include page="../imageboard/imageboardViewResult.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardDeleteResult' }">
				<jsp:include page="../imageboard/imageboardDeleteResult.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardModifyForm' }">
				<jsp:include page="../imageboard/imageboardModifyForm.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardModifyResult' }">
				<jsp:include page="../imageboard/imageboardModifyResult.jsp"/>
			</c:if>
			
		</div>
	</div>
	
	<div id="footer">
		<p>EZEN IT ACADEMY</p>
	</div>
</div>	
</body>
</html>
