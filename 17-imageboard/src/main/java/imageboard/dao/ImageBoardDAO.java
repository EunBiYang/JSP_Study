package imageboard.dao;

import java.awt.Image;
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

import imageboard.beam.ImageBoardDTO;

public class ImageBoardDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	DataSource ds;
	
	public ImageBoardDAO() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int imageboardWrite(ImageBoardDTO dto) {
		int result = 0;
		String sql = "insert into imageboard values "
				+ "(seq_imageboard.nextval, ?,?,?, ?, ?, ?,sysdate)";
		
		try {
			conn=ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getImageId());
			pstmt.setString(2,dto.getImageName());
			pstmt.setInt(3,dto.getImagePrice());
			pstmt.setInt(4, dto.getImageQty());
			pstmt.setString(5, dto.getImageContent());
			pstmt.setString(6, dto.getImage1());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
	
	public List<ImageBoardDTO> imageBoardList(int sNum, int eNum){
		List<ImageBoardDTO> list = new ArrayList<ImageBoardDTO>();
		String sql = "select * from"
				+ "(select rownum rn, tt.* from"
				+ "(select * from imageboard order by seq desc)tt)"
				+ "where rn>=? and rn<=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sNum);
			pstmt.setInt(2, eNum);
			rs= pstmt.executeQuery();
			
		while(rs.next()) {
			ImageBoardDTO dto = new ImageBoardDTO();
			dto.setSeq(rs.getInt("seq"));
			dto.setImageId(rs.getString("imageId"));
			dto.setImageName(rs.getString("imageName"));
			dto.setImagePrice(rs.getInt("imagePrice"));
			dto.setImageQty(rs.getInt("imageQty"));
			dto.setImageContent(rs.getString("imageContent"));
			dto.setImage1(rs.getString("image1"));
			dto.setLogtime(rs.getString("logtime"));
			list.add(dto);
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	public int getTotalList() {
		int result =0;
		String sql = "select count(*) as cnt from imageboard";
		
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
	public ImageBoardDTO imageBoardView(int seq){
		ImageBoardDTO dto = new ImageBoardDTO();
		String sql = "select * from imageboard where seq=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			rs= pstmt.executeQuery();
			
		if(rs.next()) {
			dto = new ImageBoardDTO();
			dto.setSeq(rs.getInt("seq"));
			dto.setImageId(rs.getString("imageId"));
			dto.setImageName(rs.getString("imageName"));
			dto.setImagePrice(rs.getInt("imagePrice"));
			dto.setImageQty(rs.getInt("imageQty"));
			dto.setImageContent(rs.getString("imageContent"));
			dto.setImage1(rs.getString("image1"));
			dto.setLogtime(rs.getString("logtime"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return dto;
	}
	//글 삭제하기
	public int imageBoardDelete(int seq) {
		int result = 0;
		String sql = "delete imageboard where seq=?";
			
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
	
	public int imagBoardModify(ImageBoardDTO dto) {
		int result = 0;
		String sql = "update imageboard set "
				+ "imageName=?, imagePrice=?, imageQty=?, imageContent=?,"
				+ "image1=? where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,dto.getImageName());
			pstmt.setInt(2, dto.getImagePrice());
			pstmt.setInt(3, dto.getImageQty());
			pstmt.setString(4, dto.getImageContent());
			pstmt.setString(5, dto.getImage1());
			pstmt.setInt(6, dto.getSeq());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}
}









