package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.common.Action;
import controller.common.ActionForward;
import model.dao.MemberDAO;
import model.vo.MemberVO;

public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=null;
		MemberDAO memberDAO=new MemberDAO();
		MemberVO mvo=new MemberVO();
		mvo.setMid(request.getParameter("mid"));
		mvo.setMpw(request.getParameter("mpw"));
		mvo=memberDAO.selectOne(mvo);
		if(mvo!=null){
			HttpSession session=request.getSession();
			session.setAttribute("member", mvo.getMid());
			/////				int i    = 10;
			session.setAttribute("memberName", mvo.getMname());
			forward=new ActionForward();
			forward.setPath("main.do");
			forward.setRedirect(true);
		}
		
		return forward;
		// 아이디없음 or 비밀번호불일치 등의 이유로 login실패하였을때,
		// mvo가 null이다! -> forward가 null이다!!!
	}

}
