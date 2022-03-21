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
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException, Exception {
		
		ActionForward forward=new ActionForward();

		MemDAO memDAO = new MemDAO();
		MemVO memVO = new MemVO();

		// 회원
		ArrayList<MemVO> memdatas = memDAO.memSelectAll(memVO);
		req.setAttribute("memdatas", memdatas);

		forward.setPath("AdminMemberMain.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
