package controller.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import model.common.JDBCUtil;
import model.member.MemVO;

/**
 * Servlet implementation class AjaxController
 */
@WebServlet("*.a")
public class AjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AjaxController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String uri=request.getRequestURI();
		String cp=request.getContextPath();
		String command=uri.substring(cp.length());
		System.out.println(command);

		if(command.equals("/ajax.a")) {
			System.out.println("안녕");
			String phone = request.getParameter("phone");
			System.out.println("phone: "+phone);

			//5자리 난수 생성(10000~99999)
			int randomNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
			//random()은 타입이 double인 값을 반환하므로 int타입으로 형변환
			System.out.println(randomNum);

			PrintWriter out = response.getWriter();
			JSONObject jobj = new JSONObject();
			
			// 문자열 register.jsp에 전송
			jobj.put("randomNum", randomNum);
			out.print(jobj.toString()); 
			out.flush();

			System.out.println("2");
						
			//문자보내는 메서드
			//SmsApi msg = new SmsApi();
			//msg.sms(randomNum, phone);
			
			
		}else if(command.equals("/check.a")){
			System.out.println("확인");
			String id = request.getParameter("id");
			System.out.println("id:"+ id);

			String sql = "select count(*) cnt from member where memId =  ?";
			PrintWriter out = response.getWriter();
			JSONObject data = null;

			Connection conn = JDBCUtil.connect();
			PreparedStatement pstmt=null;
			try {

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);

				ResultSet rs = pstmt.executeQuery();
				rs.next();
				int cnt = rs.getInt("cnt");
				data = new JSONObject();
				System.out.println(cnt);
		        data.put("count", cnt);   // { "count":0 }
		        out.print(data.toString()); 
				out.flush();
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				JDBCUtil.disconnect(pstmt, conn);
			}
		}



	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}



}