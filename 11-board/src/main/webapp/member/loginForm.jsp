<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 브라우저들은 resource 파일을 한번 다운로드한 다음에는 갱신을 자주안함.
	그래서 "파일명?v=1" 이런 식으로 해야만 브라우저가 파일을 바꿔치기 함
 -->
<script type="text/javascript" src="script/memberScript.js"></script>
</head>
<body>
   <form action="login.jsp" method="post" name="loginForm">
      <table border="1">
         <tr>
            <td>아이디</td>
            <td><input type="text" name="id" size="25"></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pwd" size="25"></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="button" value="로그인" onclick="checkLogin()">
               <input type="button" value="회원가입" 
               			onclick="location.href='writeForm.jsp'">
            </td>
         </tr>
      </table>
   </form>
   
   <input type="button" value="메인화면" onclick="location.href='index.jsp'">
</body>
</html>




