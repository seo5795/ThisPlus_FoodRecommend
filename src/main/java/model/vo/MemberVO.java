package model.vo;

import java.util.Date;

public class MemberVO {
	private String mid;
	private String mname;
	private String mpw;
	private Date mdate;
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public Date getMdate() {
		return mdate;
	}
	public void setMdate(Date mdate) {
		this.mdate = mdate;
	}
	@Override
	public String toString() {
		return "MemberVO [mid=" + mid + ", mname=" + mname + ", mpw=" + mpw + ", mdate=" + mdate + "]";
	}
}
