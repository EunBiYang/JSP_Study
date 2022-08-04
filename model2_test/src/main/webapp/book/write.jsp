<%@page import="org.w3c.dom.css.Rect"%>
<%@page import="book.bean.BookDTO"%>
<%@page import="book.dao.BookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%



	request.setCharacterEncoding("utf-8");
String code = request.getParameter("code");
String name = request.getParameter("name");
String author = request.getParameter("author");
String pub = request.getParameter("pub");
int price = Integer.parseInt(request.getParameter("price"));

System.out.println(code);
System.out.println(name);
System.out.println(author);
System.out.println(pub);

//DB처리
BookDTO dto = new BookDTO();
dto.setCode(code);
dto.setName(name);
dto.setAuthor(author);
dto.setPub(pub);
dto.setPrice(price);

BookDAO dao = new BookDAO();
int result = dao.bookWrite(dto);

System.out.println(result);
System.out.println(name);

//공유데이터 설정
request.setAttribute("result", result);
request.setAttribute("name", name);

//이동
RequestDispatcher dispacher = request.getRequestDispatcher("../main/index.jsp?req=writeResult");
dispacher.forward(request, response);
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