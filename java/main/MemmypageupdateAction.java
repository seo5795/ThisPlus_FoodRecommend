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

public class MemmypageupdateAction implements Action {

	// 회원정보 수정
	//   static final String memUpdate = "update member set"
	//         +" memPw=?,memEmail=?,memPhone=?,memAddress=?,memPic=? where memId=?";

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;
		MemDAO memDAO=new MemDAO();
		MemVO mvo=new MemVO();
		HttpSession session = request.getSession();
		mvo.setMemId((String)session.getAttribute("memberid"));
		mvo.setMemPw(request.getParameter("memPw"));
		mvo.setMemName(request.getParameter("memName"));
		mvo.setMemEmail(request.getParameter("memEmail"));
		mvo.setMemPhone(request.getParameter("memPhone"));
		mvo.setMemAddress(request.getParameter("memAddress"));
		mvo.setMemPic(request.getParameter("memPic"));      
		

		if(memDAO.memUpdate(mvo)) {
			
			//회원수정이 되었다면 session에 이름 최신화
			session.setAttribute("member", mvo.getMemName());
			forward=new ActionForward();
			forward.setPath("main.do");   // 수정을 완료했으면 메인으로 이동해도 됨
			forward.setRedirect(true);

			System.out.println("로그 : 회원 수정 액션 완료");

		}

		return forward;
	}
}