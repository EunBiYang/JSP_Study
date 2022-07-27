<%@page import="board.Bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	//내용가져오기
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String name = (String)session.getAttribute("memName");
	String id = (String)session.getAttribute("memId");
	
	
	//게시판 내용 DB처리
	BoardDTO dto = new BoardDTO();
	dto.setId(id);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setName(name);
	
	BoardDAO dao = new BoardDAO();
	int result = dao.write(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(<%=result >0 %>){
		alert("작성하신 글을 저장하였습니다.");
	}else{
		alert("글 저장에 실패했습니다.");
	}
	location.href="boardList.jsp?pg=1";
</script>

</head>
<body>

<%--
<%  if(result > 0){ %>
	<p>작성하신 글을 저장하였습니다.</p>
<%	}else{ %>
	<p>글 저장에 실패했습니다.</p>
<%	} %>

	<p>
	글쓴이 : <%=name %><br>
	제목 : <%=subject %><br>
	내용 : <%=content %><br>
	</p>
 --%>
 	<input type="button" value="글목록" onclick="location.href='board.jsp'">
</body>
</html>