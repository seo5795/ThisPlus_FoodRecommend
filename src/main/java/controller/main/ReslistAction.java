package controller.main;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

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

		//===========검색알고리즘==========
		ServletContext application = req.getServletContext(); 
		//검색리스트 불러오기
		ArrayList<String> searchList=(ArrayList<String>) application.getAttribute("searchList");


		if(searchList == null) {//검색리스트가 없다면 arrayList생성
			searchList=new ArrayList<String>();
		}

		Boolean flag=false;//분기처리용 flag변수
		
		
		for (int i = 0; i < searchList.size(); i++) {
			if(searchList.get(i).equals(search)) {
				//검색목록리스트에 중복 검색항목이 있다면 true
				flag=true;
			}
		}
		
		if(!flag) {//검색목록리스트에 중복 검색 항목이 없다면 리스트 추가
			searchList.add(0,search);
		}
		//application에 검색리스트 저장
		application.setAttribute("searchList", searchList); 

		
		//======식당 리스트 페이지 정보넘겨주는 코드========
		System.out.println("배열");
		ResDAO resDAO = new ResDAO();
		ResVO rvo = new ResVO();

		if(category.equals("name")) {//이름 검색
			rvo.setResName(search);
		}else if(category.equals("menuCategory")) {//카테고리 검색
			rvo.setResCategory(search);
		}		

		ArrayList<ResVO> resDatas = resDAO.resSelectAll(rvo,num);//검색으로 화면에 보여줄 데이터
		ArrayList<ResVO> allresDatas = resDAO.resSelectAll(rvo, 0);//검색으로 인해 
		req.setAttribute("resDatas",resDatas);//검색으로 화면에 보여줄 데이터
		req.setAttribute("num", num);//보여줄 데이터 숫자
		req.setAttribute("cnt", allresDatas.size() );//검색데이터 크기
		req.setAttribute("category", category);	
		req.setAttribute("search", search);


		forward.setPath("resList.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
