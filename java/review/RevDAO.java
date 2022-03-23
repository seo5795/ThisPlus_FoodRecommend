package model.review;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import model.common.JDBCUtil;


public class RevDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 리뷰 sql 쿼리
	// 리뷰 등록
	//	static final String revInsert = "insert into review"
	//			+" (revId,memId,memName,resId,revTitle,revCont,revDate,revScore,revPic)"
	//			+" values ((select nvl(max(revId),2000)+1 from review),?,?,?,?,?,sysdate,?,?)";
	// 리뷰 등록
	static final String revInsert = "insert into review"
			+" (revId,memId,memName,resId,revTitle,revCont,revScore)"
			+" values ((select nvl(max(revId),2000)+1 from review),?,?,?,?,?,?)";
	// 리뷰 내용 조회
	static final String revSelectOne = "select * from review where revId=?";
	// 리뷰 리스트 조회(유저용:식당ID 기준으로 소팅)
	static final String revSelectAll = "select * from review where resId=?";
	// 리뷰 리스트 조회(관리자용:리뷰ID 기준으로 소팅)
	static final String revSelectAllAdmin = "select * from review where revId=?";
	// 리뷰 수정
	static final String revUpdate = "update review set revTitle=?,revCont=?,revScore=?,revPic=? where revId=?";	
	// 리뷰 삭제
	static final String revDelete = "delete from review where revId=?";
	//식당당 리뷰평점 평균
	static final String revAvg = "SELECT ROUND(AVG(revScore),1) AS avg FROM review where resId=? GROUP BY resId";
	
	
	// 리뷰 등록
	// 고민 : 회원정보와 식당정보는 Contoroller에서 연결해야 겠지?
	public boolean revInsert(RevVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(revInsert);
			pstmt.setString(1, vo.getMemId());
			pstmt.setString(2, vo.getMemName());
			pstmt.setInt(3, vo.getResId());
			pstmt.setString(4, vo.getRevTitle());
			pstmt.setString(5, vo.getRevCont());
			pstmt.setDouble(6, vo.getRevScore());
			//pstmt.setString(8, vo.getRevPic());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}
	
	public int revAvg(int resId) {
		conn = JDBCUtil.connect();
		int avg=0;
		try {
			pstmt = conn.prepareStatement(revAvg);
			pstmt.setInt(1, resId);
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				avg = rs.getInt("avg");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
		JDBCUtil.disconnect(pstmt, conn);
		return avg;
	}
	
	// 리뷰 내용 조회
	public RevVO revSelectOne(RevVO vo) {
		RevVO data = null;
		conn = JDBCUtil.connect();
		try {
			System.out.println(vo);
			pstmt = conn.prepareStatement(revSelectOne);
			pstmt.setInt(1, vo.getRevId());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				// 날짜 표기 방식 정의
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				sdf.format(rs.getDate("revDate"));

				data = new RevVO();
				data.setRevId(rs.getInt("revId"));
				data.setMemId(rs.getString("memId"));
				data.setMemName(rs.getString("memName"));
				data.setResId(rs.getInt("resId"));	
				data.setRevTitle(rs.getString("revTitle"));
				data.setRevCont(rs.getString("revCont"));
				data.setRevRegDate(sdf.format(rs.getDate("revDate"))); // 날짜 형변환
				data.setRevScore(rs.getDouble("revScore"));
				data.setRevPic(rs.getString("revPic"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return data;
	}

	// 리뷰 리스트 조회(유저 조회용)
	public ArrayList<RevVO> revSelectAll(RevVO vo) {
		ArrayList<RevVO> datas=new ArrayList<RevVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(revSelectAll);
			pstmt.setInt(1, vo.getResId());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				// 날짜 표기 방식 정의
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				sdf.format(rs.getDate("revDate"));

				RevVO data=new RevVO(); 
				data = new RevVO();
				data.setRevId(rs.getInt("revId"));
				data.setMemId(rs.getString("memId"));
				data.setMemName(rs.getString("memName"));
				data.setResId(rs.getInt("resId"));	
				data.setRevTitle(rs.getString("revTitle"));
				data.setRevCont(rs.getString("revCont"));
				data.setRevRegDate(sdf.format(rs.getDate("revDate"))); // 날짜 형변환
				data.setRevScore(rs.getDouble("revScore"));
				data.setRevPic(rs.getString("revPic"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return datas;
	}

	// 리뷰 리스트 조회(관리자 조회용)
	public ArrayList<RevVO> revSelectAllAdmin(RevVO vo) {
		ArrayList<RevVO> datas=new ArrayList<RevVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(revSelectAllAdmin);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				// 날짜 표기 방식 정의
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				sdf.format(rs.getDate("revDate"));

				RevVO data=new RevVO(); 
				data = new RevVO();
				data.setRevId(rs.getInt("revId"));
				data.setMemId(rs.getString("memId"));
				data.setMemName(rs.getString("memName"));
				data.setResId(rs.getInt("resId"));	
				data.setRevTitle(rs.getString("revTitle"));
				data.setRevCont(rs.getString("revCont"));
				data.setRevRegDate(sdf.format(rs.getDate("revDate"))); // 날짜 형변환
				data.setRevScore(rs.getDouble("revScore"));
				data.setRevPic(rs.getString("revPic"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return datas;
	}

	// 리뷰 수정
	public boolean revUpdate(RevVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(revUpdate);
			pstmt.setString(1, vo.getRevTitle());
			pstmt.setString(2, vo.getRevCont());
			pstmt.setDouble(3, vo.getRevScore());
			pstmt.setString(4, vo.getRevPic());
			pstmt.setInt(5, vo.getRevId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	// 리뷰 삭제
	public boolean revDelete(RevVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(revDelete);
			pstmt.setInt(1, vo.getRevId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	// 예비 메서드(추가 기능 적용)
	public void unknown() {

	}
}