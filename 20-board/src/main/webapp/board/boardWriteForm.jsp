<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h2{	text-align: center;
}
table{
	width: 450px;
	margin: auto;
}
.td_left{
	width: 110px;
	background: orange;
	text-align: center;
}
.td_right{background: skyblue;}
</style>
</head>
<body>
	<h2>게시판 글 등록</h2>
	<form action="boardWritePro.do" method="post" enctype="multipart/form-data" name="boardForm">
		<table>
			<tr>
				<td class="td_left">글쓴이</td>
				<td class="td_right">
					<input type="text" name="board_name" required="required">
				</td>
			</tr>
			<tr>
				<td class="td_left">비밀번호</td>
				<td class="td_right">
					<input type="password" name="board_pass" required="required">
				</td>
			</tr>
			
			<tr>
				<td class="td_left">제  목</td>
				<td class="td_right">
					<input type="text" name="board_subject" required="required">
				</td>
			</tr>
			
			<tr>
				<td class="td_left">내 용</td>
				<td class="td_right">
					<textarea rows="15" cols="40" name="board_content" required="required"></textarea>
				</td>
			</tr>
			
			<tr>
				<td class="td_left">파일 첨부</td>
				<td class="td_right">
					<input type="file" name="board_file">
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="등록">
					<input type="reset" value="다시쓰기">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>