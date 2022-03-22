package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class AdminRestaurantDetailAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;
		ResDAO resDAO=new ResDAO();
		ResVO rvo=new ResVO();
		rvo.setResId(Integer.parseInt(request.getParameter("resId")));
		rvo=resDAO.resSelectOne(rvo);

		System.out.println(rvo.getResId());

		forward=new ActionForward();
		System.out.println(rvo);
		request.setAttribute("res", rvo);
		forward.setPath("AdminRestaurantDetail.jsp");
		forward.setRedirect(false);
		return forward;
	}
}