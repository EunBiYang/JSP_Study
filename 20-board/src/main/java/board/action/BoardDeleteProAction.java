package board.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dao.BoardDAO;

public class BoardDeleteProAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//데이터 가져오기
		int pg = Integer.parseInt(request.getParameter("pg"));
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String pass = request.getParameter("pass");
		
		System.out.println("pg ==" + pg);
		System.out.println("num ==" + board_num);
		System.out.println("pass ==" + pass);
		
		//DB처리
		BoardDAO dao = new BoardDAO();
		int result = dao.boardDelete(board_num, pass);

		if (result == 0) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();

			out.println("<script>");
			out.println("alert('삭제실패:비밀번호 오류')");
			String view_url = "location.href='boardDetail.do?board_num=" + board_num + "&pg=" + pg + "'";
			out.println(view_url);
			out.println("</script>");
		} else {
			return "boardList.do?pg=" + pg;
		}

		return null;
	}

}
