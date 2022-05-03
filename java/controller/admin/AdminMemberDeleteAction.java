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
		memVO.setMemPw(req.getParameter("memPw"));

		System.out.println(req.getParameter("memPw"));
		System.out.println(req.getParameter("memId"));
		System.out.println("로그 AMDAction 불러옴");
		forward = new ActionForward();
		if (memDAO.memDelete(memVO)) {
			System.out.println("로그 AMDAction 탈퇴");
			forward.setPath("adminmember.did");
			forward.setRedirect(false);
		} else {
			throw new Exception("Log : delete fail");
		}
		return forward;
	}
}
