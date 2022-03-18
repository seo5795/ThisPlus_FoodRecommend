package controller.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

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
	
			System.out.println("안녕");
			String phone = request.getParameter("phone");
			System.out.println("phone: "+phone);

			//5자리 난수 생성(10000~99999)
			int randomNum = (int)(Math.random() * (99999 - 10000 + 1)) + 10000;
			//random()은 타입이 double인 값을 반환하므로 int타입으로 형변환
			System.out.println(randomNum);
			System.out.println("1");

			PrintWriter out = response.getWriter();
			JSONObject jobj = new JSONObject();
			System.out.println("2");
			// 문자열 전송
			//	jobj.put("str", str);
			jobj.put("randomNum", randomNum);
			 out.print(jobj.toString()); 
			 out.flush();
			 

			System.out.println("2");
			//문자보내는 메서드
			//SmsApi msg = new SmsApi();
			//msg.sms(randomNum, phone);

		}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	
}
