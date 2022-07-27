<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 한글처리 : post 방식일 경우
	request.setCharacterEncoding("utf-8");
	// 데이터 처리
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	// DB 처리
	MemberDAO dao = new MemberDAO();
	String name = dao.login(id, pwd);
	
	// 화면 이동
	if(name != null) {	// 로그인 성공
		// 1) get 방식 이용
		// get 방식으로 다음페이지 데이터를 전송하기 때문에, id와 이름이 주소창에 오픈된다.
		//response.sendRedirect("loginOk.jsp?name=" 
		//		+ URLEncoder.encode(name, "utf-8") + "&id=" + id);
	
/*		// 2) 쿠키 이용
		//Cookie cookie = new Cookie("memName", URLEncoder.encode(name, "UTF-8"));
		Cookie cookie = new Cookie("memName", name);
		cookie.setMaxAge(300);	// 300초 설정
		response.addCookie(cookie);
		
		Cookie cookie2 = new Cookie("memId", id);
		cookie2.setMaxAge(300);
		response.addCookie(cookie2);
*/		

		// 3) 세션 이용
		session.setAttribute("memName", name);
		session.setAttribute("memId", id);

		// 페이지 이동
		response.sendRedirect("loginOk.jsp");
	} else {			// 로그인 실패
		response.sendRedirect("loginFail.jsp");
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
<%	if(name != null) { %>
		<%=name %>(<%=id %>) 님이 로그인
<% 	} else { %>
		아이디 또는 비밀번호가 틀렸으니, 다시 로그인 하세요.<br>
		<a href="#" onclick="history.back()">뒤로</a>
<% 	} %>
 --%>
</body>
</html>