package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class AdminRestaurantAction implements Action {
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      ResDAO resDAO=new ResDAO();
      ResVO rvo=new ResVO();
      
      // 페이지당 출력 리스트수(사용안함)
      int listCnt=5;
      ArrayList<ResVO> resDatas=resDAO.resSelectAll(rvo,listCnt);
      // System.out.println(resDatas.get(0));
      request.setAttribute("res", resDatas);
      ActionForward forward=new ActionForward();
      forward.setPath("AdminRestaurantMain.jsp");
      forward.setRedirect(false);

      return forward;
   }
}