<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script type="text/javascript" src="script/memberScript.js?v=2"></script>
</head>
<body>
   <form action="memberWrite.do" method="post" name="frm">
   <table border="1" style="width: 500px;">
      <tr>
         <td align="center" width="70">이름</td>
         <td><input type="text" name="name"></td>
      </tr>
      
      <tr>
         <td align="center">아이디</td>
         <td>
         	<input type="text" name="id">
         	<input type="button" value="중복체크" onclick="checkId();">
         </td>
      </tr>
      
      <tr>
         <td align="center">비밀번호</td>
         <td><input type="password" name="pwd"></td>
      </tr>
      
      <tr>
         <td align="center">재확인</td>
         <td><input type="password" name="repwd"></td>
      </tr>
      
      <tr>
         <td align="center">성별</td>
         <td>
            <input type="radio" name="gender" value="0" checked="checked">남 &nbsp;&nbsp;
            <input type="radio" name="gender" value="1">여
         </td>
      </tr>
      
      <tr>
         <td align="center">이메일</td>
         <td>
            <input type="text" name="email1">
            @
            <select name="email2">
               <option value="naver.com">naver.com</option>
               <option value="daum.net">daum.net</option>
               <option value="gmail.com">gmail.com</option>
            </select>
         </td>
      </tr>
      
      <tr>
         <td align="center">핸드폰</td>
         <td>
            <select name="tel1">
               <option value="010">010</option>
               <option value="070">070</option>
               <option value="02">02</option>
            </select>
            -
            <input type="text" name="tel2" size="15">
            -
            <input type="text" name="tel3" size="15">
         </td>
      </tr>
      
      <tr>
         <td align="center">주소</td>
         <td><input type="text" name="addr" style="width: 98%;"></td>
      </tr>
      
      <tr>
         <td align="center" colspan="2">
            <input type="button" value="회원가입" onclick="checkWrite();">
            <input type="reset" value="다시 작성">
         </td>
      </tr>
   </table>
   </form>
   
   <input type="button" value="메인화면" onclick="location.href='index.jsp'">
</body>
</html>



