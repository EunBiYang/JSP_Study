<%@page import="book.dao.BookDAO"%>
<%@page import="book.bean.BookDTO"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    

    	int pg = Integer.parseInt(request.getParameter("pg"));

    	int eNum = pg *10;
    	int sNum = eNum -9;
    	
    	BookDAO dao = new BookDAO();
    	List<BookDTO> list = dao.bookList(sNum, eNum);
    	
    	//총페이지수
    	int totalList = dao.getTotalNum();
    	int totalPage = (totalList +9)/10;
    	
    	//블럭설정
    	int sPage = (pg-1)/5*5 +1;
    	int ePage = sPage +4;
    	if(ePage > totalPage) ePage = totalPage;
    	
    	// 공유 데이터 설정
    	request.setAttribute("list", list);
    	request.setAttribute("pg", pg);
    	request.setAttribute("sPage", sPage);
    	request.setAttribute("ePage", ePage);
    	request.setAttribute("totalPage", totalPage);
    	
    	//화면 이동
    	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=bookListResult");
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