<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	//DB처리
	BoardDAO dao = new BoardDAO();
	int result = dao.boardDelete(seq);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(<%=result >0%>){
		alert("삭제 되었습니다.");
		location.href = "boardList.jsp?pg=<%=pg%>";
	}else{
		alert("삭제 실패입니다.");
		history.back();
	}
</script>
</head>
<body>

</body>
</html>