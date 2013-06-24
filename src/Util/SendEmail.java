package Util;


import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import domain.Client;


public class SendEmail  extends Thread  {

	/**
	 * sendEmail - Ready to server
	 * @param propertiesFile
	 * @param email
	 * @param name
	 * @param passwordUser
	 * @param attach
	 * @param pref
	 */
	public static void sendEmail(Properties propertiesFile, String email, String name, String passwordUser, boolean attach, String pref) {
		
		String to = email;
		final String from = propertiesFile.getProperty(pref + "EmailCountFrom");
		final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
		final String port = propertiesFile.getProperty(pref + "EmailPort");
		final String server = propertiesFile.getProperty(pref + "EmailServer");
		final String fromName = propertiesFile.getProperty(pref + "EmailFromUser");
		boolean debug = false;		  
		Properties props = new Properties();
		
		props.put("mail.smtp.host", server);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtps.port", port);
        props.put("mail.smtps.ssl.trust", server);
        
        Session session = Session.getDefaultInstance(props, null);
        
        session.setDebug(debug);
        
        try{
        	MimeMessage mimemessage = new MimeMessage(session);
        	InternetAddress addressFrom = new InternetAddress( from, fromName );
	          
        	mimemessage.setFrom(addressFrom);
	          
        	InternetAddress[] addressTo = new InternetAddress[1];
	          
        	addressTo[0] = new InternetAddress(to);
        	mimemessage.setRecipients(Message.RecipientType.TO, addressTo);
        	mimemessage.setSubject("Registro en la Página Web de ArmaTuTorta ", "ISO-8859-1");
        	
        	String messa = "Hola " + name + ",<br><br>" +
    			" A continuaci&oacute;n encontrar&aacute;s la informaci&oacute;n de tu cuenta: <br><br> " +
    			" <strong> Nombre de Usuario: </strong>" + email + "<br><br>"+	 
    			" <strong> Contrase&ntilde;a </strong>" + passwordUser + "<br><br>"+	 
    			" Atentamente, equipo de apoyo de <a href=\"www.armatutorta.com.ve\"> Arma Tu Torta </a>";
	                	
        	mimemessage.setContent( messa , "text/html");
	          
        	Transport transport = session.getTransport("smtp"); 
	          
        	transport.connect(server, from, password); 
        	transport.sendMessage(mimemessage, mimemessage.getAllRecipients()); 
        	transport.close();
        	System.out.println("Correo enviado. Enjoy!!!");
	          
        } catch (MessagingException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
        }		  
	}
	
	/**
	 * sendEmailPassword - Ready to server
	 * @param propertiesFile
	 * @param email
	 * @param name
	 * @param userName
	 * @param newPassword
	 * @param attach
	 * @param pref
	 */
	public static void sendEmailPassword(Properties propertiesFile, String email, String name, String userName, String newPassword, boolean attach, String pref) {
		
		String to = email;
		final String from = propertiesFile.getProperty(pref + "EmailCountFrom");
		final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
		final String port = propertiesFile.getProperty(pref + "EmailPort");
		final String server = propertiesFile.getProperty(pref + "EmailServer");
		final String fromName = propertiesFile.getProperty(pref + "EmailFromUser");
		boolean debug = false;		  
		Properties props = new Properties();
		
		props.put("mail.smtp.host", server);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtps.port", port);
        props.put("mail.smtps.ssl.trust", server);
        
        Session session = Session.getDefaultInstance(props, null);
        
        session.setDebug(debug);
        
        try{
        	MimeMessage mimemessage = new MimeMessage(session);
        	InternetAddress addressFrom = new InternetAddress( from, fromName );
	          
        	mimemessage.setFrom(addressFrom);
	          
        	InternetAddress[] addressTo = new InternetAddress[1];
	          
        	addressTo[0] = new InternetAddress(to);
        	mimemessage.setRecipients(Message.RecipientType.TO, addressTo);
        	mimemessage.setSubject( "Recuperación de Contraseña", "ISO-8859-1" );
	          
        	String messa = "<div style='color: gray;'>Hola " + name + ",<br>" +
		    	"A continuación encontrarás la información para acceder a tu cuenta: <br><br>"
		    	+ "Tu usuario es: " + userName + "<br>"+
		     	"Tu nueva contrase&ntilde;a es:" + newPassword +"<br><br>"+
		    	"Atentamente, equipo de apoyo de Arma Tu Torta.</div>";

        	mimemessage.setContent( messa , "text/html");
	          
        	Transport transport = session.getTransport("smtp"); 
	          
        	transport.connect(server, from, password); 
        	transport.sendMessage(mimemessage, mimemessage.getAllRecipients()); 
        	transport.close();
        	System.out.println("Correo enviado. Enjoy!!!");
	          
        } catch (MessagingException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
        }
	}		
	
