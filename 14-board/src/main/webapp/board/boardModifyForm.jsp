<%@page import="board.dao.BoardDAO"%>
<%@page import="board.Bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	//DB작업
	BoardDAO dao = new BoardDAO();
	//1줄 데이터
	BoardDTO dto = dao.boardView(seq); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
<script type="text/javascript" src="../script/boardScript.js?v=1"></script>
</head>
<body>

<%-- seq값을 다음페이지로 전달하는방식
	1)get방식
		boardModify.jsp?seq=<%=seq%>    >이렇게 하면 주소창에 보인다.
	2)<input type="hidden"> 방식
	
<form action="boardModify.jsp?seq=<%=seq%>&pg=<%=pg%>" name="boardModifyForm" method="post">
 --%>
 
 
<form action="boardModify.jsp" method="post" name="fm">
	<input type="hidden" name="seq" value="<%=seq%>">
	<input type="hidden" name="pg" value="<%=pg%>">
	<table border="1">
		<tr>
			<th width="90">제목</th>
			<td width="400" >
				<input type="text" name="subject" style="width: 97%;" value="<%=dto.getSubject()%>">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<th><textarea rows="" cols="" style="height: 300px; width: 97%;" name="content"><%=dto.getContent() %></textarea></th>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="글수정" onclick="checkWrite();">
			<input type="button" value="다시 작성" onclick="reset1();">
			</td>
		</tr>
	</table>
</form>
</body>
</html>