package model.review;

import java.util.ArrayList;

public class RevBoardSet {
	private RevVO revVO;
	private ArrayList<RevVO> replyList=new ArrayList<RevVO>();
	public RevVO getRevVO() {
		return revVO;
	}
	public void setRevVO(RevVO revVO) {
		this.revVO = revVO;
	}
	public ArrayList<RevVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(ArrayList<RevVO> replyList) {
		this.replyList = replyList;
	}
	
}
