package controller.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import controller.main.LoginAction;
import controller.main.LogoutAction;
import controller.main.MainAction;
import controller.main.SignupAction;



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
		else if(command.equals("/logout.do")) {
			forward=new LogoutAction().execute(request,response);
		}
		else if(command.equals("/signup.do")) {
			forward=new SignupAction().execute(request,response);
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
