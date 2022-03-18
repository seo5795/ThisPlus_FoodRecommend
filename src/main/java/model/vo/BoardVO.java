package model.vo;

public class BoardVO {
	private int bid;
	private String mid;
	private String content;
	private int favcnt;
	private int rpcnt;
	private String bdate;
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getFavcnt() {
		return favcnt;
	}
	public void setFavcnt(int favcnt) {
		this.favcnt = favcnt;
	}
	public int getRpcnt() {
		return rpcnt;
	}
	public void setRpcnt(int rpcnt) {
		this.rpcnt = rpcnt;
	}
	public String getBdate() {
		return bdate;
	}
	public void setBdate(String bdate) {
		this.bdate = bdate;
	}
	@Override
	public String toString() {
		return "BoardVO [bid=" + bid + ", mid=" + mid + ", content=" + content + ", favcnt=" + favcnt + ", rpcnt="
				+ rpcnt + ", bdate=" + bdate + "]";
	}
}