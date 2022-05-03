package model.member;

public class MemVO {
	private String memId;		// 회원 아이디(고유값)
	private String memPw;		// 회원 비밀번호
	private String memName;		// 회원 이름
	private String memEmail;	// 회원 이메일
	private int memRank;		// 회원 등급
	private int memPoint;		// 보유 포인트
	private String memPhone;	// 회원 전화번호
	private String memAddress;	// 회원 집주소
	private String memPic;		// 회원 사진(저장경로)

	// 게터/세터
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public int getMemRank() {
		return memRank;
	}
	public void setMemRank(int memRank) {
		this.memRank = memRank;
	}
	public int getMemPoint() {
		return memPoint;
	}
	public void setMemPoint(int memPoint) {
		this.memPoint = memPoint;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public String getMemPic() {
		return memPic;
	}
	public void setMemPic(String memPic) {
		this.memPic = memPic;
	}
	@Override
	public String toString() {
		return "MemVO [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memEmail=" + memEmail
				+ ", memRank=" + memRank + ", memPoint=" + memPoint + ", memPhone=" + memPhone + ", memAddress="
				+ memAddress + ", memPic=" + memPic + "]";
	}
	
	
}