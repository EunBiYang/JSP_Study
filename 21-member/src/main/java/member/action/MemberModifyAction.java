package member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberModifyAction implements Action{

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String gender = request.getParameter("gender");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String tel1 = request.getParameter("tel1");
		String tel2 = request.getParameter("tel2");
		String tel3 = request.getParameter("tel3");
		String addr = request.getParameter("addr");
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");	
		
		MemberDTO dto = new MemberDTO();	
		dto.setName(name);
		dto.setId(id);
		dto.setPwd(pwd);
		dto.setGender(gender);
		dto.setEmail1(email1);
		dto.setEmail2(email2);
		dto.setTel1(tel1);
		dto.setTel2(tel2);
		dto.setTel3(tel3);
		dto.setAddr(addr);
		
		MemberDAO dao = new MemberDAO();	
		int result = dao.modify(dto);
		System.out.println("result = " + result);
		
		request.setAttribute("result", result);
		request.setAttribute("req", "member/modify.jsp");
		
		return "index.jsp";
	}
	
}
