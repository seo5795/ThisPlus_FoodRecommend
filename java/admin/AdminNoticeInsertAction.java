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
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {

		ActionForward forward = null;

		NotDAO noticeDAO = new NotDAO();
		NotVO noticeVO = new NotVO();

		if (noticeDAO.notInsert(noticeVO)) {
			forward = new ActionForward();
			forward.setPath("adminMain.do");
			forward.setRedirect(true);
		}
		return forward;
	}

}
