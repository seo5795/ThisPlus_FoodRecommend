
package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCUtil;

public class NotDAO {
	Connection conn;
	PreparedStatement pstmt;
	
	//공지사항 sql 쿼리
	
	//공지사항 등록
	static final String notInsert = "insert into notice values(?,?,?,?,?)";
	//공지사항 조회
	static final String notSelectOne = "select * from notice where notId=?";
	//공지사항 모두 조회
	static final String notSelectAll = "select * from notice";
	
	//공지사항 수정
	static final String notUpdate = "update notice set notTitle=?, notContent=?, notShow=? where notId=?";
	//공지사항 삭제
	static final String notDelete = "delete from notice where notId=?";

	//공지사항 등록
	public boolean notInsert(NotVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(notInsert);
			pstmt.setInt(1, vo.getNotId());
			pstmt.setString(2, vo.getNotTitle());
			pstmt.setString(3, vo.getNotContent());
			pstmt.setString(4, vo.getNotRegDate());	//데이터형에서 스트링으로 형번환
			pstmt.setInt(5, vo.getNotShow());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	//공지사항 하나 조회
	public NotVO notSelectOne(NotVO vo) {
		NotVO data = null;
		conn = JDBCUtil.connect();
		try {
			System.out.println(vo);
			pstmt = conn.prepareStatement(notSelectOne);
			pstmt.setInt(1, vo.getNotId());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getInt("notId")==(vo.getNotId())) {
					data = new NotVO();
					data.setNotId(rs.getInt("notId"));
					data.setNotTitle(rs.getString("notTitle"));
					data.setNotContent(rs.getString("notContent"));
					data.setNotRegDate(rs.getString("notRegDate"));	//데이터형변환
					data.setNotShow(rs.getInt("notShow"));
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return data;
	}
	
	//공지사항 전체 조회
	public ArrayList<NotVO> notSelectAll(NotVO vo) {
		ArrayList<NotVO> datas=new ArrayList<NotVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(notSelectAll);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				NotVO data=new NotVO(); 
				data.setNotId(rs.getInt("bid"));
				data.setNotTitle(rs.getString("notTitle"));
				data.setNotContent(rs.getString("notContent"));
				data.setNotRegDate(rs.getString("notRegDate"));	//데이터형변환
				data.setNotShow(rs.getInt("notShow"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return datas;
	}
	
	//공지사항 수정  -- 공지사항 제목, 내용, 노출여부 추가함 (추후 업데이트예정)
	public boolean update(NotVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(notUpdate);
			pstmt.setString(1, vo.getNotTitle());
			pstmt.setString(2, vo.getNotContent());
			pstmt.setInt(3, vo.getNotShow());
			pstmt.setInt(4, vo.getNotId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	//공지사항 삭제
	public boolean delete(NotVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(notDelete);
			pstmt.setInt(1, vo.getNotId());
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