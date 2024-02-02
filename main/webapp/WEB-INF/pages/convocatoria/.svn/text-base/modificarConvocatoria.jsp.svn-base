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
<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<title>..:: Modificación Convocatoria ::..</title>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script type="text/javascript">

$(function() {

	$("#zonaCimientos").keypress(function(){
		$("#zonaCimientosId").val(0);
		$("#escuelaId").val(0);
		$("#nombreEscuela").val("");
		$("#zonaCimientos").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarZonaPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.zonas, function(item) {
							return {
								label: item.nombre,
								value: item.nombre,
								id: item.id
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#zonaCimientosId").val(ui.item.id);
				
			}
		});
	});

	
		$("#nombreEscuela").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarColegiosZona.do?idZona=" + $("#zonaCimientosId").val(),
					dataType: "json",
					data: {
						style: "full",
						maxRows: 12,
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.escuelas, function(item) {
							return {
								label: item.nombre,
								value: item.nombre,
								id: item.id
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#escuelaId").val(ui.item.id);
			}
		});

});

</script>

<script>
$(document).ready(function(){
	$("#modificarConvocatoria").validate();
	$('#fechaInicio').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'-1:+1'
	});
	$('#fechaInicio').datepicker($.datepicker.regional['es']);

});

function enviarForm(action){
	if(action=='modificar'){
		document.forms['modificarConvocatoria'].action ="<c:url value='/convocatoria/modificarConvocatoria.do'/>";
	}else if(action=='volver'){
		document.forms['modificarConvocatoria'].action ="<c:url value='/convocatoria/listaConvocatoria.do'/>";
		document.forms['modificarConvocatoria'].submit();
		return ;
	}
	if($("#zonaCimientosId").val() != 0){
		if($("#escuelaId").val() != 0){
			$("#modificarConvocatoria").submit();
		}else{
			jAlert('warning', 'Ingrese una escuela válida', 'Atención!');	
		}
	}else{
		jAlert('warning', 'Ingrese una zona válida', 'Atención!');
	}
}  
</script>
<script type="text/javascript">
	function chequearLongitud(obj)
	{
		if (obj.value.length > 10000) 
		{
			obj.value = obj.value.substring(0, 10000);
		}
	}
</script>
</head>
<body>
<div id="main-content">

<form:form id="modificarConvocatoria" cssClass="cmxform" method="post" commandName="convocatoria" name="modificarConvocatoria">
<form:hidden path="idConvocatoria"/>
    <fieldset>
    <legend>Modificación de Convocatoria</legend>
    <br>
    <p>
	<label>Nombre Convocatoria:</label>
		<input  name="nombre" id="nombre" class="required" value="${convocatoria.nombre}"/>
	</p>		   
    <p>
    <label>Zona Cimientos</label>
    		<c:choose>
				<c:when test="${convocatoria.zonaCimientos.id != null}">
					<input type="hidden" name="zonaCimientos.id" id="zonaCimientosId" 
						value="${convocatoria.zonaCimientos.id}" class="required"/>
					<input type="text" id="zonaCimientos" value="${convocatoria.zonaCimientos.nombre}" class="required"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="zonaCimientos.id" id="zonaCimientosId" 
						value="" class="required"/>
					<input type="text" id="zonaCimientos" value="" class="required"/>
				</c:otherwise>	
			</c:choose>
	</p>	
	<p>
	<label>Escuela</label>
			<c:choose>
				<c:when test="${convocatoria.escuela != null}">
					<input type="hidden" name="escuela.id" id="escuelaId" value="${convocatoria.escuela.id}"/>
					<input  name="nombreEscuela"  id="nombreEscuela" value="${convocatoria.escuela.nombre}" class="required"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="escuela.id" id="escuelaId" value=""/>
					<input id="nombreEscuela"  value="" class="required"/>
				</c:otherwise>	
		</c:choose>
	</p>	
	<p>
	<label>Ciclo Programa</label>
		<select id="cicloPrograma.id" name="cicloPrograma.id" class="required">
			<option value="">Seleccione una opción...</option>
			<c:forEach var="ciclo" items="${listCiclos}">
				<c:choose>
					<c:when test="${convocatoria.cicloPrograma.id == ciclo.id}">
						<option  value="${ciclo.id}" selected="selected">${ciclo.nombre}</option>
					</c:when>
					<c:otherwise>
						<option  value="${ciclo.id}">${ciclo.nombre}</option>
					</c:otherwise>	
				</c:choose>
			</c:forEach>
		</select>
	</p>	
	<p>
	<label for="fechaInicio">Fecha Inicial:</label>
		<input name="fechaInicioText" id="fechaInicio" 
			   class="text-input required date" value="<fmt:formatDate value="${convocatoria.fechaInicio}" pattern="dd/MM/yyyy"/>" />
	</p>
	<p>
	<label>Observaciones</label>
		<form:textarea path="observaciones" rows="4" cols="40" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
	</p>		   
	</fieldset>	
        <table align="center">
          <tr>
			<td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="button" value="Modificar" onclick="enviarForm('modificar')" /></td>
			<td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="button" value="Volver" onclick="enviarForm('volver')" /></td>
	    </tr>
	</table>
</form:form>
	
</div>
</body>
</html>