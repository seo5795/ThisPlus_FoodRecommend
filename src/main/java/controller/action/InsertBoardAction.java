package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.dao.BoardDAO;
import model.vo.BoardVO;

public class InsertBoardAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=new ActionForward();
		BoardDAO boardDAO=new BoardDAO();
		BoardVO bvo=new BoardVO();
		bvo.setContent(request.getParameter("content"));
		bvo.setMid(request.getParameter("mid"));
		if(boardDAO.insertBoard(bvo)){
			forward.setPath("main.do");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
