<%@page import="member.dao.MemberDAO"%>
<%@page import="member.Bean.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String id = (String)session.getAttribute("memId");

MemberDAO dao = new MemberDAO();
//회원 1명 데이터
MemberDTO dto = dao.memberView(id);


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/memberScript.js?v=1"></script>
</head>
<body>
<body>
	<form action="modify.jsp" method="post" name="frm">
	 <table border="1">
	 	<tr>
	 		<td width="90" align="center">이름</td>
	 		<td width="350">
	 			<input type="text" name="name" value="<%=dto.getName()%>">
	 		</td>
	 	</tr>
	 	<tr>
	 		<td align="center">아이디</td>
	 		<td>
	 			<%=dto.getId()%>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td align="center">비밀번호</td>
	 		<td>
	 			<input type="password" name="pwd" value="<%=dto.getPwd()%>">
	 		</td>
	 	</tr>
	 	<tr>
	 		<td align="center">재확인</td>
	 		<td>
	 			<input type="password" name="repwd" value="<%=dto.getPwd()%>">
	 		</td>
	 	</tr>
	 	<tr>
	 		<td align="center">성별</td>
	 		<td>
	 		<%if(dto.getGender().equals("0")){ %>
	 			<input type="radio" name="gender" value="0" checked="checked">
	 			<label for="0" >남자</label>
	 			<input type="radio" name="gender" value="1">
	 			<label for="1">여자</label>
	 		<%} else{ %>
	 			<input type="radio" name="gender" value="0" >
	 			<label for="0" >남자</label>
	 			<input type="radio" name="gender" value="1" checked="checked">
	 			<label for="1">여자</label>
	 		<%} %>
	 		</td>
	 	</tr>
	 	<tr>
	 		<td align="center">이메일</td>
	 		<td >
	 			<input type="text" name="email1" style="width: 100px;" value="<%=dto.getEmail1()%>">@
	 			<input type="text" name="email2" style="width: 100px;" value="<%=dto.getEmail2()%>">
	 		</td>
	 	</tr>
	 	<tr>
	 		<td align="center">핸드폰</td>
	 		<td>
	 			<input type="text" name="tel1" size="10" value="<%=dto.getTel1()%>">-
	 			<input type="text" name="tel2" size="10" value="<%=dto.getTel2()%>">-
	 			<input type="text" name="tel3" size="10" value="<%=dto.getTel3()%>">
	 		</td>
	 	</tr>
	 	<tr>
	 		<td align="center">주소</td>
	 		<td>
	 			<input type="text" name="addr" style="width : 96%" value="<%=dto.getAddr()%>">
	 		</td>
	 	</tr>
	 	<tr  align="center">
	 		<td colspan="2" align="center">
	 			<input type="button" value="수정" onclick="checkWrite();">
	 		</td>
	 	</tr>
	 </table>	
	</form>
	<input type="button" value="메인화면" onclick="location.href='../main/index.jsp'">
</body>
</html>