<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<script type="text/javascript">
function checkLogin() {
   var frm = document.loginForm;
   
   if(!frm.id.value) {
      alert("아이디를 입력하세요.");
      frm.id.focus();   
   } else if(!frm.pwd.value) {
      alert("비밀번호를 입력하세요.");
      frm.pwd.focus();
   } else {
	   frm.submit();     
   }
}
</script>

</head>
<body>
   <form action="memberLogin.do" method="post" name="loginForm">
   
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
               			onclick="location.href='memberWriteForm.do'">
            </td>
         </tr>
      </table>
   </form>
   
   <input type="button" value="메인화면" onclick="location.href='index.jsp'">
</body>
</html>




