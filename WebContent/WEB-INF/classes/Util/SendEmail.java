package Util;

import java.util.Arrays;
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
	
	
	public static void sendContactEmail(Properties propertiesFile, String email, String name, String phone, String msg,  boolean attach, String pref) {
		
		  String to = propertiesFile.getProperty(pref + "EmailCountFrom");
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
		         message.setSubject("Tienes un nuevo comentario o mensaje");

		         // Send the actual HTML message, as big as you like
		         String messa = "<div style='color: #8904B1;'>Hola, has recibido un nuevo comentario a través de " +
		         		"la p&aacute;gina web de Arma Tu Torta.<br><br>" +
		        		 "A continuación encontrarás los datos de la persona que escribi&oacute; y su mensaje: <br><br>"
		        		 + "<strong>Nombre: </strong>" + name + "<br>"
		        		 + "<strong>Email:</strong> " + email + "<br>"
		        		 + "<strong>Tel&efono:</strong> " + phone + "<br>"
		        		 + "<strong>Mensaje:</strong> " + msg + "<br>";
		         message.setContent(messa,"text/html" );

		         // Send message
		         Transport.send(message);
		   }catch (MessagingException ex) {
			   ex.printStackTrace();
		   }
	 }
	
	
	public static void sendContactEmailCopy(Properties propertiesFile, String email, String name, String phone, String msg,  boolean attach, String pref) {
		
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
		         message.setSubject("Copia de mensaje envíado a Arma Tu Torta");

		         // Send the actual HTML message, as big as you like
		         String messa = "<div style='color: #8904B1;'>Hola, " + name + ", <br><br>"
		        		 + "A continuación encontrarás una copia del mensaje que nos enviaste " +
		        		 " Arma Tu Torta <br><br>"
		        		 + "<strong> Nombre:</strong>  " + name + "<br>"
		        		 + "<strong> Email:</strong> " + email + "<br>"
		        		 + "<strong> Tel&efono:</strong> " + phone + "<br>"
		        		 + "<strong> Mensaje:</strong> " + msg + "<br><br>" +
        		 		"Gracias por escribirnos, te responderemos en la brevedad posible.<br><br>" +
        		 		"Atentamente, Equipo de Apoyo de Arma Tu Torta.";
		         
		         
		         message.setContent(messa,"text/html" );

		         // Send message
		         Transport.send(message);
		   }catch (MessagingException ex) {
			   ex.printStackTrace();
		   }
	 }
	
	
	public static void sendEmailOrderCake(Properties propertiesFile, String numPedido, boolean attach, String pref,
			String[] datos, String[] relleno, String nombre, String correo, String telefono) {
		
	
		
		  String to = propertiesFile.getProperty(pref + "EmailCountFrom");
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
		         message.setSubject("Tienes un nuevo pedido: No." + numPedido);
	
		         // Send the actual HTML message, as big as you like
		         String messa = "Has recibido un nuevo pedido. <br><br>" +
		    		"<strong> Datos del pedido.</strong><br><br>" +
		    		" Producto pedido: Torta<br>" +
		    		" Forma: " + datos[0] + "<br>" +
		     		" Tama&ntilde;o: " + datos[1]  + "<br>" +
		     		" Sabor del ponqu&eacute; " + datos[2]  + "<br>" +
		     		" Cantidad de capas: " + datos[3]  + "<br>" +
		     		" Sabores de capas: " + Arrays.deepToString(relleno) + "<br>" +
		     		" Sabores de cubierta: " + datos[4] + ".<br><br>" +
		     		" <strong>Datos del comprador:</strong> <br><br> " +
		     		" Nombre :" + nombre +  "<br>" +
		     		" Correo Electr&oacute;nico :" + correo + "<br>" +
		     		" Tel&eacute;fono :" + telefono + ".";
		         message.setContent(messa,"text/html" );
		         
		         
		      Transport.send(message);
		 
		   }catch (MessagingException ex) {
			   ex.printStackTrace();
		   }
	}
		
		
	
}
