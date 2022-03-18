package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.dao.BoardDAO;
import model.vo.BoardVO;

public class DeleteBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=null;
		BoardDAO boardDAO=new BoardDAO();
		BoardVO bvo=new BoardVO();
		bvo.setBid(Integer.parseInt(request.getParameter("bid")));
		if(boardDAO.deleteBoard(bvo)){
			forward=new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(false);
		}
		
		return forward;
	}

}
