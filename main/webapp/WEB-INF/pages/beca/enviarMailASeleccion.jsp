<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page language="java" %> 
<%@ page import = "org.cimientos.intranet.modelo.MailSender"%> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<title>Enviar Mail a Selección</title>

<% 
 MailSender ms = new MailSender(); 

 boolean result = ms.send("smtp.gmail.com","carlosquetto@cimientos.org", 
 "carlosquetto@hotmail.com","carlosquetto@gmail.com", "carlosquetto@insc.org.ar" , 
 "mail de prueba", false, new StringBuffer("hola"),true); 

 out.print("Resultado del envío del mensaje : " + result); 
 %> 


</body>
</html>