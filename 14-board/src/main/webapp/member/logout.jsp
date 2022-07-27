<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//1.쿠키삭제
	/*Cookie[] coo = request.getCookies();
	if(coo !=null){
		for(int i =0;i<coo.length;i++){
			if(coo[i].getName().equals("memName")){
				coo[i].setMaxAge(0); //유지시간을 0으로 하면 쿠키가 삭제된다.
				response.addCookie(coo[i]);
			}else if(coo[i].getName().equals("memId")){
				coo[i].setMaxAge(0);
				response.addCookie(coo[i]);
			}
		}
	}*/
	
	//2.세션 삭제
	session.removeAttribute("memName");
	session.removeAttribute("memId");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		alert("로그아웃");
		location.href = "../main/index.jsp";
	}
</script>
</head>
<body>

</body>
</html>