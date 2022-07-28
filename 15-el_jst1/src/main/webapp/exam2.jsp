<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	//입력검사 : 입력값 있는지, 숫자인지 검사
	function check() {
		var frm = document.frm;
		
		if(!frm.x.value){
			alert("x값을 입력하세요.");
			frm.x.focus();
		} else if(!frm.y.value){
			alert("y값을 입력하세요.");
			frm.y.focus();
		}else if (isNaN(frm.x.value)){
			alert("x값을 숫자로 입력하세요.");
			frm.x.value = "";
			frm.x.focus();
		}else if (isNaN(frm.y.value)){
			alert("y값을 숫자로 입력하세요.");
			frm.y.value = "";
			frm.y.focus();
		} else{
			frm.submit();
		}
	}
</script>

</head>
<body>
 <form action="exam2Pro.jsp" name="frm">
 	X : <input type="text" name="x"><br>
 	Y : <input type="text" name="y"><br>
 	<input type="button" value="계산" onclick="check()">
 	<input type="reset" value="취소">
 
 </form>
</body>
</html>