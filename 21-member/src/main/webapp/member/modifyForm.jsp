<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="member.bean.MemberDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="script/memberScript.js?"></script>
</head>
<body>
   <form action="memberModify.do" method="post" name="modifyForm">
   <table border="1" style="width: 500px;">
      <tr>
         <td align="center" width="70">이름</td>
         <td><input type="text" name="name" value="${dto.getName() }"></td>
      </tr>

      <tr>
         <td align="center">아이디</td>
         <td>${dto.getId() }</td>
      </tr>      
      
      <tr>
         <td align="center">비밀번호</td>
         <td><input type="password" name="pwd"  value="${dto.getPwd() }"></td>
      </tr>
      
      <tr>
         <td align="center">재확인</td>
         <td><input type="password" name="repwd" value="${dto.getPwd() }"></td>
      </tr>
      
      <tr>
         <td align="center">성별</td>
         <td>
         <c:if test='${dto.getGender().equals("0") }'>
            <input type="radio" name="gender" value="0" checked="checked">남 &nbsp;&nbsp;
            <input type="radio" name="gender" value="1">여
         </c:if>
         <c:if test='${dto.getGender().equals("1") }'>
         	<input type="radio" name="gender" value="0">남 &nbsp;&nbsp;
            <input type="radio" name="gender" value="1"  checked="checked">여
         </c:if>
         </td>
      </tr>
      
      <tr>
         <td align="center">이메일</td>
         <td>
            <input type="text" name="email1"  value="${dto.getEmail1() }">
            @
            <input type="text" name="email2"  value="${dto.getEmail2() }">
         </td>
      </tr>
      
      <tr>
         <td align="center">핸드폰</td>
         <td>
            <input type="text" name="tel1" size="7"  value="${dto.getTel1() }">
            -
            <input type="text" name="tel2" size="15" value="${dto.getTel2() }">
            -
            <input type="text" name="tel3" size="15" value="${dto.getTel3() }">
         </td>
      </tr>
      
      <tr>
         <td align="center">주소</td>
         <td><input type="text" name="addr" style="width: 98%;"  value="${dto.getAddr() }"></td>
      </tr>
      
      <tr>
         <td align="center" colspan="2">
            <input type="button" value="수정" onclick="checkModify()">
         </td>
      </tr>
   </table>
   </form>
   
   <input type="button" value="메인화면" onclick="location.href='index.jsp'">
</body>
</html>

