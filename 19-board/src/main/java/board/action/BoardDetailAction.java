package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardDetailAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 데이터 가져오기
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_Num = Integer.parseInt(request.getParameter("board_num"));
		System.out.println("pg" + pg);
		System.out.println("num" + board_Num);

		// DB처리
		BoardDAO dao = new BoardDAO();
		
		// 조회수 증가
		dao.updateReadCount(board_Num);
		//1줄데이터 얻어오기
		BoardBean bean = dao.oneBoardView(board_Num);
		// 데이터 공유
		request.setAttribute("pg", pg);
		request.setAttribute("bean", bean);
		request.setAttribute("board_Num", board_Num);

		// view처리 파일명 리턴
		return "/board/board_view.jsp";
	}

}
