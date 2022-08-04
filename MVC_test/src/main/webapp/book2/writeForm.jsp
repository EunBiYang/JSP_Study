<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록 입력창</title>
<script type="text/javascript" src="script/bookScript.js"></script>
<style type="text/css">
th{background: orange;}
</style>

</head>
<body>
	<form action="bookWrite.do" method="post" name="na">
		<table border="1"  height ="250">
			<tr>
	 			<th width="100" >도서코드</th>
	 			<td><input type="text" name="code" size="30" style="border: none;"></td>
	 		</tr>
	 		<tr>
	 			<th>도서이름</th>
	 			<td><input type="text" name="name" size="30" style="border: none;"></td>
	 		</tr>
	 		<tr>
	 			<th>저자</th>
	 			<td><input type="text" name="author" size="30" style="border: none;"></td>
	 		</tr>
	 		<tr>
	 			<th>출판사</th>
	 			<td><input type="text" name="pub" size="30" style="border: none;"></td>
	 		</tr>
	 		<tr>
	 			<th>가격</th>
	 			<td><input type="text" name="price" size="30" style="border: none;"></td>
	 		</tr>
	 		<tr>
	 			<td colspan="2" align="center">
	 				<input type="button" value="도서 입력 저장" onclick="checkInput()">
	 				<input type="reset" value="다시 작성">
	 			</td>
	 		</tr>
		
		</table>
	</form>

</body>
</html>