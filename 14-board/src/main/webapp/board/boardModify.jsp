<%@page import="board.dao.BoardDAO"%>
<%@page import="board.Bean.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
	request.setCharacterEncoding("utf-8");
	//내용가져오기
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");


	//게시판 내용 DB처리
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

	if(<%=result >0 %>){
		alert("작성하신 글을 수정하였습니다.");
	}else{
		alert("글 수정에 실패했습니다.");
	}
	location.href="boardList.jsp?seq=<%=seq%>&pg=<%=pg%>";

</script>
</head>
<body>

</body>
</html>