<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 입력</title>
<script type="text/javascript" src="../script/scoreScript.js?v=2"></script>
</head>
<body>
	<form action="scoreWrite.jsp?pg=1" name="frm" method="post">
		
		<table border="1" align="center">
			<tr>
				<td>학번</td>
				<td>	
					<input type="text" name="hak">
				</td>
			</tr>
			
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			
			<tr>
				<td>국어</td>
				<td><input type="text" name="kor"></td>
			</tr>
			
			<tr>
				<td>영어</td>
				<td><input type="text" name="eng"></td>
			</tr>
			
			<tr>
				<td>수학</td>
				<td><input type="text" name="mat"></td>
			</tr>
			 
			<tr>
				<td colspan="2" align="center">
					<input type="button" value="성적입력" onclick="checkWrite()">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>			
</body>
</html>