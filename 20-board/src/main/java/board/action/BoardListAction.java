package board.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.bean.BoardBean;
import board.dao.BoardDAO;

public class BoardListAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//1.데이터처리
		int pg = 1;
		if(request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		//목록 : 10개
		int list_num = 10;
		int endNum = pg * list_num;
		int startNum = endNum-(list_num-1);
		
		BoardDAO dao = new BoardDAO();
		List<BoardBean> list = dao.selectArticleList(startNum, endNum);
		
		//페이징 : 3블럭
		int totalA = dao.selectListCount();	//총 글수
		int totalP = (totalA +(list_num-1))/list_num; //목록의 갯수와 비례하게
		
		int startPage = (pg-1)/3*3 +1;
		int endPage = startPage+2;
		if(endPage>totalP) endPage = totalP;
		
		//2.데이터 공유
		request.setAttribute("pg",pg );
		request.setAttribute("list", list);
		request.setAttribute("totalP", totalP);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		
		//3.view 처리 파일명 리턴
		return "/board/boardList.jsp";
	}

}
