package com.param;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ParamServlet")
public class ParamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ParamServlet() {
        super();
    }
    //브라우저로부터 get방식으로 요청을 받으면, 톰캣서버는 doGet() 함수를 호출하면서
    // 요청정ㅇ보는 request 객체에, 응답정보는 response 객체에 거장해서 매개변수로 전달함
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://localhost:8080/10-Servlet/paramServlet?name=홍길동&age=25 >request 객체 안에 저장되어잇다.
		//1.데이터 처리
		String name = request.getParameter("name");
		String age_str = request.getParameter("age");
		
		//데이터 확인
		System.out.println("name ="+name);
		System.out.println("age ="+age_str);
		
		//나이는 정수로 변환
		int age = Integer.parseInt(age_str);
		
		//성인 검사
		String result = name+"님의 나이는"+age+"살 이므로,";
		if(age>=20) result += "성인입니다.";
		else result += "청소년 입니다.";
		
		//2.HTML문서 작성 및 응답
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet</title>");
		out.println("</head>");
		
		out.println("<body>");
		out.println(result);
		out.println("</body>");
		out.println("</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
