<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function confirm1() {
		var frm = document.frm;
		
		if(!frm.pass.value) {
			alert("비밀번호를 입력해주세요.")
			frm.pass.focus();
		} else if(confirm("정말 삭제하겠습니까?")) {
			frm.submit();
		} else {
			history.back();
		}
	}
</script>
</head>
<body>
<form action="boardDeletePro.do" method="post" name="frm"> 
	<input type="hidden" name="board_num" value="${param.board_num}">
	<input type="hidden" name="pg" value="${param.pg}">
	
	<fieldset>
		<p>글비밀번호 :  <input type="password" name="pass"></p>
		<input type="button" value="삭제" onclick="confirm1()">
		<input type="reset" value="다시작성">		
	</fieldset>
	
</form>
</body>
</html>