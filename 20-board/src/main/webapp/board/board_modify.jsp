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
<script type="text/javascript">
	function check1() {
		var frm = document.frm;
		if(!frm.board_pass.value){
			alert("비밀번호를 입력하세요")
			frm.board_pass.focus();
		}else { 
			frm.submit();
		}
	}

</script>
</head>
<body>
	<form action="boardModifyPro.do" method="post" name="frm"> 
		<input type="hidden" name="board_num" value="${board_num}">
		<input type="hidden" name="pg" value="${pg}">

	
	<table>
			<tr>
				<td class="td_left">글쓴이</td>
				<td class="td_right">
					<input type="text" name="board_name" required="required" value="${bean.board_name}">
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
					<input type="text" name="board_subject" required="required" value="${bean.board_subject}">
				</td>
			</tr>
			
			<tr>
				<td class="td_left">내 용</td>
				<td class="td_right">
					<textarea rows="15" cols="40" name="board_content" required="required" >${bean.board_content}</textarea>
				</td>
			</tr>
				
			 
		</table>
		<div align="center">
		<a href="#" onclick="check1()">[수정]</a>
		<a href="#" onclick="history.back(); return false;">[뒤로]</a>
		</div>
	
</form>
</body>
</html>