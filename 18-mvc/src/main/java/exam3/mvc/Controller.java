package exam3.mvc;

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

@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
    // Map 클래스 : 명령어와 명령어 처리 객체를 쌍으로 저장
	private Map<String, Object> map = new HashMap<String, Object>(); 
	
    public Controller() {
        super();
    }
    
    // 톰캣서버가 서블릿을 구동시킨후, 제일 먼저 호출하는 함수
    // => 서블릿의 초기화 작업을 함
    // => command.properties 파일에 설정된 대로 객체를 생성한 후,
    //    map 객체에 요청명과 요청처리객체를 쌍으로 저장함
    @Override
    public void init(ServletConfig config) throws ServletException {
    	String realFolder = config.getServletContext().getRealPath("property");
    	String realPth = realFolder + "/command.properties";
    	
    	// properties 파일을 관리하는 클래스
    	Properties properties = new Properties();
    	// 파일을 읽어올 IO 클래스
    	FileInputStream fis = null;
    	try {
			fis = new FileInputStream(realPth);
			properties.load(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis != null) fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
    	// command.properties의 "=" 기준 왼쪽 키값을 읽어옴
    	Iterator<?> iterator = properties.keySet().iterator();
    	while(iterator.hasNext()) {
    		String command = (String) iterator.next();  		// "=" 기준 왼쪽값
    		String className = properties.getProperty(command);	// "=" 기준 오른쪽값
    		// 결과 확인
    		System.out.println("command = " + command);
    		System.out.println("className = " + className);
    		
    		
    		try {
    			// 클래스가 있는 지 검사
				Class<?> commandClass = Class.forName(className);
				// 객체 생성 함수, new exam3.mvc.MessageAction();와 동일
				Object object = commandClass.newInstance();
				// map 객체에 저장
				map.put(command, object);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
    	}
    	// map 확인
    	System.out.println("map : " + map);
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doRequest(request, response);
	}
	
	protected void doRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 정보 확인
		String command = request.getParameter("command");
		
		
		// 2. 요청 작업 처리
		// => 데이터 처리 클래스 선택
		Action action = (Action) map.get(command);
		
		
		// 3. 데이터 처리 + view 처리 파일 선택
		String view = null;
		if(action != null) {
			try {
				view = action.process(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		System.out.println("command = " + command);
		System.out.println("action = " + action);
		
		// 4. view 처리 파일로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}

}








