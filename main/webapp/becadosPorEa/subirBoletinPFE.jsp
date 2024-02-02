<%@ page import="java.util.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@ page import="org.apache.commons.io.*" %>
<%@ page import="java.io.*" %>
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
<%@page import="java.sql.*" %>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
 

<%
	String becado="";
	
	/*FileItemFactory es una interfaz para crear FileItem*/
	FileItemFactory file_factory = new DiskFileItemFactory();

	/*ServletFileUpload esta clase convierte los input file a FileItem*/
	ServletFileUpload servlet_up = new ServletFileUpload(file_factory);
	/*sacando los FileItem del ServletFileUpload en una lista */
	List items = servlet_up.parseRequest(request);

	for(int i=0;i<items.size();i++){
		/*FileItem representa un archivo en memoria que puede ser pasado al disco duro*/
		FileItem item = (FileItem) items.get(i);
		/*item.isFormField() false=input file; true=text field*/
		if (! item.isFormField()){
			/*cual sera la ruta al archivo en el servidor*/
			File archivo_server = new File(System.getProperty("user.home")+"/webapps/intranet/boletinesPostPFE/"+item.getName());
			System.out.println("Archivo server: " +archivo_server);
			/*y lo escribimos en el servidor*/
			item.write(archivo_server);
			//out.print("Nombre --> " + item.getName() );
			//out.print("<br> Tipo --> " + item.getContentType());
			//out.print("<br> tamaño --> " + (item.getSize()/1240)+ "KB");
			//out.print("<br>");
			
			// copiamos las fotos donde se vean
			String comando;
			// en testing
			//comando = "copiarPostPFE.sh";
			//en produccion
			comando = "copiarPostPFEProd.sh";
			Runtime.getRuntime().exec(comando);
			
			// subir archivo a bbdd
			Connection cn = null;			
			String dni=item.getName().substring(0,8);
			System.out.println("dni: "+dni);			
			try
				{
					cn = Conexion.getConexion();
					Statement st = cn.createStatement();
					st.executeUpdate("update perfil_alumno p, persona pp set p.boletin_post_pfe='"+item.getName()+"' , p.aprobar_pago='no' where p.id=pp.perfil_alumno and pp.dni='"+dni+"'");
					st.close();
					Conexion.cerrarConexion(cn);
				}
			catch (Exception e)
				{
					e.printStackTrace();
				}
			String idBecado="";
			CallableStatement cl = null;
			ResultSet rs = null;
			cn = null;
			cl = null;
			rs = null;
			String call = "SELECT * FROM perfil_alumno,persona where perfil_alumno.id=persona.perfil_alumno and persona.dni='"+dni+"'";
			cn = Conexion.getConexion();
			cl = cn.prepareCall(call); 
			rs = cl.executeQuery();
			while (rs.next()) {		
				idBecado=rs.getString("perfil_alumno.id");
				becado=rs.getString("persona.apellido")+" "+rs.getString("persona.nombre");
			}
			Conexion.cerrarCall(cl);
			Conexion.cerrarConexion(cn);
			
			//enviar mail
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
			//String to="gimenazeniquel@cimientos.org";
			//String cc="becasuniversitarias@cimientos.org";
			String to="carlosquetto@gmail.com";
			String cc="carlosquetto@hotmail.com";
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
						InternetAddress.parse(cc));

				// Set Subject: header field
				message.setSubject("Noticias de Post PFE");

				// This mail has 2 part, the BODY and the embedded image
				MimeMultipart multipart = new MimeMultipart("related");

				// first part (the html)
				BodyPart messageBodyPart = new MimeBodyPart();
				// con formato html e imagen
				//String htmlText = "<H3>Hola !!!!, vos vas a hacer la imagen para los recibos como la de los minions para pegar en el cuerpo del mail?</H3><img src=\"cid:image\">";
				String htmlText = "<strong>Hola !!!</strong><br><br>"+
					  "Acaban de subir el boletín de <strong><font color=blue>"+becado +"</strong></font>";
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
			
			
			
			response.sendRedirect("detallePostPFE.jsp?id="+idBecado);
			
		}
	}
	
%>