<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript">
	
</script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"
	media="all">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="<c:url value="/static/js/validaciones.js"/>"></script>
<title><c:if test="${!empty alumno.id}">
Modificar
</c:if> <c:if test="${empty alumno.id}">
Alta de
</c:if> Alumno</title>
</head>

<body>
<div align="center"  class="ui-state-default ui-corner-all" id="content-wrap">
<form:form modelAttribute="alumno" id="altaAlumno" commandName="alumno" action="guardarAlumno.do" method="post">
	<form:hidden path="id" />
	<div id="tabs" align="center">
		<ul>
			<c:if test="${!empty alumno.id}">
			Modificar
			</c:if> <c:if test="${empty alumno.id}">
			Alta de
			</c:if>Alumno
		</ul>
		<div id="tabs-1">
			<p>
				Nombre <form:input path="datosPersonales.nombre"/><br>
				Apellido <form:input path="datosPersonales.apellido" /><br>
				Tel&eacute;fono 1 <form:input path="telefono1" />
				Contacto <form:input path="contactoTelefono1" /><br>
				Tel&eacute;fono 2 <form:input path="telefono2" />
				Contacto <form:input path="contactoTelefono2" /><br>
				Tel&eacute;fono 3 <form:input path="telefono3" />
				Contacto <form:input path="contactoTelefono3" /><br>
				Turno <form:input path="turno" /><br>
				Fecha de alta <input name="fechaAlta" value="<fmt:formatDate value="${alumno.fechaAlta}" pattern="MM/dd/yyyy"/>" /> mm/dd/aaaa<br>
				Fecha de baja <input name="fechaBaja" value="<fmt:formatDate value="${alumno.fechaBaja}" pattern="MM/dd/yyyy"/>" /> mm/dd/aaaa<br>
				Material completo <form:textarea path="materialCompleto" /><br>
				Desempeño escolar <form:input path="desempenioEscolar" /><br>
			
				<input type="submit" value="Guardar" class="ui-state-default ui-corner-all" /> 
				<input type="button" value="Volver" class="ui-state-default ui-corner-all" 	onclick="location.href='../alumno/listaAlumnos.do'; return false;"  />
			</p>
		</div>
	</div>
</form:form>
</div>

</body>
</html>