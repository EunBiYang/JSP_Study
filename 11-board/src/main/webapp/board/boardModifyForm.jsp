<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 데이터
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	// db
	BoardDAO dao = new BoardDAO();
	// 1줄 데이터 가져오기
	BoardDTO dto = dao.boardView(seq);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/boardScript.js?v=4"></script>
</head>
<body>
	<%-- seq 값을 다음페이지로 전달하는 방식
		1) get 방식
			boardModify.jsp?seq=<%=seq%>
		2) <input type="hidden"> 방식
	 --%>
	<form action="boardModify.jsp" method="post" name="boardModifyForm">
		<input type="hidden" name="seq" value="<%=seq%>">
		<input type="hidden" name="pg" value="<%=pg%>">
		
		<table border="1" style="width: 450px;">
			<tr>
				<td align="center" width="50px">제목</td>
				<td>
					<input type="text" name="subject" style="width:95%" value="<%=dto.getSubject() %>">
				</td>
			</tr>
			
			<tr>
				<td align="center">내용</td>
				<td>
					<textarea type="text" name="content" style="width:95%; height:200px;"><%=dto.getContent()%></textarea>
				</td>
			</tr>
			
			<tr>
				<td align="center" colspan="2">
					<input type="button" value="수정" onclick="checkBoardModify()">
					<input type="button" value="다시 작성" onclick="reset1()"></td>
			</tr>
		</table>
	</form>
	<input type="button" value="메인화면" onclick="location.href='../main/index.jsp'">
</body>
</html>