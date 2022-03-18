package controller.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;
import model.dao.BoardDAO;
import model.vo.BoardSet;
import model.vo.BoardVO;

public class MainAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String a=request.getParameter("a");
		System.out.println("a: "+a);
		int b=3;
		if(request.getParameter("b")!=null) {
			b=Integer.parseInt(request.getParameter("b"));
		}
		System.out.println("b: "+b);
		
		BoardDAO boardDAO=new BoardDAO();
		BoardVO bvo=new BoardVO();
		bvo.setMid(a);
		ArrayList<BoardSet> datas=boardDAO.selectAll(bvo,b);
		request.setAttribute("datas", datas);
		request.setAttribute("a", a);
		// VIEW에서 ${a}를 사용하는것을 알고있었다면,
		// 사전에 미리 a를 req.setAttribute()했어야한다!!!
		request.setAttribute("b", b);
		ActionForward forward=new ActionForward();
		forward.setPath("main.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
