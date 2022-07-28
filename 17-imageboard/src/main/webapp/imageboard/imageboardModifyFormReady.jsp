<%@page import="imageboard.beam.ImageBoardDTO"%>
<%@page import="imageboard.dao.ImageBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	//DB, 게시글 1개 처리
	ImageBoardDAO dao = new ImageBoardDAO();
	ImageBoardDTO dto = dao.imageBoardView(seq);
	
	//공유데이터 설정
	request.setAttribute("dto", dto);
	request.setAttribute("seq", seq);
	request.setAttribute("pg", pg);
	
	//이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardModifyForm");
	dispatcher.forward(request, response);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>