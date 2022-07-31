<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#listForm{
	width: 600px;
	height: 350px;
	border: 1px solid black;
	margin: auto;
}
h2{
	text-align: center;
}
table{
	width:  500px;
	margin: auto;
}
#tr_top{
	background: salmon;
	text-align: center;
}
#pageList{
	width: 500px;
	margin: auto;
	text-align: center;
}
.pagging{color : blue; text-decoration: none;}
.currentPaging{color : red;}
</style>
</head>
<body>
	<h2>글 목록</h2>
	
	<div id="listForm" >
		<table align="center">
			<tr id="tr_top">
				<td width="80">번호</td>
				<td width="200">제목</td>
				<td>작성자</td>
				<td>날짜</td>
				<td>조회수</td>
			</tr>
			
		 <c:forEach var="bean" items="${list}">
         <tr align="center">
            <td>${bean.board_num}</td>
            <td align="left">
               <%-- board_re_lev 값만큼 들여쓰기 --%>
               <c:if test="${bean.board_re_lev != 0}">
                  <c:forEach var="i" begin="0" end="${bean.board_re_lev}" step="1">
                     &nbsp;&nbsp;
                  </c:forEach>
                  <%-- 한글 ㅁ 을 치고, 한자키를 누르면 특수키 창이 열림 --%>
                  ▶
               </c:if>
               
               <a href="boardDetail.do?board_num=${bean.board_num}&pg=${pg}">${bean.board_subject}</a>
            </td>
            <td>${bean.board_name}</td>
            <td>${bean.board_date}</td>
            <td>${bean.board_readcount}</td>
         </tr>
      </c:forEach>          
		</table>
		<br>
		<a href="boardWrite.do">게시판 글쓰기</a>	
	</div>
	
	
	<div id="pageList">
		<c:if test="${startPage > 3}">
			<a class="pagging" href="boardList.do?pg=${startPage-1}">[이전]</a>
		</c:if>
		
		<c:forEach var="i" begin="${startPage}" end="${endPage}" step="1">
			<c:if test="${pg==i }">
				<a class="currentPaging" href="boardList.do?pg=${i}">[${i}]</a>
			</c:if>
			
			<c:if test="${pg != i }">
				<a class="pagging" href="boardList.do?pg=${i}">[${i}]</a>
			</c:if>
		</c:forEach>
		
		<c:if test="${endPage < totalP}">
			<a class="pagging" href="boardList.do?pg=${endPage +1}">[다음]</a>
		</c:if>
	</div>
</body>
</html>