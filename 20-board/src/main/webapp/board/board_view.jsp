<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body {
	border: medium;
}

table {
	border-color: orange;
}
</style>
</head>
<body>
	<table border="1" width=400 align="center">
		<tr>
			<th>
				<h2 align="center">글 내용 상세보기</h2>
				제목 : ${bean.board_subject}<br>
				첨부파일 : <a href="../boardUpload">${bean.board_file}</a>
			</th>
		</tr>

		<tr style="background-color: orange; height: 400px; margin-bottom: 100px;">
			<td align="char" ><pre>${bean.board_content}</pre></td>
		</tr>
	</table>
	
	${bean.board_num}
	<div align="center">
		<a href="boardReplyForm.do?pg=${pg}&board_num=${bean.board_num}">[답글]</a>
		<a href="boardModifyForm.do?pg=${pg}&board_num=${bean.board_num}">[수정]</a>
		<a href="boardDeleteForm.do?pg=${pg}&board_num=${bean.board_num}">[삭제]</a> 
		<a href="boardList.do">[목록]</a>
	</div>
</body>
</html>

