package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardReplyProAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		//1. 데이터 가져오기
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		int board_re_ref = Integer.parseInt(request.getParameter("board_re_ref"));
		int board_re_lev = Integer.parseInt(request.getParameter("board_re_lev"));
		int board_re_seq = Integer.parseInt(request.getParameter("board_re_seq"));
		String board_name = request.getParameter("board_name");
		String board_pass = request.getParameter("board_pass");
		String board_subject = request.getParameter("board_subject");
		String board_content = request.getParameter("board_content");
		
		System.out.println("board_re_ref = "+board_re_ref);
		
		//DB작업
		BoardBean bean = new BoardBean();
		bean.setBoard_num(board_num);
		bean.setBoard_re_ref(board_re_ref);
		bean.setBoard_re_lev(board_re_lev);
		bean.setBoard_re_seq(board_re_seq);
		bean.setBoard_name(board_name);
		bean.setBoard_pass(board_pass);
		bean.setBoard_subject(board_subject);
		bean.setBoard_content(board_content);
		
		BoardDAO dao = new BoardDAO();
		int result = dao.insertReplyArticle(bean);

		//2. 화면 네이비게이션 : 데이터 공유 + 파일명 선택
		if(result == 0) {
			response.setContentType("text/html; charest=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('답글저장실패');");
			out.println("history.back();");
			out.println("<script>");
		}else {
			//return "boardList.do?pg=" +pg;
			//forward방식으로 동작될 경우, 새로고침하면 답글이 계속 추가됨
			//주소창에 http://localhost:8080/19-board/boardReplyPro.do로 표시되기 때문
			
			//주소창의 url이 http://localhost:8080/19-board/boardList.do?pg=1 이렇게 표시되어야한다.
			// =>조소가 바뀔수 있도록 sendRedirect 방식으로 이동해야함.
			response.sendRedirect("boardList.do?pg=" +pg);
		}
		return null;
		//화면 움직이지 않게
	}

}
