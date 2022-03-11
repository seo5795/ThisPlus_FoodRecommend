package model.coupon;

public class CpnVO {
	private int cpnId;			//쿠폰 아이디(번호)
	private String resName;		//쿠폰 해당식당이름
	private String cpnName;		//쿠폰 이름	
	private int cpnDiscount;	//쿠폰 할인율
	private int cpnOriPrice;	//쿠폰 원래가격
	private int cpnDisPrice;	//쿠폰 할인된 가격
	private String cpnPic;		//쿠폰 사진(경로)
	public int getCpnId() {
		return cpnId;
	}
	
	public void setCpnId(int cpnId) {
		this.cpnId = cpnId;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public String getCpnName() {
		return cpnName;
	}
	public void setCpnName(String cpnName) {
		this.cpnName = cpnName;
	}
	public int getCpnDiscount() {
		return cpnDiscount;
	}
	public void setCpnDiscount(int cpnDiscount) {
		this.cpnDiscount = cpnDiscount;
	}
	public int getCpnOriPrice() {
		return cpnOriPrice;
	}
	public void setCpnOriPrice(int cpnOriPrice) {
		this.cpnOriPrice = cpnOriPrice;
	}
	public int getCpnDisPrice() {
		return cpnDisPrice;
	}
	public void setCpnDisPrice(int cpnDisPrice) {
		this.cpnDisPrice = cpnDisPrice;
	}
	public String getCpnPic() {
		return cpnPic;
	}
	public void setCpnPic(String cpnPic) {
		this.cpnPic = cpnPic;
	}
	
	
	
	
	
}
