package org.cimientos.intranet.modelo;

import java.util.Properties; 
import java.util.Date; 
import javax.mail.Session; 
import javax.mail.Message; 
import javax.mail.Transport; 
import javax.mail.internet.MimeMultipart; 
import javax.mail.internet.MimeMessage; 
import javax.mail.internet.MimeBodyPart; 
import javax.mail.internet.InternetAddress; 

/** 
* <p>Title: MailSender</p> 
* 
* <p>Description: </p> 
* 
* <p>Copyright: Copyright (c) 2005</p> 
* 
* <p>Company: </p> 
* 
* @author Carlos Quetto
* @version 1.0 
*/ 

public class MailSender { 

    public MailSender() { 
   } 
   public  boolean send(String hostSmtp, String senderAddress, String toAddress, 
       String ccAddress, String bccAddress, String subject, 
       boolean isHTMLFormat, StringBuffer body, boolean debug){ 

   MimeMultipart multipart = new MimeMultipart(); 

   Properties properties = new Properties(); 

    properties.put("mail.smtp.host", hostSmtp); 
   Session session = Session.getDefaultInstance(properties, null); 
   session.setDebug(debug); 
   try { 
      MimeMessage msg = new MimeMessage(session); 
      msg.setFrom(new InternetAddress(senderAddress)); 
      msg.setRecipients(Message.RecipientType.TO, toAddress); 
      msg.setRecipients(Message.RecipientType.CC, ccAddress); 
      msg.setRecipients(Message.RecipientType.BCC, bccAddress); 
      msg.setSubject(subject); 
      msg.setSentDate(new Date()); 

      // BODY 
      MimeBodyPart mbp = new MimeBodyPart(); 
      if(isHTMLFormat){ 
         mbp.setContent(body.toString(), "text/html"); 
      } 
      else{ 
         mbp.setText(body.toString()); 
      } 

      multipart.addBodyPart(mbp); 

      msg.setContent(multipart); 
      Transport.send(msg); 
   } 
   catch (Exception mex){ 
      //System.out.println(">> MailSender.send() error = "+mex ); 
      return false; 
   } 
   return true; 
  } 

}  
