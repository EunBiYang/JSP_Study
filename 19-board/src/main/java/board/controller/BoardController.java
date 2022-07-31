package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
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

    public BoardController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1.요청 정보 확인
		String command = request.getServletPath();
		System.out.println("command ="+command);
		
		//2.요청 작업 처리
		//=>데이처 처리 클래스 선택
		String view = null;		//뷰처리 파일명 저장
		Action action = null;	//데이터 처리 클래스
		
		if(command.equals("/boardWrite.do")) {
			//데이터 처리할게 없으니깐 바로 뷰처리
			view = "board/boardWriteForm.jsp";
		} else if(command.equals("/boardWritePro.do")) {
			action = new BoradWriteProAction();
		} else if(command.equals("/boardList.do")) {
			action = new BoardListAction();
		} else if(command.equals("/boardDetail.do")) {
			action = new BoardDetailAction();
		} else if(command.equals("/boardDeleteForm.do")) {
			view="/board/board_delete.jsp";
		} else if(command.equals("/boardDeletePro.do")) {
			action = new BoardDeleteProAction();
		} else if(command.equals("/boardModifyForm.do")) {
			action = new BoardModifyFormAction();
		} else if(command.equals("/boardModifyPro.do")) {
			action = new BoardModifyProAction();
		} else if(command.equals("/boardReplyForm.do")) {
			action = new BoardRepalyFormAction();
		} else if(command.equals("/boardReplyPro.do")) {
			action = new BoardReplyProAction();
		}
		
		
		//3.데이터 처리 및 view 처리 파일 선택
		if(action != null) {
			try {
				view=  action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//4. 화면 이동
		if(view != null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		}
		
	}

}

