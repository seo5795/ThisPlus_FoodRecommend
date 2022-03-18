package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.common.Action;
import controller.common.ActionForward;

import model.member.MemDAO;
import model.member.MemVO;


public class LoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		ActionForward forward=null;
		MemDAO memDAO=new MemDAO();
		MemVO mvo=new MemVO();
		System.out.println("LoginActino 들어옴");
		System.out.println("1:"+mvo);
		mvo.setMemName(request.getParameter("memName"));
		mvo.setMemPw(request.getParameter("memPw"));
		mvo=memDAO.memSelectOne(mvo);
		System.out.println("LoginActino dao완료");
		System.out.println("2:"+mvo);
		if(mvo!=null){
			HttpSession session=request.getSession();
			session.setAttribute("member", mvo.getMemName());
			forward=new ActionForward();
			System.out.println(mvo.getMemRank());
			if(mvo.getMemRank()==2) {
				//관리자모드
				forward.setPath("main.did");
				
			}else {
				forward.setPath("main.do");
			}
			forward.setRedirect(true);
			
			
			
		}
		
		return forward;

	}

}
