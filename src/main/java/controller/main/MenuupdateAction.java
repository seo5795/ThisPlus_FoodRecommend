package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.menu.MenuDAO;
import model.menu.MenuVO;

public class MenuupdateAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
ActionForward forward = new ActionForward();
      //메뉴 업데이트액션
      MenuDAO menuDAO = new MenuDAO();
      MenuVO mevo = new MenuVO();
      
      System.out.println("메뉴업데이트액션"+req.getParameter("menuName"));
      System.out.println("메뉴업데이트액션"+req.getParameter("resId"));
      System.out.println("메뉴업데이트액션"+req.getParameter("menuPrice"));
      System.out.println("메뉴업데이트액션"+req.getParameter("menuCategory"));
      System.out.println("메뉴업데이트액션"+req.getParameter("menuId"));
      
      mevo.setMenuId(Integer.parseInt(req.getParameter("menuId")));
      mevo.setMenuName(req.getParameter("menuName"));
      //mevo.setResId(Integer.parseInt(req.getParameter("resId")));
      mevo.setMenuPrice(Integer.parseInt(req.getParameter("menuPrice")));
      mevo.setMenuCategory(req.getParameter("menuCategory"));
   //   mevo.setMenuPic(req.getParameter("MenuPic"));
      if(menuDAO.menuUpdate(mevo)) {
         forward.setPath("resdetail.do");//식당 상세보기페이지 이동
         forward.setRedirect(false);
      }
      
      return forward;
   }
   
}