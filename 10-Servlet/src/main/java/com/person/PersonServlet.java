package com.person;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/PersonServlet")
public class PersonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public PersonServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.데이터 처리
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String[] hobby_arr = request.getParameterValues("hobby");
		String color = request.getParameter("color");
		String[] subject_arr = request.getParameterValues("subject");
		
		//데이터 확인
//		System.out.println("색깔 : "+ color);
//		System.out.println("취미 : "+ hobby_arr);
//		System.out.println("과목 : "+ subject_arr );
		
		//결과값
		String hobby = "";
		for (int i = 0; i < hobby_arr.length; i++) {
			hobby += hobby_arr[i] + " ";
		}

		String subject = "";
		for (int i = 0; i < subject_arr.length; i++) {
			subject += subject_arr[i] + " ";
		}

		
		//2.HTML문서 작성 및 응답
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet</title>");
		out.println("<style>");
		out.println("body{color : yellow;}");
		out.println("a{color : yellow;}");
		out.println("</style>");
		out.println("</head>");

		out.println("<body bgcolor="+color+">");
		out.println("<ul>");
		out.println("<li>이름 :"+name+" </li>");
		out.println("<li>성별 :"+gender+" </li>");
		out.println("<li>취미 :"+hobby+" </li>");
		out.println("<li>색깔 :"+color+" </li>");
		out.println("<li>과목 :"+subject+" </li>");
		out.println("</ul>");
		out.println("<br>");
	    out.print("<a href='#' onclick='history.back(); return false;'>뒤로</a>");
		out.println("</body>");
		out.println("</html>");
		
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
