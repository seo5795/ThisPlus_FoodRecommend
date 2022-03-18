package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;


public class SignupAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;
		MemDAO memDAO=new MemDAO();
		MemVO mvo=new MemVO();
		mvo.setMemId(request.getParameter("memid")); // 회원 아이디
		mvo.setMemName(request.getParameter("memname")); // 회원 이름
		mvo.setMemPw(request.getParameter("mempw")); // 회원 비밀번호
		mvo.setMemEmail(request.getParameter("mememail")); // 회원 이메일
		mvo.setMemPhone(request.getParameter("memphone")); // 회원 전화번호
		mvo.setMemAddress(request.getParameter("memaddress")); // 회원 주소
		
		if(memDAO.memInsert(mvo)) {
			forward=new ActionForward();
			forward.setPath("/main.do");
			forward.setRedirect(true);
		}

		return forward;
	}
}