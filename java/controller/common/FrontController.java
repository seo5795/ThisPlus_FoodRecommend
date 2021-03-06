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
         System.out.println("FC: main.do ?????????");
         forward=new MainAction().execute(request,response);
      }
      else if(command.equals("/login.do")) {
         System.out.println("FC: login.do ?????????");
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
         // ????????? ????????? ??????
         // JSP?????? application(????????????,scope)??? ???????????? ?????? -> sc??????
         ServletContext sc=request.getServletContext();

         // MultipartRequest?????? 5?????? ?????? ??????
         String path=sc.getRealPath("imgUpload"); // server.core ?????????
         int maxSize=1024*1024*200; // 200mb
         String encType="UTF-8";
         DefaultFileRenamePolicy originname=new DefaultFileRenamePolicy();

         MultipartRequest mr=new MultipartRequest(request,path,maxSize,encType,originname);
         System.out.println("????????????!");

         // ????????? ????????? ??????????????? ??????
         Enumeration files = mr.getFileNames();
         String nameStr = (String)files.nextElement();
         String saveName = mr.getFilesystemName(nameStr);

         String filename=mr.getOriginalFileName("imgUpload"); // ?????? ??????
         String realname=mr.getFilesystemName("imgUpload"); // ????????? ??????

         // ????????? ????????? ??????
         // movePath??? ????????? ????????? ??????
         String movePath="C:\\SEO\\workspace2\\TP_THISPLUS\\src\\main\\webapp\\imgUpload\\memPic\\";
         // db??? ???????????? ?????? ??????
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
            System.out.println("????????? ?????? ??????");
            System.out.println("?????? ???????????? : "+movePath);
         }

         // ????????????????????? ??????????????? ??????????????? ??????

         request.setAttribute("memid",mr.getParameter("memid"));
         request.setAttribute("memPw",mr.getParameter("memPw"));
         request.setAttribute("memName",mr.getParameter("memName"));
         request.setAttribute("memEmail",mr.getParameter("memEmail"));
         request.setAttribute("memAdd",mr.getParameter("memAdd"));
         request.setAttribute("memPhone",mr.getParameter("memPhone"));
         request.setAttribute("memRank",mr.getParameter("memRank"));
         request.setAttribute("memPic",dbPath+saveName);

         System.out.println("1???????????? : "+request.getAttribute("memid"));
         System.out.println("?????????????????? : "+movePath+saveName);
         System.out.println("DB???????????? : "+dbPath+saveName);

         forward=new SignupAction().execute(request, response);
      }
      //??????
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
         // JSP?????? application(????????????,scope)??? ???????????? ?????? -> sc??????
         ServletContext sc=request.getServletContext();

         // MultipartRequest?????? 5?????? ?????? ??????
         String path=sc.getRealPath("imgUpload"); // server.core ?????????
         int maxSize=1024*1024*200; // 200mb
         String encType="UTF-8";
         DefaultFileRenamePolicy originname=new DefaultFileRenamePolicy();

         MultipartRequest mr=new MultipartRequest(request,path,maxSize,encType,originname);

         // ????????? ????????? ??????????????? ??????
         Enumeration files = mr.getFileNames();
         String nameStr = (String)files.nextElement();
         String saveName = mr.getFilesystemName(nameStr);

         String filename=mr.getOriginalFileName("imgUpload"); // ?????? ??????
         String realname=mr.getFilesystemName("imgUpload"); // ????????? ??????

         // ????????? ????????? ??????
         // movePath??? ????????? ????????? ??????
         String movePath="C:\\SEO\\workspace2\\TP_THISPLUS\\src\\main\\webapp\\imgUpload\\resPic\\";
         // db??? ???????????? ?????? ??????
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
            System.out.println("????????? ?????? ??????");
            System.out.println("?????? ???????????? : "+movePath);
         }

         // ????????????????????? ??????????????? ??????????????? ??????
         request.setAttribute("resName",mr.getParameter("resName"));
         request.setAttribute("resCategory",mr.getParameter("resCategory"));
         request.setAttribute("resAdd",mr.getParameter("resAdd"));
         request.setAttribute("resPhone",mr.getParameter("resPhone1")+"-"+mr.getParameter("resPhone2")+"-"+mr.getParameter("resPhone3"));
         request.setAttribute("resPic",dbPath+saveName);

         System.out.println("???????????? : "+request.getAttribute("resName"));
         System.out.println("???????????? : "+request.getAttribute("resCategory"));
         System.out.println("???????????? : "+request.getAttribute("resAdd"));
         System.out.println("??????????????? : "+request.getAttribute("resPhone"));
         System.out.println("?????????????????? : "+movePath+saveName);
         System.out.println("DB???????????? : "+dbPath+saveName);

         forward=new ResinsertAction().execute(request, response);
      }

      else if(command.equals("/reslist.do")) {
         forward=new ReslistAction().execute(request, response);
      }
      //??????
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
      //??????
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
      //??????
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
         System.out.println("FC: ?????????????????????");
         forward = new ResdetailAction().execute(request, response);
      }
      else if (command.equals("/notice.do")) {
         System.out.println("?????? FC ???????????????");
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
            System.out.println("???????????????????????????????????????");
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
         throw new ServletException("command ????????????!");
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

     out.println("<script>alert('command ??????????????????!');history.go(-1);</script>");
   }
}