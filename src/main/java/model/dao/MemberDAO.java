package model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.common.JDBCUtil;
import model.vo.MemberVO;

public class MemberDAO {
	Connection conn;
	PreparedStatement pstmt;

	static final String insert="insert into member (mid,mname,mpw) values(?,?,?)";
	static final String selectOne="select * from member where mid=? and mpw=?";

	public boolean insert(MemberVO vo) {
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(insert);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMname());
			pstmt.setString(3, vo.getMpw());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}
	public MemberVO selectOne(MemberVO vo) {
		MemberVO data=null;
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(selectOne);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()) {
				data=new MemberVO();
				data.setMid(rs.getString("mid"));
				data.setMpw(rs.getString("mpw"));
				data.setMname(rs.getString("mname"));
				data.setMdate(rs.getDate("mdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return data;
	}
}
