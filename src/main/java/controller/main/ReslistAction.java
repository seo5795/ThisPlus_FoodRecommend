package controller.main;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class ReslistAction implements Action{

	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		ActionForward forward = new ActionForward();
		
		int num = 2; //식당 리스트 페이지에서 출력할 식당의 갯수
		String category = req.getParameter("scategory");
		String search = req.getParameter("search");
		if(req.getParameter("num")!=null) {//더보기값이 있을경우
			num=Integer.parseInt(req.getParameter("num"));
		}
		
		/*
		 * ServletContext application = req.getServletContext(); ArrayList<String>
		 * searchList=(ArrayList<String>) application.getAttribute("searchList");
		 */
	
		/*
		 * if(searchList!=null) {//검색리스트가 null이 아니라면 application에 저장 ArrayList<>
		 * application.setAttribute("searchList", searchList); }
		 */
		
		System.out.println("배열");
		ResDAO resDAO = new ResDAO();
		ResVO rvo = new ResVO();
		
		if(category.equals("name")) {//이름 검색
			rvo.setResName(search);
		}else if(category.equals("menuCategory")) {//카테고리 검색
			rvo.setResCategory(search);
		}		
		
		ArrayList<ResVO> resDatas = resDAO.resSelectAll(rvo,num);
		req.setAttribute("num", num);
		req.setAttribute("category", category);
		req.setAttribute("resDatas",resDatas);
		req.setAttribute("search", search);
		
		
		forward.setPath("resList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
	
}
