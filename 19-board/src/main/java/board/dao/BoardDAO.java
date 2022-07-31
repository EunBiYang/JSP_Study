package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.BoardBean;

public class BoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public BoardDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource)context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//insert 명령
	public int insertArticle(BoardBean bean) {
		int result = 0;
		String sql = "insert into board2 values(seq_num.nextval, ?, ?, ?, ?, ?, seq_num.currval, 0, 0, 0, sysdate)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getBoard_name());
			pstmt.setString(2, bean.getBoard_pass());
			pstmt.setString(3, bean.getBoard_subject());
			pstmt.setString(4, bean.getBoard_content());
			pstmt.setString(5, bean.getBoard_file());
			result = pstmt.executeUpdate();			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	//목록
	public List<BoardBean> selectArticleList(int startNum, int endNum){
		List<BoardBean> list = new ArrayList<BoardBean>();
		String sql = "select * from "
				+ "(select rownum rn, tt.* from "
				+ "(select * from board2 order by board_re_ref desc, board_re_seq asc )tt) "
				+ "where rn>=? and rn<=?";
				//답글용 목록보기 sql문으로 변경함
		try {
			conn= ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startNum);
			pstmt.setInt(2, endNum);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				BoardBean bean = new BoardBean();
				bean.setBoard_num(rs.getInt("board_num"));
				bean.setBoard_name(rs.getString("board_name"));
				bean.setBoard_subject(rs.getString("Board_subject"));
				bean.setBoard_content(rs.getString("Board_content"));
				bean.setBoard_file(rs.getString("Board_file"));
				bean.setBoard_re_ref(rs.getInt("Board_re_ref"));
				bean.setBoard_re_lev(rs.getInt("Board_re_lev"));
				bean.setBoard_re_seq(rs.getInt("Board_re_seq"));
				bean.setBoard_readcount(rs.getInt("Board_readcount"));
				
				//날짜를 년월일만 저장
				String date_str = rs.getString("Board_date");
				bean.setBoard_date(date_str.substring(0, date_str.indexOf(" ")));
				list.add(bean);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int selectListCount() {
		int result = 0;
		String sql = "select count(*) as cnt from board2";
		
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
	
	//게시글 1개보기
		public BoardBean oneBoardView(int board_num){
			BoardBean bean = new BoardBean();
			String sql = "select * from board2 where board_num=?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, board_num);
				rs= pstmt.executeQuery();
				
			if(rs.next()) {
				bean = new BoardBean();
				bean.setBoard_num(rs.getInt("board_num"));
				bean.setBoard_name(rs.getString("board_name"));
				bean.setBoard_subject(rs.getString("Board_subject"));
				bean.setBoard_content(rs.getString("Board_content"));
				bean.setBoard_file(rs.getString("Board_file"));
				bean.setBoard_readcount(rs.getInt("Board_readcount"));
				bean.setBoard_re_ref(rs.getInt("Board_re_ref"));
				bean.setBoard_re_lev(rs.getInt("Board_re_lev"));
				bean.setBoard_re_seq(rs.getInt("Board_re_seq"));
				
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return bean;
		}

		//삭제
		public int boardDelete(int board_Num, String pass) {
			int result = 0;
			String sql = "delete board2 where board_num=? and board_pass=?";
			
			try {
				conn= ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,board_Num);
				pstmt.setString(2, pass);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return result;
		}
		
		//조회수 증가
		public int updateReadCount(int board_num) {
			int result = 0;
			String sql = "update board2 set board_readcount = board_readcount+1"
					+ "where board_num = ? ";
			
			try {
				conn = ds.getConnection();
				pstmt =conn.prepareStatement(sql);
				pstmt.setInt(1, board_num);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return result;
		}
		
		//수정
		public int boardModify(BoardBean bean) {
			int result = 0;
			String sql = "update board2 set board_name=?,"
					+ " board_subject=?, board_content=?"
					+ " where board_num=? and board_pass=?";
			
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bean.getBoard_name());
				pstmt.setString(2, bean.getBoard_subject());
				pstmt.setString(3, bean.getBoard_content());
				pstmt.setInt(4, bean.getBoard_num());
				pstmt.setString(5, bean.getBoard_pass());

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close();
			}
			return result;
		}
		
		//답변글 저장
		public int insertReplyArticle(BoardBean bean) {
			int result = 0;
			String sql = "";
			//원글에 대한 ref, lev, seq 값 저장
			int re_ref = bean.getBoard_re_ref();
			int re_lev = bean.getBoard_re_lev();
			int re_seq = bean.getBoard_re_seq();
			
			try {
				conn= ds.getConnection();
				//기존 답글의 등록순서를 재정리
				//원글 re_seq보다 큰 답글 re_seq를 1씩 증가
				sql = "update board2 set board_re_seq = board_re_seq+1 "
						+ "	where board_re_ref=? and board_re_seq>?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, re_ref);
				pstmt.setInt(2, re_seq);
				pstmt.executeUpdate();
				
				//추가되는 답글의 re_ref는 원글 re_ref 값을 가짐
				//추가되는 답글의 re_lev는 원글 re_lev에 1 증가한 값을 가짐
				//추가되는 답글의 re_seq는 원글 re_seq에 1 증가한 값을 가짐
				sql = "insert into board2 values(seq_num.nextval, ?, ?, ?, ?,"
						+ "?, ?, ?, ?, 0, sysdate)";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, bean.getBoard_name());
				pstmt.setString(2, bean.getBoard_pass());
				pstmt.setString(3, bean.getBoard_subject());
				pstmt.setString(4, bean.getBoard_content());
				pstmt.setString(5, " "); // 답글에는 파일없로드 하지 않음
				pstmt.setInt(6,re_ref);	//원글re_ref
				pstmt.setInt(7,re_lev + 1);
				pstmt.setInt(8,re_seq + 1);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return result;
		}
}
















