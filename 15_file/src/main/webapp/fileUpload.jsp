<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	/* 1. 데이터 처리 부분
	 enctype="multipart/form-data"로 전송되어 왔기 때문에
	 request 객체로는 데이터를 추출할 수 없음 */
	//String subject = request.getParameter("subject");
	//System.out.println("subject = " + subject);
	
	// 실제 파일 저장 폴더위치 확인
	// => 톰캣서버가 파일을 저장하는 폴더 위치 구하기
	String realFolder = request.getServletContext().getRealPath("./storage");
	// realFolder = D:\aa_class\bigdata_ycs\jsp\workspace\.metadata\.plugins\
	//              org.eclipse.wst.server.core\tmp0\wtpwebapps\14-file\storage
	System.out.println("realFolder = " + realFolder);
	
	/* enctype="multipart/form-data"로 전송되어온 데이터는
	   cos.jar 라이브러리에서 제공하는 MultipartRequest 클래스를 사용함
	   => MultipartRequest 객체가 생성될 때, storage 폴더에 전송되어온 파일이 저장됨*/
	   

	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024,
										"utf-8", new DefaultFileRenamePolicy());
	/*  - request  : 요청 정보가 저장된 객체
		- realFolder : 파일이 저장될 폴더 위치
		- 5*1024*1024 : 최대한 처리할 수 있는 파일의 크기 설정, 5MB까지만 파일을 처리할 수 있음
		- "utf-8" : post 방식 데이터의 인코딩 설정 
		- new DefaultFileRenamePolicy() : 중복 파일명이 있을 경우, 뒤에 숫자를 덧붙여서 저장하는 설정*/
	
	String subject = multi.getParameter("subject");
	String content = multi.getParameter("content");
	String originalFileName1 = multi.getOriginalFileName("upload1");
	String originalFileName2 = multi.getOriginalFileName("upload2");
	
	// storage 폴더에 실제 저장되는 파일의 이름
	String fileName1 = multi.getFilesystemName("upload1");
	String fileName2 = multi.getFilesystemName("upload2");
	
	// 저장된 파일 크기
	File file1 = multi.getFile("upload1");
	File file2 = multi.getFile("upload2");
	long fileSize1 =0, fileSize2 = 0;
	if(file1 != null) fileSize1 = file1.length();//파일의 크기를 long형으로 리턴한다 그래서 long형 객체 생성해서 받아준다
	if(file2 != null) fileSize2 = file2.length();
%>    

<!-- 2. View 처리 부분 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>제목 : <%=subject %></li>
		<li>내용 : <%=content %></li>
		<li>파일 : <a href="fileDownload.jsp?fileName=<%=originalFileName1%>"><%=originalFileName1%></a>
				&nbsp;&nbsp;&nbsp; <%=fileName1%></li>
		<li>크기 : <%=fileSize1 %></li>
		<br><br>
		<li>파일 : <%=originalFileName2 %> &nbsp;&nbsp;&nbsp; <%=fileName2 %></li>
		<li>크기 : <%=fileSize2%></li>
	</ul>
</body>
</html>


