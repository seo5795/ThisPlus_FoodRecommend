package controller.main;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;

public class FindPwAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
      ActionForward forward = null;
      MemDAO memDAO = new MemDAO();
      MemVO mvo = new MemVO();

      System.out.println("로그 FindPwAction 들어옴");

      mvo.setMemId(request.getParameter("memId"));
      mvo = memDAO.memSelectOne(mvo);
      System.out.println("로그 FindPwAction dao완료");
      System.out.println(mvo);
      
      
         request.setAttribute("memId", mvo.getMemId());
         request.setAttribute("memPw", mvo.getMemPw());
         forward = new ActionForward();

         forward.setPath("findPwCheck.jsp");

         forward.setRedirect(false);

      

      return forward;
   }
}