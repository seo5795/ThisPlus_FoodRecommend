package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;

public class MemdeleteAction implements Action {

   // 회원 탈퇴
   //   static final String memDelete = "delete from member where memId=?";
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      ActionForward forward=null;
      MemDAO memDAO=new MemDAO();
      MemVO mvo=new MemVO();
      
      mvo.setMemPw(request.getParameter("password"));
      HttpSession session=request.getSession();
      mvo.setMemId((String)session.getAttribute("memberid")); // sql문을 실행시키기 위해서 memId가 필요함
      
      
      if(memDAO.memDelete(mvo)) {
         forward=new ActionForward();
         forward.setPath("main.do");   // 삭제를 완료했으면
         System.out.println("로그 : 회원 삭제 완료");
         forward.setRedirect(true);
      }

      return forward;
   }
}