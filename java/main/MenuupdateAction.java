package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.menu.MenuDAO;
import model.menu.MenuVO;

public class MenuupdateAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
ActionForward forward = new ActionForward();
		//메뉴 업데이트액션
		MenuDAO menuDAO = new MenuDAO();
		MenuVO mevo = new MenuVO();
		
		mevo.setMenuName(req.getParameter("menuName"));
		mevo.setResId(Integer.parseInt(req.getParameter("resId")));
		mevo.setMenuPrice(Integer.getInteger(req.getParameter("menuPrice")));
		mevo.setMenuCategory(req.getParameter("menuCategory"));
		mevo.setMenuPic(req.getParameter("MenuPic"));
		if(menuDAO.menuUpdate(mevo)) {
			forward.setPath("resdetail.do");//식당 상세보기페이지 이동
			forward.setRedirect(true);
		}
		
		return forward;
	}
	
}