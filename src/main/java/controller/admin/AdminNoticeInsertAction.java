package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.notice.NotDAO;
import model.notice.NotVO;


public class AdminNoticeInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		
		ActionForward forward=new ActionForward();
		NotDAO boardDAO=new NotDAO();
		NotVO nvo=new NotVO();
		nvo.setNotId(Integer.parseInt(request.getParameter("notContent")));
		nvo.setNotTitle(request.getParameter("notTitle"));
		nvo.setNotContent(request.getParameter("notContent"));
		nvo.setNotRegDate(request.getParameter("notRegDate"));
		nvo.setNotShow(Integer.parseInt(request.getParameter("notShow")));
		
		if(boardDAO.notInsert(nvo)){
			forward.setPath("adminmain.do");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
