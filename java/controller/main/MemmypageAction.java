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

public class MemmypageAction implements Action {

   // 마이페이지 접속
   // 회원정보 조회
   // static final String memSelectOne = "select * from member where memId=?";
   
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      ActionForward forward=null;
      HttpSession session=request.getSession();
      MemDAO memDAO=new MemDAO();
      MemVO mvo=new MemVO();
      mvo.setMemId((String)session.getAttribute("memberid"));
      
         mvo=memDAO.memSelectOne(mvo);
         request.setAttribute("data", mvo);
         forward=new ActionForward();
         forward.setPath("mypage.jsp");   // 수정을 완료했으면 메인으로 이동해도 됨
         System.out.println("로그 : 회원 상세보기 액션 완료");
         forward.setRedirect(false);


      return forward;
   }
}