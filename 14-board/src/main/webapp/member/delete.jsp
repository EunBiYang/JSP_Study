<%@page import="member.Bean.MemberDTO"%>
<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)session.getAttribute("memId");

	MemberDAO dao = new MemberDAO();
	int result = dao.delete(id);
	System.out.print(id);
	System.out.print(result);
	
	//세션삭제
	if(result >0){
		session.removeAttribute("memName");
		session.removeAttribute("memId");	
	}
	

%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	if (<%=result >0%>) {
		alert("회원 탈퇴되셨습니다.")
	} else {
		alert("회원 탈퇴에 실패하셨습니다.")
		history.back();
	}
	location.href = "../main/index.jsp";
</script>
</head>
<body>

</body>
</html>