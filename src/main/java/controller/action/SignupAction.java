package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.dao.MemberDAO;
import model.vo.MemberVO;

public class SignupAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=null;
		MemberDAO memberDAO=new MemberDAO();
		MemberVO mvo=new MemberVO();
		mvo.setMid(request.getParameter("mid"));
		mvo.setMname(request.getParameter("mname"));
		mvo.setMpw(request.getParameter("mpw"));
		if(memberDAO.insert(mvo)) {
			forward=new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
