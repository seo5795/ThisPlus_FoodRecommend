package controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.menu.MenuDAO;
import model.menu.MenuVO;

public class MenuinsertAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
      ActionForward forward = new ActionForward();

      MenuDAO menuDAO = new MenuDAO();
      MenuVO mevo = new MenuVO();

      System.out.println(req.getParameter("menuName"));
      System.out.println(req.getParameter("resId"));
      
      System.out.println(req.getParameter("menuPrice"));
      System.out.println(req.getParameter("menuCategory"));
      
      
      mevo.setMenuName(req.getParameter("menuName"));
      mevo.setResId(Integer.parseInt(req.getParameter("resId")));
      mevo.setMenuPrice(Integer.parseInt(req.getParameter("menuPrice")));
      mevo.setMenuCategory(req.getParameter("menuCategory"));
      
      

      System.out.println("로그 MIAction set완료");
      if (menuDAO.menuInsert(mevo)) {
         forward.setPath("resdetail.do");// 식당등록이 성공하면 메인페이지로 이동
         forward.setRedirect(false);
      }
      return forward;
   }

}