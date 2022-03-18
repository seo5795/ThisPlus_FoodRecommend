package controller.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;
import model.notice.NotDAO;
import model.notice.NotVO;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class AdminMainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		
		MemDAO memDAO = new MemDAO();
		MemVO memVO = new MemVO();
		NotDAO notDAO = new NotDAO();
		NotVO notVO = new NotVO();
		ResDAO resDAO = new ResDAO();
		ResVO resVO = new ResVO();
		
		//회원
		ArrayList<MemVO> memdatas = memDAO.memSelectAll(memVO);
		request.setAttribute("memdatas",memdatas);
		//식당
		ArrayList<ResVO> resdatas = resDAO.resSelectAll(resVO);
		request.setAttribute("resdatas",resdatas);
		//공지
		ArrayList<NotVO> notdatas = notDAO.notSelectAll(notVO);
		request.setAttribute("notdatas",notdatas);
		
		
		forward.setPath("AdminMain.jsp");
		forward.setRedirect(false);

		return forward;
	}

}