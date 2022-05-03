package controller.common;

public class ActionForward {
	private String path;//경로
	private boolean redirect;//어떻게 갈지
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return redirect;
	}
	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}	
	
}
