package com.moving.util;

import java.nio.charset.Charset;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Repository;

@Repository
public class MailSenderUtil {

	public String send(String recipient) {
		
		final String userName = "wnghks1357";
		final String password = "likeFirst!1";
		String title = "MovingHair 임시 비밀번호 입니다.";
		String contents = "";
		
		
		String uuid = "";
		//임시 비밀번호 생성 
		for (int i = 0; i < 5; i++) { 
			uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
			uuid = uuid.substring(0, 10); //uuid를 앞에서부터 10자리 잘라줌. 
		} 
	 
	    contents = "고객님의 임시 비밀번호는 '" + uuid +"' 입니다.";
	    contents += "반드시 로그인 후 패스워드를 변경해 주세요.";
		
		// 네이버일 경우 smtp.naver.com 을 입력합니다.  

		// Google일 경우 smtp.gmail.com 을 입력합니다.  

		String host = "smtp.naver.com";
		
		int port=465; //포트번호  
		
		Properties props = System.getProperties();
		
		// 정보를 담기 위한 객체 생성  

		// SMTP 서버 정보 설정  

		props.put("mail.smtp.host", host);  

		props.put("mail.smtp.port", port);  

		props.put("mail.smtp.auth", "true");  

		props.put("mail.smtp.ssl.enable", "true");  

		props.put("mail.smtp.ssl.trust", host);  

		//Session 생성  

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {  

		String un=userName;  

		String pw=password;  

		protected javax.mail.PasswordAuthentication getPasswordAuthentication() {  

			return new javax.mail.PasswordAuthentication(un, pw);  

		}  

		});  

		session.setDebug(true); //for debug  

		Message mimeMessage = new MimeMessage(session); //MimeMessage 생성 
		
		try {

			mimeMessage.setFrom(new InternetAddress("wnghks1357@naver.com")); //발신자 셋팅 , 보내는 사람의 이메일주소를 한번 더 입력합니다. 이때는 이메일 풀 주소를 다 작성해주세요.  
	
			mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient)); //수신자셋팅  
	
			mimeMessage.setSubject(title); //제목셋팅  
	
			mimeMessage.setText(contents); //내용셋팅 
	
			Transport.send(mimeMessage); //javax.mail.Transport.send() 이용 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
}
