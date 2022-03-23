package model.menu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.common.JDBCUtil;


public class MenuDAO {
	Connection conn;
	PreparedStatement pstmt;

	// 메뉴 sql 쿼리
	// 메뉴 등록
	static final String menuInsert = "insert into menu (menuId,resId,menuName,menuPrice,menuCategory)"
		+" values ((select nvl(max(menuId),4000)+1 from menu),?,?,?,?)";
	// 메뉴 내용 조회
	static final String menuSelectOne = "select * from menu where menuId=?";
	// 메뉴 리스트 조회(유저용:식당ID 기준으로 소팅)
	static final String menuSelectAll = "select * from menu where resId=?";
	// 메뉴 리스트 조회(관리자용:메뉴ID 기준으로 소팅)
	static final String menuSelectAllAdmin = "select * from menu where menuId=?";
	// 메뉴 수정
	   static final String menuUpdate = "update menu set menuName=?,menuPrice=?,menuCategory=? where menuId=?";
	// 메뉴 삭제
	static final String menuDelete = "delete from menu where menuId=?";

	// 메뉴 등록
	// 고민 : 식당정보는 Contoroller에서 연결해야 겠지?
	public boolean menuInsert(MenuVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(menuInsert);
			pstmt.setInt(1, vo.getResId());
			pstmt.setString(2, vo.getMenuName());
			pstmt.setInt(3, vo.getMenuPrice());
			pstmt.setString(4, vo.getMenuCategory());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		JDBCUtil.disconnect(pstmt, conn);
		return true;
	}

	// 메뉴 내용 조회
	public MenuVO menuSelectOne(MenuVO vo) {
		MenuVO data = null;
		conn = JDBCUtil.connect();
		try {
			System.out.println(vo);
			pstmt = conn.prepareStatement(menuSelectOne);
			pstmt.setInt(1, vo.getMenuId());
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
					data = new MenuVO();
					data.setMenuId(rs.getInt("menuId"));
					data.setResId(rs.getInt("resId"));
					data.setMenuName(rs.getString("menuName"));
					data.setMenuPrice(rs.getInt("menuPrice"));	
					data.setMenuCategory(rs.getString("menuCategory"));
					data.setMenuPic(rs.getString("menuPic"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		System.out.println(data);
		return data;
	}

	// 메뉴 리스트 조회(유저 조회용)
	public ArrayList<MenuVO> menuSelectAll(MenuVO vo) {
		ArrayList<MenuVO> datas=new ArrayList<MenuVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(menuSelectAll);
			pstmt.setInt(1, vo.getResId());
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				MenuVO data=new MenuVO(); 
				data = new MenuVO();
				data.setMenuId(rs.getInt("menuId"));
				data.setResId(rs.getInt("resId"));
				data.setMenuName(rs.getString("menuName"));
				data.setMenuPrice(rs.getInt("menuPrice"));	
				data.setMenuCategory(rs.getString("menuCategory"));
				data.setMenuPic(rs.getString("menuPic"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return datas;
	}

	// 메뉴 리스트 조회(관리자 조회용)
	public ArrayList<MenuVO> menuSelectAllAdmin(MenuVO vo) {
		ArrayList<MenuVO> datas=new ArrayList<MenuVO>();
		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(menuSelectAllAdmin);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
				MenuVO data=new MenuVO(); 
				data = new MenuVO();
				data.setMenuId(rs.getInt("menuId"));
				data.setResId(rs.getInt("resId"));
				data.setMenuName(rs.getString("menuName"));
				data.setMenuPrice(rs.getInt("menuPrice"));	
				data.setMenuCategory(rs.getString("menuCategory"));
				data.setMenuPic(rs.getString("menuPic"));
				datas.add(data);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		JDBCUtil.disconnect(pstmt, conn);
		return datas;
	}

	// 메뉴 수정
	   public boolean menuUpdate(MenuVO vo) {
	      conn = JDBCUtil.connect();
	      try {
	         pstmt = conn.prepareStatement(menuUpdate);
	         pstmt.setString(1, vo.getMenuName());
	         pstmt.setInt(2, vo.getMenuPrice());
	         pstmt.setString(3, vo.getMenuCategory());
	         //pstmt.setString(4, vo.getMenuPic());
	         pstmt.setInt(4, vo.getMenuId());
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	         return false;
	      }
	      JDBCUtil.disconnect(pstmt, conn);
	      return true;
	   }

	// 메뉴 삭제
	public boolean menuDelete(MenuVO vo) {
		conn = JDBCUtil.connect();
		try {
			pstmt = conn.prepareStatement(menuDelete);
			pstmt.setInt(1, vo.getMenuId());
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