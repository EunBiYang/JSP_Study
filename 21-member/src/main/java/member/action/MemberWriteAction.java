package member.action;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;


public class MemberWriteAction implements Action {

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		   // post 방식 한글설정
		   request.setCharacterEncoding("utf-8");
		   // 1. 데이터 처리	
		   String name = request.getParameter("name");
		   String id = request.getParameter("id");
		   String pwd = request.getParameter("pwd");
		   String gender = request.getParameter("gender");
		   String email1 = request.getParameter("email1");
		   String email2 = request.getParameter("email2");
		   String tel1 = request.getParameter("tel1");
		   String tel2 = request.getParameter("tel2");
		   String tel3 = request.getParameter("tel3");
		   String addr = request.getParameter("addr");
		   
		   System.out.println("name = "+ name);
		   // 2. DB 작업
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
		   int result = dao.write(dto);
		   System.out.println("result = "+result);
		   
		   request.setAttribute("result", result);
		   request.setAttribute("memId", id);
		   request.setAttribute("req", "member/write.jsp");
		 
		   //3. view처리 파일명 리턴
		   return "index.jsp";
			
	}

}
