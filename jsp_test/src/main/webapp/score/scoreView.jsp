<%@page import="score.bean.scoreDTO"%>
<%@page import="java.util.List"%>
<%@page import="score.dao.scoreDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	int pg = Integer.parseInt(request.getParameter("pg"));
	int eNum = pg*10;
	int sNum = eNum -9;
	
	scoreDAO dao = new scoreDAO();
	List<scoreDTO> list = dao.scoreList(sNum, eNum);
	
	int totalA = dao.getTotalS();     // 총 성적리스트 수
	int totalP = (totalA + 4) / 5;  
	
	
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

/*페이지 표시*/
.paging{color: blue; text-decoration: none;}
.currentPaging{color: red; text-decoration: underline;}
</style>

</head>
<body>
	<table border="1" width="700">
      <tr align="center" bgcolor="#ffff00">
         <td width="100">학번</td>
         <td width="100">이름</td>
         <td width="100">국어</td>
         <td width="100">영어</td>
         <td width="100">수학</td>
         <td width="100">총점</td>
         <td width="100">평균</td>
      </tr>   
      
<%
   for(scoreDTO dto : list) {
%>
      <tr align="center" bgcolor="#ffffdd">
         	<td><%=dto.getHak() %></td>
         	<td><%=dto.getName() %></td>
            <td><%=dto.getKor() %></td>
            <td><%=dto.getEng() %></td>
            <td><%=dto.getMat() %></td>
            <td><%=dto.getTot() %></td>
            <td><%=dto.getAvg() %></td>
      </tr>
<%   }%>     
      <!-- 페이징 -->
      <tr>
         <td colspan="7" align="center">
         <% if(startPage > 3) { %>
            <a class="paging" href="scoreView.jsp?pg=<%=startPage - 1%>">[이전]</a>
         <% } %>
            
         <% for(int i=startPage; i<=endPage; i++) { %>
         	<%if(i == pg){ %>   
             <a class="currentPaging" href="#">[<%=i%>]</a>
            <% } else{%>
             <a class="paging" href="scoreView.jsp?pg=<%=i%>">[<%=i%>]</a>
            <% } %>   
         <% } %>
         
         <% if(endPage < totalP) { %>
            <a class="paging" href="scoreView.jsp?pg=<%=endPage + 1%>">[다음]</a>
         <% } %>
         </td>
      </tr> 
   </table>

</body>
</html>