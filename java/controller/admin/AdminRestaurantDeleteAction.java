package controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class AdminRestaurantDeleteAction implements Action {
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward=null;
      ResDAO resDAO=new ResDAO();
      ResVO rvo=new ResVO();
      rvo.setResId(Integer.parseInt(request.getParameter("resId")));
      
      forward=new ActionForward();
      if(resDAO.resDelete(rvo)) {
         forward.setPath("adminrestaurant.did");
         forward.setRedirect(false);
      }
      else {
         throw new Exception("Log : delete fail");
      }
      return forward;
   }
}