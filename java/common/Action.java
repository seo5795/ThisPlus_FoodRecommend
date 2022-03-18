package controller.common;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//모든 요청처리로직(==메서드)은
//반드시 res, req를 가져야한다!==강제
//->추상메서드=> 인터페이스
public interface Action {
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception;
	
	 //1-어디로갈지(페이지 정보)
    //2-어떻게 갈지(forward,sendRedirect)
    //어디로 어떻게 == 객체화 -> ActionForward ex)vo
		
	
}
