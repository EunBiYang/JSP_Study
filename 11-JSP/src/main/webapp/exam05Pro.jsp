<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//선언
String name = request.getParameter("name");
String kor_str = request.getParameter("kor");
String eng_str = request.getParameter("eng");
String mat_str = request.getParameter("mat");
int kor = 0, eng = 0, mat = 0;

System.out.println("name = "+name);

//이름 입력 검사
 if(name != null){
	 if(name.equals("")){
		 out.println("이름 입력값이 없습니다.");//body쪽 출력
		 return;	//함수 강제 종료, 밑으로 코드가 진행되지 않도록 막는역활
	 }
 }else{
	 out.println("이름 입력값에 문제가 있습니다.");
	 return;
 }

//숫자의 입력 검사 및 숫자 검사
//국어검사
 if(kor_str != null){
	 if(kor_str.equals("")){
		 out.println("국어 입력값이 없습니다.");
		 return;
		 }else{
		 if(kor_str.matches("^[0-9]*$")){
		 kor = Integer.parseInt(kor_str);
	 }else{
		 out.println("국어점수에 문자가 포함되어 있습니다.");
		 return;
	 }
	 }
 }else{
	 out.println("국어 입력값에 문제가 있습니다.");
	 return;
 }

//영어검사
 if(eng_str != null){
	 if(eng_str.equals("")){
		 out.println("영어 입력값이 없습니다.");
		 return;
		 }else{
		 if(eng_str.matches("^[0-9]*$")){
		 eng = Integer.parseInt(eng_str);
	 }else{
		 out.println("영어점수에 문자가 포함되어 있습니다.");
		 return;
	 }
	 }
 }else{
	 out.println("영어 입력값에 문제가 있습니다.");
	 return;
 }

//수학검사
 if(mat_str != null){
	 if(mat_str.equals("")){
		 out.println("수학 입력값이 없습니다.");
		 return;
	}else{
		if(mat_str.matches("^[0-9]*$")){
		mat = Integer.parseInt(mat_str);
	}else{
		out.println("수학점수에 문자가 포함되어 있습니다.");
		return;
	}
 }
}else{
	out.println("수학 입력값에 문제가 있습니다.");
	return;
 }

//정수변환
//Integer.parseInt()은 문자열이 반드시 정수형태여야함
//그렇지 않으면 , NumberFormatException 예외가 발생함
/*int kor = Integer.parseInt(kor_str);
int eng = Integer.parseInt(eng_str);
int mat = Integer.parseInt(mat_str);*/
double avg = (kor+eng+mat)/3;
String result = "";

//연산
if(avg>=90) result = "<수>";
else if(avg<90 && avg>=80) result= "<우>";
else if(avg<80 && avg>=70) result= "<미>";
else if(avg<70 && avg<60) result= "<양>";

%>   
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 결과</title>
</head>
<body>
	<p><%=name%> 님의 성적은 <%=result%>입니다.</p>
</body>
</html>
