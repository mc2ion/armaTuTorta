package Util;

import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;


public class SendEmail  extends Thread  {

	public static void sendEmail(Properties propertiesFile, String email, String name, boolean attach, String pref) {
		
		
		
		  String to = email;
		  final String user= propertiesFile.getProperty(pref + "EmailCountFrom");
		  final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
				
		  Properties properties = System.getProperties();
		  properties.setProperty("mail.smtp.host", propertiesFile.getProperty(pref + "EmailServer") );
		  properties.setProperty("mail.smtp.port", "587");
		  properties.setProperty("mail.smtp.starttls.enable", "true");
		  properties.put("mail.smtp.auth", "true");
		  properties.put("mail.debug", "true");
		  
		  Session session = Session.getDefaultInstance(properties,
		   new javax.mail.Authenticator() {
			  protected PasswordAuthentication getPasswordAuthentication() {
			   return new PasswordAuthentication(user,password);
			  }
		  });
		   
		  try{
		    MimeMessage message = new MimeMessage(session);
		    message.setFrom(new InternetAddress(user));
		    message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));
		    message.setSubject(propertiesFile.getProperty(pref + "EmailSubject"));
		    
		    BodyPart messageBodyPart1 = new MimeBodyPart();
		    
	    	messageBodyPart1.setText( "Hola," + name + "\n\n " +
		    		" Haz click en el siguiente bot&oacute;n para activar su cuenta. \n\n " +
	    			" <span style='background-color: #3366ff; padding: 10px;'><strong>" +
	    			" <a href='www.facebook.com'>Activar Mi Cuenta</a></strong></span> \n\n" +
		    		" Si el anterior vínculo no funciona, copie y pegue la anterior URL en la barra de dirección del explorador \n" +
		    		" www.prueba.com ");
		    
		    Multipart multipart = new MimeMultipart();
		    multipart.addBodyPart(messageBodyPart1);
		    message.setContent(multipart, "text/html");
		    Transport.send(message);
		 
		   }catch (MessagingException ex) {
			   ex.printStackTrace();
		   }
		 }
		
	
}
