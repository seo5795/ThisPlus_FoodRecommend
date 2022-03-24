package controller.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.common.Action;
import controller.common.ActionForward;
import model.menu.MenuDAO;
import model.menu.MenuVO;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;
import model.review.RevDAO;
import model.review.RevVO;

public class ResdetailAction implements Action {

   // 식당 내용 조회
   // static final String resSelectOne = "select * from restaurant where resId=?";
   
   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
      ActionForward forward=null;
      ResDAO resDAO=new ResDAO();
      MenuDAO menuDAO = new MenuDAO();
      RevDAO revDAO = new RevDAO();
      RevVO revVO = new RevVO();
      ResVO rvo=new ResVO();
      MenuVO mvo = new MenuVO();
      int num = 5;//맨 처음 출력할 리뷰수
      
      if(request.getParameter("num")!=null) {//더보기값이 있을경우
			num=Integer.parseInt(request.getParameter("num"));
		}
      request.setAttribute("num", num);
      
      System.out.println( request.getParameter("num"));
      System.out.println( request.getParameter("resId"));
      
      //식당 정보
      System.out.println("로그 ResdetailAction "+request.getParameter("resId"));
      rvo.setResId(Integer.parseInt(request.getParameter("resId"))); // 가게 번호
      rvo=resDAO.resSelectOne(rvo);
      request.setAttribute("rdatas", rvo);
      
      System.out.println(request.getParameter("act"));
      if(request.getParameter("act")!=null&&request.getParameter("act")!=null) {
    	  //act가 없으면 식당상세페이지 이동, act가 있다면 식당수정페이지로 이동
    	  System.out.println("resUpdate.jsp");
    	  forward=new ActionForward();      
          forward.setPath("resUpdate.jsp"); // main.do가 아니라 해당 페이지로 이동해야됨
          forward.setRedirect(false);
          return forward;
      }
      
      //메뉴정보
      ArrayList<MenuVO> mlist = new ArrayList<MenuVO>();
      mvo.setResId(Integer.parseInt(request.getParameter("resId"))); // 가게 번호
      mlist=menuDAO.menuSelectAll(mvo);
      request.setAttribute("mdatas", mlist);
      
      //리뷰정보
      ArrayList<RevVO> revlist = new ArrayList<RevVO>();
      revVO.setResId(Integer.parseInt(request.getParameter("resId")));
      revlist= revDAO.revSelectAll(revVO, num);
      request.setAttribute("revdatas", revlist);
            
      //리뷰를 작성했을시 다시 못작성하게 하기위한 멤버 리뷰 작성 여부 정보
      HttpSession session = request.getSession();
      String memberid = (String) session.getAttribute("memberid");
      RevVO ynrevVO = new RevVO();
      ynrevVO.setMemId(memberid);
      ynrevVO.setResId(Integer.parseInt(request.getParameter("resId")));
      ynrevVO=revDAO.revSelectOne(ynrevVO);
      System.out.println(ynrevVO);
      request.setAttribute("ynrevVO", ynrevVO);
      
      if(rvo!=null) {
         System.out.println("rvo:"+rvo);
         forward=new ActionForward();      
         forward.setPath("/restaurantDetails.jsp"); // main.do가 아니라 해당 페이지로 이동해야됨
         forward.setRedirect(false);
      }

      return forward;
   }
}