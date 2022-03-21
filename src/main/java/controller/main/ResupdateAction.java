package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class ResupdateAction implements Action {

	// 식당 수정
	//	static final String resUpdate = "update restaurant set resName=?,resAvg=?,resAdd=?,resPhone=?,resCategory=?,resPic=? where resId=?";
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ActionForward forward=null;
		ResDAO resDAO=new ResDAO();
		ResVO rvo=new ResVO();
		rvo.setResName(request.getParameter("resName"));
		rvo.setResAvg(Double.parseDouble(request.getParameter("resAvg"))); // 더블 형변환하였음
		rvo.setResAdd(request.getParameter("resAdd")); // 주소
		rvo.setResPhone(request.getParameter("resPhone"));
		rvo.setResCategory(request.getParameter("resCategory"));
		rvo.setResPic(request.getParameter("resPic"));
		rvo.setResId(Integer.parseInt(request.getParameter("resId")));
		
		
		if(resDAO.resUpdate(rvo)) {
			forward=new ActionForward();
			forward.setPath("/main.do"); // 업데이트를 마치면 메인으로 이동
			forward.setRedirect(true);
		}

		return forward;
	}
}