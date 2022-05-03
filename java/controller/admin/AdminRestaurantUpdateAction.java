package controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;

import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class AdminRestaurantUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ActionForward forward=new ActionForward();

		ResDAO resDAO = new ResDAO();
		ResVO resVO = new ResVO();
		resVO.setResId(Integer.parseInt(req.getParameter("resId")));

		if (resDAO.resUpdate(resVO)) {
			forward.setPath("/adminrestaurantupdate.do");
			forward.setRedirect(true);
		} else {
			throw new Exception("로그: ARUAction 업데이트 중 오류 발생!");
		}
		return forward;
	}

}
