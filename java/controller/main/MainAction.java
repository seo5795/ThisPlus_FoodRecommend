package controller.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.restaurant.ResDAO;
import model.restaurant.ResVO;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int num=6; //메인페이지에서 출력할 식당의 갯수
		String category="양식";//특정카테고리가 포함된 식당 출력
			
		ResDAO resDAO = new ResDAO();
		ResVO rvo = new ResVO();
		
		ArrayList<ResVO> avgDatas = resDAO.resSelectAllMain(rvo, num, "avg");//평점순위
		ArrayList<ResVO> locationDatas = resDAO.resSelectAllMain(rvo, num, "location");//위치순위
		ArrayList<ResVO> menuDatas = resDAO.resSelectAllMain(rvo, num, category);//메뉴순위
		
		request.setAttribute("avgDatas", avgDatas);
		request.setAttribute("locationDatas", locationDatas);
		request.setAttribute("menuDatas", menuDatas);
		
		 ServletContext application = request.getServletContext(); 
		 ArrayList<String> searchList=(ArrayList<String>) application.getAttribute("searchList");
		
		
		 if(searchList == null) { 
			 searchList=new ArrayList<String>();
		 }
		
		request.setAttribute("rsearchList", searchList);
		ActionForward forward=new ActionForward();

		forward.setPath("main.jsp");
		forward.setRedirect(false);



		return forward;

	}



}
