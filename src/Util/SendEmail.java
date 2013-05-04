package Util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


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
			  
			  // Create a default MimeMessage object.
		         MimeMessage message = new MimeMessage(session);
	
		         // Set From: header field of the header.
		         message.setFrom(new InternetAddress(user));
	
		         // Set To: header field of the header.
		         message.addRecipient(Message.RecipientType.TO,
		                                  new InternetAddress(to));
	
		         // Set Subject: header field
		         message.setSubject("Recuperación de Contraseña");
	
		         // Send the actual HTML message, as big as you like
		         String messa = "Hola," + name + "<br><br>" +
		    		" Haz click en el siguiente bot&oacute;n para activar su cuenta. <br><br> " +
	    			" <div style='background-color: #8565ad; padding: 10px; text-decoration:none; color:#ffffff; text-align:center;'><strong>" +
	    			" <a href='www.facebook.com'>Activar Mi Cuenta</a></strong></div> <br><br>" +
		    		" Si el anterior vínculo no funciona, copie y pegue la anterior URL en la barra de dirección del explorador <br>" +
		    		" www.prueba.com .<br><br>" +
		    		" Atentamente, equipo de apoyo de Arma Tu Torta";
	
		         message.setContent(messa,"text/html" );
		         
		         
		      Transport.send(message);
		 
		   }catch (MessagingException ex) {
			   ex.printStackTrace();
		   }
		 }
		
	
	public static void sendEmailPassword(Properties propertiesFile, String email, String name, String newPassword, boolean attach, String pref) {
		
		
		
		  String to = email;
		  final String user= propertiesFile.getProperty(pref + "EmailCountFrom");
		  final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
				
		  Properties properties = System.getProperties();
		  properties.setProperty("mail.smtp.host", propertiesFile.getProperty(pref + "EmailServer") );
		  properties.setProperty("mail.smtp.port", "587");
		  properties.setProperty("mail.smtp.starttls.enable", "true");
		  properties.put("mail.smtp.auth", "true");
		  
		  Session session = Session.getDefaultInstance(properties,
		   new javax.mail.Authenticator() {
			  protected PasswordAuthentication getPasswordAuthentication() {
			   return new PasswordAuthentication(user,password);
			  }
		  });
		   
		  try{
			  // Create a default MimeMessage object.
		         MimeMessage message = new MimeMessage(session);

		         // Set From: header field of the header.
		         message.setFrom(new InternetAddress(user));

		         // Set To: header field of the header.
		         message.addRecipient(Message.RecipientType.TO,
		                                  new InternetAddress(to));

		         // Set Subject: header field
		         message.setSubject("Recuperación de Contraseña");

		         // Send the actual HTML message, as big as you like
		         String messa = "<div style='color: gray;'>Hola, " + name + ".<br>" +
		        		 "A continuación encontrará la información para acceder a su cuenta: <br><br>"
		        		 + "Su usuario es: " + email + "<br>"+
		        		 "Su nueva contrase&ntilde;a es:" + newPassword +"<br><br>"+
		        		 "Atentamente, equipo de apoyo de Arma Tu Torta.</div>";

		         message.setContent(messa,"text/html" );

		         // Send message
		         Transport.send(message);
		   }catch (MessagingException ex) {
			   ex.printStackTrace();
		   }
	 }
		
	
}
