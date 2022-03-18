package controller.common;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class CrawlingListener
 *
 */
@WebListener
public class CrawlingListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public CrawlingListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         try {
			Crawling.start();
			System.out.println("로그: 리스너 클래스: 크롤링 완료");
	         ServletContext sc=sce.getServletContext();
//	         sc.setAttribute("title", Crawling.title);
//	         sc.setAttribute("category", Crawling.category);
//	         sc.setAttribute("rate", Crawling.rate);
//	         sc.setAttribute("address", Crawling.address);
//	         sc.setAttribute("phonenum", Crawling.phonenum);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}