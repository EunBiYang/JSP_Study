package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDeleteFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 1.데이터 처리
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		// 2.데이터 공유
		request.setAttribute("pg", pg );
		request.setAttribute("board_num", board_num);
		// 3.view퍼리 파일명 리턴
		return "/board/board_delete.jsp";
	}

}

