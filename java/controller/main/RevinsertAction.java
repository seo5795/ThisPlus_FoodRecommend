package controller.main;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import controller.common.Action;
import controller.common.ActionForward;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;
import model.review.RevDAO;
import model.review.RevVO;

public class RevinsertAction implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {



		System.out.println(request.getParameter("revContent")+"내용");
		System.out.println(request.getParameter("memId")+"ㅣ아이디");
		System.out.println(request.getParameter("memName")+"회원이름");
		System.out.println(request.getParameter("revtitle")+"제목");
		System.out.println(request.getParameter("revScore")+"평점");
		//System.out.println(request.getParameter("revPic"));



		ActionForward forward=new ActionForward();
		RevDAO revDAO=new RevDAO();
		RevVO rvo=new RevVO();
		int resId = Integer.parseInt(request.getParameter("resId"));
		rvo.setResId(resId);
		rvo.setRevCont(request.getParameter("revContent"));
		rvo.setMemId(request.getParameter("memId"));
		rvo.setMemName(request.getParameter("memName"));
		rvo.setRevTitle(request.getParameter("revtitle"));
		rvo.setRevScore(Double.parseDouble(request.getParameter("revScore")));
		//rvo.setRevPic(request.getParameter("revPic"));
		
		
		if(revDAO.revInsert(rvo)){//리뷰 등록후 식당 평점 계산
			System.out.println("리뷰등록 완료");
			ResDAO resDAO = new ResDAO();
			ResVO resvo =new ResVO();

			int resAvg = revDAO.revAvg(resId);
			System.out.println("평점 가져오기"+resAvg);
			resvo.setResAvg(resAvg);
			resvo.setResId(resId);
			if(resDAO.resAvgUpdate(resvo)) {
				System.out.println("업데이트");
				System.out.println("리뷰 등록");
				forward.setPath("resdetail.do");
				forward.setRedirect(false);
			}
		}

		return forward;
	}
}