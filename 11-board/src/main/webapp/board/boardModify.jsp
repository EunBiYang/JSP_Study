<%@page import="board.dao.BoardDAO"%>
<%@page import="board.bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	// 데이터
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");	
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	//System.out.println("seq = " + seq);
	// DB
	BoardDTO dto = new BoardDTO();	
	dto.setSeq(seq);
	dto.setSubject(subject);
	dto.setContent(content);
	   
	BoardDAO dao = new BoardDAO();
	int result = dao.boardModify(dto);	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(<%=result > 0%>) {
		alert("작성한 글을 수정하였습니다.");
	} else {
		alert("작성한 글을 수정하지 못했습니다.");
	}
	location.href = "boardView.jsp?seq=<%=seq%>&pg=<%=pg%>";
</script>
</head>
<body>

</body>
</html>