<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	height: 100%;
}

#main1 {
	width: 800px;
	height: 600px;
	margin: 0 auto;
	/*위아래 마진 0, 좌우 오토*/
}

#header1 {
	color: white;
	width: 100%;
	height: 15%;
	text-align: center;
	border: 1px solid white;
	background: skyblue;
}

#container1 {
	width: 100%;
	height: 80%;
	border: 1px solid white;
}

#nav1 {
	width: 20%;
	height: 100%;
	background: orange;
	float: left;
	text-align: center;
}

#section1 {
	width: 80%;
	height: 100%;
	float: left;
}

#footer1 {
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
	<div id="main1">
		<div id="header1">
			<h1>게시판</h1>
		</div>

		<div id="container1">
			<div id="nav1">
				<h2 align="center">
					<a href="index.jsp">*메인화면*</a>
				</h2>
				
				<div align="center">
					<c:if test="${memId == null}">
						<a href="memberLoginForm.do">로그인</a><br>
						<a href="memberWriteForm.do">회원가입</a><br> 
					</c:if>
					<c:if test="${memId != null}">
						<a href="memberLogout.do">로그아웃</a><br>
						<a href="memberModifyForm.do">회원정보수정</a><br>
						<a href="memberDeleteForm.do">회원탈퇴</a><br>
						<a href="memberList.do?pg=1">회원목록</a><br>
					</c:if>
				</div>
			</div>

			<div id="section1">
				<c:if test="${req == null}">
					<img alt="징징이" src="2.png" width="100%" height="100%">
				</c:if>
				<c:if test="${req != null}">
					<jsp:include page="${req}" />
				</c:if>
			</div>
		</div>

	
	<div id="footer1">
		<p>EZEN IT ACADEMY</p>
	</div>
</div>
</body>
</html>