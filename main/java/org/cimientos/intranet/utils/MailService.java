package org.cimientos.intranet.utils;

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

import org.springframework.stereotype.Service;


/**
 * Clase utilizada para administrar el envio y recepcion de emails de los usuarios a la Intranet
 * @author msagarduy
 *  
 */
@Service
public class MailService {
	
	private static Properties props;


	
	/**
	 * Llama al metodo enviarMailPersonal y le setea los parametros.
	 * @param titulo Titulo del email
	 * @param mensaje Contenido del email
	 * @param recipients Lista de contactos para el envio de email
	 * @throws Exception
	 */
	public Boolean enviarMailSistema(final String titulo,
			final String mensaje, final String recipients[], final String bcc,
			Boolean resultado, final String filename) throws Exception 
	{
		System.out.println("entré a mailSistema");
		Boolean result = enviarMailPersonal(titulo, mensaje, recipients, bcc,resultado, getProps().getProperty("mail.smtp.mailFrom"),
				getProps().getProperty("mail.smtp.password"),filename);
		System.out.println("filename: "+filename);
		return result;
	}

	public Boolean enviarMailSistemaSinAdjunto(final String titulo,
			final String mensaje, Boolean resultado, final String recipients[]) throws Exception 
	{
		Boolean result = enviarMailPersonal(titulo, mensaje, resultado, recipients,getProps().getProperty("mail.smtp.mailFrom"),
				getProps().getProperty("mail.smtp.password"));	
		return result;
	}
	
	/**
	 * @param titulo
	 * @param mensaje
	 * @param recipients
	 * @param usuario
	 * @param password
	 * @throws Exception
	 */
	public Boolean enviarMailPersonal(final String titulo,
			final String mensaje, Boolean resultado,
			final String recipients[],final String usuario, 
			final String password) throws Exception 
		{

		Session session = Session.getDefaultInstance(props,null);
		
		String cuerpoMail = "<font style=\"font-family: Helvetica; font-size: 14px;\">" + mensaje + "</font>";
		
		try
		{
			resultado = true;
			Message msg = new MimeMessage(session);
			
			InternetAddress addressFrom = new InternetAddress(usuario, getProps().getProperty("mail.smtp.from"));
			msg.setFrom(addressFrom);

			InternetAddress[] addressTo = new InternetAddress[recipients.length];
			for (int i = 0; i < recipients.length; i++) {
				addressTo[i] = new InternetAddress(recipients[i]);
			}
			msg.setRecipients(Message.RecipientType.TO, addressTo);
			
			msg.setSubject(titulo);
			msg.setContent(cuerpoMail, "text/html");
			final Transport transport = session.getTransport("smtp");
			transport.connect(usuario, password);

			transport.sendMessage(msg, addressTo);
			transport.close();
			
		}
		catch (Exception e) {
			//System.out.println(e);
			resultado = false;
		}
		return resultado;
	}


	/**
	 * Envia el email, con formato en texto plano, a la lista de usuarios
	 * Utiliza protocolo SMTP
	 * @param titulo
	 * @param mensaje
	 * @param recipients
	 * @param usuario
	 * @param password
	 * @throws Exception
	 */
	public Boolean enviarMailPersonal(final String titulo,
			final String mensaje, final String recipients[], String bcc,
			Boolean resultado,final String usuario, 
			final String password,final String filename) throws Exception {

		Session session = Session.getDefaultInstance(props, null);
		
		String cuerpoMail = "<font style=\"font-family: Helvetica; font-size: 14px;\">" + mensaje + "</font>";
		System.out.println("entro al envio perosonal");
		try {
			resultado = true;
			String nombre = "";
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(usuario,getProps().getProperty("mail.smtp.from")));
            //message.setRecipient(Message.RecipientType.TO, new InternetAddress(recipients));
            message.setSubject(titulo);
            message.setSentDate(new Date());
            
            // Set the email message text.
            MimeBodyPart messagePart = new MimeBodyPart();
            messagePart.setContent(cuerpoMail, "text/html");
            	
        	// Set the email attachment file
        	MimeBodyPart attachmentPart = new MimeBodyPart();
        	FileDataSource fileDataSource = new FileDataSource(filename) {
        		@Override
        		public String getContentType() {
        			return "application/octet-stream";
        		}
        	};
        	attachmentPart.setDataHandler(new DataHandler(fileDataSource));
        	
        	String[] nombreArchivo = filename.split("/");
        	nombre = nombreArchivo[nombreArchivo.length - 1];
        	       	
        	attachmentPart.setFileName(nombre);
        	Multipart multipart = new MimeMultipart();
        	multipart.addBodyPart(messagePart);
        	multipart.addBodyPart(attachmentPart);

        	message.setContent(multipart);
            
            
            //Transport.send(message);
    		final Transport transport = session.getTransport("smtp");
    		transport.connect(usuario, password);
    		System.out.println("usuario: " +usuario);
    		System.out.println("pass: "+password);
    		
    		//String[] ad = new String[]{recipients};
    		//InternetAddress[] addressTo = new InternetAddress[1];
    		//addressTo[0] = new InternetAddress(ad[0]);
    		InternetAddress[] addressTo = new InternetAddress[recipients.length];
			for (int i = 0; i < recipients.length; i++) {
				addressTo[i] = new InternetAddress(recipients[i]);
			}
			message.setRecipients(Message.RecipientType.TO, addressTo);
			message.setRecipients(Message.RecipientType.BCC, getProps().getProperty("mail.smtp.mailFrom"));
			//message.setRecipients(Message.RecipientType.BCC, bcc);
			transport.sendMessage(message, addressTo);
    		transport.close();
    		System.out.println("salí del envio");
    		
        } catch (MessagingException e) {
            e.printStackTrace();
            resultado = false;
        }
        return resultado;
	}

	/**
	 * Setea las propiedades obtenidas del archivo mail.properties
	 * @param props
	 */
	public void setProps(Properties props) {
		MailService.props = props;
	}

	/**
	 * Retorna las propiedades del archivo mail.properties
	 * @return {@link Properties}
	 */
	public static Properties getProps() {
		return props;
	}

}
