package model.restaurant;

public class ResVO {
	private int resId;			// 식당 번호(고유값)
	private String memId;
	private String resName;		// 식당 이름
	private double resAvg;		// 식당 평점
	private String resAdd;		// 식당 주소
	private String resPhone;	// 식당 연락처
	private String resCategory;	// 식당 카테고리
	private int resPark;		// 주차가능여부
	private String resPic;		// 식당 사진(저장경로)
	
	// getter/setter
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getResName() {
		return resName;
	}
	public void setResName(String resName) {
		this.resName = resName;
	}
	public double getResAvg() {
		return resAvg;
	}
	public void setResAvg(double resAvg) {
		this.resAvg = resAvg;
	}
	public String getResAdd() {
		return resAdd;
	}
	public void setResAdd(String resAdd) {
		this.resAdd = resAdd;
	}
	public String getResPhone() {
		return resPhone;
	}
	public void setResPhone(String resPhone) {
		this.resPhone = resPhone;
	}
	public String getResCategory() {
		return resCategory;
	}
	public void setResCategory(String resCategory) {
		this.resCategory = resCategory;
	}
	public int getResPark() {
		return resPark;
	}
	public void setResPark(int resPark) {
		this.resPark = resPark;
	}
	public String getResPic() {
		return resPic;
	}
	public void setResPic(String resPic) {
		this.resPic = resPic;
	}
	
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	
	@Override
	public String toString() {
		return "ResVO [resId=" + resId + ", memId=" + memId + ", resName=" + resName + ", resAvg=" + resAvg
				+ ", resAdd=" + resAdd + ", resPhone=" + resPhone + ", resCategory=" + resCategory + ", resPark="
				+ resPark + ", resPic=" + resPic + "]";
	}

	
	
}