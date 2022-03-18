package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.dao.BoardDAO;
import model.vo.ReplyVO;

public class InsertReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=null;
		BoardDAO boardDAO=new BoardDAO();
		ReplyVO rvo=new ReplyVO();
		rvo.setBid(Integer.parseInt(request.getParameter("bid")));
		rvo.setMid(request.getParameter("mid"));
		rvo.setMsg(request.getParameter("msg"));
		if(boardDAO.insertReply(rvo)){
			forward=new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(false);
		}		
		
		return forward;
	}

}
