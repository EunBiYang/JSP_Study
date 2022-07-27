<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script type="text/javascript" src="../script/boardScript.js"></script>

</head>
<body>
<form action="boardWrite.jsp" method="post" name="fm">
	<table border="1">
		<tr>
			<th width="90">제목</th>
			<td width="400" >
				<input type="text" name="subject" style="width: 97%;" >
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<th><textarea rows="" cols="" style="height: 300px; width: 97%;" name="content"></textarea></th>
		</tr>
		<tr>
			<td colspan="2" align="center">
			<input type="button" value="글쓰기" onclick="checkWrite()">
			<input type="reset" value="다시 작성">
		</tr>

	</table>
</form>
 <input type="button" value="메인화면" onclick="location.href='../main/index.jsp'">
</body>
</html>