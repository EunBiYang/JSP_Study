package com.hello;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/* 톰캣 프로그램이 관리하는 클래스 파일 */
public class HelloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;     

    public HelloServlet() {
        super();
    }
    
    @Override
    public void init(ServletConfig config) throws ServletException {
    	System.out.println("init() ...");
    }
    
    //서블릿이 종료될 때 마지막에 1번 호출된다.
    // =>1) 서버가 종료될때
    // =>2) 서블릿 파일이 수정되었을 때
    @Override
	public void destroy() {
		System.out.println("destroy() ...");
	}
    
    /**		[ 톰캣 서버에서 만든다!]          
     * request : 요청정보를 저장하고 있는 객체
     * response : 응답정보를 저장하고 있는 객체
    */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() ...");
		//1.데이터 처리
		
		//2. HTML 문서 작업
		//	=>데이터 처리 결과를 HTML 문서로 작성함
		
		// "이후 문자열은 HTML문서이다!"로 설정
		response.setContentType("text/html; charset=UTF-8");
		//출력 클래스
		PrintWriter out = response.getWriter();
		
		//HTML문서 작성(아파치 서버쪽으로 출력이 나간다)
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet</title>");
		out.println("</head>");
		
		out.println("<body>");
		out.println("Hellow Servlet!!<br>");
		out.println("안녕하세요. 서블릿!!<br>");
		out.println("</body>");
		out.println("</html>");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() ...");
		doGet(request, response);
	}

}













