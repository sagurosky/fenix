<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">
	label { width: 12em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>

<script type="text/javascript">

$(document).ready(function(){

 $("#fechaActualizacion").datepicker({
	 changeDay: true,
 	  changeMonth: true,
 	  changeYear: true,
 	 
 	  });
 
});

</script>

<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<script type="text/javascript" src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
</head>
<body>

	
	<p>
		<label for="fechaActualizacion">Fecha de Actualizacion:</label> 
		<input  type="text" name="fechaActualizacion" id="fechaActualizacion"
		class="date required" value="<fmt:formatDate  value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>"  > 
	</p>	
	
	<p><label>Estado de Escuela:</label>
		<select name="estadoDeEscuela" id="estadoDeEscuela">
			<option>String</option>
		</select>
	</p>
	
	<p><label>Motivo de No selección:</label>
		<input type="text" name="motivoNoSeleccion" id="motivoNoSeleccion">
	</p>
	
	<p><label>Año de incorporación a Cimientos:</label>
		<input type="text" name="anioIncorporacionCimientos" id="anioIncorporacionCimientos">
	</p>
	
	<p><label>Programa que se implementa:</label>
		<select name="programaImplementa" id="programaImplementa">
			<option>String</option>
		</select>
	</p>
	
	<p><label>Otro programa que se implemente:</label>
		<input type="text" name="otroProgramaImplementa" id="otroProgramaImplementa">
	</p>
	
	<p><label>Modalidad de trabajo con la escuela:</label>
		<select name="modalidadTrabajoEscuela" id="modalidadTrabajoEscuela">
			<option>String</option>
		</select>
	</p>
	
	<p><label>Nivel de trabajo:</label>
		<select name="nivelTrabajo" id="nivelTrabajo">
			<option>String</option>
		</select>
	</p>
	
</body>
</html>