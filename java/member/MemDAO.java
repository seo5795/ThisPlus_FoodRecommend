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
			+" (memId,memPw,memName,memEmail,memAddress,memPic,memPhone, memRank) values (?,?,?,?,?,?,?,?)";
	// 회원정보 조회
	static final String memSelectOne = "select * from member where memId=?";
	// sns회원정보 조회
	static final String memSnsSelectOne = "select * from member where memId=?";
	// 회원리스트 조회
	static final String memSelectAll = "select * from member";
	//회원 리스트 조회(회원명 검색기능)
	 static final String memSelectAllSearch = "select * from member where memName like '%'||?||'%'";

	// 회원정보 수정
	static final String memUpdate = "update member set"
			+" memPw=?,memEmail=?,memPhone=?,memAddress=?, memName=? where memId=?";
	// 회원 탈퇴
	static final String memDelete = "delete from member where memId=? and memPw=?";

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
			pstmt.setString(7, vo.getMemPhone());
			pstmt.setInt(8, vo.getMemRank());
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
				if (vo.getMemPw() != null) {
					pstmt = conn.prepareStatement(memSelectOne);
					pstmt.setString(1, vo.getMemId());
					ResultSet rs = pstmt.executeQuery();

					if (rs.next()) {//로그인
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
				} else {//회원상세보기
					pstmt = conn.prepareStatement(memSelectOne);
					pstmt.setString(1, vo.getMemId());
					ResultSet rs1 = pstmt.executeQuery();

					if (rs1.next()) {

						data = new MemVO();
						data.setMemId(rs1.getString("memId"));
						data.setMemPw(rs1.getString("memPw")); // 보안용 *처리, 정보수정용
						data.setMemName(rs1.getString("memName"));
						data.setMemEmail(rs1.getString("memEmail"));
						data.setMemAddress(rs1.getString("memAddress"));
						data.setMemPoint(rs1.getInt("memPoint"));
						data.setMemPhone(rs1.getString("memPhone"));
						data.setMemPic(rs1.getString("memPic"));
						data.setMemRank(rs1.getInt("memRank"));

					}
				}

			} catch (

			SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			JDBCUtil.disconnect(pstmt, conn);
			return data;
		}

	// sns로그인(트랜젝션으로 회원가입처리까지)
	public MemVO memSnsSelectOne(MemVO vo) {
		MemVO data = null;
		conn = JDBCUtil.connect();
		try {
			conn.setAutoCommit(false);//트랜젝션
			System.out.println(vo);

			pstmt = conn.prepareStatement(memSnsSelectOne);
			pstmt.setString(1, vo.getMemId());

			ResultSet rs = pstmt.executeQuery();
			
			if(!rs.next()){	//회원정보가 없을 시
				System.out.println("신규회원");
				pstmt = conn.prepareStatement(memInsert);
				pstmt.setString(1, vo.getMemId());
				pstmt.setString(2, vo.getMemPw());
				pstmt.setString(3, vo.getMemName());
				pstmt.setString(4, vo.getMemEmail());
				pstmt.setString(5, vo.getMemAddress());
				pstmt.setString(6, vo.getMemPic());
				pstmt.setString(7, vo.getMemPhone());
				pstmt.setInt(8, vo.getMemRank());
				pstmt.executeUpdate();
				
				//회원가입 후 가입된 계정 select
				pstmt = conn.prepareStatement(memSnsSelectOne);
				pstmt.setString(1, vo.getMemId());
				System.out.println("이름"+vo.getMemName());
				
				
				ResultSet rs2 = pstmt.executeQuery();
				rs2.next();
				System.out.println("등록완료1");
				System.out.println("Id: "+rs2.getString("memId"));
				
				data = new MemVO();
				data.setMemId(rs2.getString("memId"));
				data.setMemName(rs2.getString("memName"));
				data.setMemEmail(rs2.getString("memEmail"));	
				data.setMemAddress(rs2.getString("memAddress"));
				data.setMemPic(rs2.getString("memPic"));
				data.setMemRank(rs2.getInt("memRank"));
				
				
			}else {//회원가입 되있을 시
				System.out.println("등록완료2");
				data = new MemVO();
				data.setMemId(rs.getString("memId"));
				data.setMemName(rs.getString("memName"));
				data.setMemEmail(rs.getString("memEmail"));	
				data.setMemAddress(rs.getString("memAddress"));
				data.setMemPic(rs.getString("memPic"));
				data.setMemRank(rs.getInt("memRank"));		
			}
				
			
			

			conn.commit();
			conn.setAutoCommit(true);//트랜젝션 끝
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			e.printStackTrace();

		}
		JDBCUtil.disconnect(pstmt, conn);
		System.out.println("dao마지막점검:"+data);
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
	
	   // 회원 리스트 조회 (회원명 검색)
	   public ArrayList<MemVO> memSelectAllSearch(MemVO vo) {
	      ArrayList<MemVO> datas=new ArrayList<MemVO>();
	      conn=JDBCUtil.connect();
	      try {
	         pstmt=conn.prepareStatement(memSelectAllSearch);
	         pstmt.setString(1, vo.getMemName());
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
		//memPw=?,memEmail=?,memPhone=?,memAddress=?, memName=? where memId=?
		conn = JDBCUtil.connect();
		try {
			System.out.println(vo);
			pstmt = conn.prepareStatement(memUpdate);
			pstmt.setString(1, vo.getMemPw());
			pstmt.setString(2, vo.getMemEmail());
			pstmt.setString(3, vo.getMemPhone());
			pstmt.setString(4, vo.getMemAddress());			
			pstmt.setString(5, vo.getMemName());
			
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
			System.out.println("deletedao"+vo);
			pstmt = conn.prepareStatement(memDelete);
			pstmt.setString(1, vo.getMemId());
			pstmt.setString(2, vo.getMemPw());
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
