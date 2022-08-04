package book2.dao;

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

import book2.bean.Book2DTO;

public class Book2DAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public Book2DAO() {
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
	
	public int bookWrite(Book2DTO dto) {
		int result =0;
		String sql="insert into book2 values (?, ?, ?, ?, ?, sysdate)";
		
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
	
	public List<Book2DTO> book2List (int sNum, int eNum){
		List<Book2DTO> list = new ArrayList<Book2DTO>();
		String sql = "select * from"
				+ "(select rownum rn, tt.* from"
				+ "(select * from book2 order by code asc)tt)"
				+ "where rn>=? and rn<=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sNum);
			pstmt.setInt(2, eNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Book2DTO dto = new Book2DTO();
				dto.setCode(rs.getString("code"));
				dto.setName(rs.getString("name"));
				dto.setAuthor(rs.getString("author"));
				dto.setPub(rs.getString("pub"));
				dto.setPrice(rs.getInt("price"));
							
				String str = rs.getString("p_day");
				dto.setP_day(str.substring(0, str.indexOf(" ")));
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
		String sql = "select count(*) as cnt from book2";
		
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
	public Book2DTO imageBoardView(int seq){
		Book2DTO dto = new Book2DTO();
		String sql = "select * from book2 where code=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "code");
			rs= pstmt.executeQuery();
			
		if(rs.next()) {
			dto = new Book2DTO();
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
