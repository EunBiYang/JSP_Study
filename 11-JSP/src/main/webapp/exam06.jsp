<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전화번호</title>
<script type="text/javascript">
function doSubmit() {
	var fm = document.fm;
	
	if(!fm.name.value){
		alert("이름을 입력해주세요.");
		fm.name.focus();
	}else if(fm.area.selectedIndex<1){
		alert("지역을 선택해주세요");
		fm.area.focus();
	}else if(!fm.num.value){
		alert("번호를 입력해주세요.");
		fm.num.focus();
	}else (confirm("입력하신 내용이 맞습니까?")){
		fm.submit();
	}
}	
</script>
</head>
<body>
	<h1>이름과 전화번호를 입력하세요</h1>
	<form action="exam06Pro.jsp" name="fm">
		<div>
			이름 : <input type="text" name="name">
		</div>
		<div>
			전화번호 : <select name="area">
				<option>선택</option>
				<option value="031">경기</option>
				<option value="02">서울</option>
				<option value="032">인천</option>
			</select>
			-
			<input type="text" name="num" placeholder="xxx-xxxx">
		</div>
		<div>	
			<input type="button" value="제출" onclick="doSubmit()">
			<input type="reset" value="다시작성">
		</div>
	</form>
</body>
</html>