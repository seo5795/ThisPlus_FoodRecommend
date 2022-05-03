package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.menu.MenuDAO;
import model.menu.MenuVO;
import model.restaurant.ResVO;

public class MenudetailAction implements Action{

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
      //메뉴 디테일 보기
      ActionForward forward=new ActionForward();

      MenuDAO menuDAO = new MenuDAO();
      MenuVO menuVO = new MenuVO();
      
      menuVO.setMenuId(Integer.parseInt(req.getParameter("menuId")));
      
      //로그
      System.out.println(req.getParameter("resId"));
      System.out.println(req.getParameter("menuId"));

      // 관리자 회원 상세 페이지
      menuVO = menuDAO.menuSelectOne(menuVO);
      
      req.setAttribute("menudata", menuVO);

      forward.setPath("menudetail.jsp");
      forward.setRedirect(false);

      return forward;
   }
}