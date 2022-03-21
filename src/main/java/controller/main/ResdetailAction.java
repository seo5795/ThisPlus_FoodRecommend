package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
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
		ResVO rvo=new ResVO();
		rvo.setResId(Integer.parseInt(request.getParameter("resId"))); // 가게 번호
		
		if(resDAO.resSelectOne(rvo)!=null) {
			forward=new ActionForward();
			forward.setPath("/restaurantDetails.jsp"); // main.do가 아니라 해당 페이지로 이동해야됨
			forward.setRedirect(true);
		}

		return forward;
	}
}