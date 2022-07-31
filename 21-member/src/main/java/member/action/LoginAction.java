package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDAO;

public class LoginAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		
		// 데이터 처리
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");

		// DB 처리
		MemberDAO dao = new MemberDAO();
		String name = dao.login(id, pwd);

		System.out.println("id=" + id); 
		System.out.println("pwd=" + pwd);
		System.out.println("name=" + name);

		// 화면 이동
		if (name != null) { // 로그인 성공
			HttpSession session = request.getSession();
			session.setAttribute("memName", name);
			session.setAttribute("memId", id);
			request.setAttribute("req", "member/loginOk.jsp");
			
		} else { // 로그인 실패
			request.setAttribute("req", "member/loginFail.jsp");
		}
		return "index.jsp";
	}

}
