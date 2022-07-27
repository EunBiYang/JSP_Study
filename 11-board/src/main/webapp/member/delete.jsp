<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");

	MemberDAO dao = new MemberDAO();
	int result = dao.delete(id);
	
	// 세션 삭제
	if(result > 0) {
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
	if(<%=result > 0%>) {
		alert("회원 탈퇴에 성공했습니다.");
	} else {
		alert("회원 탈퇴에 실패하였습니다.");
	}
	location.href = "../main/index.jsp";
</script>
</head>
<body>

</body>
</html>