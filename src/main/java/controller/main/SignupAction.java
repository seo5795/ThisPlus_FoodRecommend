package controller.main;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;


public class SignupAction implements Action {
   // 회원 가입
     // static final String memInsert = "insert into member"
         //   +" (memId,memPw,memName,memEmail,memAddress,memPic) values (?,?,?,?,?,?)";
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      
     //로그인 액션
      ActionForward forward=null;
      MemDAO memDAO=new MemDAO();
      MemVO mvo=new MemVO();
      System.out.println("로그 : SignupAction");
      System.out.println((String)request.getAttribute("memRank"));
      System.out.println((String)request.getAttribute("memid"));
      System.out.println((String)request.getAttribute("memPw"));
      mvo.setMemId((String)request.getAttribute("memid")); // 회원 아이디
      mvo.setMemPw((String)request.getAttribute("memPw")); // 회원 비밀번호
      mvo.setMemName((String)request.getAttribute("memName")); // 회원 이름
      mvo.setMemEmail((String)request.getAttribute("memEmail")); // 회원 이메일
      mvo.setMemAddress((String)request.getAttribute("memAdd")); // 회원 주소
      mvo.setMemPic((String)request.getAttribute("memPic")); // 회원 사진
      mvo.setMemPhone((String)request.getAttribute("memPhone")); // 회원 전화번호
      mvo.setMemRank(Integer.parseInt((String) request.getAttribute("memRank")));
      
      
      System.out.println(mvo);
   
      if(memDAO.memInsert(mvo)) {
         System.out.println("회원가입 성공");
         forward=new ActionForward();
         forward.setPath("login.jsp");
         forward.setRedirect(true);
      }

      return forward;
   }
}