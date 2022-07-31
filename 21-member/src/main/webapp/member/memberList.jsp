<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paging {
	color: blue;
	text-decoration: none;
}

.currentPaging {
	color: red;
	text-decoration: none;
}
</style>
</head>
<body>
	<form action="" method="post" name="frm">
		<table border="1" width="640" height="300">
			<tr align="center" bgcolor="#ffff00">
				<td width="70" height="20">이름</td>
				<td width="80">아이디</td>
				<td width="50">성별</td>
				<td width="170">이메일</td>
				<td width="130">전화번호</td>
				<td width="100">가입일</td>
			</tr>


			<c:forEach var="bean" items="${list}">
				<tr>
					<td>${bean.name}</td>
					<td>${bean.id}</td>
					<c:if test="${bean.getGender() =='0'}">
						<td>남성</td>
					</c:if>

					<c:if test="${bean.getGender().equals('남')}">
						<td>남성</td>
					</c:if>
					
					<c:if test="${bean.getGender() =='1'}">
						<td>여성</td>
					</c:if>

					<c:if test="${bean.getGender().equals('여')}">
						<td>여성</td>
					</c:if>
					
					

					<td>${bean.email1}@${bean.email2}</td>
					<td>${bean.tel1}-${bean.tel2}-${bean.tel3}</td>
					<td>${bean.logtime}</td>
				</tr>
			</c:forEach>
			<!-- 페이징 -->
			<tr>

				<td colspan="6" align="center">
					<c:if test="${startPage > 3}">
						<a class="pagging" href="memberList.do?pg=${startPage-1}">[이전]</a>
					</c:if> 
					<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${pg==i }">
							<a class="currentPaging" href="memberList.do?pg=${i}">[${i}]</a>
						</c:if>

						<c:if test="${pg != i }">
							<a class="pagging" href="memberList.do?pg=${i}">[${i}]</a>
						</c:if>
					</c:forEach> 
					<c:if test="${endPage < totalP}">
						<a class="pagging" href="memberList.do?pg=${endPage +1}">[다음]</a>
					</c:if></td>
			</tr>
		</table>
	</form>
	<a href="index.jsp">메인화면</a> &nbsp;
</body>
</html>


