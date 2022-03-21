package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;

public class MemmypageupdateAction implements Action {

   // 회원정보 수정
   //   static final String memUpdate = "update member set"
   //         +" memPw=?,memEmail=?,memPhone=?,memAddress=?,memPic=? where memId=?";
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      ActionForward forward=null;
      MemDAO memDAO=new MemDAO();
      MemVO mvo=new MemVO();
      mvo.setMemPw(request.getParameter("memPw"));
      mvo.setMemEmail(request.getParameter("memEmail"));
      mvo.setMemPhone(request.getParameter("memPhone"));
      mvo.setMemAddress(request.getParameter("memAddress"));
      mvo.setMemPic(request.getParameter("memPic"));      
      mvo.setMemId(request.getParameter("memId"));
      
      if(memDAO.memUpdate(mvo)) {
         forward=new ActionForward();
         forward.setPath("main.do");   // 수정을 완료했으면 메인으로 이동해도 됨
         System.out.println("로그 : 회원 수정 액션 완료");
         forward.setRedirect(false);
      }

      return forward;
   }
}