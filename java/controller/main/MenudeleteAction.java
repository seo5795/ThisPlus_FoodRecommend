package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.menu.MenuDAO;
import model.menu.MenuVO;

public class MenudeleteAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      //메뉴삭제 액션
      ActionForward forward=new ActionForward();
      MenuDAO menuDAO = new MenuDAO();
      MenuVO mevo = new MenuVO();
      System.out.println("로그: 메뉴삭제 액션");
      System.out.println("로그 MDAction "+req.getParameter("menuId"));
      System.out.println("로그 MDAction "+req.getParameter("resId"));
      mevo.setMenuId(Integer.parseInt(req.getParameter("menuId")));
      //식당 주인 id필요한지 확인
      String restId=req.getParameter("resId");
      req.setAttribute("resId", restId);
      if(menuDAO.menuDelete(mevo)) {
         forward.setPath("resdetail.do");//식당 상세보기 페이지
         forward.setRedirect(false);
      }
      
      return forward;
   }
   
}