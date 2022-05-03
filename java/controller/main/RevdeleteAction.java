package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.review.RevDAO;
import model.review.RevVO;

public class RevdeleteAction implements Action {
 
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
      ActionForward forward=null;
      RevDAO revDAO=new RevDAO();
      RevVO rvo=new RevVO();
      rvo.setRevId(Integer.parseInt(request.getParameter("revid")));
      if(revDAO.revDelete(rvo)){
         System.out.println("리뷰 삭제");
         forward=new ActionForward();
         forward.setPath("resdetail.do");
         forward.setRedirect(false);
      }
      
      return forward;
   }
}