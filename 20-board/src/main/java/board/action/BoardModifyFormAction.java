package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyFormAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//확인
		System.out.println("값 form에서 ="+request.getParameter("pg"));
		System.out.println("값2 form에서="+request.getParameter("board_num"));
		
		//추출
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));

		//DB
		BoardDAO dao = new BoardDAO();
		BoardBean bean = dao.oneBoardView(board_num);
		//공유
		request.setAttribute("pg", pg);
		request.setAttribute("board_num", board_num);
		request.setAttribute("bean", bean);
		
		//view
		return "/board/board_modify.jsp";
	}

}
