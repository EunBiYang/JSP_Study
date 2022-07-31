package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardRepalyFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1. 데이터 처리
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		//db : 원글 데이터 읽어오기
		BoardDAO dao = new BoardDAO();
		BoardBean bean = dao.oneBoardView(board_num);
		
		//2. 데이터 공유
		request.setAttribute("pg", pg);
		request.setAttribute("bean", bean);
		
		//3. view 처리 파일명 리턴
		
		return "/board/board_reply.jsp";
	}

}
