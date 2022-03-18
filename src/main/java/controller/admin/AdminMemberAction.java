package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;

public class AdminMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		ActionForward forward = null;

		MemDAO memDAO = new MemDAO();
		MemVO memVO = new MemVO();

		// 회원
		ArrayList<MemVO> memdatas = memDAO.memSelectAll(memVO);
		request.setAttribute("memdatas", memdatas);

		forward.setPath("MemberMain.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
