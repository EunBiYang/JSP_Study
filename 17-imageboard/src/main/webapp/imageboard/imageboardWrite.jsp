<%@page import="imageboard.dao.ImageBoardDAO"%>
<%@page import="imageboard.beam.ImageBoardDTO"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1)데이터 읽기
	//저장 폴더 위치
	String realFolder = request.getServletContext().getRealPath("storage");
	//파일 저장
	//MultipartRequest 클래스 cos.jar 파일 추가후 사용가능한 함수
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8");
	
	//데이터 읽기
	String imageId = multi.getParameter("imageId");
	String imageName = multi.getParameter("imageName");
	int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
	int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
	String imageContent = multi.getParameter("imageContent");
	String image1 = multi.getOriginalFileName("image1");
	
	
	//2)DB작업
	ImageBoardDTO dto = new ImageBoardDTO();
	dto.setImageId(imageId);
	dto.setImageName(imageName);
	dto.setImagePrice(imagePrice);
	dto.setImageQty(imageQty);
	dto.setImageContent(imageContent);
	dto.setImage1(image1);
	
	ImageBoardDAO dao = new ImageBoardDAO();
	int result = dao.imageboardWrite(dto);
	
	
	//3)공유데이터 저장 및 화면 공유걸기
	request.setAttribute("result", result);
	request.setAttribute("imageName",imageName );
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardWriteResult");
	dispatcher.forward(request, response);
	//forward로 다음 파일로 이동!
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WriteForm에서 넘어온 데이터 처리</title>
</head>
<body>

</body>
</html>
