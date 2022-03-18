package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.dao.BoardDAO;
import model.vo.ReplyVO;

public class DeleteReplyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=new ActionForward();
		BoardDAO boardDAO=new BoardDAO();
		ReplyVO rvo=new ReplyVO();
		rvo.setRid(Integer.parseInt(request.getParameter("rid")));
		if(boardDAO.deleteReply(rvo)){
			forward.setPath("main.do");
			forward.setRedirect(false);
		}		
		
		return forward;
	}

}
