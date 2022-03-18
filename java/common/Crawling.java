package controller.common;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import model.common.JDBCUtil;
import model.menu.MenuVO;
import model.restaurant.ResVO;


public class Crawling {
	static Connection conn;
	static PreparedStatement pstmt;

	// 초기 데이터 유무 체크
	static final String datacheck = "select resId from restaurant";
	// 식당 등록
	static final String resInsert = "insert into restaurant (resId,resName,resAvg,resAdd,resPhone,resCategory,resPic)"
			+" values ((select nvl(max(resId),1000)+1 from restaurant),?,?,?,?,?,?)";
	// 메뉴 등록
	static final String menuInsert = "insert into menu (menuId,resId,menuName,menuPrice,menuCategory,menuPic)"
			+" values ((select nvl(max(menuId),4000)+1 from menu),?,?,?,?,?)";

	public static void start() throws IOException {
		// 크롤링할 첫번째 페이지
		int subURL=151;
		// 크롤링할 마지막 페이지
		int subURLend=160;

		conn=JDBCUtil.connect();
		try {
			pstmt=conn.prepareStatement(datacheck);
			ResultSet rs=pstmt.executeQuery(datacheck);
			if(rs.next()!=false) {
				System.out.println("초기 데이터 존재");
				System.out.println("데이터 크롤링 미실행");
			}
			else {
				System.out.println("초기 데이터 미존재");

				for(int i=subURL;i<=subURLend;i++) {
					System.out.println(i+"번 식당");

					String URL = "https://keiren2022.tistory.com/"+i;
					Document doc = Jsoup.connect(URL).get();

					// 가게명
					Elements tele = doc.select("h1.resName");
					String resName=tele.text();
					System.out.println("가게명 : "+resName);

					// 평점
					Elements scele = doc.select("p.resAvg");
					double resAvg=Double.parseDouble(scele.text());
					System.out.println("평점 : "+resAvg);

					// 카테고리
					Elements cele = doc.select("p.resCategory");
					String resCategory=cele.text();
					System.out.println("카테고리 : "+resCategory);

					// 주소
					Elements aele = doc.select("p.resAdd");
					String resAdd=aele.text();
					System.out.println("주소 : "+resAdd);

					// 전화번호
					Elements pele = doc.select("p.resPhone");
					String resPhone=pele.text();
					System.out.println("전화번호 : "+resPhone);

					// 가게사진
					Elements iele = doc.select("img.resPic");
					String resPic=iele.attr("src");
					System.out.println("사진경로 : "+resPic);

					// 식당 DB에 삽입
					conn=JDBCUtil.connect();
					ResVO rvo=new ResVO();

					rvo.setResName(resName);
					rvo.setResAvg(resAvg);
					rvo.setResAdd(resAdd);
					rvo.setResPhone(resPhone);
					rvo.setResCategory(resCategory);
					rvo.setResPic(resPic);

					try {
						pstmt=conn.prepareStatement(resInsert);
						pstmt.setString(1, rvo.getResName());
						pstmt.setDouble(2, rvo.getResAvg());
						pstmt.setString(3, rvo.getResAdd());
						pstmt.setString(4, rvo.getResPhone());
						pstmt.setString(5, rvo.getResCategory());
						pstmt.setString(6, rvo.getResPic());
						pstmt.executeUpdate();

						System.out.println("Log: 식당 데이터를 추가하였습니다.");
					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						try {
							pstmt.close();
							conn.close();
						} catch (SQLException e) {
							e.printStackTrace();
						}
					}

					// 메뉴
					Elements mnele = doc.select("span.menuName");
					Elements mpele = doc.select("span.menuPrice");
					Elements miele = doc.select("img.menuPic");
					String menuName;
					String menuPrice;
					String menuPic;
					Iterator<Element> itr1 = mnele.iterator();
					Iterator<Element> itr2 = mpele.iterator();
					Iterator<Element> itr3 = miele.iterator();
					for(int j=0;itr1.hasNext();j++) {
						menuName=itr1.next().text();
						menuPrice=itr2.next().text();
						menuPic=itr3.next().attr("src");
						System.out.println((j+1)+"번 메뉴: "+menuName+" "+menuPrice);
						System.out.println("메뉴사진: "+menuPic);

						// 메뉴 DB에 삽입
						// ResId는 1001부터 삽입
						conn=JDBCUtil.connect();
						MenuVO mvo=new MenuVO();

						mvo.setResId(rvo.getResId());
						mvo.setMenuName(menuName);
						mvo.setMenuPrice(Integer.parseInt(menuPrice));
						mvo.setMenuCategory(resCategory);
						mvo.setMenuPic(menuPic);

						try {
							pstmt=conn.prepareStatement(menuInsert);
							pstmt.setInt(1, (i-subURL)+1001);
							pstmt.setString(2, mvo.getMenuName());
							pstmt.setInt(3, mvo.getMenuPrice());
							pstmt.setString(4, mvo.getMenuCategory());
							pstmt.setString(5, mvo.getMenuPic());
							pstmt.executeUpdate();

							System.out.println("Log: 메뉴 데이터를 추가하였습니다.");
						} catch (Exception e) {
							e.printStackTrace();
						} finally {
							try {
								pstmt.close();
								conn.close();
							} catch (SQLException e) {
								e.printStackTrace();
							}
						}
					}
					System.out.println("===========================================");
				}
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}