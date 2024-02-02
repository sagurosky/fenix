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
	$("#nombreLocalidad").keypress(function(){

		$("#localidadId").val(0);
		$("#zonaCimientos").val("");
		$("#idZonaCimientos").val(0);
		$("#nombreProvincia").val("");
		$("#provinciaId").val(0);

		$("#nombreLocalidad").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarLocalidadPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						name_startsWith: request.term,
						maxRows:40
					},
					success: function(data) {
						response($.map(data.localidades, function(item) {
							return {
								label: item.nombre + ", " + item.nombreZona ,
								value: item.nombre,
								id: item.id,
								zonaCimientos: item.nombreZona,								
								idZonaCimientos: item.idZona,
								provincia: item.nombreProvincia,
								idProvincia: item.idProvincia
								
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#localidadId").val(ui.item.id);				
				$("#zonaCimientos").val(ui.item.zonaCimientos);
				$("#idZonaCimientos").val(ui.item.idZonaCimientos);
				$("#nombreProvincia").val(ui.item.provincia);
				$("#provinciaId").val(ui.item.idProvincia);
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
		document.forms['altaEscuela'].action ="<c:url value='/escuela/altaEscuela.do'/>";
	}else if(action=='volver'){
		document.forms['altaEscuela'].action ="<c:url value='/escuela/listaEscuelas.do'/>";
		document.forms['altaEscuela'].submit();
		return;
	}
	if($("#localidadId").val() != 0){
		$('#altaEscuela').submit();
	}
	else{
		$('#altaEscuela').submit();
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
<div id="accordion"  style="width:80%"   >
<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(1)" >Datos del Candidato</a></h3>
	<div id="datosCandidato"  style=" height:850px; ;overflow:scroll;">  	
			  	
			
  	
    <fieldset> 
		<legend>Alta Escuela Candidata:</legend>
		<p>
		<label>Nombre</label>
		<input type="text" id="nombre"  name="nombre" class="required" value="${escuela.nombre }">
		</p>

	<p>
	<label>Localidad</label>
		 <c:choose>
			<c:when test="${escuela.localidad != null}">
				<input type="text" id="nombreLocalidad" value="${escuela.localidad.nombre}"  class="required">
				<input type="hidden" name="localidad.id" id="localidadId" value="${escuela.localidad.id}"/>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="localidad.id" id="localidadId" value="" />
				<input type="text" id="nombreLocalidad" value=""  class="required"/>
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
				<input id="nombreProvincia" value=""  class="required"/>
				<input type="hidden" name="provincia.id" id="provinciaId" value="" />
			</c:otherwise>	
		</c:choose>
	</p>
	<p><label>Zona Cimientos</label>
		<c:choose>
			<c:when test="${escuela.zonaCimientos != null}">
				<input id="zonaCimientos" name="zonaCimientos.nombre" value="${escuela.zonaCimientos.nombre}"  class="required"/>
				<input type="hidden" name="zonaCimientos.id" 
					id="idZonaCimientos" value="${escuela.zonaCimientos.id}"/>
			</c:when>
			<c:otherwise>
				<input type="hidden" name="zonaCimientos.id" 
					id="idZonaCimientos" value=""/>
				<input id="zonaCimientos" name="zonaCimientos.nombre" value=""  class="required"/>
			</c:otherwise>	
		</c:choose> 
	</p>	
	</fieldset>
	</div> 
</div>
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