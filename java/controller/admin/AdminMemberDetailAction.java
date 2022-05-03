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
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException, Exception {
		ActionForward forward=new ActionForward();

		MemDAO memDAO = new MemDAO();
		MemVO memVO = new MemVO();
		memVO.setMemId(req.getParameter("memId"));

		// 관리자 회원 상세 페이지
		memVO = memDAO.memSelectOne(memVO);
		req.setAttribute("memdata", memVO);

		forward.setPath("AdminMemberDetail.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
