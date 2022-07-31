package member.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberListAction implements Action{

	@Override
	public String excute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		//1. 데이터 처리
		int pg = Integer.parseInt(request.getParameter("pg"));

		// 목록처리 
		// => 목록의 수 : 5개
		int list_num = 5;
		int endNum = pg * list_num;
		int startNum = endNum - (list_num-1);
		
		MemberDAO dao = new MemberDAO();
		List<MemberDTO> list = dao.selectList(startNum, endNum);
		
		// 페이징 처리
		// => 블럭의 수 : 3개
		int totalA = dao.getTotalMember();	// 총인원수
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
		request.setAttribute("req",  "member/memberList.jsp");
		
		//3. view처리 파일
		return "index.jsp";
	}

}
