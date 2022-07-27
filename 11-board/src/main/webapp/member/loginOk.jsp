<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1) get 방식으로 전달된 데이터 얻기
	//String name = request.getParameter("name");
	//String id = request.getParameter("id");
	
/*	// 2) 쿠키에 저장된 데이터 얻기
	String name = null;
	String id = null;
	
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("memName")) {
				//name = URLDecoder.decode(cookies[i].getValue(), "UTF-8");
				name = cookies[i].getValue();
			} else if(cookies[i].getName().equals("memId")) {
				id = cookies[i].getValue();
			}
		}
	}
*/
	// 3) 세션에 저장된 데이터 얻기
	String name = (String) session.getAttribute("memName");
	String id = (String) session.getAttribute("memId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="../image/tumi.png" width="30" height="30"
		onclick="location.href='../main/index.jsp'" 
		style="cursor: pointer;">
	<%=name %>(<%=id %>) 님이 로그인
</body>
</html>