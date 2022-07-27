package board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.Bean.BoardDTO;

public class BoardDAO {
	private Connection conn;		//DB접속을 관리하는 클래스
	private PreparedStatement pstmt;//DB와 데이터를 주고받는 클래스
	private ResultSet rs;			//select문 처리결과를 저장하는 클래스.
	
	//커넥션 풀을 담당하는 DataSource객체
	private DataSource ds;
		
	//DataSource객체 얻어오기
	public BoardDAO() {
		Context context;
		
		try {
			context = new InitialContext();
			//톰캣인 경우, DataSource 객체를 찾을때,
			//context.xml의 name속성앞에 "java:comp/env/"를 붙여야한다.
			//context.lookup() : 톰캣 서버에게 DataSource 객체를 달라고 요청하는 함수.
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
	}
	
/*	// 1. driver 등록 확인
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	// 2. DB접속하기
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
*/
	// 3. DB접속 끊기
	public void close() {
		try {
			if (rs != null)	rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//SQL
	//데이터 저장하기
	//데이터 저장
	public int write(BoardDTO dto) {
		int result = 0;
		String sql = "insert into board values(seq_board.nextval,?,?,?,?,?,sysdate)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getHit());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//데이터 읽기 (목록)
	public List<BoardDTO> boardList(int startNum, int endNum){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		String sql = "select seq, id, name, subject, content, hit, "
				+ "to_char(logtime,'YYYY.MM.DD')as logtime from"
				+ "(select rownum rn, tt.* from"
				+ "(select * from board order by seq desc)tt)"
				+ "where rn>=? and rn<=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				dto.setLogtime(rs.getString("logtime"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	
	//게시글 1개 보기
	public BoardDTO boardView(int seq) {
	      BoardDTO dto = null;
	      String sql = "select * from board where seq=?";
	      
	      try {
	         conn = ds.getConnection();
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, seq); 
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            dto = new BoardDTO();
	            dto.setSeq(rs.getInt("seq"));
	            dto.setId(rs.getString("id")); 
	            dto.setName(rs.getString("name")); 
	            dto.setSubject(rs.getString("subject")); 
	            dto.setContent(rs.getString("content")); 
	            dto.setHit(rs.getInt("hit")); 
	            dto.setLogtime(rs.getString("logtime")); 
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      return dto;
	   }
	
	//조회수 증가시키기
	public int updateHit(int seq) {
		int result = 0;
		String sql = "update board set hit = hit+1 where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	//총 글수 구하기
	public int getTotalA() {
		int result = 0;
		String sql = "select count(*) as cnt from board";
		
		try {
			conn = ds.getConnection();
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
	
	//글 삭제하기
	public int boardDelete(int seq) {
		int result = 0;
		String sql = "delete board where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//글 수정하기
	public int boardModify(BoardDTO dto) {
		int result = 0;
		String sql = "update board set subject=?, content=? where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getSeq());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}





















