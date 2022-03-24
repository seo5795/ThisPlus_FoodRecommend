package controller.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class AdminSearchAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		ActionForward forward=new ActionForward();

	      MemDAO memDAO = new MemDAO();
	      MemVO memVO = new MemVO();
	      ResDAO resDAO = new ResDAO();
	      ResVO resVO = new ResVO();
	      
	     
	      String searchField = req.getParameter("searchField");
	      
	      

	      if(searchField.equals("memName")) {
		   memVO.setMemName(req.getParameter("searchText"));

	    	// 회원 검색
		      ArrayList<MemVO> memdatas = memDAO.memSelectAllSearch(memVO);
		      req.setAttribute("memdatas", memdatas);

		      if(memdatas.size()==0) {
		         System.out.println("로그 AMSAction 배열크기 0");
		         forward.setPath("adminmemeber.did");
		         forward.setRedirect(true);
		      }
		      else {
		         System.out.println("로그 AMSAction 검색 출력");
		         System.out.println(memdatas.size()+"배열크기");
		         forward.setPath("AdminMemberMain.jsp");
		         forward.setRedirect(false);
		      }
	      }
	      
	      else {
		      resVO.setResName(req.getParameter("searchText"));

	    	  //식당검색
		      ArrayList<ResVO> resdatas = resDAO.resSelectAllSearch(resVO);
		      req.setAttribute("res", resdatas);

		      if(resdatas.size()==0) {
		         System.out.println("로그 ARSAction 배열크기 0");
		         forward.setPath("adminrestaurant.did");
		         forward.setRedirect(true);
		      }
		      else {
		         System.out.println("로그 ARSAction 검색 출력");
		         System.out.println(resdatas.size()+"배열크기");
		         forward.setPath("AdminRestaurantMain.jsp");
		         forward.setRedirect(false);
		      }
	      }
	      
	      return forward;
	   }
}
