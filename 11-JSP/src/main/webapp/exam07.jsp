<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function doSubmit() {
	var fm = document.fm;
	var chk = false; //체크 상태 저장, true : 체크된 태그 있음, false : 체크된 태그 없음
	
	for(var i=0; i<fm.area.length;i++){
		if(fm.area[i].checked){
			chk = true;
			break;
		}	
	}
	if(!chk){
		alert("권역을 선택해 주세요");
		fm.area[0].focus();
		return false;
	}else (confirm("입력하신 내용이 맞습니까?")){
		fm.submit();
	}
	
}
</script>
</head>
<body>
	<h1>다음 중 권역을 선택하세요.</h1>
	<form action="exam07Pro.jsp" name="fm">
		<div>
			<input type="radio" value="종로, 중구, 용산" name="area" id="0">
			<label for="0">0권역</label><br>
			<input type="radio" value="도봉, 신사, 잠실" name="area" id="1">
			<label for="1">1권역</label><br>
			<input type="radio" value="동대문, 성대, 안양" name="area" id="2">
			<label for="2">2권역</label><br>
			<input type="radio" value="수원, 용인" name="area" id="3">
			<label for="3">3권역</label><br>
			<input type="radio" value="없는 권역" name="area" id="4">
			<label for="4">4권역</label><br>
			<input type="radio" value="없는 권역" name="area" id="5">
			<label for="5">5권역</label><br>
			<input type="radio" value="없는 권역" name="area" id="6">
			<label for="6">6권역</label>
		</div>
		<input type="button" value="제출하기" onclick="doSubmit()">
	</form>

</body>
</html>