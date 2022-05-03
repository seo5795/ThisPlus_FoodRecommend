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

public class SnsLoginAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ActionForward forward=null;
		MemDAO memDAO=new MemDAO();
		MemVO mvo=new MemVO();
		System.out.println("snsLoginAction 들어옴");

		//-----sns로그인시 필요 정보------
		var id = req.getParameter("memId");
		mvo.setMemId(req.getParameter("memId"));
		mvo.setMemEmail(req.getParameter("memEmail"));
		mvo.setMemName(req.getParameter("memName"));
		mvo.setMemPic(req.getParameter("memPic"));
		mvo.setMemPhone(req.getParameter("memPhone"));
		mvo.setMemRank(Integer.parseInt(req.getParameter("memRank")));

		System.out.println("id:"+id);

		mvo=memDAO.memSnsSelectOne(mvo);
		System.out.println(mvo); 
		System.out.println("LoginAction dao완료");


		HttpSession session=req.getSession();
		session.setAttribute("member", mvo.getMemName());
		session.setAttribute("memberid", mvo.getMemId());
		 session.setAttribute("meberRank", mvo.getMemRank());
		forward=new ActionForward();
		System.out.println(mvo.getMemRank());
		forward.setPath("main.do");
		forward.setRedirect(true);


		return forward;
	}

}
