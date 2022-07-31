<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload = function () {
	var dialog = document.getElementById("myMsgDialog");
	dialog.showModal(); //<dialog>태그 보이기
}
function close_ok() {
	var dialog = document.getElementById("myMsgDialog");
	dialog.close(); //<dialog> 태그 닫기
	location.href = "index.jsp";
}

</script>
</head>
<body>
	<dialog id="myMsgDialog" align="center">	
			<h3>로그아웃 되었습니다.</h3>
			<input type="button" value="확 인" onclick="close_ok()">
	</dialog>
	
</body>
</html>