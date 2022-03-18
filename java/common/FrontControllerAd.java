package controller.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.admin.AdminNoticeMainAction;

/**
 * Servlet implementation class FrontControllerAd
 */
@WebServlet("*.did")
public class FrontControllerAd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FrontControllerAd() {
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
		
		System.out.println(command);
		
		ActionForward forward=null;

		if(command.equals("/main.did")) {
			forward = new ActionForward();
			forward.setPath("admin/AdminMain.jsp");
			forward.setRedirect(true);
		}else if(command.equals("/admin/adminNotMain.did")) {
			System.out.println("FC:공지사항보기");
			forward=new AdminNoticeMainAction().execute(request,response);
		}	else {
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
	}

}
