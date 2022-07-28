<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뷰처리</title>

<style type="text/css">
/*페이지 표시*/
.paging{color: blue; text-decoration: none;}
.currentPaging{color: red; text-decoration: underline;}
</style>

</head>
<body>
	<table border="1" width="500">		
      	<tr align="center" bgcolor="#ffff00">
			<td width="70">번호</td>
			<td width="70">이미지</td>
			<td width="200">상품명</td>
			<td width="100">단가</td>
			<td width="70">개수</td>
			<td width="100">합계</td>
		</tr>   
		<!-- 확장 for문 
			for(ImageboardDTO dto : list){} -->
		<c:forEach var="dto" items="${list}"> 		
			<tr align="center" >
				<td>${dto.seq}</td>
				<td>
					<a href="imageboardView.jsp?seq=${dto.seq }&pg=${pg}">
						<img src="../storage/${dto.image1}" width = "50" >
					</a>
				</td>
				<td>${dto.imageName }</td>
				<td>${dto.imagePrice }</td>
				<td>${dto.imageQty }</td>
				<td>${dto.imagePrice * dto.imageQty}</td>
			</tr>
      	</c:forEach>


      <!-- 페이징 -->
      <tr>
		<td colspan="6" align="center">
			<c:if test="${startPage > 3}">
				<a class ="paging" href="../imageboard/imageboardList.jsp?pg=${startPage -1 }">[이전]</a>
			</c:if>         	
         	
            
        	<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
        		<c:if test="${i == pg }">
        			<a class ="currentPaging" href="../imageboard/imageboardList.jsp?pg=${i }">[${i}]</a>
        		</c:if>
        		<c:if test="${i != pg }">
        			<a class ="paging" href="../imageboard/imageboardList.jsp?pg=${i }">[${i}]</a>
        		</c:if>
			</c:forEach>
        
        	<c:if test="${endPage < totalP}">
        		<a class ="paging" href="../imageboard/imageboardList.jsp?pg=${endPage + 1 }">[다음]</a>
        	</c:if>
         </td>
      </tr> 

   </table>

</body>
</html>