package controller.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.notice.NotDAO;
import model.notice.NotVO;


public class AdminNoticeAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
      
      ActionForward forward=new ActionForward();
      NotDAO boardDAO=new NotDAO();
      NotVO nvo=new NotVO();
      System.out.println("AdminNoticeMainAction실행중");
      ArrayList<NotVO> ndatas=boardDAO.notSelectAll(nvo);
      request.setAttribute("ndatas", ndatas);
      
      System.out.println("공지"+ ndatas.size());
      
      forward.setPath("AdminNoticeMain.jsp");
      forward.setRedirect(false);
   

      
      return forward;
   }

}