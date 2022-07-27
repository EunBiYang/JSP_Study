<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//한글처리
	request.setCharacterEncoding("utf-8");
	//1.로그인창 데이터처리
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//2.로그인창 DB 처리
	MemberDAO dao = new MemberDAO();
	String name = dao.login(id, pwd);
	
	//3.화면이동
	if(name != null){//로그인성공
		//1) get방식으로 다음페이지로 데이터를 전송하기 때문에, id와 이름이 주소창에 오픈됨
		//response.sendRedirect("loginOk.jsp?name=" + URLEncoder.encode(name,"utf-8")+"&id="+id);
	
		//2) 쿠키이용
		/*Cookie coo = new Cookie("memName", URLEncoder.encode(name, "utf-8"));
		coo.setMaxAge(300);  //300초 설정
		response.addCookie(coo);
		
		Cookie coo2 = new Cookie("memId", id);
		coo2.setMaxAge(300);
		response.addCookie(coo2);
		*/
		
		//3) 세션이용
		session.setAttribute("memName", name);
		session.setAttribute("memId", id);
		
		//페이지 이동
		response.sendRedirect("loginOk.jsp");
		
	}else{ //로그인 실패
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
<% if(name != null){ %>
	<%=name%>(<%=id %>)님이 로그인 하셨습니다.
<%} else{ %>
	아이디 또는 비밀 번호가 틀렸습니다. 다시 로그인하세요.<br>
	<a href="#" onclick="history.back()">뒤로</a>
<%} %>
 --%>
</body>
</html>