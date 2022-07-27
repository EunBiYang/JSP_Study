<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적입력</title>
<script type="text/javascript">
	function doSubmit() {
		var fm = document.fm;
		fm.submit();
	}

	function doSubmit1() {
		var fm = document.fm;		
		
		if(!fm.name.value ){
			alert("이름을 입력해 주세요");
			fm.name.focus();
		}
		// !fm.kor.value : 입력값이 있는지 검사
		// isNaN(fm.kor.value) : 숫자로만 되어있는지 검사
		else if(!fm.kor.value || isNaN(fm.kor.value)){
			alert("국어 점수를 숫자로 입력해 주세요");
			fm.kor.focus();
		}
		else if(!fm.eng.value || isNaN(fm.eng.value)){
			alert("영어 점수를 숫자로 입력해 주세요");
			fm.eng.focus();
		}
		else if(!fm.mat.value || isNaN(fm.mat.value)){
			alert("수학 점수를 숫자로 입력해 주세요");
			fm.mat.focus();
		}
		else if(confirm("입력하신 내용이 맞습니까?")){
			fm.submit();
		}
	}
</script>
</head>
<body>
	<form action="exam05Pro.jsp" name="fm">
		<h1>이름과 성적을 입력하세요</h1>
		<div>
			이름 : <input type="text" name="name"><br>
			국어 : <input type="text" name="kor"><br>
			영어 : <input type="text" name="eng"><br>
			수학 : <input type="text" name="mat"><br>
		</div>
		<div>
 			<input type="button" value="입력완료" onclick="doSubmit1();">
 			<!-- sumbit을 사용하면 입력값 없이 넘어가서 500 에러 발생시키기때문에 여기선 버튼이 좋다!-->
 			<input type="reset" value="다시작성">
 		</div>
	</form>

</body>
</html>