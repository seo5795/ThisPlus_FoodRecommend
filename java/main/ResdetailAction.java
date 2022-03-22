package controller.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.menu.MenuDAO;
import model.menu.MenuVO;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class ResdetailAction implements Action {

	// 식당 내용 조회
	// static final String resSelectOne = "select * from restaurant where resId=?";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;
		ResDAO resDAO=new ResDAO();
		MenuDAO menuDAO = new MenuDAO();
		ResVO rvo=new ResVO();
		MenuVO mvo = new MenuVO();
		//식당 정보
		rvo.setResId(Integer.parseInt(request.getParameter("resId"))); // 가게 번호
		rvo=resDAO.resSelectOne(rvo);
		
		//메뉴정보
		ArrayList<MenuVO> mlist = new ArrayList<MenuVO>();
		mvo.setResId(Integer.parseInt(request.getParameter("resId"))); // 가게 번호
		mlist=menuDAO.menuSelectAll(mvo);
		request.setAttribute("mdatas", mlist);
		
		if(rvo!=null) {
			System.out.println("rvo:"+rvo);
			forward=new ActionForward();
			request.setAttribute("rdatas", rvo);
			forward.setPath("/restaurantDetails.jsp"); // main.do가 아니라 해당 페이지로 이동해야됨
			forward.setRedirect(false);
		}

		return forward;
	}
}