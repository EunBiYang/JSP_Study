<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%	// 데이터
	int pg = Integer.parseInt(request.getParameter("pg"));
	// 1. 목록보기
	// 목록을 1페이지당 5개씩 읽어오기
	int endNum = pg * 5;
	int startNum = endNum - 4;
	
	BoardDAO dao = new BoardDAO();
	List<BoardDTO> list = dao.boardList(startNum, endNum);
	
	// 2. 페이징 처리
	// 1) 총페이지수
	//  총글수    : 12     23     25
	//  총페이지수 : 3      5      5
	int totalA = dao.getTotalA();     // 총글수 저장
	int totalP = (totalA + 4) / 5;	  // 총페이지수 저장
	
	// 2) 블럭 설정
	// => 페이지 숫자를 몇개보여줄 지 결정
	// => 3블럭
	// => 총페이지수 : 8
	//			[1][2][3][다음]
	//	   [이전][4][5][6][다음]
	//	   [이전][7][8]
	// pg        : 1  2  3  4  5  6  7  8
	// startPage : 1  1  1  4  4  4  7  7
	int startPage = (pg-1)/3*3 + 1;
	int endPage = startPage + 2;
	if(endPage > totalP) endPage = totalP;
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#subjectA:link {color:black; text-decoration: none;}
#subjectA:visited {color:black; text-decoration: none;}
#subjectA:hover {color:green; text-decoration: underline;}
#subjectA:active {color:black; text-decoration: none;}

/* 페이지 표시 설정 */
.paging {color: blue; text-decoration: none;}
.currentPaging {color: red; text-decoration: none;}
</style>

<script type="text/javascript">
	function isLogin(seq) {
		<% if(session.getAttribute("memId") == null) { %>
				alert("먼저 로그인 하세요");
		<% } else {%>
				location.href = "boardView.jsp?seq=" + seq +"&pg=" + <%=pg%>;
		<% } %>
	}
</script>
</head>
<body>
   <table border="1" width="540">
      <tr align="center" bgcolor="#ffff00">
         <td width="70">글번호</td>
         <td>제목</td>
         <td width="100">작성자</td>
         <td width="100">작성일</td>
         <td width="70">조회수</td>
      </tr>   
      
<%
	//for(int i=0; i<list.size(); i++) {
	//	BoardDTO dto = list.get(i);
	for(BoardDTO dto : list) {
%>
		<tr align="center" bgcolor="#ffffdd">
			<td><%=dto.getSeq() %></td>
         	<td><a id="subjectA" href="#" onclick="isLogin(<%=dto.getSeq()%>)">
         			<%=dto.getSubject() %></a></td>
         	<td><%=dto.getName() %></td>
         	<td><%=dto.getLogtime() %></td>
         	<td><%=dto.getHit() %></td>
		</tr>
<%
	}
%>     

		<!-- 페이징 -->
		<tr>
			<td colspan="5" align="center">
			<% if(startPage > 3) { %>
				<a class="paging" href="boardList.jsp?pg=<%=startPage - 1%>">[이전]</a>
			<% } %>
				
			<% for(int i=startPage; i<=endPage; i++) { %>	
				<% if(i == pg) { %>
				<a class="currentPaging">[<%=i%>]</a>	
				<% } else { %>
				<a class="paging" href="boardList.jsp?pg=<%=i%>">[<%=i%>]</a>	
				<% } %>
			<% } %>
			
			<% if(endPage < totalP) { %>
				<a class="paging" href="boardList.jsp?pg=<%=endPage + 1%>">[다음]</a>
			<% } %>
			</td>
		</tr> 
   </table>
      
   <a href="../main/index.jsp">메인화면</a> &nbsp;
      
<% if(session.getAttribute("memId") == null) {  // 로그아웃 상태에서만 표시%>   
   <a href="../member/loginForm.jsp">로그인</a>
<% } else { // 로그인일 때만 표시%>
	<a href="boardWriteForm.jsp">글쓰기</a>
<% } %>   
</body>
</html>





