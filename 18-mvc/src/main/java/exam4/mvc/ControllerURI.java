package exam4.mvc;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class ControllerURI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> map = new HashMap<String, Object>();
	
    public ControllerURI() {
        super();
    }

    @Override
    public void init(ServletConfig config) throws ServletException {
    	String realFolder = config.getServletContext().getRealPath("property");
    	String realPath = realFolder+"/commandURI.properties";
    	
    	//1.commandURI.properties 파일 읽기
    	Properties properties = new Properties();
    	FileInputStream fis = null;
    	try {
			fis = new FileInputStream(realPath);
			properties.load(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis != null )fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
    	
    	//2.commandURI.properties에 설정된 대로 객체 생성 후, map에 저장하기
    	Iterator<?> iterator = properties.keySet().iterator();
    	while(iterator.hasNext()) {
    		String command =(String) iterator.next();
    		String className = properties.getProperty(command);
    		
    		Class<?> commandClass;
			try {
				commandClass = Class.forName(className);
				Object object = commandClass.newInstance();
				map.put(command, object);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
    		
    	}
    	//map 확인
    	System.out.println("map = " + map);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//http://localhost:8080/18-mvc/exam4/message.do
		
		//1.요청정보 확인
		String command = request.getRequestURI();
		String contextPath = request.getContextPath();
		int contextPathLength = request.getContextPath().length();
		
		
		//command = /18-mvc/exam4/message.do
		//contextPath = /18-mvc
		//contextPathLength = 7
		System.out.println("command = "+command);
		System.out.println("contextPath = "+contextPath);
		System.out.println("contextPathLength = "+contextPathLength);
		System.out.println("--------------------");
		
		//요청정보 추출
		if(command.indexOf(contextPath)==0) { // 0과 같냐 == /18-mvc가 제일 처음에 위치해 있냐
			command = command.substring(contextPathLength);
		}
		//command = /exam4/message.do
		System.out.println("command = "+command);
		System.out.println("--------------------");
		
		//2. 요청 작업 처리
		//=> 데이터 처리 클래스 선택
		Action action = (Action)map.get(command);
		
		//3. 데이터처리 + view 처리 파일 선택
		String view = null;
		if(action != null) {
			try {
				view = action.precess(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//4.view 처리 파일로 이동
		if(view != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}else {
			System.out.println("view = "+view);
		}
		}
		
}












