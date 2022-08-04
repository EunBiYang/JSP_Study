package score.dao;

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

import score.bean.scoreDTO;

public class scoreDAO {
	private Connection conn;		//DB접속을 관리하는 클래스
	private PreparedStatement pstmt;//DB와 데이터를 주고받는 클래스
	private ResultSet rs;			//select문 처리결과를 저장하는 클래스.
	
	//커넥션 풀을 담당하는 DataSource객체
	private DataSource ds;
	
	//DataSource객체 얻어오기
	public scoreDAO() {
		Context context;
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	//DB 접속 끊기
	public void close() {
		try {
			if (rs != null)	rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	//SQL 구문 실행
	//1.데이터 입력하기
	public int socreInput(scoreDTO dto) {
		int result = 0;
		String sql = "insert into score values (?, ?, ?, ?, ?, ?, ?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getHak());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getKor());
			pstmt.setInt(4, dto.getEng());
			pstmt.setInt(5, dto.getMat());
			pstmt.setInt(6, dto.getTot());
			pstmt.setDouble(7, dto.getAvg());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return result;
	}

	//2.학번 기준 오름차순 10개씩 출력
	public List<scoreDTO> scoreList(int sNum, int eNum){
		List<scoreDTO> list = new ArrayList<scoreDTO>();
		String sql ="select * from"
				+ "(select rownum rn, tt.* from"
				+ "(select * from score order by hak asc)tt)"
				+ "where rn>=? and rn<=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, sNum);
			pstmt.setInt(2, eNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				scoreDTO dto = new scoreDTO();
				dto.setHak(rs.getString("hak"));
				dto.setName(rs.getString("name"));
				dto.setKor(rs.getInt("kor"));
				dto.setEng(rs.getInt("eng"));
				dto.setMat(rs.getInt("mat"));
				dto.setTot(rs.getInt("tot"));
				dto.setAvg(rs.getDouble("avg"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	
	//3. 성적 리스트 수 구하기
	public int getTotalS() {
		int result = 0;
		String sql = "select count(*) as cnt from score";
		
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
}
