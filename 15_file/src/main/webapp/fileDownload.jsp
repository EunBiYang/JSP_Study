<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String fileName = request.getParameter("fileName");
	// 저장 폴더위치 얻기
	String realPath = request.getServletContext().getRealPath("/storage");
	// 다운받고자 하는 파일 : 절대 경로
	File file = new File(realPath, fileName);
	// file  = D:\aa_class\bigdata_ycs\jsp\workspace\.metadata\.plugins\
	//	       org.eclipse.wst.server.core\tmp0\wtpwebapps\14-file\storage\cupra.jpg
	System.out.println("file  = " + file);
	
	// HTML문서 형식이 아닌, "파일 다운로드" 형태로 전송 
	String str_fileName = new String(URLEncoder.encode(fileName, "UTF-8")).replaceAll("\\+", " ");
	// 응답 헤더에 파일 정보를 저장함(문자열로만 저장 가능)
	response.setHeader("Content-Disposition", "attachment; fileName=" + str_fileName);
	response.setHeader("Content-Length", String.valueOf(file.length()));
	
	// 출력 buffer 초기화
	out.clear();
	out = pageContext.pushBody();
	
	// HDD에 저장된 파일을 RAM으로 읽어옴
	FileInputStream fis = new FileInputStream(file);
	BufferedInputStream bis = new BufferedInputStream(fis);
	byte[] b = new byte[(int)file.length()];
	bis.read(b, 0, b.length);
	bis.close();
	fis.close();
	
	// 클라이언트로 전송
	ServletOutputStream sos = response.getOutputStream();
	BufferedOutputStream bos = new BufferedOutputStream(sos);
	bos.write(b);
	bos.close();

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>