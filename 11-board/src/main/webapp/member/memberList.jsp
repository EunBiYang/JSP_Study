<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@page import="java.util.List"%>
<%	
	request.setCharacterEncoding("utf-8");
	int pg = Integer.parseInt(request.getParameter("pg"));
	// 1. 목록처리 
	// => 목록의 수 : 5개
	int endNum = pg * 5;
	int startNum = endNum - 4;
	
	MemberDAO dao = new MemberDAO();
	List<MemberDTO> list = dao.selectList(startNum, endNum);
	
	// 2. 페이징 처리
	// => 블럭의 수 : 3개
	int totalA = dao.getTotalMember();	// 총인원수
	int totalP = (totalA + 4) / 5;		// 총페이지수
	
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
.paging {color: blue; text-decoration: none;}
.currentPaging {color: red; text-decoration: none;}
</style>
</head>
<body>
   <table border="1" width="670">
      <tr align="center" bgcolor="#ffff00">
         <td width="70">이름</td>
         <td>아이디</td>
         <td width="50">성별</td>
         <td width="170">이메일</td>
         <td width="130">전화번호</td>
         <td width="100">가입일</td>
      </tr>   
      
<%
	for(MemberDTO dto : list) {
%>
		<tr align="center" bgcolor="#ffffdd">
			<td><%=dto.getName() %></td>
         	<td><%=dto.getId() %></td>
         	<%if(dto.getGender().equals("0")) {%>
         	<td>남성</td>
         	<%}else{ %>
         	<td>여성</td>
         	<%} %>
         	<td><%=dto.getEmail1() %>@<%=dto.getEmail2() %></td>
         	<td><%=dto.getTel1() %>-<%=dto.getTel2() %>-<%=dto.getTel3() %></td>
         	<td><%=dto.getLogtime().substring(0, dto.getLogtime().indexOf(" ")) %></td>
		</tr>
<%
	}
%>     

		<!-- 페이징 -->
		<tr>
			<td colspan="6" align="center">
			<% if(startPage > 3) { %>
				<a class="paging" href="memberList.jsp?pg=<%=startPage - 1%>">[이전]</a>
			<% } %>
				
			<% for(int i=startPage; i<=endPage; i++) { %>	
				<% if(i == pg) { %>
				<a class="currentPaging">[<%=i%>]</a>	
				<% } else { %>
				<a class="paging" href="memberList.jsp?pg=<%=i%>">[<%=i%>]</a>	
				<% } %>
			<% } %>
			
			<% if(endPage < totalP) { %>
				<a class="paging" href="memberList.jsp?pg=<%=endPage + 1%>">[다음]</a>
			<% } %>
			</td>
		</tr> 
   </table>
   
   <a href="../main/index.jsp">메인화면</a> &nbsp;
</body>
</html>


