<%@ page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="javax.mail.BodyPart" %>
<%@page import="javax.mail.Message" %>
<%@page import="javax.mail.Multipart" %>
<%@page import="javax.mail.PasswordAuthentication" %>
<%@page import="javax.mail.Session" %>
<%@page import="javax.mail.Transport" %>
<%@page import="javax.mail.internet.AddressException" %>
<%@page import="javax.mail.internet.InternetAddress" %>
<%@page import="javax.mail.internet.MimeBodyPart" %>
<%@page import="javax.mail.internet.MimeMessage" %>
<%@page import="javax.mail.internet.MimeMultipart" %>
<%@page import="javax.mail.*"%>
 

<%
	
	

	
			
	// subir archivo a bbdd
	String ra=request.getParameter("ra");
	String mesPago=request.getParameter("mesPago");
	String id=request.getParameter("idBecadoAprobar");
	String becado=request.getParameter("becadoAprobarNombre");
	String zona=request.getParameter("becadoAprobarZona");	
	String idBecado=request.getParameter("idBecado");
	String ciclo=request.getParameter("ciclo");
	System.out.println(id);
	System.out.println(ra);
	System.out.println("mes de pago: "+mesPago);
	System.out.println("ciclo: "+ciclo);
	if (ciclo.equals("2019")){
		ciclo="30";
	}
	if (ciclo.equals("2020")){
		ciclo="31";
	}
	if (ciclo.equals("2021")){
		ciclo="32";
	}
	if (ciclo.equals("2022")){
		ciclo="33";
	}
	if (ciclo.equals("2023")){
		ciclo="34";
	}

	
	String idRr=request.getParameter("idRr");
	String maiRr="";
	if(idRr.equals("19")){maiRr="luzcasal@cimientos.org";}
	if(idRr.equals("145")){maiRr="rominabesada@cimientos.org";}
	if(idRr.equals("167")){maiRr="lisandramauri@cimientos.org";}
	if(idRr.equals("182")){maiRr="biancaattarantato@cimientos.org";}
	if(idRr.equals("194")){maiRr="florenciagelabert@cimientos.org";}
	Connection cn = null;			
	if(request.getParameter("aprobarPago").equals("no")){					
		cn = Conexion.getConexion();
		Statement st = cn.createStatement();
		st.executeUpdate("update perfil_alumno p set p.aprobar_pago='si',p.revertir_pago='no' where p.id="+id);
		st.close();
		Conexion.cerrarConexion(cn);
		
		
		// enviar mail
		String from = "carlosquetto@cimientos.org";
		final String username = "carlosquetto@cimientos.org";//change accordingly
		final String password = "ibrxurkarjumxtad";//change accordingly
		String host = "smtp.gmail.com";
		String mail="carlosquetto@cimientos.org";
		String pass="ibrxurkarjumxtad";	  
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "25");
		String to="marianasoliz@cimientos.org";
		String to1="lisandramauri@cimientos.org";
		String to2="carlosquetto@hotmail.com";
		String to3="carlosquetto@cimientos.org";
		Session session1 = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
				}
			 });
		// Create a default MimeMessage object.
		Message message = new MimeMessage(session1);

		// Set From: header field of the header.

			try {
				message.setFrom(new InternetAddress(from));
			
		 

			// Set To: header field of the header.
			message.setRecipients(Message.RecipientType.TO,
			   InternetAddress.parse(to));
			message.setRecipients(Message.RecipientType.CC,
			   InternetAddress.parse("lisandramauri@cimientos.org,marianasoliz@cimientos.org,carlosquetto@cimientos.org"));   	 
			//message.setRecipients(Message.RecipientType.CC,
			//		InternetAddress.parse(to2));
			//message.setRecipients(Message.RecipientType.CC,
			//		InternetAddress.parse(to3));	
			

			// Set Subject: header field
			message.setSubject("Noticias de Post PFE - Pago Aprobado");

			// This mail has 2 part, the BODY and the embedded image
			MimeMultipart multipart = new MimeMultipart("related");

			// first part (the html)
			BodyPart messageBodyPart = new MimeBodyPart();
			// con formato html e imagen
			//String htmlText = "<H3>Hola !!!!, vos vas a hacer la imagen para los recibos como la de los minions para pegar en el cuerpo del mail?</H3><img src=\"cid:image\">";
			String htmlText = "<strong>Hola !!!</strong><br><br>"+
				  "Acaban de aprobar el pago de <strong><font color=blue>"+becado +"</strong></font> de la zona de <strong><font color=blue>"+zona+"</strong></font>";
			messageBodyPart.setContent(htmlText, "text/html");
			// add it
			multipart.addBodyPart(messageBodyPart);
			
			// con imagen adjunta
			/*second part (the image)
			messageBodyPart = new MimeBodyPart();
			DataSource fds = new FileDataSource(
			   "c:/Recibos/minions.jpg");

			messageBodyPart.setDataHandler(new DataHandler(fds));
			messageBodyPart.setHeader("Content-ID", "<image>");

			// add image to the multipart
			multipart.addBodyPart(messageBodyPart);
			*/
		 // Part two is attachment
		 //        messageBodyPart = new MimeBodyPart();
		 //        String filename = "//fileserver/RRHH/recibodigitales/"+rs.getString("legajo")+".pdf";
		 //        DataSource source = new FileDataSource(filename);
		 //        messageBodyPart.setDataHandler(new DataHandler(source));
		 //        messageBodyPart.setFileName(filename);
		 //        multipart.addBodyPart(messageBodyPart);	
			
			
			// put everything together
			message.setContent(multipart);
			// Send message
			Transport.send(message);

			System.out.println("Sent message successfully....");
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
	}
	if(request.getParameter("aprobarPago").equals("si") && request.getParameter("rp").equals("no")){					
		cn = Conexion.getConexion();
		Statement st = cn.createStatement();
		st.executeUpdate("insert into pago (estado_pago,extra,monto,becado,periodo,ra) values(0,0,2250,"+id+","+mesPago+","+ra+")");
		st.executeUpdate("update perfil_alumno p set p.revertir_pago='si' where p.id="+id);
		st.close();
		
		Conexion.cerrarConexion(cn);
	}
	if(request.getParameter("rp").equals("si")){					
		cn = Conexion.getConexion();
		Statement st = cn.createStatement();
		st.executeUpdate("delete from pago where becado="+id+" and ra="+ra+" and monto=2250 and estado_pago=0");		
		st.executeUpdate("update perfil_alumno p set p.revertir_pago='no' where p.id="+id);
		st.close();
		
		Conexion.cerrarConexion(cn);
	}
	
	response.sendRedirect("detallePostPFE.jsp?id="+id+"&ciclo="+ciclo);
			
		
	
%>