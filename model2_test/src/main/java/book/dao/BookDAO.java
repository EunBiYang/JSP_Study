package book.dao;

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

import book.bean.BookDTO;

public class BookDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public BookDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public void close() {
		
			try {
				if(rs != null)rs.close();
				if(pstmt != null)pstmt.close();
				if(conn != null)conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}
	
	public int bookWrite(BookDTO dto) {
		int result =0;
		String sql="insert into book values (?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getCode());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getAuthor());
			pstmt.setString(4, dto.getPub());
			pstmt.setInt(5, dto.getPrice());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public List<BookDTO> bookList (int sNum, int eNum){
		List<BookDTO> list = new ArrayList<BookDTO>();
		String sql = "select * from"
				+ "(select rownum rn, tt.* from"
				+ "(select * from book order by code asc)tt)"
				+ "where rn>=? and rn<=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sNum);
			pstmt.setInt(2, eNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BookDTO dto = new BookDTO();
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));
				dto.setAuthor(rs.getString("author"));
				dto.setPub(rs.getString("pub"));
				dto.setPrice(rs.getInt("price"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { 
			close();
		}
		return list;
	}
	
	public int getTotalNum() {
		int result =0;
		String sql = "select count(*) as cnt from book";
		
		try {
			conn =ds.getConnection();
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
	public BookDTO imageBoardView(int seq){
		BookDTO dto = new BookDTO();
		String sql = "select * from book where code=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "code");
			rs= pstmt.executeQuery();
			
		if(rs.next()) {
			dto = new BookDTO();
			dto.setCode(rs.getString("code"));
			dto.setName(rs.getString("name"));
			dto.setAuthor(rs.getString("author"));
			dto.setPub(rs.getString("pub"));
			dto.setPrice(rs.getInt("price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}

}
