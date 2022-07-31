package board.controller;

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

import board.action.Action;
import board.action.BoardDeleteProAction;
import board.action.BoardDetailAction;
import board.action.BoardListAction;
import board.action.BoardModifyFormAction;
import board.action.BoardModifyProAction;
import board.action.BoardRepalyFormAction;
import board.action.BoardReplyProAction;
import board.action.BoradWriteProAction;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// MAP클래스& init 클래스 만들기
	public Map<String, Object> map = new HashMap<String, Object>();

	public BoardController() {
		super();
	}

	@Override
	public void init(ServletConfig config) throws ServletException {
		// 'property' 폴더 절대경로 구하기
		String realFolder = config.getServletContext().getRealPath("/property");
		String realPath = realFolder + "/command.properties";

		// properties
		Properties properties = new Properties();
		FileInputStream fis = null;
		// 파일불러오기
		try {
			fis = new FileInputStream(realPath);
			properties.load(fis);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (fis != null)
					fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		// map 객체에 요청 이름과 요청처리 객체 저장
		Iterator<?> iterator = properties.keySet().iterator();

		while (iterator.hasNext()) {
			String command = (String) iterator.next();
			String className = properties.getProperty(command);
			// System.out.println("command="+command);
			// System.out.println("className="+className);

			try {
				// 객체 생성
				Class<?> commandClass = Class.forName(className);
				Object object = commandClass.newInstance();
				// map에 저장
				map.put(command, object);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}

		}
		// map 저장 내용 확인
		System.out.println(map.toString());
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.요청 정보 확인
		String command = request.getServletPath();
		System.out.println("command =" + command);

		// 2.요청 작업 처리
		// =>데이처 처리 클래스 선택
		String view = null; // 뷰처리 파일명 저장
		Action action = null; // 데이터 처리 클래스

		action = (Action) map.get(command);

		// 3.데이터 처리 및 view 처리 파일 선택
		if (action != null) {
			try {
				view = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 4. 화면 이동
		if (view != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}

	}

}
