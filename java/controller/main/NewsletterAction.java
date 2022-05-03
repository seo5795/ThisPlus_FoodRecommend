package controller.main;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;

public class NewsletterAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		System.out.println("로그로그로");
		System.out.println(req.getParameter("useremail"));


		String host = "smtp.naver.com"; // 사용할 사이트
		final String user = "jdaaaaun1@naver.com"; // ID
		final String password = "jung000422"; // PW

		String to = req.getParameter("useremail"); // 보낼 이메일 주소


		// Get the session object
		Properties props = new Properties();
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.ssl.protocols", "TLSv1.2");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
		});

		// Compose the message
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

			// Subject
			message.setSubject("오늘의 메뉴 구독 완료!");

			// Text
			message.setText("새로운 맛집들을 소개해드릴게요!");

			// send the message
			Transport.send(message);
			System.out.println("이메일 전송 성공!");

		} catch (MessagingException e) {
			e.printStackTrace();
		}



		ActionForward forward=new ActionForward();
		forward.setPath("main.do");

		forward.setRedirect(true);

		return forward;
	}

}