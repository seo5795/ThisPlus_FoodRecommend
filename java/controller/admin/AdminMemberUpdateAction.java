package controller.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.member.MemDAO;
import model.member.MemVO;

public class AdminMemberUpdateAction implements Action {

   @Override
   public ActionForward execute(HttpServletRequest req, HttpServletResponse res)
         throws ServletException, IOException, Exception {

      ActionForward forward=new ActionForward();

      MemDAO memDAO = new MemDAO();
      MemVO memVO = new MemVO();
      memVO.setMemId((String)req.getParameter("memId"));
      memVO.setMemName((String)req.getParameter("memName"));
      memVO.setMemEmail((String)req.getParameter("memEmail"));
      memVO.setMemPhone((String)req.getParameter("memPhone"));
      memVO.setMemAddress((String)req.getParameter("memAddress"));
      memVO.setMemPoint(Integer.parseInt((String)req.getParameter("memPoint")));
      memVO.setMemPw((String)req.getParameter("memPw"));
      //memVO.setMemPw(req.getParameter("memPw"));

      System.out.println("2회원계정 : "+memVO.getMemId());
      System.out.println("2회원이름 : "+memVO.getMemName());
      System.out.println("2회원메일 : "+memVO.getMemEmail());
      System.out.println("2회원전화 : "+memVO.getMemPhone());
      System.out.println("2회원주소 : "+memVO.getMemAddress());
      System.out.println("2회원점수 : "+memVO.getMemPoint());
      System.out.println("2회원비번 : "+memVO.getMemPw());
      System.out.println("2회원사진 : "+memVO.getMemPic());


      if (memDAO.memUpdate(memVO)) {
         forward.setPath("adminmember.did");
         forward.setRedirect(true);
      } else {
         throw new Exception("로그: AMUAction 업데이트 중 오류 발생!");
      }
      return forward;
   }

}