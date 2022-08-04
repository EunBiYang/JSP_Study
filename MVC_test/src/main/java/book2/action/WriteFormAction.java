package book2.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WriteFormAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setAttribute("req", "book2/writeForm.jsp");
		
		return "main.jsp";
	}

}
