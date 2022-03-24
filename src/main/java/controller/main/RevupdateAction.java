package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.review.RevDAO;
import model.review.RevVO;


public class RevupdateAction implements Action {

   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      ActionForward forward=null;
      RevDAO revDAO=new RevDAO();
      RevVO rvo=new RevVO();
      
      System.out.println(request.getParameter("revTitle"));
      System.out.println(request.getParameter("revCont"));
      System.out.println(request.getParameter("revId"));
      System.out.println(request.getParameter("resId"));
      
      
      rvo.setRevTitle(request.getParameter("revTitle"));
      rvo.setRevCont(request.getParameter("revCont"));
      rvo.setRevId(Integer.parseInt(request.getParameter("revId")));
      if(revDAO.revUpdate(rvo)){
    	  request.setAttribute("resId", request.getParameter("resId"));
         System.out.println("리뷰 수정");
         forward=new ActionForward();
         forward.setPath("resdetail.do");
         forward.setRedirect(false);
      }
      
      return forward;
   }
}