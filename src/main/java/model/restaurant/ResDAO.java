package model.restaurant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;


public class ResDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 식당 sql 쿼리
	// 식당 등록
	static final String resInsert = "insert into restaurant (resId,resName,resAvg,resAdd,resPhone,resCategory,resPic)"
			+" values ((select nvl(max(resId),1000)+1 from restaurant),?,?,?,?,?,?)";
	// 식당 내용 조회
	static final String resSelectOne = "select * from restaurant where resId=?";
	// 식당 리스트 조회
	static final String resSelectAll = "select * from restaurant where resId=?";
	// 식당 수정
	static final String resUpdate = "update restaurant set resName=?,resAvg=?,resAdd=?,resPhone=?,resCategory=?,resPic=? where resId=?";
	// 식당 삭제
	static final String resDelete = "delete from restaurant where resId=?";

	// 식당 등록
	public boolean resInsert(ResVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(resInsert);
			pstmt.setString(1, vo.getResName());
			pstmt.setDouble(2, vo.getResAvg());
			pstmt.setString(3, vo.getResAdd()); // 제외가능
			pstmt.setString(4, vo.getResPhone()); // 제외가능
			pstmt.setString(5, vo.getResCategory());
			pstmt.setString(6, vo.getResPic());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	// 식당 내용 조회
	public ResVO resSelectOne(ResVO vo) {
		ResVO data = null;
		conn = JDBCUtil.connect();
		try {
			System.out.println(vo);
			pstmt = conn.prepareStatement(resSelectOne);
			pstmt.setInt(1, vo.getResId());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt("resId")==(vo.getResId())) {
					data = new ResVO();
					data.setResId(rs.getInt("resId"));
					data.setResName(rs.getString("resName"));
					data.setResAvg(rs.getDouble("resAvg"));
					data.setResAdd(rs.getString("resAdd"));	 // 제외가능
					data.setResPhone(rs.getString("resPhone"));  // 제외가능
					data.setResCategory(rs.getString("resCategory"));
					// data.setResPark(rs.getInt("resPark"));
					data.setResPic(rs.getString("resPic"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return data;
	}

	// 식당 리스트 조회
	public ArrayList<ResVO> resSelectAll(ResVO vo) {
		ArrayList<ResVO> datas=new ArrayList<ResVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(resSelectAll);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ResVO data=new ResVO(); 
				data = new ResVO();
				data.setResId(rs.getInt("resId"));
				data.setResName(rs.getString("resName"));
				data.setResAvg(rs.getDouble("resAvg"));
				data.setResAdd(rs.getString("resAdd"));	 // 제외가능
				data.setResPhone(rs.getString("resPhone"));  // 제외가능
				data.setResCategory(rs.getString("resCategory"));
				// data.setResPark(rs.getInt("resPark"));
				data.setResPic(rs.getString("resPic"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return datas;
	}

	// 식당 수정
	public boolean resUpdate(ResVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(resUpdate);
			pstmt.setString(1, vo.getResName());
			pstmt.setDouble(2, vo.getResAvg());
			pstmt.setString(3, vo.getResAdd());
			pstmt.setString(4, vo.getResPhone());
			pstmt.setString(5, vo.getResCategory());
			pstmt.setString(6, vo.getResPic());
			pstmt.setInt(7, vo.getResId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	// 식당 삭제
	public boolean resDelete(ResVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(resDelete);
			pstmt.setInt(1, vo.getResId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}
}