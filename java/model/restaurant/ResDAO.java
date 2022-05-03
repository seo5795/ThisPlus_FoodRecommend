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
	static final String resInsert = "insert into restaurant (resId,memId,resName,resAvg,resAdd,resPhone,resCategory,resPic)"
			+" values ((select nvl(max(resId),1000)+1 from restaurant),?,?,?,?,?,?,?)";
	// 식당 내용 조회
	static final String resSelectOne = "select * from restaurant where resId=?";
	// 식당 리스트 조회
	static final String resSelectAll = "select * from restaurant";
	// 식당 리스트 조회(평점기준)
	static final String resSelectAllAvg = "select * from (select * from restaurant order by resAvg DESC) where rownum<=?";
	// 식당 리스트 조회(위치기준)
	static final String resSelectAllLocation = "select * from (select * from restaurant where resAdd like '%'||?||'%' order by resAvg DESC) where rownum<=?";
	//식당 리스트 조회(이름기준)
	static final String resSelectAllName = "select * from (select * from restaurant where resName like '%'||?||'%' order by resAvg DESC)"; //where rownum<=?";
	// 식당 리스트 조회(카테고리기준)
	static final String resSelectAllCategory = "select * from (select * from restaurant where resCategory like '%'||?||'%' order by resAvg DESC)"; //where rownum<=?";
	// 식당 리스트 조회(식당명 검색기능)
	static final String resSelectAllSearch = "select * from restaurant where resName like '%'||?||'%'";
	// 식당 수정
	static final String resUpdate = "update restaurant set resName=?,resAvg=?,resAdd=?,resPhone=?,resCategory=? where resId=?";
	// 식당 평점 수정
	static final String resAvgUpdate = "update restaurant set resAvg=? where resId=?";
	// 식당 삭제
	static final String resDelete = "delete from restaurant where resId=?";

	// 식당 등록
	public boolean resInsert(ResVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(resInsert);
			pstmt.setString(1, vo.getMemId());
			pstmt.setString(2, vo.getResName());
			pstmt.setDouble(3, vo.getResAvg());
			pstmt.setString(4, vo.getResAdd()); // 제외가능
			pstmt.setString(5, vo.getResPhone()); // 제외가능
			pstmt.setString(6, vo.getResCategory());
			pstmt.setString(7, vo.getResPic());
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
				data = new ResVO();
				data.setResId(rs.getInt("resId"));
				data.setMemId(rs.getString("memId"));
				data.setResName(rs.getString("resName"));
				data.setResAvg(rs.getDouble("resAvg"));
				data.setResAdd(rs.getString("resAdd"));	 // 제외가능
				data.setResPhone(rs.getString("resPhone"));  // 제외가능
				data.setResCategory(rs.getString("resCategory"));
				// data.setResPark(rs.getInt("resPark"));
				data.setResPic(rs.getString("resPic"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		System.out.println("data"+data);
		return data;
	}

	// 식당 리스트 조회
	public ArrayList<ResVO> resSelectAll(ResVO vo, int num) {
		ArrayList<ResVO> datas=new ArrayList<ResVO>();
		conn=JDBCUtil.connect();
		try {
			if(vo.getResName()!=null) {//이름검색
				System.out.println("이름");
				if(num==0) {//이름 전체 데이터 숫자 파악
					pstmt=conn.prepareStatement(resSelectAllName);
					pstmt.setString(1,vo.getResName());
				}else {//페이징 처리할 만큼의 이름 정보 받기
					pstmt=conn.prepareStatement(resSelectAllName+" where rownum<=?");
					pstmt.setString(1,vo.getResName());
					pstmt.setInt(2, num);
				}				
			}
			else if(vo.getResCategory()!=null) {//카테고리 검색
				System.out.println("카테고리");
				if(num==0) {//카테고리 전체 데이터 받기 숫자 파악
					pstmt=conn.prepareStatement(resSelectAllCategory);
					pstmt.setString(1,vo.getResCategory());
				}else {//페이징 처리할 만큼의 카테고리 정보 받기
					pstmt=conn.prepareStatement(resSelectAllCategory+" where rownum<=?");
					pstmt.setString(1,vo.getResCategory());
					pstmt.setInt(2, num);
				}
			}
			else {//전체검색
				pstmt=conn.prepareStatement(resSelectAll);
			}

			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				ResVO data=new ResVO(); 
				data = new ResVO();
				data.setResId(rs.getInt("resId"));
				data.setMemId(rs.getString("memId"));
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



	//메인에서 보여줄 식당 리스트 조회
	public ArrayList<ResVO> resSelectAllMain(ResVO vo,int num, String category) {
		ArrayList<ResVO> datas=new ArrayList<ResVO>();
		conn=JDBCUtil.connect();
		try {
			if(category.equals("avg")) {//평점 6개
				pstmt=conn.prepareStatement(resSelectAllAvg);
				pstmt.setInt(1, num);
			}else if(category.equals("location")) {//위치-> 평점 6개

				pstmt=conn.prepareStatement(resSelectAllLocation);
				String location ="강남구"; 
				pstmt.setString(1, location);
				pstmt.setInt(2, num);
			}else {//카테고리-> 평점 6개
				pstmt=conn.prepareStatement(resSelectAllCategory+"where rownum<=?");
				pstmt.setString(1, category);
				pstmt.setInt(2, num);
			}
			ResultSet rs=pstmt.executeQuery();

			while(rs.next()) {
				System.out.println(rs.getString("memId"));
				ResVO data=new ResVO(); 
				data = new ResVO();
				data.setResId(rs.getInt("resId"));
				data.setMemId(rs.getString("memId"));
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

	// 식당 리스트 조회 (식당명 검색)
	public ArrayList<ResVO> resSelectAllSearch(ResVO vo) {
		ArrayList<ResVO> datas = new ArrayList<ResVO>();
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(resSelectAllSearch);
			pstmt.setString(1, vo.getResName());
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				ResVO data = new ResVO();
				data = new ResVO();
				data.setResId(rs.getInt("resId"));
				data.setResName(rs.getString("resName"));
				data.setResAvg(rs.getDouble("resAvg"));
				data.setResAdd(rs.getString("resAdd")); // 제외가능
				data.setResPhone(rs.getString("resPhone")); // 제외가능
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
			pstmt.setInt(6, vo.getResId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}
	// 식당 평점 수정
	public boolean resAvgUpdate(ResVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(resAvgUpdate);
			pstmt.setDouble(1, vo.getResAvg());
			pstmt.setInt(2, vo.getResId());

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