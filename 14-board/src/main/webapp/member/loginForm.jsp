<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
<!-- 브라우저들은 resource파일을 다운 후 갱신을 잘 안한다. 
	그래서 파일명뒤에 "파일명?v=1" 이런식으로 버전을 입력해줘야 브라우저가 파일을 바꿔치기함
 -->
<script type="text/javascript" src="../script/memberScript.js?v=1"></script>
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
               <input type="button" value="회원가입" onclick="location.href='writeForm.jsp'">
               
            </td>
         </tr>
      </table>
   </form>
   
   <input type="button" value="메인화면" onclick="location.href='../main/index.jsp'">
</body>
</html>