package controller.common;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.main.CustomerServiceAction;
import controller.main.FindPwAction;
import controller.main.LoginAction;
import controller.main.LogoutAction;
import controller.main.MainAction;
import controller.main.MemNoticeAction;
import controller.main.MemdeleteAction;
import controller.main.MemmypageAction;
import controller.main.MemmypageupdateAction;
import controller.main.MenudeleteAction;
import controller.main.MenudetailAction;
import controller.main.MenuinsertAction;
import controller.main.MenuupdateAction;
import controller.main.NewsletterAction;
import controller.main.ResdeleteAction;
import controller.main.ResdetailAction;
import controller.main.ResinsertAction;
import controller.main.ReslistAction;
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
      System.out.println(command);


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
         // 이미지 업로드 파트
         // JSP에서 application(내장객체,scope)을 이용하는 코드 -> sc객체
         ServletContext sc=request.getServletContext();

         // MultipartRequest에는 5가지 인자 필요
         String path=sc.getRealPath("imgUpload"); // server.core 폴더명
         int maxSize=1024*1024*200; // 200mb
         String encType="UTF-8";
         DefaultFileRenamePolicy originname=new DefaultFileRenamePolicy();

         MultipartRequest mr=new MultipartRequest(request,path,maxSize,encType,originname);
         System.out.println("해결하자!");

         // 저장한 파일명 스트링으로 추출
         Enumeration files = mr.getFileNames();
         String nameStr = (String)files.nextElement();
         String saveName = mr.getFilesystemName(nameStr);

         String filename=mr.getOriginalFileName("imgUpload"); // 원래 이름
         String realname=mr.getFilesystemName("imgUpload"); // 저장된 이름

         // 이미지 경로를 변경
         // movePath에 원하는 경로를 기입
         String movePath="C:\\SEO\\workspace2\\TP_THISPLUS\\src\\main\\webapp\\imgUpload\\memPic\\";
         // db에 등록하기 위한 경로
         String dbPath="imgUpload/memPic/";

         try {
            FileInputStream fis=new FileInputStream(path+"\\"+saveName);
            FileOutputStream fos=new FileOutputStream(movePath+saveName);

            byte[] buff=new byte[3000];
            int len;
            while((len=fis.read(buff))!=-1) {
               fos.write(buff, 0, len);
            }

            fos.flush();
            fos.close();
         }catch (Exception e) {
            e.printStackTrace();
         }
         finally {
            System.out.println("이미지 복사 완료");
            System.out.println("최종 저장경로 : "+movePath);
         }

         // 멀티리퀘스트의 파라미터를 리퀘스트에 삽입

         request.setAttribute("memid",mr.getParameter("memid"));
         request.setAttribute("memPw",mr.getParameter("memPw"));
         request.setAttribute("memName",mr.getParameter("memName"));
         request.setAttribute("memEmail",mr.getParameter("memEmail"));
         request.setAttribute("memAdd",mr.getParameter("memAdd"));
         request.setAttribute("memPhone",mr.getParameter("memPhone"));
         request.setAttribute("memRank",mr.getParameter("memRank"));
         request.setAttribute("memPic",dbPath+saveName);

         System.out.println("1회원계정 : "+request.getAttribute("memid"));
         System.out.println("실제사진경로 : "+movePath+saveName);
         System.out.println("DB사진경로 : "+dbPath+saveName);

         forward=new SignupAction().execute(request, response);
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
         // JSP에서 application(내장객체,scope)을 이용하는 코드 -> sc객체
         ServletContext sc=request.getServletContext();

         // MultipartRequest에는 5가지 인자 필요
         String path=sc.getRealPath("imgUpload"); // server.core 폴더명
         int maxSize=1024*1024*200; // 200mb
         String encType="UTF-8";
         DefaultFileRenamePolicy originname=new DefaultFileRenamePolicy();

         MultipartRequest mr=new MultipartRequest(request,path,maxSize,encType,originname);

         // 저장한 파일명 스트링으로 추출
         Enumeration files = mr.getFileNames();
         String nameStr = (String)files.nextElement();
         String saveName = mr.getFilesystemName(nameStr);

         String filename=mr.getOriginalFileName("imgUpload"); // 원래 이름
         String realname=mr.getFilesystemName("imgUpload"); // 저장된 이름

         // 이미지 경로를 변경
         // movePath에 원하는 경로를 기입
         String movePath="C:\\SEO\\workspace2\\TP_THISPLUS\\src\\main\\webapp\\imgUpload\\resPic\\";
         // db에 등록하기 위한 경로
         String dbPath="imgUpload/resPic/";
         try {
            FileInputStream fis=new FileInputStream(path+"\\"+saveName);
            FileOutputStream fos=new FileOutputStream(movePath+saveName);

            byte[] buff=new byte[3000];
            int len;
            while((len=fis.read(buff))!=-1) {
               fos.write(buff, 0, len);
            }

            fos.flush();
            fos.close();
         }catch (Exception e) {
            e.printStackTrace();
         }
         finally {
            System.out.println("이미지 복사 완료");
            System.out.println("최종 저장경로 : "+movePath);
         }

         // 멀티리퀘스트의 파라미터를 리퀘스트에 삽입
         request.setAttribute("resName",mr.getParameter("resName"));
         request.setAttribute("resCategory",mr.getParameter("resCategory"));
         request.setAttribute("resAdd",mr.getParameter("resAdd"));
         request.setAttribute("resPhone",mr.getParameter("resPhone1")+"-"+mr.getParameter("resPhone2")+"-"+mr.getParameter("resPhone3"));
         request.setAttribute("resPic",dbPath+saveName);

         System.out.println("식당이름 : "+request.getAttribute("resName"));
         System.out.println("식당분류 : "+request.getAttribute("resCategory"));
         System.out.println("식당주소 : "+request.getAttribute("resAdd"));
         System.out.println("식당연락처 : "+request.getAttribute("resPhone"));
         System.out.println("실제사진경로 : "+movePath+saveName);
         System.out.println("DB사진경로 : "+dbPath+saveName);

         forward=new ResinsertAction().execute(request, response);
      }

      else if(command.equals("/reslist.do")) {
         forward=new ReslistAction().execute(request, response);
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
         try {
            forward=new MenuinsertAction().execute(request, response);
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
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
      else if(command.equals("/resdetail.do")) {
         System.out.println("FC: 식당상세페이지");
         forward = new ResdetailAction().execute(request, response);
      }
      else if (command.equals("/notice.do")) {
         System.out.println("로그 FC 공지페이지");
         try {
            forward = new MemNoticeAction().execute(request, response);
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }else if(command.equals("/Newsletter.do")) {
         try {
            forward=new NewsletterAction().execute(request, response);
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      else if(command.equals("/CustomerService.do")) {
         try {
            System.out.println("로로로로로로로그그그그그그");
            forward=new CustomerServiceAction().execute(request, response);
         } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      else if (command.equals("/findPw.do")) {
          try {
             forward = new FindPwAction().execute(request, response);
          } catch (Exception e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }
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
   }
}