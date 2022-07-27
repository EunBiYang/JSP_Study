<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//가져오기
String num1_str = request.getParameter("num1");
String calc = request.getParameter("calc");
String num2_str = request.getParameter("num2");
int num1 = Integer.parseInt(num1_str);
int num2 = Integer.parseInt(num2_str);
int result = 0;

if(calc.equals("+")){
	result = num1+num2;
}else if(calc.equals("-")){
	result = num1-num2;
}else if(calc.equals("*")){
	result = num1*num2;
}else if(calc.equals("/")){
	result = num1/num2;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계산기</title>
</head>
<body>
	<p><%=num1%><%=calc%><%=num2%>=<%=result %></p>
</body>
</html>