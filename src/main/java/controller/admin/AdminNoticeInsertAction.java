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
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException, Exception {

		ActionForward forward=new ActionForward();

		NotDAO noticeDAO = new NotDAO();
		NotVO noticeVO = new NotVO();

		noticeVO.setNotTitle(req.getParameter("notTitle"));
		noticeVO.setNotContent(req.getParameter("notContent"));
		System.out.println(noticeVO.getNotTitle());
		if (noticeDAO.notInsert(noticeVO)) {
			forward = new ActionForward();
			forward.setPath("adminnotice.did");
			forward.setRedirect(true);
		}
		return forward;
	}

}
