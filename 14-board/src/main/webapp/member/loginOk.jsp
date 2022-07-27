<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. get 방식으로 전달된 데이터 얻기
	/*String name = request.getParameter("name");
	String id = request.getParameter("id");*/

	//2. 쿠키정보 추출
	/*String name = null;
	String id = null;

	Cookie[] coo = request.getCookies();
	if (coo != null) {
		for (int i = 0; i < coo.length; i++) {
			if (coo[i].getName().equals("memName")) {
				name = URLDecoder.decode(coo[i].getValue(), "utf-8");
			} else if (coo[i].getName().equals("memId")) {
				id = coo[i].getValue();
			}
		}
	}*/
	
	//3.세션정보 추출
	// 리턴값이 object이기때문에 형변환 시켜야함
	String name = (String)session.getAttribute("memName");
	String id = (String)session.getAttribute("memId");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<img src="../image/tumi.png" width="30" height="30" onclick="location.href='../main/index.jsp'" style="cursor: pointer;">
	<%=name%>(<%=id %>)님이 로그인 하셨습니다.<br>
	<input type="button" value="메인화면" onclick="location.href='../main/index.jsp'">
</body>
</html>
