<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../script/boardScript.js"></script>
</head>
<body>
   <form action="boardWrite.jsp" method="post" name="boardWriteForm">
   <table border="1" style="width: 450px;">
      <tr>
         <td align="center" width="50">제목</td>
         <td>
            <input type="text" name="subject" style="width: 98%;">
         </td>
      </tr>
      <tr>
         <td align="center">내용</td>
         <td>
            <textarea type="text" name="content" style="width: 98%; height: 200px;"></textarea>
         </td>
      </tr>
      <tr>
         <td align="center" colspan="2">
            <input type="button" value="글쓰기" onclick="checkTitle()">
            <input type="reset" value="다시 작성">
         </td>
      </tr>
   </table>
   </form>
   <input type="button" value="메인화면" onclick="location.href='../main/index.jsp'">
</body>
</html>