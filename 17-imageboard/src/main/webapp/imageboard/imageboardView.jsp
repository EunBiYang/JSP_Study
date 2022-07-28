<%@page import="imageboard.beam.ImageBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="imageboard.dao.ImageBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	// 1. 데이터
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	// 2. DB 
	ImageBoardDAO dao = new ImageBoardDAO();
	ImageBoardDTO dto = dao.imageBoardView(seq);
		
	
	// 3.공유 데이터 설정
	request.setAttribute("dto", dto);
	request.setAttribute("seq", seq);
	request.setAttribute("pg", pg);
	
	//4.화면 이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardViewResult");
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