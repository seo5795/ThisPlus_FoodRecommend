package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.menu.MenuDAO;
import model.menu.MenuVO;

public class MenuinsertAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		MenuDAO menuDAO = new MenuDAO();
		MenuVO mevo = new MenuVO();
		
		mevo.setMenuName(req.getParameter("menuName"));
		mevo.setResId(Integer.parseInt(req.getParameter("resId")));
		mevo.setMenuPrice(Integer.getInteger(req.getParameter("menuPrice")));
		mevo.setMenuCategory(req.getParameter("menuCategory"));
		mevo.setMenuPic(req.getParameter("uploadfile"));
		
		if(menuDAO.menuInsert(mevo)) {
			forward.setPath("resdetail.do");//식당등록이 성공하면 메인페이지로 이동
			forward.setRedirect(true);
		}
		return forward;
	}
	
}