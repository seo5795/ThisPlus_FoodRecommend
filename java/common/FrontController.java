package controller.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.main.LoginAction;
import controller.main.LogoutAction;
import controller.main.MainAction;
import controller.main.MemdeleteAction;
import controller.main.MemmypageAction;
import controller.main.MemmypageupdateAction;
import controller.main.MenudeleteAction;
import controller.main.MenudetailAction;
import controller.main.MenuinsertAction;
import controller.main.MenuupdateAction;
import controller.main.ResdeleteAction;
import controller.main.ResdetailAction;
import controller.main.ResinsertAction;
import controller.main.ResupdateAction;
import controller.main.RevdeleteAction;
import controller.main.RevdetailAction;
import controller.main.RevinsertAction;
import controller.main.RevupdateAction;
import controller.main.SignupAction;
import controller.main.SnsLoginAction;



/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request,response);
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri=request.getRequestURI();
		String cp=request.getContextPath();
		String command=uri.substring(cp.length());

		ActionForward forward=null;

		if(command.equals("/main.do")) {
			System.out.println("FC: main.do 실행됨");
			forward=new MainAction().execute(request,response);
		}
		else if(command.equals("/login.do")) {
			System.out.println("FC: login.do 실행됨");
			forward=new LoginAction().execute(request,response);
		}
		else if(command.equals("/snslogin.do")) {
			var id = request.getParameter("memId");
			var rank = request.getParameter("memRank");
			System.out.println("fc-id:"+id);
			System.out.println("fc-rank:"+rank);
			try {
				forward=new SnsLoginAction().execute(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(command.equals("/logout.do")) {
			forward=new LogoutAction().execute(request,response);
		}
		else if(command.equals("/signup.do")) {
			forward=new SignupAction().execute(request,response);
		}
		//식당
		else if(command.equals("/resdetail.do")) {
			forward=new ResdetailAction().execute(request, response);
		}
		else if(command.equals("/resdelete.do")) {
			forward=new ResdeleteAction().execute(request, response);
		}
		else if(command.equals("/resupdate.do")) {
			forward=new ResupdateAction().execute(request, response);
		}
		else if(command.equals("/resinsert.do")) {
			forward=new ResinsertAction().execute(request, response);
		}
		//리뷰
		else if(command.equals("/revdetail.do")) {
			forward=new RevdetailAction().execute(request, response);
		}
		else if(command.equals("/revupdate.do")) {
			forward=new RevupdateAction().execute(request, response);
		}
		else if(command.equals("/revinsert.do")) {
			forward=new RevinsertAction().execute(request, response);
		}
		else if(command.equals("/revdelete.do")) {
			forward=new RevdeleteAction().execute(request, response);
		}
		//메뉴
		else if(command.equals("/menudetail.do")) {
			forward=new MenudetailAction().execute(request, response);
		}
		else if(command.equals("/menuupdate.do")) {
			forward=new MenuupdateAction().execute(request, response);
		}
		else if(command.equals("/menuinsert.do")) {
			forward=new MenuinsertAction().execute(request, response);
		}
		else if(command.equals("/menudelete.do")) {
			forward=new MenudeleteAction().execute(request, response);
		}
		//회원
		else if(command.equals("/memmypageupdate.do")) {
			forward=new MemmypageupdateAction().execute(request, response);
		}
		else if(command.equals("/memmypage.do")) {
			forward=new MemmypageAction().execute(request, response);
		}
		else if(command.equals("/memdelete.do")) {
			forward=new MemdeleteAction().execute(request, response);
		}

		else {
			throw new ServletException("command 요청에러!");
		}


		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}
			else {
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}


		PrintWriter out=response.getWriter();

		out.println("<script>alert('command 요청처리실패!');history.go(-1);</script>");
		System.out.println("3");
	}
}