<%@page import="score.dao.scoreDAO"%>
<%@page import="score.bean.scoreDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("utf-8");
int pg = Integer.parseInt(request.getParameter("pg"));

//1. 성적 데이터 처리
String hak = request.getParameter("hak");
String name = request.getParameter("name");
int kor = Integer.parseInt(request.getParameter("kor"));
int eng = Integer.parseInt(request.getParameter("eng"));
int mat = Integer.parseInt(request.getParameter("mat"));
int tot = kor+eng+mat;
double avg = tot/3;


//2.DB처리
scoreDTO dto = new scoreDTO();
dto.setHak(hak);
dto.setName(name);
dto.setKor(kor);
dto.setEng(eng);
dto.setMat(mat);
dto.setTot(tot);
dto.setAvg(avg);

scoreDAO dao = new scoreDAO();
int result = dao.socreInput(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적 입력</title>
<script type="text/javascript">
	if(<%=result >0 %>){
		alert("저장했습니다.");
	}else{
		alert("저장에 실패했습니다.");
	}
	location.href="scoreView.jsp?pg=1";
</script>

</head>
<body>

		
</body>
</html>