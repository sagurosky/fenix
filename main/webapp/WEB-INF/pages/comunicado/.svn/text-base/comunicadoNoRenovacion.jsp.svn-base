<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
	..:: Comunicado de Renovación Pendiente ::..
</title>
<script type="text/javascript"	src="<c:url value="/static/js/funcionesEntrevista.js"/>"></script>

<script type="text/javascript">
$(function() {
	$('#tabla1').dataTable( {
		"sDom": '<"H"l>rt<"F"ip>',
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>' +
		'<option value="50">50</option>'+
		'<option value="75">75</option>'+
		'<option value="100">100</option>'+
		'<option value="-1">Todos</option>'+
		'</select> registros por hoja',
		"sZeroRecords": "No se encontraron registros",
		"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		"sInfoEmtpy": "Mostrando 0 registros",
		"sInfoFiltered": "(filtrado de _MAX_ registros totales)",
		"sSearch": "Buscar",
		"oPaginate": {
			"sFirst":    "Primera",
			"sPrevious": "Anterior",
			"sNext":     "Siguiente",
			"sLast":     "Ultima"
		}
		
		},
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25
	});
	});
</script>
</head>
<body>
<div id="main-content">
<form:form modelAttribute="pendiente" id="alta" name="alta" cssClass="cmxform" commandName="pendiente" method="post" action="">
<h1 id="titulo-informe">:: Comunicado No Renovación ::</h1>
	<table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		<tr>
		<td colspan="2"><h1 id="subtitulo-informe"><label>Datos del Alumno</label></h1></td>
		</tr>
		
		<tr>
		<td width="150">Alumno:</td>
		<td width="600"><label>${comunicado.becado.datosPersonales.nombre},&nbsp;${comunicado.becado.datosPersonales.apellido}</label></td>
		</tr>
		
		
    	<tr>
		<td >Ciclo Lectivo:</td>
		<td ><label>${comunicado.cicloActual.nombre}</label></td>
		</tr>
	
		<tr>
		<td >Zona:</td>
		<td ><label>${comunicado.becado.escuela.localidad.zona.nombre}</label>
		</td>
		</tr>
		
		<tr>
		<td >Año:</td>
		<td ><label>${comunicado.becado.anioEscolar.valor}</label>
		</td>
		</tr>
		
		<tr>
		<td >Estado de Renovación:</td>
		<td ><label>${comunicado.er.evaluacionRenovacion.valor}</label>
		</td>
		</tr>
		
		<tr>
		<td >Motivo de Pendiente:</td>
		<td ><label>${comunicado.er.motivoPendiente.valor}</label>
		</td>
		</tr>
		
		<c:if test="${!empty comunicado.er.motivoOtro}">
		<tr>
		<td >Motivo Otro:</td>
		<td ><label>${comunicado.er.motivoOtro}</label>
		</td>
		</tr>
		</c:if>
		
		<tr>
        	<td>&nbsp;</td>
     	</tr>
    	
       <tr>
        <td colspan="2">
        <table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
          <tr>

		    <td width="50" height="0" align="center" valign="middle"><input type="button" value="Volver" class="ui-state-default ui-corner-all"	
		    	onclick="location.href='../comunicado/listaNoRenovados.do'; return false;"/></td>
		   </tr>	
	   </table>
	   <input type="hidden" name="idComunicado" ></input>
		</td>
	  </tr>
</table>
</form:form>
</div>
</body>
</html>