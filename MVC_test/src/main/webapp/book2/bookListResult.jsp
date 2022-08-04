<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.paging{color: blue; text-decoration: none;}
.currentPaging{color: red; text-decoration: underline;}
</style>

</head>
<body>
	<table border="1" width ="640" height ="480">
		<tr align="center" bgcolor="orange">
			<td width="80">도서코드</td>
			<td width="140">도서명</td>
			<td width="100">작가</td>
			<td width="80">출판사</td>
			<td width="70">가격</td>
			<td width="90">출판일</td>
		</tr>
		
	<c:forEach var="dto" items="${list}">
		<tr>
			<td>${dto.code}</td>
			<td>${dto.name }</td>
			<td>${dto.author }</td>
			<td>${dto.pub }</td>
			<td>${dto.price }</td>
			<td>${dto.p_day }</td>
		</tr>
	</c:forEach>
	
	<!-- 페이징 처리 -->
		<tr>
			<td colspan="6" align="center"  bgcolor="orange">
				<c:if test="${startPage > 3}">
					<a class="pagging" href="bookList.do?pg=${startPage-1}">[이전]</a>
				</c:if> 
				<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
					<c:if test="${pg==i }">
						<a class="currentPaging" href="bookList.do?pg=${i}">[${i}]</a>
					</c:if>

					<c:if test="${pg != i }">
						<a class="pagging" href="bookList.do?pg=${i}">[${i}]</a>
					</c:if>
				</c:forEach> 
				<c:if test="${endPage < totalP}">
					<a class="pagging" href="bookList.do?pg=${endPage +1}">[다음]</a>
				</c:if></td>
		</tr>
	</table>
</body>
</html>