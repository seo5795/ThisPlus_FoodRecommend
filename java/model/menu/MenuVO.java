package model.menu;

public class MenuVO {
	private int menuId;				// 메뉴 번호(고유값)
	private int resId;				// 식당 번호(참조값)
	private String menuName;		// 메뉴 이름
	private int menuPrice;			// 메뉴 가격
	private String menuCategory;	// 메뉴 카테고리
	private String menuPic;			// 메뉴 사진(저장경로)
	
	// getter/setter
	public int getMenuId() {
		return menuId;
	}
	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}
	public int getResId() {
		return resId;
	}
	public void setResId(int resId) {
		this.resId = resId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public int getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuCategory() {
		return menuCategory;
	}
	public void setMenuCategory(String menuCategory) {
		this.menuCategory = menuCategory;
	}
	public String getMenuPic() {
		return menuPic;
	}
	public void setMenuPic(String menuPic) {
		this.menuPic = menuPic;
	}
	@Override
	public String toString() {
		return "MenuVO [menuId=" + menuId + ", resId=" + resId + ", menuName=" + menuName + ", menuPrice=" + menuPrice
				+ ", menuCategory=" + menuCategory + ", menuPic=" + menuPic + "]";
	}
	
	
}