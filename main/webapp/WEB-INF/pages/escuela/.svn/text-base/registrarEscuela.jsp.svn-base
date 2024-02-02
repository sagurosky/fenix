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
<title>..:: Registrar Escuelas Candidatas ::..</title>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>


<script type="text/javascript">

$(function() {
	$("#nombreBarrio").keypress(function(){

		$("#idBarrio").val(0);
		$("#localidadId").val(0);
		$("#nombreLocalidad").val("");
		$("#zonaCimientos").val("");
		$("#idZonaCimientos").val(0);
		$("#nombreProvincia").val("");
		$("#provinciaId").val(0);

		$("#nombreBarrio").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarBarrioPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.barrios, function(item) {
							return {
								label: item.nombre + ", " + item.localidad ,
								value: item.nombre,
								id: item.id,
								provincia: item.provincia,
								idProvincia: item.idProvincia
							}
						}))
					}
				})
			},
			select: function(event, ui) {
	
				var direccion = "../ajax/buscarLocalidadZona.do?idBarrio=" + ui.item.id;
				$.ajax({
	
					type: "POST",
					cache: false,
					url: direccion,
					dataType: "json", 
					processData: false,
					success: function(data){
						$("#idBarrio").val(data.id);
						$("#localidadId").val(data.idLocalidad);
						$("#nombreLocalidad").val(data.localidad);
						$("#zonaCimientos").val(data.zona);
						$("#idZonaCimientos").val(data.idZona);
						$("#nombreProvincia").val(ui.item.provincia);
						$("#provinciaId").val(ui.item.idProvincia);
					}
	
				});
			}
		});
	});
});

</script>

<script type="text/javascript">

$(document).ready(function(){
 
 	$("#altaEscuela").validate();
 
 });

function enviarForm(action){
	if(action=='alta'){
		document.forms['altaEscuela'].action ="<c:url value='/escuela/registrarEscuela.do'/>";
	}else if(action=='volver'){
		document.forms['altaEscuela'].action ="<c:url value='/escuela/listaEscuelas.do'/>";
		document.forms['altaEscuela'].submit();
		return;
	}
	if($("#localidadId").val() != 0){
		$('#altaEscuela').submit();
	}else{
		alert('ingrese un barrio válido');
	}	
}	
</script>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

</head>
<body>
<div id="main-content">

<form:form id="altaEscuela" class="cmxform" action="registrarEscuela.do" method="post" commandName="escuela" name="altaEscuela">
<form:hidden path="id"/>
    <fieldset> 
		<legend>Registrar Escuela Candidata:</legend>
		<p>
		<label>Nombre</label>
		<input type="text" id="nombre"  name="nombre" class="required" value="${escuela.nombre }">
		</p>
		<p>
		<label>Barrio</label> 
			<c:choose>
				<c:when test="${escuela.barrio != null}">
					<input type="text" id="nombreBarrio" value="${escuela.barrio.nombre}" class="required"/>
					<input type="hidden" name="barrio.id" id="idBarrio" value="${escuela.barrio.id}"/>
				</c:when>
				<c:otherwise>
					<input type="hidden" name="barrio.id" id="idBarrio" value="" />
					<input id="nombreBarrio" value="" class="required"/>
				</c:otherwise>	
			</c:choose>
		</p>

	<p>
	<label>Localidad</label>
		 <c:choose>
			<c:when test="${escuela.localidad != null}">
				<input type="text" id="nombreLocalidad" value="${escuela.localidad.nombre}" disabled="disabled" class="required">
				<input type="hidden" name="localidad.id" id="localidadId" value="${escuela.localidad.id}"/>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="localidad.id" id="localidadId" value="" />
				<input type="text" id="nombreLocalidad" value="" disabled="disabled" class="required"/>
			</c:otherwise>	
		</c:choose>
	</p>
	<p>
	<label>Provincia</label>
		<c:choose>
			<c:when test="${escuela.provincia != null}">
				<input id="nombreProvincia" value="${escuela.provincia.descripcion}" disabled="disabled"/ class="required">
				<input type="hidden" name="provincia.id" id="provinciaId" value="${escuela.provincia.id}"/>
			</c:when>
			<c:otherwise>
				<input id="nombreProvincia" value="" disabled="disabled" class="required"/>
				<input type="hidden" name="provincia.id" id="provinciaId" value="" />
			</c:otherwise>	
		</c:choose>
	</p>
	<p><label>Zona Cimientos</label>
		<c:choose>
			<c:when test="${escuela.zonaCimientos != null}">
				<input id="zonaCimientos" name="zonaCimientos.nombre" value="${escuela.zonaCimientos.nombre}" disabled="disabled" class="required"/>
				<input type="hidden" name="zonaCimientos.id" 
					id="idZonaCimientos" value="${escuela.zonaCimientos.id}"/>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="zonaCimientos.id" 
					id="idZonaCimientos" value=""/>
				<input id="zonaCimientos" name="zonaCimientos.nombre" value="" disabled="disabled" class="required"/>
			</c:otherwise>	
		</c:choose> 
	</p>	
	</fieldset> 
		<table align="center">
			<tr>
				<td>
					<input class="ui-state-default ui-corner-all " type="button" value="Registrar" onclick="enviarForm('alta')"/>
					
				</td>
				<td>
					<input class="ui-state-default ui-corner-all " type="button" value="Volver" onclick="enviarForm('volver')"/>
					
				</td>
			</tr>
		</table>
</form:form>
	
</div>
</body>
</html>