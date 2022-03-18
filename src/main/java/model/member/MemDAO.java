package model.member;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;



public class MemDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 회원정보 sql 쿼리
	// 회원 가입
	static final String memInsert = "insert into member"
			+" (memId,memPw,memName,memEmail,memAddress,memPic) values (?,?,?,?,?,?)";
	// 회원정보 조회
	static final String memSelectOne = "select * from member where memName=?";
	// 회원리스트 조회
	static final String memSelectAll = "select * from member where memId=?";
	// 회원정보 수정
	static final String memUpdate = "update member set"
			+" memPw=?,memEmail=?,memPhone=?,memAddress=?,memPic=? where memId=?";
	// 회원 탈퇴
	static final String memDelete = "delete from member where memId=?";

	// 회원 가입
	public boolean memInsert(MemVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(memInsert);
			pstmt.setString(1, vo.getMemId());
			pstmt.setString(2, vo.getMemPw());
			pstmt.setString(3, vo.getMemName());
			pstmt.setString(4, vo.getMemEmail());
			pstmt.setString(5, vo.getMemAddress());
			pstmt.setString(6, vo.getMemPic());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	// 회원 정보 조회
	public MemVO memSelectOne(MemVO vo) {
		MemVO data = null;
		conn = JDBCUtil.connect();
		try {
			System.out.println(vo);
			pstmt = conn.prepareStatement(memSelectOne);
			pstmt.setString(1, vo.getMemName());
			ResultSet rs = pstmt.executeQuery();
			System.out.println(vo);
			if (rs.next()) {
				if (rs.getString("memPw").equals(vo.getMemPw())) {
					data = new MemVO();
					data.setMemId(rs.getString("memId"));
					data.setMemPw(rs.getString("memPw")); // 보안용 *처리, 정보수정용
					data.setMemName(rs.getString("memName"));
					data.setMemEmail(rs.getString("memEmail"));	
					data.setMemAddress(rs.getString("memAddress"));
					data.setMemPic(rs.getString("memPic"));
					data.setMemRank(rs.getInt("memRank"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return data;
	}

	// 회원 리스트 조회
	public ArrayList<MemVO> memSelectAll(MemVO vo) {
		ArrayList<MemVO> datas=new ArrayList<MemVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(memSelectAll);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				MemVO data=new MemVO(); 
				data.setMemId(rs.getString("memId"));
				data.setMemName(rs.getString("memName"));
				data.setMemEmail(rs.getString("memEmail"));
				data.setMemRank(rs.getInt("memRank"));	
				data.setMemPoint(rs.getInt("memPoint"));
				data.setMemPhone(rs.getString("memPhone"));
				data.setMemAddress(rs.getString("memAddress"));
				data.setMemPic(rs.getString("memPic"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return datas;
	}

	// 회원 정보 갱신
	public boolean memUpdate(MemVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(memUpdate);
			pstmt.setString(1, vo.getMemPw());
			pstmt.setString(2, vo.getMemEmail());
			pstmt.setString(3, vo.getMemPhone());
			pstmt.setString(4, vo.getMemAddress());
			pstmt.setString(5, vo.getMemPic());
			pstmt.setString(6, vo.getMemId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	// 회원탈퇴
	public boolean memDelete(MemVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(memDelete);
			pstmt.setString(1, vo.getMemId());
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
