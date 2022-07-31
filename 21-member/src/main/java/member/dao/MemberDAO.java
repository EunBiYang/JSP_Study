package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import member.bean.MemberDTO;

public class MemberDAO {
	private Connection conn;		// DB와의 접속을 관리하는 클래스
	private PreparedStatement pstmt;// DB와 데이터를 주고 받는 클래스
	private ResultSet rs;			// select 처리 결과를 저장하는 클래스
	
	// 1. driver 등록 확인
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	// 2. DB 접속하기
	public Connection getConnection() {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String username = "C##dbexam";
		String password = "m1234";
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 3. DB 접속끊기
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 4. SQL
	// 4-1) insert
	public int write(MemberDTO dto) {
		int result = 0;
		String sql = "insert into member values (?,?,?,?,?,?,?,?,?,?,sysdate)";
		
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getId());
			pstmt.setString(3, dto.getPwd());
			pstmt.setString(4, dto.getGender());
			pstmt.setString(5, dto.getEmail1());
			pstmt.setString(6, dto.getEmail2());
			pstmt.setString(7, dto.getTel1());
			pstmt.setString(8, dto.getTel2());
			pstmt.setString(9, dto.getTel3());
			pstmt.setString(10, dto.getAddr());
			
			result = pstmt.executeUpdate();  // 1) db에 sql 처리 요청 2) 응답대기 3) 응답 데이터 리턴
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	// 로그인
	public String login(String id, String pwd) {
		String name = null;
		String sql = "select * from member where id=? and pwd=?";
		
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("name");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return name;
	}
	// id 검사
	public boolean isExistId(String id) {
		boolean result = false;  // true: 존재, false: 존재안함
		String sql = "select * from member where id=?";
		
		conn = getConnection();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {	// id가 존재하면
				result = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	// 회원정보 수정하기
	public int modify(MemberDTO dto) {
		int result = 0;
		String sql = "update member set name=?, pwd=?, gender=?, email1=?, email2=?, "
				   + " tel1=?, tel2=?, tel3=?, addr=? where id=?";
		conn=getConnection();
		try {
			pstmt=conn.prepareStatement(sql);			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getEmail1());
			pstmt.setString(5, dto.getEmail2());
			pstmt.setString(6, dto.getTel1());
			pstmt.setString(7, dto.getTel2());
			pstmt.setString(8, dto.getTel3());
			pstmt.setString(9, dto.getAddr());
			pstmt.setString(10, dto.getId());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	// 회원1명의 정보 읽어오기
	public MemberDTO getMember(String id) {
		MemberDTO dto = null;
		String sql= "select * from member where id=?";
		
		try {
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setAddr(rs.getString("addr"));
				dto.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	// 회원탈퇴 (삭제)
	public int delete(String id) {
		int result = 0;
		String sql = "delete member where id=?";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return result;
	}
	// 목록
	public List<MemberDTO> selectList(int startNum, int endNum) {
		List<MemberDTO> list = new ArrayList<MemberDTO>();
		String sql = "select * from "
				   + " (select rownum rn, tt.* from "
				   + " (select * from member order by name asc) tt) "
				   + " where rn >= ? and rn <= ?";
		conn = getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum); 
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setPwd(rs.getString("pwd"));
				dto.setGender(rs.getString("gender"));
				dto.setEmail1(rs.getString("email1"));
				dto.setEmail2(rs.getString("email2"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setAddr(rs.getString("addr"));
				
				String str = rs.getString("logtime");
				dto.setLogtime(str.substring(0, str.indexOf(" ")));
				
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	// 총 인원수 
	public int getTotalMember() {
		int result = 0;
		String sql = "select count(*) as cnt from member";
		conn=getConnection();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}











