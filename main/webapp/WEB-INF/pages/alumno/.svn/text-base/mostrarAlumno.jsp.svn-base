<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<script type="text/javascript">

function enviarForm1(action, idalumno){
	
		document.forms['alumnoForm'].action = "../alumno/modificarAlumno.do";
		document.forms['alumnoForm'].idalumno.value = idalumno;
		document.forms['alumnoForm'].submit();
}
</script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"
	media="all">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alumno</title>
</head>

<body>

<div align="center" style="font-size: 14px"  class="ui-state-default ui-corner-all" id="content-wrap">
Datos Completos del Alumno<br><br>

	Apellido:&nbsp;<input type="text" value="${alumno.datosPersonales.apellido}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;<br>
	Nombre:&nbsp;<input type="text" value="${alumno.datosPersonales.nombre}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;<br>
	Tel&eacute;fono 1:&nbsp;<input type="text" value="${alumno.telefono1}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;<br>
	Contacto tel&eacute;fono 1:&nbsp;<input type="text" value="${alumno.contactoTelefono1}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;<br>
	Tel&eacute;fono 2:&nbsp;<input type="text" value="${alumno.telefono2}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;<br>
	Contacto tel&eacute;fono 2:&nbsp;<input type="text" value="${alumno.contactoTelefono2}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;<br>
	Tel&eacute;fono 3:&nbsp;<input type="text" value="${alumno.telefono3}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;<br>
	Contacto tel&eacute;fono 3:&nbsp;<input type="text" value="${alumno.contactoTelefono3}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;<br>
	Turno:&nbsp;<input type="text" value="${alumno.turno}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;<br>
	Fecha de Alta:&nbsp;<input type="text" value="<fmt:formatDate value="${alumno.fechaAlta}" pattern="MM/dd/yyyy"/>" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;mm/dd/aaaa<br>
	Fecha de baja:&nbsp;<input type="text" value="<fmt:formatDate value="${alumno.fechaBaja}" pattern="MM/dd/yyyy"/>" class="ui-state-default ui-corner-all" disabled="disabled" />mm/dd/aaaa<br>
	Material completo:<textarea  class="ui-state-default ui-corner-all" disabled="disabled" >${alumno.materialCompleto}</textarea>
	Desempe&ntilde;o escolar:&nbsp;<input type="text" value="${alumno.desempenioEscolar}" class="ui-state-default ui-corner-all" disabled="disabled" />&nbsp;
</div>
<br />
<div id="wrap">
<table align="center" >
	<tr>
		<td><input type="submit" value="Modificar"
			class="ui-state-default ui-corner-all"
			onclick="enviarForm1('modificar','${alumno.id}')">
		</td>
		<td><input type="button" value="Volver"
			class="ui-state-default ui-corner-all"
			onclick="location.href='../alumno/listaAlumnos.do'; return false;" />
		</td>
	</tr>
</table>
</div>
<br />
<br />
<form:form name="alumnoForm" method="post" commandName="alumno">
	<input type="hidden" name="idalumno" />
</form:form>
</body>
</html>