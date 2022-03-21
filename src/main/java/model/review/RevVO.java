package model.review;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author seo57
 *
 */
/**
 * @author seo57
 *
 */
public class RevVO {
	private int revId;			// 리뷰 번호(고유값)
	private String memId;		// 리뷰 작성자 번호(참조값)
	private String memName;		// 리뷰 작성자명
	private int resId;			// 대상 식당 번호
	private String revTitle;	// 리뷰 제목
	private String revCont;		// 리뷰 내용
	private Date revDate;		// 리뷰 등록일자
	private String revRegDate;	// 등록일자 형변환
	private double revScore;	// 메뉴 별점 
	private String revPic;		// 리뷰 사진(저장경로)

	// 게터/세터
	public int getRevId() {
		return revId;
	}
	public void setRevId(int revId) {
		this.revId = revId;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getRevTitle() {
		return revTitle;
	}
	public void setRevTitle(String revTitle) {
		this.revTitle = revTitle;
	}
	public String getRevCont() {
		return revCont;
	}
	public void setRevCont(String revCont) {
		this.revCont = revCont;
	}
	public Date getRevDate() {
		return revDate;
	}
	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}
	public double getRevScore() {
		return revScore;
	}
	public void setRevScore(double revScore) {
		this.revScore = revScore;
	}
	public String getRevPic() {
		return revPic;
	}
	public void setRevPic(String revPic) {
		this.revPic = revPic;
	}

	// Date형을 문자열로 형변환
	public String getRevRegDate() {
		return revRegDate;
	}
	public void setRevRegDate(String revRegDate) {
		this.revRegDate=revRegDate;
	}
	@Override
	public String toString() {
		return "RevVO [revId=" + revId + ", memId=" + memId + ", memName=" + memName + ", resId=" + resId
				+ ", revTitle=" + revTitle + ", revCont=" + revCont + ", revDate=" + revDate + ", revRegDate="
				+ revRegDate + ", revScore=" + revScore + ", revPic=" + revPic + "]";
	}	
	
	
}