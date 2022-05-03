package controller.admin;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemVO;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class AdminRestaurantSearchAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      ActionForward forward=new ActionForward();
      
      ResDAO resDAO = new ResDAO();
      ResVO resVO = new ResVO();
      
      resVO.setResName(req.getParameter("searchRestaurantText"));
   

      // 회원 검색
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
      

      return forward;
   }

}