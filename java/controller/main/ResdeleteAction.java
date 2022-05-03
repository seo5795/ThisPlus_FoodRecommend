package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class ResdeleteAction implements Action {

	// 식당 삭제
	// static final String resDelete = "delete from restaurant where resId=?";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;
		ResDAO resDAO=new ResDAO();
		ResVO rvo=new ResVO();
		rvo.setResId(Integer.parseInt(request.getParameter("resId"))); // 가게 번호
		
		if(resDAO.resDelete(rvo)) {
			forward=new ActionForward();
			forward.setPath("main.do");	// 삭제를 완료했으면 메인으로 이동해도 됨
			System.out.println("로그 : 식당 삭제 액션 완료");
			forward.setRedirect(true);
		}

		return forward;
	}
}