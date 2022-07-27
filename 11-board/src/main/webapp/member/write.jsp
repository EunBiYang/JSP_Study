<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   // post 방식 한글설정
   request.setCharacterEncoding("utf-8");
   // 1. 데이터 처리	
   String name = request.getParameter("name");
   String id = request.getParameter("id");
   String pwd = request.getParameter("pwd");
   String gender = request.getParameter("gender");
   String email1 = request.getParameter("email1");
   String email2 = request.getParameter("email2");
   String tel1 = request.getParameter("tel1");
   String tel2 = request.getParameter("tel2");
   String tel3 = request.getParameter("tel3");
   String addr = request.getParameter("addr");
   
   // 2. DB 작업
   MemberDTO dto = new MemberDTO();
   dto.setName(name);
   dto.setId(id);
   dto.setPwd(pwd);
   dto.setGender(gender);
   dto.setEmail1(email1);
   dto.setEmail2(email2);
   dto.setTel1(tel1);
   dto.setTel2(tel2);
   dto.setTel3(tel3);
   dto.setAddr(addr);
   
   MemberDAO dao = new MemberDAO();
   int result = dao.write(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%	if(result > 0) { %>
		<p>회원 가입 성공</p>
<% 	} else { %>
		<p>회원 가입 실패</p>
<%	} %>
<input type="button" value="메인화면" onclick="location.href='../main/index.jsp'">

<%--
   이름 : <%=name %><br>
   아이디 : <%=id %><br>
   비밀번호 : <%=pwd %><br>
   성별 : <%=gender %><br>
   이메일 : <%=email1 %>@<%=email2 %><br>
   핸드폰 : <%=tel1 %>-<%=tel2 %>-<%=tel3 %><br>
   주소 : <%=addr %><br>
 --%>
</body>   
</html>