	/**
	 * sendEmailPassword - Ready to server
	 * @param propertiesFile
	 * @param email
	 * @param name
	 * @param newPassword
	 * @param attach
	 * @param pref
	 */
	public static void sendEmailPassword(Properties propertiesFile, String email, String name, String newPassword, boolean attach, String pref){
		
		  String to = email;
		  final String from = propertiesFile.getProperty(pref + "EmailCountFrom");
		  final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
		  final String port = propertiesFile.getProperty(pref + "EmailPort");
		  final String server = propertiesFile.getProperty(pref + "EmailServer");
		  final String fromName = propertiesFile.getProperty(pref + "EmailFromUser");
		  boolean debug = false;		  
		  Properties props = new Properties();
		  
          props.put("mail.smtp.host", server);
          props.put("mail.transport.protocol", "smtp");
          props.put("mail.smtp.auth", "true");
          props.put("mail.smtps.port", port);
          props.put("mail.smtps.ssl.trust", server);

          Session session = Session.getDefaultInstance(props, null);
          
          session.setDebug(debug);
          
          try{
        	  MimeMessage mimemessage = new MimeMessage(session);
	          InternetAddress addressFrom = new InternetAddress( from, fromName );
	          
	          mimemessage.setFrom(addressFrom);
	          
	          InternetAddress[] addressTo = new InternetAddress[1];
	          
	          addressTo[0] = new InternetAddress(to);
	          mimemessage.setRecipients(Message.RecipientType.TO, addressTo);
	          mimemessage.setSubject( "Recuperación de Contraseña", "ISO-8859-1" );
	          
	          String messa = "<div style='color: gray;'>Hola " + name + ",<br>" +
		 		 "A continuación encontrará la información para acceder a su cuenta: <br><br>"
		 		 + "Su usuario es: " + email + "<br>"+
		 		 "Su nueva contrase&ntilde;a es:" + newPassword +"<br><br>"+
		 		 "Atentamente, equipo de apoyo de Arma Tu Torta.</div>";

	          mimemessage.setContent( messa , "text/html");
	          
	          Transport transport = session.getTransport("smtp"); 
	          
	          transport.connect(server, from, password); 
	          transport.sendMessage(mimemessage, mimemessage.getAllRecipients()); 
	          transport.close();
	          System.out.println("Correo enviado. Enjoy!!!");
	          
          } catch (MessagingException ex) {
			   ex.printStackTrace();
		  } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		  }
	 }
	
	/**
	 * sendContactEmail - Ready to server
	 * @param propertiesFile
	 * @param email
	 * @param name
	 * @param phone
	 * @param msg
	 * @param attach
	 * @param pref
	 */
	public static void sendContactEmail(Properties propertiesFile, String email, String name, String phone, String msg,  boolean attach, String pref) {
		
		String to = propertiesFile.getProperty(pref + "EmailOrdersCopy");
		final String from = propertiesFile.getProperty(pref + "EmailCountFrom");
		final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
		final String port = propertiesFile.getProperty(pref + "EmailPort");
		final String server = propertiesFile.getProperty(pref + "EmailServer");
		final String fromName = propertiesFile.getProperty(pref + "EmailFromUser");
		boolean debug = false;		  
		Properties props = new Properties();
		
		props.put("mail.smtp.host", server);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtps.port", port);
        props.put("mail.smtps.ssl.trust", server);
		
        Session session = Session.getDefaultInstance(props, null);
        
        session.setDebug(debug);
			 
        try{
        	MimeMessage mimemessage = new MimeMessage(session);
        	InternetAddress addressFrom = new InternetAddress( from, fromName );
	          
        	mimemessage.setFrom(addressFrom);
	          
        	InternetAddress[] addressTo = new InternetAddress[1];
	          
        	addressTo[0] = new InternetAddress(to);
        	mimemessage.setRecipients(Message.RecipientType.TO, addressTo);
        	mimemessage.setSubject("Tienes un nuevo comentario o mensaje", "ISO-8859-1");
	          
        	String messa = "<div style='color: #222222;'>Hola, has recibido un nuevo comentario a través de " +
	          	"la p&aacute;gina web de Arma Tu Torta.<br><br>" +
	          	"A continuación encontrarás los datos de la persona que escribi&oacute; y su mensaje: <br><br>"
	          	+ "<strong>Nombre: </strong>" + name + "<br>"
	          	+ "<strong>Email:</strong> " + email + "<br>";
	          
        	if (phone != "")
        		messa += "<strong>Tel&eacute;fono:</strong> " + phone + "<br>";
       		
        	messa += "<strong>Mensaje:</strong> " + msg + "<br>";

        	mimemessage.setContent( messa , "text/html");
	          
        	Transport transport = session.getTransport("smtp"); 
	          
        	transport.connect(server, from, password); 
        	transport.sendMessage(mimemessage, mimemessage.getAllRecipients()); 
        	transport.close();
        	System.out.println("Correo enviado. Enjoy!!!");
	          
        } catch (MessagingException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException e) {
        	e.printStackTrace();
        }
	}
	
	/**
	 * sendContactEmailCopy - Ready to server
	 * @param propertiesFile
	 * @param email
	 * @param name
	 * @param phone
	 * @param msg
	 * @param attach
	 * @param pref
	 */
	public static void sendContactEmailCopy(Properties propertiesFile, String email, String name, String phone, String msg,  boolean attach, String pref) {
		
		String to = email;
		final String from = propertiesFile.getProperty(pref + "EmailCountFrom");
		final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
		final String port = propertiesFile.getProperty(pref + "EmailPort");
		final String server = propertiesFile.getProperty(pref + "EmailServer");
		final String fromName = propertiesFile.getProperty(pref + "EmailFromUser");
		boolean debug = false;		  
		Properties props = new Properties();
		
		props.put("mail.smtp.host", server);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtps.port", port);
        props.put("mail.smtps.ssl.trust", server);

        Session session = Session.getDefaultInstance(props, null);
        
        session.setDebug(debug);
        
        try{
        	MimeMessage mimemessage = new MimeMessage(session);
        	InternetAddress addressFrom = new InternetAddress( from, fromName );
	          
        	mimemessage.setFrom(addressFrom);
	          
        	InternetAddress[] addressTo = new InternetAddress[1];
	          
        	addressTo[0] = new InternetAddress(to);
        	mimemessage.setRecipients(Message.RecipientType.TO, addressTo);
        	mimemessage.setSubject("Copia de mensaje envíado a Arma Tu Torta", "ISO-8859-1");
	          
        	String messa = "<div style='color: #222222;'>Hola " + name + ", <br><br>"
   		 		+ "A continuación encontrarás una copia del mensaje que nos enviaste " +
   		 		" Arma Tu Torta <br><br>"
   		 		+ "<strong> Nombre:</strong>  " + name + "<br>"
   		 		+ "<strong> Email:</strong> " + email + "<br>"
   		 		+ "<strong> Tel&eacute;fono:</strong> " + phone + "<br>"
   		 		+ "<strong> Mensaje:</strong> " + msg + "<br><br>" +
   		 		"Gracias por escribirnos, te responderemos en la brevedad posible.<br><br>" +
   		 		"Atentamente, Equipo de Apoyo de Arma Tu Torta.";

        	mimemessage.setContent( messa , "text/html");
	          
        	Transport transport = session.getTransport("smtp"); 
	          
        	transport.connect(server, from, password); 
        	transport.sendMessage(mimemessage, mimemessage.getAllRecipients()); 
        	transport.close();
        	System.out.println("Correo enviado. Enjoy!!!");
	          
        } catch (MessagingException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
        }
	}
	
	/**
	 * sendEmailOrderCake - Ready to server
	 * @param propertiesFile
	 * @param numPedido
	 * @param attach
	 * @param pref
	 * @param datos
	 * @param relleno
	 * @param client
	 */
	public static void sendEmailOrderCake(Properties propertiesFile, String numPedido, boolean attach, String pref,
			String[] datos, String[] relleno, Client client) {
		
		String to = propertiesFile.getProperty(pref + "EmailOrdersCopy");
		final String from = propertiesFile.getProperty(pref + "EmailCountFrom");
		final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
		final String port = propertiesFile.getProperty(pref + "EmailPort");
		final String server = propertiesFile.getProperty(pref + "EmailServer");
		final String fromName = propertiesFile.getProperty(pref + "EmailFromUser");
		boolean debug = false;		  
		Properties props = new Properties();
		
		props.put("mail.smtp.host", server);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtps.port", port);
        props.put("mail.smtps.ssl.trust", server);

        Session session = Session.getDefaultInstance(props, null);
        
        session.setDebug(debug);
        
        try{
        	MimeMessage mimemessage = new MimeMessage(session);
        	InternetAddress addressFrom = new InternetAddress( from, fromName );
	          
        	mimemessage.setFrom(addressFrom);
	          
        	InternetAddress[] addressTo = new InternetAddress[1];
	          
        	addressTo[0] = new InternetAddress(to);
        	mimemessage.setRecipients(Message.RecipientType.TO, addressTo);
        	mimemessage.setSubject("Tienes un nuevo pedido de tortas. Orden N°" + numPedido, "ISO-8859-1");
        	
        	String rell = "";
        	
        	if (relleno != null){
        		for (int i = 0; i< relleno.length; i++){
        			if (i == relleno.length - 1)
		        		 rell += relleno[i] ;
		        	 else
		        		 rell += relleno[i] + "," ;
        		}
        	}
	          
        	// Send the actual HTML message, as big as you like
        	String messa = "Has recibido un nuevo pedido. <br><br>" +
	    		"<strong> Datos del pedido.</strong><br><br>" +
	    		" Producto pedido: Torta<br>" +
	    		" Forma: " + datos[0] + "<br>" +
	     		" Tama&ntilde;o: " + datos[1]  + "<br>" +
	     		" Sabor del ponqu&eacute;: " + datos[2]  + "<br>" +
	     		" Cantidad de capas: " + datos[3]  + "<br>" ;
         	if (relleno != null)
         		messa += " Sabores de capas: " + rell + "<br>" ;
         	
         	messa += " Sabores de cubierta: " + datos[4] + ".<br><br>" +
	     		" Precio: Bs." + datos[5] + ".<br><br>" +
	     		" Fecha de Entrega: " + datos[7] + ".<br><br>" +	     		
	     		" <strong>Datos del comprador:</strong> <br><br> " +
	     		" Nombre: " + client.getFirstName() + " "  + client.getLastName() +  "<br>" +
	     		" Correo Electr&oacute;nico: " + client.getEmail() + "<br>" +
	     		" Tel&eacute;fono: " + client.getPhone() + "<br>";
         	if (client.getOtherPhone() != null && !client.getOtherPhone().equals(""))
         		messa += "Otro Tel&eacute;fono: " + client.getOtherPhone() + "<br>";
         	if (client.isShippingAddress() == 1)
         		messa += "Dirección de Envío: " + client.getAddress() + ".<br><br>";
         	else
         		messa += "Dirección de Envío: " + client.getShippingAddress() + ".<br><br>";
	         	
         	if (attach)
         		messa += "Adjunto encontrar&aacute;s la imagen que el usuario quiere usar para la cubierta de la torta.";
         	
         	MimeBodyPart mbp1 = new MimeBodyPart();         	
         	mbp1.setText(messa);
         	mbp1.setContent(messa, "text/html");         	
         	Multipart mp = new MimeMultipart();
         	mp.addBodyPart(mbp1);

         	if (attach){
         		MimeBodyPart mbp = new MimeBodyPart();
         		FileDataSource fds = new FileDataSource(datos[6]);
         		mbp.setDataHandler(new DataHandler(fds));
         		mbp.setFileName(fds.getName());
         		mp.addBodyPart(mbp);
         	}
	        
         	mimemessage.setContent(mp);
         	mimemessage.setSentDate(new Date());

        	Transport transport = session.getTransport("smtp"); 
	          
        	transport.connect(server, from, password); 
        	transport.sendMessage(mimemessage, mimemessage.getAllRecipients()); 
        	transport.close();
        	System.out.println("Correo enviado. Enjoy!!!");
	          
        } catch (MessagingException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
        }
	}
		
	/**
	 * sendEmailOrderOcEsp - Ready to server
	 * @param propertiesFile
	 * @param numPedido
	 * @param attach
	 * @param pref
	 * @param datos
	 * @param productos
	 * @param client
	 */
	public static void sendEmailOrderOcEsp(Properties propertiesFile, String numPedido, boolean attach, String pref,
			String[] datos, String productos, Client client) {
		
		String to = propertiesFile.getProperty(pref + "EmailOrdersCopy");
		final String from = propertiesFile.getProperty(pref + "EmailCountFrom");
		final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
		final String port = propertiesFile.getProperty(pref + "EmailPort");
		final String server = propertiesFile.getProperty(pref + "EmailServer");
		final String fromName = propertiesFile.getProperty(pref + "EmailFromUser");
		boolean debug = false;		  
		Properties props = new Properties();
		
		props.put("mail.smtp.host", server);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtps.port", port);
        props.put("mail.smtps.ssl.trust", server);

        Session session = Session.getDefaultInstance(props, null);
        
        session.setDebug(debug);
        
        try{
        	MimeMessage mimemessage = new MimeMessage(session);
        	InternetAddress addressFrom = new InternetAddress( from, fromName );
	          
        	mimemessage.setFrom(addressFrom);
	          
        	InternetAddress[] addressTo = new InternetAddress[1];
	          
        	addressTo[0] = new InternetAddress(to);
        	mimemessage.setRecipients(Message.RecipientType.TO, addressTo);
        	mimemessage.setSubject("Tienes una nueva solicitud de presupuesto: No." + numPedido, "ISO-8859-1");
        	
        	// Send the actual HTML message, as big as you like
        	String messa = "Has recibido una nueva solicitud de presupuesto. <br><br>" +
	    		"<strong> Datos de la solicitud.</strong><br><br>" +
	    		" Productos pedidos: " + productos + "<br>" +
	    		" Ocasi&oacute;n: " + datos[0] + "<br>" +
	     		" N&uacute;mero aproximado de invitados: " + datos[1]  + "<br>" +
	     		" Informaci&oacute;n sobre la idea del usuario: " + datos[2]  + "<br><br>"+	     		
	     		" <strong>Datos del comprador:</strong> <br><br> " +
	     		" Nombre: " + client.getFirstName() + " " + client.getLastName() +  "<br>" +
	     		" Correo Electr&oacute;nico: " + client.getEmail() + "<br>" +
	     		" Tel&eacute;fono: " + client.getPhone() + ".<br><br>"; 
        	
        	if (!client.getOtherPhone().equals(""))
        		messa += "Otro Tel&eacute;fono: " + client.getOtherPhone() + "<br>";
        	
           	if (client.isShippingAddress() == 1)
           		messa += "Dirección de Envío: " + client.getAddress() + ".<br><br>";
           	else
           		messa += "Dirección de Envío: " + client.getShippingAddress() + ".<br><br>";
	         	
           	if (attach)
           		messa += "Anexo encontrar&aacute;s la imagen de referencia que mand&oacute; el usuario.";
	         
           	MimeBodyPart mbp1 = new MimeBodyPart();
           	mbp1.setText(messa);
           	mbp1.setContent(messa, "text/html");
           	Multipart mp = new MimeMultipart();
           	mp.addBodyPart(mbp1);

           	if (attach){
           		MimeBodyPart mbp = new MimeBodyPart();
           		FileDataSource fds = new FileDataSource(datos[4]);
           		mbp.setDataHandler(new DataHandler(fds));
           		mbp.setFileName(fds.getName());
           		mp.addBodyPart(mbp);
           	}
	        
           	mimemessage.setContent(mp);
           	mimemessage.setSentDate(new Date());

        	Transport transport = session.getTransport("smtp"); 
	          
        	transport.connect(server, from, password); 
        	transport.sendMessage(mimemessage, mimemessage.getAllRecipients()); 
        	transport.close();
        	System.out.println("Correo enviado. Enjoy!!!");
	          
        } catch (MessagingException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
        }        
	}
	
	/**
	 * sendEmailOrderCupcake - Ready to server
	 * @param propertiesFile
	 * @param numPedido
	 * @param attach
	 * @param pref
	 * @param datos
	 * @param color
	 * @param client
	 */
	public static void sendEmailOrderCupcake(Properties propertiesFile, String numPedido, boolean attach, String pref,
			String[] datos, String[] color, Client client) {
		
		String to = propertiesFile.getProperty(pref + "EmailOrdersCopy");
		final String from = propertiesFile.getProperty(pref + "EmailCountFrom");
		final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
		final String port = propertiesFile.getProperty(pref + "EmailPort");
		final String server = propertiesFile.getProperty(pref + "EmailServer");
		final String fromName = propertiesFile.getProperty(pref + "EmailFromUser");
		boolean debug = false;		  
		Properties props = new Properties();
		
		props.put("mail.smtp.host", server);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtps.port", port);
        props.put("mail.smtps.ssl.trust", server);

        Session session = Session.getDefaultInstance(props, null);
        
        session.setDebug(debug);
		
        try{
        	MimeMessage mimemessage = new MimeMessage(session);
        	InternetAddress addressFrom = new InternetAddress( from, fromName );
	          
        	mimemessage.setFrom(addressFrom);
	          
        	InternetAddress[] addressTo = new InternetAddress[1];
	          
        	addressTo[0] = new InternetAddress(to);
        	mimemessage.setRecipients(Message.RecipientType.TO, addressTo);
        	mimemessage.setSubject("Tienes un nuevo pedido de cupcakes. Orden N°" + numPedido, "ISO-8859-1");
        	
        	String rell = "";

        	if (color != null){
        		for (int i = 0; i< color.length; i++){
        			if (i == color.length - 1)
    					rell += color[i] ;
        			else
        				rell += color[i] + "," ;
        		}
        	}
	         
        	// Send the actual HTML message, as big as you like
        	String messa = "Has recibido un nuevo pedido. <br><br>" +
	    		"<strong> Datos del pedido.</strong><br><br>" +
	    		" Producto pedido: Cupcakes<br>" +
	    		" Tama&ntilde;o: " + datos[0] + "<br>";
	         	
        	if (!datos[1].contains("regalar"))
        		messa += " Cantidad: " + datos[6] + " Docenas"  + "<br>";
        	else{
        		messa += " Cantidad: " + datos[1]  + "<br>";
        		messa += " Texto de la Calcoman&iacute;a: " + datos[5] + "<br>";
        	}
	     		
        	messa += " Sabor de los cupcakes: " + datos[2]  + "<br>" +
	     		" Cubierta: " + datos[3]  + "<br>" +
	     		" Decoraci&oacute;n: " + datos[4] + "<br>";
        	
        	if (color!= null)
        		messa += " Color(es): " + rell + "<br>";
	     		messa += " Precio: Bs." + datos[7] + ".<br><br>" +
	     		" Fecha de Entrega: " + datos[8] + ".<br><br>" +	     		
	     		" <strong>Datos del comprador:</strong> <br><br> " +
	     		" Nombre: " + client.getFirstName() + " "  + client.getLastName() +  "<br>" +
	     		" Correo Electr&oacute;nico: " + client.getEmail() + "<br>" +
	     		" Tel&eacute;fono: " + client.getPhone() + "<br>";

	     	if (client.getOtherPhone() != null && !client.getOtherPhone().equals(""))
	     		messa += "Otro Tel&eacute;fono: " + client.getOtherPhone() + "<br>";
	        	
	     	if (client.isShippingAddress() == 1)
	     		messa += "Dirección de Envío: " + client.getAddress() + ".<br><br>";
	     	else
	     		messa += "Dirección de Envío: " + client.getShippingAddress() + ".<br><br>";
	         	
	     	MimeBodyPart mbp1 = new MimeBodyPart();
	     	mbp1.setText(messa);
	     	mbp1.setContent(messa, "text/html");
	     	Multipart mp = new MimeMultipart();
	     	mp.addBodyPart(mbp1);

	     	if (attach){
	     		MimeBodyPart mbp = new MimeBodyPart();
	     		FileDataSource fds = new FileDataSource(datos[6]);
	     		mbp.setDataHandler(new DataHandler(fds));
	     		mbp.setFileName(fds.getName());
	     		mp.addBodyPart(mbp);
	     	}
	        
	     	mimemessage.setContent(mp);
	     	mimemessage.setSentDate(new Date());

        	Transport transport = session.getTransport("smtp"); 
	          
        	transport.connect(server, from, password); 
        	transport.sendMessage(mimemessage, mimemessage.getAllRecipients()); 
        	transport.close();
        	System.out.println("Correo enviado. Enjoy!!!");
	          
        } catch (MessagingException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
        }  
	}
	
	/**
	 * sendEmailOrderDulcesTortas - Ready to server
	 * @param propertiesFile
	 * @param numPedido
	 * @param attach
	 * @param pref
	 * @param datos
	 * @param productos
	 * @param client
	 */
	public static void sendEmailOrderDulcesTortas(Properties propertiesFile, String numPedido, boolean attach, String pref,
			String[] datos, String[] productos, Client client) {
		
		String to = propertiesFile.getProperty(pref + "EmailOrdersCopy");
		final String from = propertiesFile.getProperty(pref + "EmailCountFrom");
		final String password =  propertiesFile.getProperty(pref + "EmailPasswordFrom");
		final String port = propertiesFile.getProperty(pref + "EmailPort");
		final String server = propertiesFile.getProperty(pref + "EmailServer");
		final String fromName = propertiesFile.getProperty(pref + "EmailFromUser");
		boolean debug = false;		  
		Properties props = new Properties();
		
		props.put("mail.smtp.host", server);
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtps.port", port);
        props.put("mail.smtps.ssl.trust", server);

        Session session = Session.getDefaultInstance(props, null);
        
        session.setDebug(debug);
        
        try{
        	MimeMessage mimemessage = new MimeMessage(session);
        	InternetAddress addressFrom = new InternetAddress( from, fromName );
	          
        	mimemessage.setFrom(addressFrom);
	          
        	InternetAddress[] addressTo = new InternetAddress[1];
	          
        	addressTo[0] = new InternetAddress(to);
        	mimemessage.setRecipients(Message.RecipientType.TO, addressTo);
        	mimemessage.setSubject("Tienes una nueva compra de dulces tortas: No." + numPedido, "ISO-8859-1");
        	
        	// Send the actual HTML message, as big as you like
        	String messa = "Has recibido una nueva compra de dulces tortas. <br><br>" +
        		"<strong> Datos de la orden:</strong><br><br>" +
        		" Productos pedidos: <br>";
	         
         	for (int j = 0; j < productos.length; j++){
         		messa += "* " + productos[j] + "<br>";
         	}
	        	
         	messa += "<br> Fecha de Entrega: " + datos[0] + ".<br>" +
         		" Total: Bs." + datos[1] + ".<br><br>" +
         		" <strong>Datos del comprador:</strong> <br><br> " +
         		" Nombre: " + client.getFirstName() + " " + client.getLastName() +  "<br>" +
         		" Correo Electr&oacute;nico: " + client.getEmail() + "<br>" +
         		" Tel&eacute;fono: " + client.getPhone() + ".<br>"; 
	         	
          	if (client.getOtherPhone() != null && !client.getOtherPhone().equals(""))
          		messa += "Otro Tel&eacute;fono: " + client.getOtherPhone() + "<br>";

          	if (client.isShippingAddress() == 1)
         		messa += "Dirección de Envío: " + client.getAddress() + ".<br><br>";
         	else
         		messa += "Dirección de Envío: " + client.getShippingAddress() + ".<br><br>";
         	
          	MimeBodyPart mbp1 = new MimeBodyPart();
         	
          	mbp1.setText(messa);
          	mbp1.setContent(messa, "text/html");
          	Multipart mp = new MimeMultipart();
          	mp.addBodyPart(mbp1);

          	mimemessage.setContent(mp);
          	mimemessage.setSentDate(new Date());

          	Transport transport = session.getTransport("smtp"); 
          
          	transport.connect(server, from, password); 
          	transport.sendMessage(mimemessage, mimemessage.getAllRecipients()); 
          	transport.close();
          	System.out.println("Correo enviado. Enjoy!!!");
	          
        } catch (MessagingException ex) {
        	ex.printStackTrace();
        } catch (UnsupportedEncodingException e) {
			e.printStackTrace();
        }  		  
	}
}
