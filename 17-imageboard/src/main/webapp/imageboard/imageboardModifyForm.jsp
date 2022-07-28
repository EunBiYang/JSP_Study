<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/imageboardScript.js?v=1"></script>
</head>
<body>
	<form action="../imageboard/imageboardModify.jsp" method="post" enctype="multipart/form-data" name="frm">
	<input type="hidden" name="seq" value="${seq}">
	<input type="hidden" name="pg" value="${pg}">
	<input type="hidden" name="img_org" value="${dto.image1 }">
	
	 	<h3>이미지 수정</h3>
	 	<table border="1" width="480">
	 		<tr>
	 			<th width="100">상품코드</th>
	 			<td><input type="text" name="imageId" value="${dto.imageId }" size="50"></td>
	 		</tr>
	 		<tr>
	 			<th>상품명</th>
	 			<td><input type="text" name="imageName" size="50" value="${dto.imageName }"></td>
	 		</tr>
	 		<tr>
	 			<th>단가</th>
	 			<td><input type="text" name="imagePrice" size="50" value="${dto.imagePrice }"></td>
	 		</tr>
	 		<tr>       
	 			<th>개수</th>
	 			<td> <input type="text" name="imageQty" size="50" value="${dto.imageQty }"> </td>
	 		</tr>
	 		<tr> 
	 			<th>내용</th>
	 			<td>
					<textarea rows="10" cols="53" name="imageContent" >${dto.imageContent }</textarea>
				</td>
	 		</tr>
	 		<tr>
	 			<td colspan="2">
	 				<input type="file" name="image1" size="50">
	 			</td>
	 		</tr>
	 		<tr>
	 			<td colspan="2" align="center">
	 				<input type="button" value="수정" onclick="checkWrite()">
	 				<input type="reset" value="다시 작성">
	 			</td>
	 		</tr>
	 	</table>
	 </form>

</body>
</html>