<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%-- 1. taglib 지시자 : tag라이브러리를 등록할때 사용한다.
			=>jstl을 사용하기 위해서는 반드시 등록시켜야한다. --%>
	<%-- 2. uri="http://java.sun.com/jsp/jstl/core" : namespace를 나타냄 
			(prefix="c"는 별명을 붙히는거)			--%>
		

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>** 변수 설정(c:set) **</h3>
	<c:set var="name">홍길동</c:set>
	<c:set var="age" value="25"/>
	나의 이름은 ${name}입니다.<br>
	나의 나이는 ${age}살 입니다.<br>
	나의 키는 ${height}입니다.<br>
	<hr>
	
	<h3>**변수 삭제(c:remove) **</h3>
	<c:remove var="name"/>
	나의 이름은 ${name}입니다.<br>
	나의 나이는 ${age}살 입니다.<br>
	나의 키는 ${height}입니다.<br>
	<hr>
	
	<!-- 일반 for문 대체 -->
	<h3>**forEach : 일반 for문 대체 **</h3>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }&nbsp;&nbsp;
		<c:set var="sum" value="${sum+i}"/>
	</c:forEach>
	<br>
	1~10까지의 합 = ${sum }
	<hr>
	
	<h3>**forEach : 확장 for문 대체 **</h3>
	<c:set var="arr" value="10, 20, 30, 40, 50"/>
	<c:forEach var="data" items="${arr }"> 
		${data} &nbsp;&nbsp;		<%--for(int data: arr){ } 와 같다.--%>
	</c:forEach>
	<hr>
	
	
	
	<h3>** if **</h3>
	<c:set var="age" value="15"/>
	<c:if test="${age >= 20 }">
		성인
	</c:if>
	
	<c:if test="${age < 20 }">
		청소년
	</c:if>
	<hr>
	
	<h3>** 다중 선택 **</h3>
	<c:set var="color" value="red"/>
	
	<c:choose>
		<c:when test="${color=='red'}">빨강</c:when>
		<c:when test="${color=='green'}">초록</c:when>
		<c:when test="${color=='blue'}">파랑</c:when>
		<c:otherwise>하늘</c:otherwise>
	</c:choose>
</body>
</html>












