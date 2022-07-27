<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/*	// 1) 쿠키 삭제
	Cookie[] cookies = request.getCookies();
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			if(cookies[i].getName().equals("memName")) {
				cookies[i].setMaxAge(0);	// 유지 시간을 0으로 설정하면 쿠키가 삭제됨
				response.addCookie(cookies[i]);
			} else if(cookies[i].getName().equals("memId")) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
	}
*/
	// 2) 세션 삭제
	session.removeAttribute("memName");
	session.removeAttribute("memId");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		alert("로그아웃");
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body>
	로그아웃
</body>
</html>