package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardModifyProAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		System.out.println(request.getParameter("pg"));
		//데이터 가져오기
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_subject = request.getParameter("board_subject");
		String board_content = request.getParameter("board_content");
		System.out.println("pg33" + pg);
		System.out.println("num33" + board_num);
		
		//bean만들기
		BoardBean bean = new BoardBean();
		bean.setBoard_num(board_num);
		bean.setBoard_name(board_name);
		bean.setBoard_pass(board_pass);
		bean.setBoard_subject(board_subject);
		bean.setBoard_content(board_content);
		
		BoardDAO dao = new BoardDAO();
		int result = dao.boardModify(bean);
		
		if(result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out=response.getWriter();
			
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back()");
			out.println("</script>");
			
		} else {
			return "boardDetail.do?pg="+pg+"&board_num="+board_num;
		}

		return null;
	}

}
