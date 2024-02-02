<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table>
   
 <tr>
    <td>
    	<p>
    		<label>Percepciones sobre el candidato</label>
    			<form:textarea path="entrevistaSeleccion.percepcionesCandidato" rows="2" cols="40" id="perfilAlumno.percepcionesCandidato" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/> 
		</p>
    	<input type="hidden" name="entrevistaSeleccion.informacionComplementaria" id="perfilAlumno.informacionComplementaria" />
    	<input type="hidden" name="idCompromiso" id="compromiso" value="3">				
		<input type="hidden" name="idCompromisoPBE" id="compromisoPBE" value="3">
    </td>
  </tr>
</table>
</body>
</html>