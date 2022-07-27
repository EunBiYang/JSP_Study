<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 데이터 확인
	String id = request.getParameter("id");

	//DB처리
	MemberDAO dao = new MemberDAO();
	boolean result = dao.isExistID(id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function checkIdClose() {
	//opener : 현재 브라우저의 부모 브라우저를 관리하는 내장 객체
	opener.frm.id.value = "<%=id%>";
	window.close(); //현재 브라우저 닫기.
	opener.frm.pwd.focus();
}

function checkId() {
	//form 객체 얻기
	var cid = document.cid;	
	//입력 체크
	if(!cid.id.value){
		alert("아이디를 입력하세요.");
		cid.id.focus();
	}else{
		cid.submit();
	}
}
</script>
</head>
<body>
<%if(result){ //id가 존재하면 %>
	<%=id %>는 사용중 입니다.<br><br>
	
	<form action="checkId.jsp" name="cid">
			아이디 <input type="text" name="id">
			<input type="button" value="중복 체크" onclick="checkId()">
	</form>

<%}else{ //id가 존재하지 않으면%>
	<%=id %>는 사용 가능합니다.<br><br>
	<input type="button" value="사용" onclick="checkIdClose()">
<%} %>
</body>
</html>