package controller.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class ReslistAction implements Action{

	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		int num = 2; //식당 리스트 페이지에서 출력할 식다으이 갯수
		String category = req.getParameter("scategory");
		
		if(req.getParameter("num")!=null) {//더보기값이 있을경우
			num=Integer.parseInt(req.getParameter("num"));
		}
		
		ResDAO resDAO = new ResDAO();
		ResVO rvo = new ResVO();
		
		if(category.equals("name")) {
			rvo.setResName(req.getParameter("search"));
		}else if(category.equals("menuCategory")) {
			rvo.setResCategory(req.getParameter("search"));
		}		
		
		ArrayList<ResVO> resDatas = resDAO.resSelectAll(rvo,num);
		req.setAttribute("num", num);
		req.setAttribute("category", category);
		req.setAttribute("resDatas",resDatas);
		req.setAttribute("search", req.getParameter("search"));
		
		forward.setPath("resList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
