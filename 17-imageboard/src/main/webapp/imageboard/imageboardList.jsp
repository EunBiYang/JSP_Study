<%@page import="imageboard.beam.ImageBoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="imageboard.dao.ImageBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int pg = Integer.parseInt(request.getParameter("pg"));
	
	//3개씩 불러오기
	int eNum = pg * 5;
	int sNum = eNum - 4;

	ImageBoardDAO dao = new ImageBoardDAO();
	List<ImageBoardDTO> list = dao.imageBoardList(sNum, eNum);
	
	int totalL= dao.getTotalList();
	int totalP = (totalL +2)/3;
	
	// 블럭 3개로 설정
	int startPage = (pg-1)/3*3 + 1;
	int endPage = startPage + 2;
	if(endPage > totalP) endPage = totalP;
	
	// 공유 데이터 설정
	request.setAttribute("list", list);
	request.setAttribute("pg", pg);
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
	request.setAttribute("totalP", totalP);
	
	//화면 이동
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardListResult");
	dispatcher.forward(request, response);
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터처리</title>
</head>
<body>	
</body>
</html>