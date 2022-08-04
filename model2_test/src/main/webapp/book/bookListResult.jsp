<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*페이지 표시*/
.paging{color: blue; text-decoration: none;}
.currentPaging{color: red; text-decoration: underline;}
</style>
</head>
<body>
	<table border="1" width ="750" height ="500">
		<tr align="center" bgcolor="mistyrose" height="40">
			<td width="80">도서코드</td>
			<td width="250">도서명</td>
			<td width="100">작가</td>
			<td width="80">출판사</td>
			<td width="70">가격</td>
		</tr>
		
	<c:forEach var="dto" items="${list}">
		<tr height="40">
			<td>${dto.code}</td>
			<td>${dto.name }</td>
			<td>${dto.author }</td>
			<td>${dto.pub }</td>
			<td>${dto.price }</td>
		</tr>
	</c:forEach>
	
	<!-- 페이징 처리 -->
	<tr>
		<td colspan="5" align="center"  bgcolor="mistyrose">
			<c:if test="${sPage > 5 }">
				<a class="paging" href="../book/bookList.jsp?pg=${sPage - 1 }">[이전]</a>
			</c:if>
			
			
			<c:forEach var="i" begin="${sPage }" end="${ePage}" step="1">
				<c:if test="${i == pg }">
				<a class = "currentPaging" href="../book/bookList.jsp?pg=${i}" >[${i}]</a>
				</c:if>
				<c:if test="${i != pg }">
					<a class = "paging" href="../book/bookList.jsp?pg=${i}" >[${i}]</a>
				</c:if>
			</c:forEach>
		
		
			<c:if test="${ePage < totalPage}">
        			<a class ="paging" href="../book/bookList.jsp?pg=${ePage + 1 }">[다음]</a>
       		</c:if>
		
		</td>
	</tr>
	
	
	</table>
</body>
</html>