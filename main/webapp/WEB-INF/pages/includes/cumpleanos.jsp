<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="org.cimientos.intranet.modelo.*;"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

Connection conn = null;
ResultSet result = null;
ResultSetMetaData rsmd = null;

	try {
		Class.forName("com.mysql.jdbc.Driver");	
	} catch (ClassNotFoundException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	try {
	      Class c = Class.forName("com.mysql.jdbc.Driver");
	    }
	    catch (Exception e) {
	      //System.out.println("Error occurred " + e);
	     }
	     try {
	    	String url = "jdbc:mysql://localhost/cimientos_prod";
			Connection cn = DriverManager.getConnection(url,"root","root");
			cn.close();				
			cn = DriverManager.getConnection(url,"root","root");
			Statement stmt = cn.createStatement();
	        ResultSet rs = null;
	        String call=null;
	        call="create table cumpleanos as "+
	        	" select nombre, apellido, fecha_nacimiento, persona.perfil_alumno, perfil_alumno.beca_id, beca.padrino, perfil_padrino.datos_personales "+
	        	" from persona, perfil_alumno, beca, perfil_padrino"+
	        	" where perfil_alumno.id=persona.perfil_alumno"+
	        	" and beca.id=perfil_alumno.beca_id"+
	        	" and beca.padrino=perfil_padrino.id"+
	        	" and perfil_alumno.beca_id>0 and perfil_padrino.datos_personales>0;";
	        PreparedStatement preparedStmt = cn.prepareStatement(call);
	        preparedStmt.execute();	
	        
	        call="select persona.id, persona.nombre, persona.apellido,persona.mail, " +
	        		" cumpleanos.nombre,cumpleanos.apellido,cumpleanos.fecha_nacimiento " + 
	        		" from persona, cumpleanos " +
	        		" where persona.id=cumpleanos.datos_personales " +
	        		" and (month(cumpleanos.fecha_nacimiento)=month(now()) and day(cumpleanos.fecha_nacimiento)=day(now())+2);" ;
	        rs = stmt.executeQuery(call);
			
			while ( rs.next() ) {
                String fn = rs.getString("fecha_nacimiento");
                //System.out.println(fn);
                String[] recipients = new String[]{"carlosquetto@hotmail.com"};   //destino
            	//String[] recipients = new String[]{"gracielanogues@cimientos.org"};   //destino
            	//String[] bccRecipients = new String[]{"valentinaanziano@cimientos.org","gracielanogues@cimientos.org","magdalenasaieg@cimientos.org"};   
            	String[] bccRecipients = new String[]{"carlosquetto@cimientos.org"};
            	String subject = "Se acerca el cumpleaños de tu ahijado de Cimientos !!!";    
            	//String messageBody = entrevista.getApellidoAlumno() + ", " + entrevista.getNombreAlumno() + " de " + entrevista.getZonaCimientos() + ", "+ entrevista.getAnioEscolar().getValor() + ", ahijado de " + entrevista.getPadrino()  + " ha cesado del PFE en "+ entrevista.getPeriodoEntrevista().toString() + " " + entrevista.getCicloLectivo().toString()  +  " por el siguiente motivo: '" + entrevista.getMotivoCesacion().getValor() + "'" ;						 						
            	
            	String messageBody = "Hola Valentina, tu ahijado... " + rs.getString("persona.nombre")+" "+ rs.getString("persona.apellido")+
            			" cumple años dentro de 2 días.";            	
            	new MailUtil().sendMail(recipients, bccRecipients, subject, messageBody);
            }	    		        
	     }
	     catch (SQLException e) {
	        //System.out.println("Error occurred " + e);
	     }
	     

	



%>


</body>
</html>