package model.vo;

import java.util.ArrayList;

public class BoardSet {
	private BoardVO boardVO;
	private ArrayList<ReplyVO> replyList=new ArrayList<ReplyVO>();
	public BoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}
	public ArrayList<ReplyVO> getReplyList() {
		return replyList;
	}
	public void setReplyList(ArrayList<ReplyVO> replyList) {
		this.replyList = replyList;
	}
	@Override
	public String toString() {
		return "BoardSet [boardVO=" + boardVO + ", replyList=" + replyList + "]";
	}
}
