package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;

public class MemberDeleteAction implements Action{

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String id = request.getParameter("id");
		System.out.println("id = "+id);
		MemberDAO dao = new MemberDAO();
		int result = dao.delete(id);
		System.out.println("result="+result);
		// 세션 삭제
		if(result > 0) {
			HttpSession session = request.getSession();
			session.removeAttribute("memName");
			session.removeAttribute("memId");
		}
		 request.setAttribute("result", result);
		 request.setAttribute("req", "member/delete.jsp");
		 
		return "index.jsp";
	}

}
