<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id = (String)session.getAttribute("memId");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="delete.jsp">
 <input type="hidden" name="id" value="<%=id%>">
	<table>
		<tr>
			<td>정말 탈퇴하시겠습니까?</td>
			<br>
			<td>
				<input type="submit" value="확인" >
				<input type="reset" value="취소" onclick="location.href = '../main/index.jsp'">
			</td>
		</tr>
	
	</table>
</form>
	
</body>
</html>