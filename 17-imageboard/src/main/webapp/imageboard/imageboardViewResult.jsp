<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="1" width="550">		
      	<tr>
      		<td width="70" rowspan="4">
      		<img alt="img" src="../storage/${dto.image1}" width="100" height="100">
      		</td>
			<td width="70" align="left">상품명 : ${dto.imageName} </td>
		</tr>   
		<tr>
			<td width="70" align="left">단가 : ${dto.imagePrice }</td>
		</tr>
		<tr>
			<td width="70" align="left">개 수 : ${ dto.imageQty}</td>
		</tr>
		<tr>
			<td width="70" align="left">합 계 : ${dto.imagePrice * dto.imageQty }</td>
		</tr>
		<tr>
			<td width="70" height="300" colspan="2" valign="top"><pre>${dto.imageContent }</pre></td>
		</tr>
	</table>
 <input type="button" value="목록" onclick="location.href='../imageboard/imageboardList.jsp?pg=${pg}'">
 <input type="button" value="수정" onclick="location.href='../imageboard/imageboardModifyFormReady.jsp?pg=${pg}&seq=${seq}'">
 <input type="button" value="삭제" onclick="location.href='../imageboard/imageboardDelete.jsp?pg=${pg}&seq=${seq}'">
</body>
</html>