package book2.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book2.bean.Book2DTO;
import book2.dao.Book2DAO;

public class BookListAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		int list_num = 10;
    	int eNum = pg *list_num;
    	int sNum = eNum -(list_num-1);
    	
    	Book2DAO dao = new Book2DAO();
    	List<Book2DTO> list = dao.book2List(sNum, eNum);
    	
    	
    	//총페이지수
    	
    	int totalA = dao.getTotalNum();	// 총인원수
		int totalP = (totalA + (list_num-1)) / list_num;		// 총페이지수
		
		int startPage = (pg-1)/3*3 + 1;
		int endPage = startPage + 2;
		if(endPage > totalP) endPage = totalP;

		// 2.데이터 공유
		request.setAttribute("pg", pg);
		request.setAttribute("list", list);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalP", totalP);
    	request.setAttribute("req", "book2/bookListResult.jsp");
    	
    	//view 화면 이동
    	return "main.jsp";
	}

}
