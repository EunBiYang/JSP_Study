<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function checkIdClose() {
		// opener : 현재 브라우저의 부모 브라우저를 관리하는 내장 객체
		opener.frm.id.value = "${id}";
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
	<c:if test="${ result}">
		${id}는 사용중 입니다.<br><br>
		
		<form action="memberCheckId.do" name="checkIdForm">
			아이디 <input type="text" name="id">
			 	 <input type="button" value="중복 체크" onclick="checkId()">
		</form>	
	</c:if>
	
	<c:if test="${ !result}">
		${id}는 사용 가능합니다.<br><br>
		<input type="button" value="사용" onclick="checkIdClose()">
	</c:if>

</body>
</html>