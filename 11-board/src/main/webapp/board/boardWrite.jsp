<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   //post 방식 한글설정
   request.setCharacterEncoding("utf-8");
   // 데이터 처리
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");
   String name = (String)session.getAttribute("memName"); 
   String id = (String) session.getAttribute("memId");
   
   // DB 처리
   BoardDTO dto = new BoardDTO();
   dto.setId(id);
   dto.setName(name);
   dto.setSubject(subject);
   dto.setContent(content);
   
   BoardDAO dao = new BoardDAO();
   int result = dao.boardWrite(dto);
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	if(<%=result > 0%>) {
		alert("작성하신 글을 저장하였습니다.");		
	} else {
		alert("작성하신 글을 저장하지 못하였습니다.");
	}
	location.href="boardList.jsp?pg=1";
</script>
</head>
<body>

<%--
<% 	if(result > 0) { %>
		작성하신 글을 저장하였습니다.
<%	} else { %>
		작성하신 글을 저장하지 못하였습니다.
<%	} %>
 --%>
      <!--   %>이름 : <!%=name %><br>
      제목 : <!%=subject %><br>
      내용 : <!%=content %><br> -->
</body>
</html>