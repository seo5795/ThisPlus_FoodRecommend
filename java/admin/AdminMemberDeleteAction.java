package controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;

public class AdminMemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ActionForward forward = null;
		MemDAO memDAO = new MemDAO();
		MemVO memVO = new MemVO();
		memVO.setMemId(req.getParameter("memId"));

		forward = new ActionForward();
		if (memDAO.memDelete(memVO)) {
			forward.setPath("adminmember.did");
			forward.setRedirect(false);
		} else {
			throw new Exception("Log : delete fail");
		}
		return forward;
	}
}
