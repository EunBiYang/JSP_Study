package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberModifyFormReadyAction implements Action{

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		String id = (String) session.getAttribute("memId");

		MemberDAO dao = new MemberDAO();
		MemberDTO dto = dao.getMember(id);
		
		request.setAttribute("dto", dto);
		request.setAttribute("req", "member/modifyForm.jsp");
		
		return "index.jsp";
	}
}
