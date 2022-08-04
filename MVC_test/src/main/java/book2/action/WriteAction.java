package book2.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book2.bean.Book2DTO;
import book2.dao.Book2DAO;

public class WriteAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		//인코딩 및 데이터 처리
		request.setCharacterEncoding("utf-8");
		String code = request.getParameter("code");
		String name = request.getParameter("name");
		String author = request.getParameter("author");
		String pub = request.getParameter("pub");
		int price = Integer.parseInt(request.getParameter("price"));

		//확인1
		System.out.println(code);
		System.out.println(name);
		System.out.println(author);
		System.out.println(pub);

		//DB처리
		Book2DTO dto = new Book2DTO();
		dto.setCode(code);
		dto.setName(name);
		dto.setAuthor(author);
		dto.setPub(pub);
		dto.setPrice(price);

		Book2DAO dao = new Book2DAO();
		int result = dao.bookWrite(dto);

		//확인2
		System.out.println(result);
		System.out.println(name);

		//공유데이터 설정
		request.setAttribute("result", result);
		request.setAttribute("name", name);
		request.setAttribute("req", "book2/writeResult.jsp");

		//view 처리
		return "main.jsp";
	}

}
