<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function test1() {
		alert("버튼을 클릭했습니다.")
	}
	
	window.onload = function () {
		alert("테스트입니다.");
	}
</script>
</head>
<body>
	<p>버튼을 클릭하세요.<input type="button" value="확인" onclick="test1()"></p>
</body>
</html>