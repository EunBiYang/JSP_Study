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
	MultipartRequest multi = new MultipartRequest(request, realFolder, 5*1024*1024, "utf-8");
	//데이터 읽기
	String imageId = multi.getParameter("imageId");
	String imageName = multi.getParameter("imageName");
	int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
	int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
	String imageContent = multi.getParameter("imageContent");
	String image1 = multi.getOriginalFileName("image1");
	
	String img_org = multi.getParameter("img_org");
	//별도 파일 업로드 없으시 기존 파일 업로드를 위한 파라미터값 공유
	int seq = Integer.parseInt(multi.getParameter("seq"));
	int pg = Integer.parseInt(multi.getParameter("pg"));
	
	if(image1 == null){		//전달된 파일이 없으면
		image1 = img_org;	//원래 파일명 저장
	}

	//2)DB작업
	ImageBoardDTO dto = new ImageBoardDTO();
	dto.setImageId(imageId);
	dto.setImageName(imageName);
	dto.setImagePrice(imagePrice);
	dto.setImageQty(imageQty);
	dto.setImageContent(imageContent);
	dto.setImage1(image1);
	dto.setSeq(seq);
	
	ImageBoardDAO dao = new ImageBoardDAO();
	int result = dao.imagBoardModify(dto);
	
	
	//3)공유데이터 저장 및 화면 공유걸기
	request.setAttribute("result", result);
	request.setAttribute("seq", seq);
	request.setAttribute("pg", pg);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("../main/index.jsp?req=imageboardModifyResult");
	dispatcher.forward(request, response);
	//forward로 다음 파일로 이동!
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