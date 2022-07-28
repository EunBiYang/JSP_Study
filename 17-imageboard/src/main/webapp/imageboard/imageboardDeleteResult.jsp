<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
/*
	if(${result >0}){
		alert("삭제 되었습니다.");
		location.href = "imageboardList.jsp?pg=${pg}";
	}else{
		alert("삭제 실패입니다.");
		history.back();
	}
*/
	window.onload = function () {
		var dialog = document.getElementById("myMsgDialog");
		dialog.showModal(); //<dialog>태그 보이기
	}
	function close_ok() {
		var dialog = document.getElementById("myMsgDialog");
		dialog.close(); //<dialog> 태그 닫기
		location.href = "imageboardList.jsp?pg=${pg}";
	}
	function close_back() {
		var dialog = document.getElementById("myMsgDialog");
		dialog.close(); 
		history.back();
	}
	
</script>
</head>
<body>
	<dialog id="myMsgDialog" align="center">
		<c:if test="${result >0 }">
			<h3>삭제 되었습니다.</h3>
			<input type="button" value="확 인" onclick="close_ok()">
		</c:if>
		
		<c:if test="${result == 0 }">
			<h3>삭제 실패입니다.</h3>
			<input type="button" value="확 인" onclick="close_back()">
		</c:if>
	</dialog>
</body>
</html>