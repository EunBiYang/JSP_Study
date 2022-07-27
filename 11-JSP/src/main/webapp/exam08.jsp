<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
<script type="text/javascript">
function doSubmit() {
	var fm = document.fm;
	
	if(!fm.num1.value || isNaN(fm.num1.value)){
		alert("(첫번째칸)숫자로 입력해 주세요");
		fm.num1.value="";//잘못된 입력값 지우기
		fm.num1.focus();
	}
	else if(!fm.num2.value || isNaN(fm.num2.value)){
		alert("(두번째칸)숫자로 입력해 주세요");
		fm.num2.value="";
		fm.num2.focus();
	}
	else{
		fm.submit();
	} 
}
</script>

</head>
<body>
	<form action="exam08Pro.jsp" name="fm">
		<div>
			<input type="text" name="num1">
			<select name="calc">
				<option value="+">+</option>
				<option value="-">-</option>
				<option value="*">*</option>
				<option value="/">/</option>
			</select>
			<input type="text" name="num2">
			<input type="button" value="계산" onclick="doSubmit();">
		</div>
		
	</form>
</body>
</html>