<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	// 데이터
	String id = request.getParameter("id");
	// DB 처리
	MemberDAO dao = new MemberDAO();
	boolean result = dao.isExistId(id);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		// opener : 현재 브라우저의 부모 브라우저를 관리하는 내장 객체
		opener.frm.id.value = "<%=id%>";
		window.close();	// 현재 브라우저 닫기
		opener.frm.pwd.focus();
	}
	function checkId() {
	     // form 객체 구하기
	     var frm = document.checkIdForm;
	     
	     if(!frm.id.value) {
	    	 alert("아이디를 입력해주세요");
	    	 frm.id.focus();
	     } else {
	    	 frm.submit();
	     }
	}
</script>
</head>
<body>
<%	if(result) { // id가 존재하면%>
		<%=id %>는 사용중 입니다.<br><br>
		
		<form action="checkId.jsp" name="checkIdForm">
			아이디 <input type="text" name="id">
			 	 <input type="button" value="중복 체크" onclick="checkId()">
		</form>		
<% 	} else { // id가 존재하지 않으면 %>
		<%=id %>는 사용 가능합니다.<br><br>
		<input type="button" value="사용" onclick="checkIdClose()">
<%	} %>
</body>
</html>