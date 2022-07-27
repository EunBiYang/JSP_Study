<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 메인화면</title>
</head>
<body>
	<h3>***메인화면***</h3>
	<a href="../board/boardList.jsp?pg=1">목록</a><br>
<% if(session.getAttribute("memId")== null){ %>
	<!-- 로그인 전후 화면(세션 이용) -->
	<!-- 로그인 전 상태 -->
	<a href="../member/loginForm.jsp">로그인</a><br>
	<a href="../member/writeForm.jsp">회원가입</a><br>
	
<% } else { %>
	<!-- 로그인 후 상태 -->
	<a href="../board/boardWriteForm.jsp">글쓰기</a><br>
	<a href="../member/logout.jsp">로그아웃</a><br>
	<a href="../member/modifyForm.jsp">회원정보수정</a><br>
	<a href="../member/deleteForm.jsp">회원탈퇴</a><br>
	<a href="../member/memberList.jsp?pg=1">회원 목록</a><br>
<% } %>	
</body>
</html> 