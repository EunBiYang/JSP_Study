<%@page import="imageboard.dao.ImageBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%	//데이터읽기
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));

	//DB처리
	ImageBoardDAO dao = new ImageBoardDAO();
	int result = dao.imageBoardDelete(seq);

	//공유데이터설정
	request.setAttribute("result", result);
	request.setAttribute("pg", pg);
	
	
	//화면이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardDeleteResult");
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