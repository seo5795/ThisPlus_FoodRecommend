package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;

public class AdminMemberUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException, Exception {

		ActionForward forward=new ActionForward();

		String mid = req.getParameter("mid");
		MemDAO memDAO = new MemDAO();
		MemVO memVO = new MemVO();
		System.out.println(req.getParameter("memId"));
		System.out.println(req.getParameter("memName"));
		System.out.println(req.getParameter("memRank"));
		memVO.setMemId(req.getParameter("memId"));
		memVO.setMemAddress(req.getParameter("memAddress"));
		memVO.setMemEmail(req.getParameter("memEmail"));
		memVO.setMemName(req.getParameter("memName"));
		memVO.setMemPhone(req.getParameter("memPhone"));
		
		memVO.setMemPoint(Integer.parseInt(req.getParameter("memPoint")));
		memVO.setMemPw(req.getParameter("memPw"));
		
		
		
		
		if (memDAO.memUpdate(memVO)) {
			forward.setPath("adminmember.did");
			forward.setRedirect(true);
		} else {
			throw new Exception("로그: AMUAction 업데이트 중 오류 발생!");
		}
		return forward;
	}

}
