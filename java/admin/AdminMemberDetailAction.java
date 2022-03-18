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

public class AdminMemberDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, Exception {
		ActionForward forward = null;

		MemDAO memDAO = new MemDAO();
		MemVO memVO = new MemVO();
		memVO.setMemId(request.getParameter("mid"));

		// 관리자 회원 상세 페이지
		memVO = memDAO.memSelectOne(memVO);
		
		request.setAttribute("memdatas", memVO);

		forward.setPath("MemberDetail.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
