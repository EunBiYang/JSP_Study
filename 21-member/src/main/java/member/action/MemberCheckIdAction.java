package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDAO;

public class MemberCheckIdAction implements Action{

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 1.데이터 처리
		String id = request.getParameter("id");
		//DB 처리
		MemberDAO dao = new MemberDAO();
		boolean result = dao.isExistId(id);
		
		// 2.데이터 공유
		request.setAttribute("result", result);
		request.setAttribute("id", id);

		
		//view처리 파일 명 선택
		return "member/checkId.jsp";
	}

}
