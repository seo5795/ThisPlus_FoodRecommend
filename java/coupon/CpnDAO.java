
package coupon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class CpnDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	//공지사항 sql 쿼리
	
	//쿠폰 등록
	static final String cpnInsert = "insert into coupon values(?,?,?,?,?,?,?)";
	//쿠폰 조회
	static final String cpnSelectOne = "select * from coupon where cpnId=?";
	//쿠폰 모두 조회
	static final String cpnSelectAll = "select * from coupon where cpnId=?";
	//쿠폰 수정
	static final String cpnUpdate = "update coupon set cpnName=?, cpnDiscount=?, cpnOriPrice=?, cpnDisPrice=? where cpnId=?";
	//쿠폰 삭제
	static final String cpnDelete = "delete from coupon where cpnId=?";

	//쿠폰 등록
	public boolean notInsert(CpnVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(cpnInsert);
			pstmt.setInt(1, vo.getCpnId());
			pstmt.setString(2, vo.getResName());
			pstmt.setString(3, vo.getCpnName());
			pstmt.setInt(4, vo.getCpnDiscount());
			pstmt.setInt(5, vo.getCpnOriPrice());
			pstmt.setInt(6, vo.getCpnDisPrice());
			pstmt.setString(7, vo.getCpnPic());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	//쿠폰 하나 조회
	public CpnVO notSelectOne(CpnVO vo) {
		CpnVO data = null;
		conn = JDBCUtil.connect();
		try {
			System.out.println(vo);
			pstmt = conn.prepareStatement(cpnSelectOne);
			pstmt.setInt(1, vo.getCpnId());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt("cpnId")==(vo.getCpnId())) {
					data = new CpnVO();
					data.setCpnId(rs.getInt("cpnId"));
					data.setResName(rs.getString("resName"));
					data.setCpnName(rs.getString("cpnName"));
					data.setCpnDiscount(rs.getInt("cpnDiscount"));	
					data.setCpnOriPrice(rs.getInt("cpnOriPrice"));
					data.setCpnDisPrice(rs.getInt("cpnDisPrice"));
					data.setCpnPic(rs.getString("cpnPic"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return data;
	}
	
	//쿠폰 전체 조회
	public ArrayList<CpnVO> notSelectAll(CpnVO vo) {
		ArrayList<CpnVO> datas=new ArrayList<CpnVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(cpnSelectAll);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				CpnVO data=new CpnVO(); 
				data.setCpnId(rs.getInt("cpnId"));
				data.setResName(rs.getString("resName"));
				data.setCpnName(rs.getString("cpnName"));
				data.setCpnDiscount(rs.getInt("cpnDiscount"));	
				data.setCpnOriPrice(rs.getInt("cpnOriPrice"));
				data.setCpnDisPrice(rs.getInt("cpnDisPrice"));
				data.setCpnPic(rs.getString("cpnPic"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return datas;
	}
	
	//쿠폰 수정  -- 쿠폰 이름, 활인율, 할인전가격, 할인후가격 (추후 업데이트예정)
	public boolean update(CpnVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(cpnUpdate);
			pstmt.setString(1, vo.getCpnName());
			pstmt.setInt(2, vo.getCpnDiscount());
			pstmt.setInt(3, vo.getCpnOriPrice());
			pstmt.setInt(4, vo.getCpnDisPrice());
			pstmt.setInt(5, vo.getCpnId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	//쿠폰 삭제
	public boolean delete(CpnVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(cpnDelete);
			pstmt.setInt(1, vo.getCpnId());
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