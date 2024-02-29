<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>..:: Registrar Escuelas Candidatas ::..</title>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<style>
.textbox2
	 { 
	  border: 1px solid #DBE1EB; 
	  font-size: 14px; 
	  font-family: Arial, Verdana; 
	  padding-left: 2px; 
	  padding-right: 2px; 
	  padding-top: 2px; 
	  padding-bottom: 2px; 
	  border-radius: 4px; 
	  -moz-border-radius: 4px; 
	  -webkit-border-radius: 4px; 
	  -o-border-radius: 4px; 
	  background: #FFFFFF; 
	  background: linear-gradient(left, #FFFFFF, #f5ebf2); 
	  background: -moz-linear-gradient(left, #FFFFFF, #f5ebf2); 
	  background: -webkit-linear-gradient(left, #FFFFFF, #f5ebf2); 
	  background: -o-linear-gradient(left, #FFFFFF, #f5ebf2); 
	  color: #2E3133; 	 
	 } 
	 .textbox2:focus 
	  { 
	  color: #2E3133; 
	  border-color: #FBFFAD; 
	  }	  
</style>
<style type="text/css">
.classnameboton {
	-moz-box-shadow:inset 0px 1px 22px 0px #dcecfb;
	-webkit-box-shadow:inset 0px 1px 22px 0px #dcecfb;
	box-shadow:inset 0px 1px 22px 0px #dcecfb;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f5ebf2), color-stop(1, #f5ebf2) );
	background:-moz-linear-gradient( center top, #f5ebf2 5%, #f5ebf2 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5ebf2', endColorstr='#f5ebf2');
	background-color:#f5ebf2;
	-webkit-border-top-left-radius:15px;
	-moz-border-radius-topleft:15px;
	border-top-left-radius:15px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:15px;
	-moz-border-radius-bottomright:15px;
	border-bottom-right-radius:15px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #84bbf3;
	display:inline-block;
	color:#000000;
	font-family:Arial;
	font-size:13px;
	font-weight:bold;
	font-style:normal;
	height:25px;
	line-height:25px;
	width:145px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #528ecc;
}
.classnameboton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f5ebf2), color-stop(1, #f5ebf2) );
	background:-moz-linear-gradient( center top, #f5ebf2 5%, #f5ebf2 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5ebf2', endColorstr='#f5ebf2');
	background-color:#f5ebf2;
	text-decoration: none;
}.classnameboton:active {
	position:relative;
	top:1px;
}	
</style>

<script type="text/javascript">
function chequearLongitud(obj,cant){
	if (obj.value.length > cant) {
		obj.value = obj.value.substring(0, cant);
	}
}

$(function() {
	$("#nombreLocalidad").keypress(function(){

		$("#localidadId").val("");
		$("#zonaCimientos").val("");
		$("#idZonaCimientos").val("");
		$("#nombreProvincia").val("");
		$("#provinciaId").val("");

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

$(document).ready(function(){
 	$("#altaEscuela").validate();
 	if($("#modalidadTrabajoEscuela option:selected" ).text()=='Contacto Virtual')
 		$("#ocultarVirtual").hide();
 	
 	//mostrar u ocultar "otro" en espacios de apoyo
 	
 	if ($("#espacioApoyoid option:selected[value='15']").length > 0) {
            $("#muestraCual").show();
            $("#cualOtroEspacioApoyo").show();
        } else {
            $("#muestraCual").hide();
            $("#cualOtroEspacioApoyo").hide();
        }
 	
 	

 	
 	 
 	
 	
 	
 	
 });
 

 function mostrarCual(){
	 if ($("#espacioApoyoid option:selected[value='15']").length > 0) {
	        // Muestra la otra parte
	        $("#muestraCual").show();
	        $("#cualOtroEspacioApoyo").show();
	    } else {
	        // Oculta la otra parte
	        $("#muestraCual").hide();
	        $("#cualOtroEspacioApoyo").hide();
	    }
 }
 
 
function validarLocalidad()
{
	if ($("#nombreLocalidad").val() == '')
	{
	   	document.getElementById("seccion1").style.display="inline";
	}
	else
	{
	   	document.getElementById("seccion1").style.display="none";
	} 
}

function limpiarLocalidad(){
	$("#nombreLocalidad").val('');
	$("#localidadId").val('');
}

function chequearLocalidad(){
	if(document.getElementById("localidadId").value == ''){
		$("#nombreLocalidad").val('');
		$("#localidadId").val('');	
	}
}
function enviarForm(action){
	if(action=='alta'){
		document.forms['altaEscuela'].action ="<c:url value='/escuela/altaEscuela.do'/>";
	}
	else if(action=='volverEscuela'){
		eliminarAtributoRequired();
		document.forms['altaEscuela'].action ="<c:url value='/escuela/listaEscuelas.do'/>";
		document.forms['altaEscuela'].submit();
		return;
	}

	$('#altaEscuela').submit();
	
		
}
function eliminarAtributoRequired(){
	$('#nombre').removeClass("required");
	$('#modalidad').removeClass("required");
	$('#nivelAtiendeEscuela').removeClass("required");
	$('#cantidadDeAnios').removeClass("required");
	$('#dependencia').removeClass("required");
	$('#codigoPostal').removeClass("required");
	$('#direccionCalle').removeClass("required");
	$('#direccionNumero').removeClass("required");
	$('#nombreLocalidad').removeClass("required");
	$('#zonaCimientos').removeClass("required");
	$('#rural').removeClass("required");
	$('#subsidioEstatal').removeClass("required");
	$('#estadoEscuela').removeClass("required");
	$('#programa').removeClass("required");
}
function cambiarMotivos(){
	if(document.getElementById('idEstadoEscuela').value == 3){
		$("#motivoNoSeleccion").removeAttr("disabled");
	}else{
		$("#motivoNoSeleccion").val("");
		$("#motivoNoSeleccion").attr("disabled","disabled");
	}
}

function habilitarCampos(){
	if($("#modalidadTrabajoEscuela option:selected" ).text()=='Contacto Virtual')
		{
		$("#ocultarVirtual").hide(500);
		}else
			{
			$("#ocultarVirtual").show(500);
			}
	
	if((document.getElementById("modalidadTrabajoEscuela").value == 4) 
			|| (document.getElementById("modalidadTrabajoEscuela").value == 5)){
		document.getElementById("comProy").disabled = false;
		document.getElementById("fase").disabled = false;
	}
	else{
		document.getElementById("comProy").disabled = true;
		document.getElementById("fase").disabled = true;
		document.getElementById("fase").value = '';
	}

	habilitarObj();
	
	if(document.getElementById("modalidadTrabajoEscuela").value != 1 && document.getElementById("modalidadTrabajoEscuela").value != ''){
		document.getElementById("matricula").disabled = false;
		document.getElementById("comPBE").disabled = false;
		document.getElementById("indicadorRepitencia").disabled = false;
		document.getElementById("indicadorAbandono").disabled = false;
		document.getElementById("porcentajeInasistencia").disabled = false;
	}
	else{
		document.getElementById("matricula").disabled = false;
		document.getElementById("comPBE").disabled = false;
		document.getElementById("indicadorRepitencia").disabled = false;
		document.getElementById("indicadorAbandono").disabled = false;
		document.getElementById("porcentajeInasistencia").disabled = false;
	}
}

function habilitarObj(){
	if(document.getElementById("fase").value == 2){
		document.getElementById("objetivoProyecto").disabled = false;
	}
	else{
		document.getElementById("objetivoProyecto").disabled = true;
		document.getElementById("objetivoProyecto").value = '';
	}
}

function validarIndicador(obj){
	if(obj.value > 1000){
		obj.value = 0;
		alert("El valor debe ser entre 0 y 5000");
	}
}

</script>
<style type="text/css">
	label { width: 12em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: middle; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
	body{
   font-size: 12px;
	}
	h3{
		color:#8C3F99;
	}
</style>


</head>


<body onload="habilitarCampos()" >
<%
   Date dNow = new Date();
   SimpleDateFormat ft = 
   new SimpleDateFormat ("MM/dd/yyyy");
   String currentDate = ft.format(dNow);
%>
 

<input type="hidden" id="ultimaModificacion" name="ultimaModificacion" value="<%=currentDate%>">
<div id="main-content">

<form:form id="altaEscuela" action="registrarEscuela.do" method="post" commandName="escuela" name="altaEscuela">
<form:hidden path="id"/>
<c:set var="urlRegreso" value="${urlRegreso}"></c:set>
	<center>
<!--     <h3>Este documento consta de tres páginas, las dos primeras las debe completar el equipo directivo y la tercer página solo el EA.</h3><br> -->
    <h3 title="id escuela: ${escuela.id} ">FICHA ESCUELA</h3><br>
    <h4>(Fecha de ultima modificacion ${escuela.ultimaModificacion})</h4><br><br>
    </center>
<!--     <fieldset style="width:1000px;"> -->
<%-- 		<legend><strong>INFORMACIÓN PARA CONSULTAR CON EL/LA REFERENTE ESCOLAR</strong></legend> --%>
<fieldset>
		<table>			
			<tr>
				<td>Nombre de la Escuela<br>(no usar comillas)*</td>
				<td><input type="text" id="nombre"  name="nombre" class="required textbox2" value="${escuela.nombre}"></td>
	
				<td>CUE (solo numeros)</td>
				<td><input class="textbox2" id="cue" name="codigoUnicoEscolar" onblur="chequearLongitud(this,10);" onkeypress="chequearLongitud(this,10);" class="digits" value="${escuela.codigoUnicoEscolar}"></td>
				<td>Modalidad *</td>
				<td><select name="idModalidad" id="modalidad" class="required textbox2" style="width: 11em;">
					<option></option>
					<c:forEach items="${modalidadesEscuela}" var="modalidad">
						<c:choose>
							<c:when test="${escuela.modalidad.id == modalidad.id}">
								<option value="${modalidad.id}" selected="selected">${modalidad.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${modalidad.id}" >${modalidad.valor}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				</td>
			</tr>
			<tr>					
				<td>Orientaciones</td>
				<td>
					<input type="text"  class="textbox2" id="orientacion"  name="orientacion" value="${escuela.orientacion}">
				</td>
				<td>Nivel que atiende *<br>(opción múltiple)</td>
				<td>
				
				<select name="idNivelAtiendeEscuela" id="nivelAtiendeEscuela" class=" textbox2" style="width: 11em;" hidden>
					<option></option>
					<c:forEach items="${nivelesEscuela}" var="nivelEscuela">
						
						<c:choose>
							<c:when test="${escuela.nivelAtiendeEscuela.id == nivelEscuela.id}">
								<c:choose>
									<c:when test="${nivelEscuela.id == 1 or nivelEscuela.id == 2 or 
									nivelEscuela.id == 4 or nivelEscuela.id == 5 or 
									nivelEscuela.id == 6 or nivelEscuela.id == 7 or  
 									nivelEscuela.id == 10 or nivelEscuela.id ==11}"> 
										<option value="${nivelEscuela.id}" selected="selected" disabled>${nivelEscuela.valor}</option>
									</c:when>
									<c:otherwise>
										<option value="${nivelEscuela.id}" selected="selected" >${nivelEscuela.valor}</option>
									</c:otherwise>								
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${nivelEscuela.id == 1 or nivelEscuela.id == 2 or 
									nivelEscuela.id == 4 or nivelEscuela.id == 5 or  
									nivelEscuela.id == 6 or nivelEscuela.id == 7 or  
 									nivelEscuela.id == 10 or nivelEscuela.id ==11}"> 
										<option value="${nivelEscuela.id}" disabled>${nivelEscuela.valor}</option>
									</c:when>
									<c:otherwise>
										<option value="${nivelEscuela.id}"  >${nivelEscuela.valor}</option>
									</c:otherwise>								
								</c:choose>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				<form:select path="nivelesAtiendeEscuela" class="textbox2">
						<form:options items="${nivelesEscuela}" itemLabel="valor" itemValue="id"/>				
						</form:select>
						
				</td>	
				<td>Turnos de la escuela<br>(opción múltiple)</td>			
					<td><form:select path="turno" class="textbox2">
						<form:options items="${turnos}" itemLabel="valor" itemValue="id"/>				
						</form:select>
						<input type="hidden" id="idCantidadDeAnios" name="idCantidadDeAnios" value="7">
					</td>
			</tr>
			<tr>
				<td>Tipo de Gestión *</td>
				<td><select name="idDependencia" id="dependencia" class="required textbox2" style="width:11em">
					<option></option>
					<c:forEach items="${dependencias}" var="dependencia">
						<c:choose>
							<c:when test="${escuela.dependencia.id == dependencia.id}">
								<option value="${dependencia.id}" selected="selected">${dependencia.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${dependencia.id}" >${dependencia.valor}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				</td>
			</tr>	
	</table>
	</fieldset>
	</br></br>
<fieldset>	
	<legend><strong>INFORMACIÓN INSTITUCIONAL DEL NIVEL SECUNDARIO</strong></legend>
	</br>
	<table>
		<tr>
				<td>Dirección *</td>
				<td><input type="text" id="direccionCalle"  name="direccionCalle" class="required textbox2" value="${escuela.direccionCalle}"></td>
				<td>N&uacute;mero *</td>
				<td><input type="text" id="direccionNumero" name="direccionNumero" class="required digits textbox2" value="${escuela.direccionNumero}"></td>				
				<td>Barrio</td>
				<td><input class="textbox2" type="text" id="barrio" name="barrio" value="${escuela.barrio}"></td>
			</tr>
			<tr>
				<td>
					Localidad *
				</td>
				<td>
					 <c:choose>
						<c:when test="${escuela.localidad != null}">
							<input type="text" id="nombreLocalidad" value="${escuela.localidad.nombre}"  class="required textbox2"  onclick="limpiarLocalidad()" onblur="chequearLocalidad()" >
							<input type="hidden" name="localidad.id" id="localidadId" value="${escuela.localidad.id}"/>
						</c:when>
						<c:otherwise>
							<input type="hidden" name="localidad.id" id="localidadId" value="" />
							<input type="text" id="nombreLocalidad" value=""  class="required textbox2"  onclick="limpiarLocalidad()" onblur="chequearLocalidad()" />
						</c:otherwise>	
					</c:choose>
				</td>		
				<td>C&oacute;digo Postal *</td>
				<td><input class="textbox2" type="text" id="codigoPostal" name="codigoPostal" class="required digits" value="${escuela.codigoPostal}"></td>			
				<td>Provincia *</td>
				<td><c:choose>
					<c:when test="${escuela.provincia != null}">
						<input id="nombreProvincia" value="${escuela.provincia.descripcion}" disabled="disabled" class="required textbox2">
						<input type="hidden" name="provincia.id" id="provinciaId" value="${escuela.provincia.id}"/>
					</c:when>
					<c:otherwise>
						<input class="textbox2" id="nombreProvincia" value=""  class="required textbox2" disabled="disabled"/>
						<input type="hidden" name="provincia.id" id="provinciaId" value="" />
					</c:otherwise>	
				</c:choose>
				</td>
			</tr>		
			<tr>
	
				<td>Zona Cimientos *</td>
				<td><c:choose>
					<c:when test="${escuela.zonaCimientos != null}">
						<input id="zonaCimientos" name="zonaCimientos.nombre" disabled="disabled" value="${escuela.zonaCimientos.nombre}"  class="required textbox2"/>
						<input type="hidden" name="zonaCimientos.id" 
							id="idZonaCimientos" value="${escuela.zonaCimientos.id}"/>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="zonaCimientos.id" 
							id="idZonaCimientos" value=""/>
						<input id="zonaCimientos" name="zonaCimientos.nombre" value="" disabled="disabled"  class="required textbox2"/>
					</c:otherwise>	
				</c:choose>
				</td> 
			
				<td>Tel&eacute;fono institucional</td>
				<td><input type="text" class="textbox2" id="telefono1" name="telefono1" class="digits" value="${escuela.telefono1}"></td>
<!-- 				<td>T&eacute;lefono 2</td> -->
				<input type="hidden" class="textbox2" id="telefono2" name="telefono2" class="digits" value="${escuela.telefono2}">		
				<td>Mail Institucional</td>
				<td><input type="text" class="textbox2" id="mail" name="mail" value="${escuela.mail}"></td>
			</tr>
	</table>
	
	<br><br>
	<center>
	<fieldset style="width:90%;">
	<legend><strong>AUTORIDADES</strong></legend>	
	<br>
	<table style="width:100%;  text-align:center " >
		<thead>
			<tr>
				<td><h4>ROL</h4> </td>
				<td> <h4>NOMBRE Y APELLIDO</h4></td>
				<td> <h4>TELÉFONO</h4></td>
				<td> <h4>CORREO ELECTRÓNICO</h4></td>
				<td> <h4>¿Es referente para la<br> articulación con Eas?</h4></td>
			</tr>
		</thead>
		<tr>
			<td>
			<select class="textbox2" id="rolAutoridad1" name="rolAutoridad1">
				<c:choose>
					<c:when test="${escuela.rolAutoridad1=='rector/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a" selected>rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${
					(escuela.rolAutoridad1=='director/a')
					||
					((escuela.director!='')&&(escuela.director!=null))
					||
					((escuela.directorCelular!='')&&(escuela.directorCelular!=null))
					||
					((escuela.directorMail!='')&&(escuela.directorMail!=null))
					}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a" >rector/a</option>
							<option value="director/a" selected>director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad1=='vicedirector/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a"selected>vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad1=='preceptor/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a"selected>preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad1=='equipo orientación'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación"selected>equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad1=='secretario/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a"selected>secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad1=='otro'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro"selected>otro</option>
					</c:when>
					<c:otherwise>
							<option value="" selected>seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:otherwise>
					
				</c:choose>
				</select>
			</td>
			<td>
<!-- 			DMS muestro el nombre del director si ya estaba cargado o el nombre del nuevo registro 
				idem para telefono y mail-->
				<c:if test="${(escuela.nombreApellidoAutoridad1==null)||(escuela.nombreApellidoAutoridad1=='')}">
					<input type="text" class="textbox2"id="nombreApellidoAutoridad1" name="nombreApellidoAutoridad1"value="${escuela.director}"/>
				</c:if>
				<c:if test="${(escuela.nombreApellidoAutoridad1!=null)&&(escuela.nombreApellidoAutoridad1!='')}">
					<input type="text" class="textbox2"id="nombreApellidoAutoridad1" name="nombreApellidoAutoridad1"value="${escuela.nombreApellidoAutoridad1}"/>
				</c:if>
				
			</td>
			<td>
				<c:if test="${(escuela.telefonoAutoridad1==null)||(escuela.telefonoAutoridad1=='')}">
					<input type="text" class="textbox2"id="telefonoAutoridad1" name="telefonoAutoridad1"value="${escuela.directorCelular}"/>
				</c:if>
				<c:if test="${(escuela.telefonoAutoridad1!=null)&&(escuela.telefonoAutoridad1!='')}">
					<input type="text" class="textbox2"id="telefonoAutoridad1" name="telefonoAutoridad1"value="${escuela.telefonoAutoridad1}"/>
				</c:if>
			</td>
			<td>
				<c:if test="${(escuela.mailAutoridad1==null)||(escuela.mailAutoridad1=='')}">
					<input type="text" class="textbox2"id="mailAutoridad1" name="mailAutoridad1"value="${escuela.directorMail}"/>
				</c:if>
				<c:if test="${(escuela.mailAutoridad1!=null)&&(escuela.mailAutoridad1!='')}">
					<input type="text" class="textbox2"id="mailAutoridad1" name="mailAutoridad1"value="${escuela.mailAutoridad1}"/>
				</c:if>
			</td>
			<td><input type="text" class="textbox2"id="esReferenteAutoridad1" name="esReferenteAutoridad1"value="${escuela.esReferenteAutoridad1}"/></td>
		</tr>
		<tr>
			<td>
			<select class="textbox2" id="rolAutoridad2" name="rolAutoridad2">
			<c:choose>
					<c:when test="${escuela.rolAutoridad2=='rector/a'}">
							<option value="" selected>seleccione una opci&oacute;n</option>
							<option value="rector/a" selected>rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad2=='director/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a" >rector/a</option>
							<option value="director/a"selected>director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${
					(escuela.rolAutoridad2=='vicedirector/a')
					||
					((escuela.secretario!='')&&(escuela.secretario!=null))
					||
					((escuela.secretarioCelular!='')&&(escuela.secretarioCelular!=null))
					||
					((escuela.secretarioMail!='')&&(escuela.secretarioMail!=null))
					}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a"selected>vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad2=='preceptor/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a"selected>preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad2=='equipo orientación'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación"selected>equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad2=='secretario/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a"selected>secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad2=='otro'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro"selected>otro</option>
					</c:when>
					<c:otherwise>
							<option value="" selected>seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:otherwise>
				</c:choose>
			</select>	
			</td>
			<td>
				<c:if test="${(escuela.nombreApellidoAutoridad2==null)||(escuela.nombreApellidoAutoridad2=='')}">
					<input type="text" class="textbox2"id="nombreApellidoAutoridad2" name="nombreApellidoAutoridad2"value="${escuela.secretario}"/>
				</c:if>
				<c:if test="${(escuela.nombreApellidoAutoridad2!=null)&&(escuela.nombreApellidoAutoridad2!='')}">
					<input type="text" class="textbox2"id="nombreApellidoAutoridad2" name="nombreApellidoAutoridad2"value="${escuela.nombreApellidoAutoridad2}"/>
				</c:if>			
			</td>
			<td>
				<c:if test="${(escuela.telefonoAutoridad2==null)||(escuela.telefonoAutoridad2=='')}">
					<input type="text" class="textbox2"id="telefonoAutoridad2" name="telefonoAutoridad2"value="${escuela.secretarioCelular}"/>
				</c:if>
				<c:if test="${(escuela.telefonoAutoridad2!=null)&&(escuela.telefonoAutoridad2!='')}">
					<input type="text" class="textbox2"id="telefonoAutoridad2" name="telefonoAutoridad2"value="${escuela.telefonoAutoridad2}"/>
				</c:if>	
			</td>
			
			<td>
				<c:if test="${(escuela.mailAutoridad2==null)||(escuela.mailAutoridad2=='')}">
					<input type="text" class="textbox2"id="mailAutoridad2" name="mailAutoridad2"value="${escuela.secretarioMail}"/>
				</c:if>
				<c:if test="${(escuela.mailAutoridad2!=null)&&(escuela.mailAutoridad2!='')}">
					<input type="text" class="textbox2"id="mailAutoridad2" name="mailAutoridad2"value="${escuela.mailAutoridad2}"/>
				</c:if>	
			</td>
			
			<td>
			<input type="text" class="textbox2"id="esReferenteAutoridad2" name="esReferenteAutoridad2"value="${escuela.esReferenteAutoridad2}"/>
			</td>
		</tr>
		<tr>
			<td>
		<select class="textbox2" id="rolAutoridad3" name="rolAutoridad3">
			<c:choose>
					<c:when test="${escuela.rolAutoridad3=='rector/a'}">
							<option value="" selected>seleccione una opci&oacute;n</option>
							<option value="rector/a" selected>rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad3=='director/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a" >rector/a</option>
							<option value="director/a"selected>director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad3=='vicedirector/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a"selected>vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad3=='preceptor/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a"selected>preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad3=='equipo orientación'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación"selected>equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad3=='secretario/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a"selected>secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad3=='otro'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro"selected>otro</option>
					</c:when>
					<c:otherwise>
							<option value="" selected>seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:otherwise>
				</c:choose>
			</select>	
			</td>
			<td><input type="text" class="textbox2"id="nombreApellidoAutoridad3" name="nombreApellidoAutoridad3"value="${escuela.nombreApellidoAutoridad3}"/></td>
			<td><input type="text" class="textbox2"id="telefonoAutoridad3" name="telefonoAutoridad3"value="${escuela.telefonoAutoridad3}"/></td>
			<td><input type="text" class="textbox2"id="mailAutoridad3" name="mailAutoridad3"value="${escuela.mailAutoridad3}"/></td>
			<td><input type="text" class="textbox2"id="esReferenteAutoridad3" name="esReferenteAutoridad3"value="${escuela.esReferenteAutoridad3}"/></td>
		</tr>
		<tr>
			<td>
			<select class="textbox2"id="rolAutoridad4" name="rolAutoridad4">
			<c:choose>
					<c:when test="${escuela.rolAutoridad4=='rector/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a" selected>rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad4=='director/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a" >rector/a</option>
							<option value="director/a" selected>director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad4=='vicedirector/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a"selected>vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad4=='preceptor/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a"selected>preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad4=='equipo orientación'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación"selected>equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad4=='secretario/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a"selected>secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad4=='otro'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro"selected>otro</option>
					</c:when>
					<c:otherwise>
							<option value="" selected>seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:otherwise>
				</c:choose>
				</select>
			</td>
			<td><input type="text" class="textbox2"id="nombreApellidoAutoridad4" name="nombreApellidoAutoridad4"value="${escuela.nombreApellidoAutoridad4}"/></td>
			<td><input type="text" class="textbox2"id="telefonoAutoridad4" name="telefonoAutoridad4"value="${escuela.telefonoAutoridad4}"/></td>
			<td><input type="text" class="textbox2"id="mailAutoridad4" name="mailAutoridad4"value="${escuela.mailAutoridad4}"/></td>
			<td><input type="text" class="textbox2"id="esReferenteAutoridad4" name="esReferenteAutoridad4"value="${escuela.esReferenteAutoridad4}"/></td>
		</tr>
		<tr>
			<td>
			<select class="textbox2"id="rolAutoridad5" name="rolAutoridad5">
			<c:choose>
					<c:when test="${escuela.rolAutoridad5=='rector/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a" selected>rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad5=='director/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a" >rector/a</option>
							<option value="director/a"selected>director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad5=='vicedirector/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a"selected>vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad5=='preceptor/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a"selected>preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad5=='equipo orientación'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación"selected>equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad5=='secretario/a'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a"selected>secretario/a</option>
							<option value="otro">otro</option>
					</c:when>
					<c:when test="${escuela.rolAutoridad5=='otro'}">
							<option value="" >seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro"selected>otro</option>
					</c:when>
					<c:otherwise>
							<option value="" selected>seleccione una opci&oacute;n</option>
							<option value="rector/a">rector/a</option>
							<option value="director/a">director/a</option>
							<option value="vicedirector/a">vicedirector/a</option>
							<option value="preceptor/a">preceptor/a</option>
							<option value="equipo orientación">equipo orientación</option>
							<option value="secretario/a">secretario/a</option>
							<option value="otro">otro</option>
					</c:otherwise>
				</c:choose>
			</select>	
			</td>
			<td><input type="text" class="textbox2"id="nombreApellidoAutoridad5" name="nombreApellidoAutoridad5"value="${escuela.nombreApellidoAutoridad5}"/></td>
			<td><input type="text" class="textbox2"id="telefonoAutoridad5" name="telefonoAutoridad5"value="${escuela.telefonoAutoridad5}"/></td>
			<td><input type="text" class="textbox2"id="mailAutoridad5" name="mailAutoridad5"value="${escuela.mailAutoridad5}"/></td>
			<td><input type="text" class="textbox2"id="esReferenteAutoridad5" name="esReferenteAutoridad5"value="${escuela.esReferenteAutoridad5}"/></td>
		</tr>
	</table>
	</fieldset>
	</center>
	<br>
	<br>
	
	
	<table>	
<!-- 			DMS borrar -->
<!-- 			<tr> -->
<!-- 				<td>Director/a</td> -->
<%-- 				<td><input type="text" class="textbox2" id="director" name="director" value="${escuela.director}"></td> --%>
<!-- 				<td>Vice-Director</td> -->
<%-- 				<td><input type="text" class="textbox2" id="secretario" name="secretario" value="${escuela.secretario}"></td> --%>
<!-- 				<td>Referente</td> -->
<%-- 				<td><input type="text" class="textbox2" id="responsable" name="responsable" value="${escuela.responsable}"></td> --%>
<!-- 			<tr> -->
<!-- 				<td>Celular Director/a</td> -->
<%-- 				<td><input type="text" class="textbox2" id="directorCelular" name="directorCelular" value="${escuela.directorCelular}"></td> --%>
<!-- 				<td>Celular Vice-Director/a</td> -->
<%-- 				<td><input type="text" class="textbox2" id="secretarioCelular" name="secretarioCelular" value="${escuela.secretarioCelular}"></td> --%>
<!-- 				<td>Celular Referente</td> -->
<%-- 				<td><input type="text" class="textbox2" id="responsableCelular" name="responsableCelular" value="${escuela.responsableCelular}"></td> --%>
<!-- 			</tr>	 -->
<!-- 			<tr> -->
<!-- 				<td>Mail Director/a</td> -->
<%-- 				<td><input type="text" class="textbox2" id="directorMail" name="directorMail" value="${escuela.directorMail}"></td>			 --%>
<!-- 				<td>Mail Vice-Director/a</td> -->
<%-- 				<td><input type="text" class="textbox2" id="secretarioMail" name="secretarioMail" value="${escuela.secretarioMail}"></td> --%>
<!-- 				<td>Mail Referente</td> -->
<%-- 				<td><input type="text" class="textbox2" id="responsableMail" name="responsableMail" value="${escuela.responsableMail}"></td> --%>
<!-- 			</tr> -->
			

			<tr>
				<td align="left">Matrícula total de estudiantes</td>
				<td>
					<input type="text" id="matricula" name="matricula"  class="textbox2" class="digits" value="${escuela.matricula}">
				</td>
				
				<td align="left">Total equipo directivo</td>
				<td>
					<input type="text"  id="equipoDirectivo"  name="equipoDirectivo"  class="digits textbox2" value="${escuela.equipoDirectivo}">
				</td>
				
				<td align="left">	
					<input type="hidden" name="idEstadoEscuela" id="estadoEscuela" value="1">
					<input type="hidden" id="motivoNoSeleccion" name="motivoNoSeleccion" value="${escuela.motivoNoSeleccion}">
					Total docentes</td>	
				<td><input type="text" id="totalDocentes" name="totalDocentes" class="textbox2" value="${escuela.totalDocentes}"></td>
			</tr>
			<tr>
			
			<td align="left">Total de preceptores</td>
			<td><input type="text" id="totalPreceptores" name="totalPreceptores" class="textbox2" value="${escuela.totalPreceptores}"></td>
			<td align="left">Total de personal de gabinete / Equipo <br>de orientación escolar </td>
			<td><input type="text" id="totalPersonal" name="totalPersonal" class="textbox2" value="${escuela.totalPersonal}"></td>
			
			</tr>
			
	</table>
</fieldset>	
			<br>
			<br>
<fieldset>			
	<legend><strong>INSTALACIONES DE LA ESCUELA</strong></legend>			
	<table >
		<tr>	
			<td>ESPACIOS Y RECURSOS (marcar todas las que corresponda)<br> <strong>Este campo va a la FP e IS1</strong><img src="../static/images/atencion.gif" width=10></td>					
			<td>
				<form:select class="textbox2" path="espacioApoyo" id="espacioApoyoid" onchange="mostrarCual()">
				<form:options items="${espaciosApoyo}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
				<td id="muestraCual">¿Cuál/es?</td>
				<td id="muestraCual"><textarea class="textbox2" rows="4" cols="38" name="cualOtroEspacioApoyo" id="cualOtroEspacioApoyo" onblur="chequearLongitud(this,200);"onkeypress="chequearLongitud(this,200);">${escuela.cualOtroEspacioApoyo}</textarea></td>
		</tr>
			<tr>
				<td align="left">¿La escuela trabaja en articulación con <br>otras organizaciones y/o programa de becas?	</td>			
			<td>
			Si <input class="textbox2" type="radio" value="true" id="tcoo" name="tcoo" class=" textbox2"
			<c:if test="${escuela.tcoo}"> checked="checked"</c:if> > 
			No<input class="textbox2" type="radio" id="tcoo" value="false" name="tcoo"
			<c:if test="${escuela.tcoo == false}"> checked="checked"</c:if>></td>	
			</tr>
			<tr>	
			<td>¿Cuáles?</td>
			<td><textarea class="textbox2" rows="4" cols="38" name="dsoo" id="dsoo" onblur="chequearLongitud(this,3000);"onkeypress="chequearLongitud(this,3000);">${escuela.dsoo}</textarea></td>			
		
			</tr>
	</table>
</fieldset>	
			<br><br>
<fieldset>			
	<legend><strong>ACCESIBILIDAD</strong></legend>			
	<table >
		<tr>	
			<td align="left">Está ubicada dentro de un barrio de emergencia</td>
				<td>
					<select class="textbox2" name="idEudbe" id="eudbe" style="width: auto;">
						<option></option>
						<c:forEach items="${eudbe}" var="eudbe">
							<c:choose>
								<c:when test="${escuela.eudbe.id == eudbe.id}">
									<option value="${eudbe.id}" selected="selected">${eudbe.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${eudbe.id}" >${eudbe.valor}</option>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</select>
				</td>
		</tr>
	<tr>								
				
				<td align="left">Tiene problemas de anegamiento cuando llueve</td>
				<td><select class="textbox2" name="idTpacl" id="tpacl" style="width: auto;">
					<option></option>
					<c:forEach items="${tpacl}" var="tpacl">
						<c:choose>
							<c:when test="${escuela.tpacl.id == tpacl.id}">
								<option value="${tpacl.id}" selected="selected">${tpacl.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${tpacl.id}" >${tpacl.valor}</option>
							</c:otherwise>
						</c:choose>
		
					</c:forEach>
					</select>
				</td>	
			</tr>
			<tr>
				<td align="left">Se puede llegar fácilmente en transporte público</td>
				<td><select class="textbox2" name="idSplftp" id="splftp" style="width: auto;">
						<option></option>
						<c:forEach items="${splftp}" var="splftp">
							<c:choose>
								<c:when test="${escuela.splftp.id == splftp.id}">
									<option value="${splftp.id}" selected="selected">${splftp.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${splftp.id}" >${splftp.valor}</option>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</select>
				</td>	
			</tr>
			<tr>				
				<td align="left">Está ubicada sobre una calle pavimentada</td>
				<td><select class="textbox2" name="idEuscp" id="euscp" style="width: auto;">
						<option></option>
						<c:forEach items="${euscp}" var="euscp">
							<c:choose>
								<c:when test="${escuela.euscp.id == euscp.id}">
									<option value="${euscp.id}" selected="selected">${euscp.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${euscp.id}" >${euscp.valor}</option>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</select>
				</td>	
			</tr>
	</table>	
	</fieldset>	
	<br><br>
	
	
	<fieldset >
		<legend><strong>ARTICULACIÓN CIMIENTOS</strong></legend>	
	<table>	
			<tr>
				<td colspan=4 align="center"><strong>BREVE DESCRIPCIÓN DE LA ESCUELA</strong></td> 
			</tr>	
			<tr>	
				<td colspan=4 align="center">mencionar información relevante como: población que recibe, principales problemáticas, recursos de apoyo al acompañamiento <br>
					(equipo de orientación, profesor referente, alguna organización barrial), condiciones edilicias, etc. *<br> <strong>esta información se va a
			 		enviar en los informes a padrinos - revisar redacción y tipeo</strong><img src="../static/images/atencion.gif" width=10></td>
			</tr>
			<tr><td><br></td></tr>
			
			<tr>
				<td colspan=4 align="center"><textarea class="textbox2" rows="4" cols="140" name="observaciones" id="observaciones" onblur="chequearLongitud(this,3000);"onkeypress="chequearLongitud(this,3000);">${escuela.observaciones}</textarea></td>
			</tr>							
			<tr><td></td></tr>
			<tr><td></td></tr>	
	</table>
	</fieldset>
	
	<br><br>
	<fieldset >		
	
	<legend><strong>PROGRAMAS QUE SE IMPLEMENTAN</strong></legend>	
	<table>
		<tr>
			<td>Programa futuros egresados: </td>
			<td>
				<select class="textbox2" disabled="disabled">
					<c:choose>
						<c:when test="${(escuela.programa.id==2)&&(escuela.becadosActivos>0)}">
							<option value="SI" selected>SI</option>
							<option value="NO">NO</option>
						</c:when>					
						<c:otherwise>
							<option value="SI" >SI</option>
							<option value="NO"selected>NO</option>
						</c:otherwise>
					</c:choose>
				</select>
			</td>
			<td>Total de estudiantes activos: </td>
			<td><input type=text class="textbox2" readonly value="${escuela.becadosActivos} "/></td>
		</tr>
		<tr>	
			<td>Año de comienzo de PFE: </td>
			<td>
			<select name="idComPBE" class="textbox2" id="comPBE" style="width: auto;" >
				<option></option>
				<c:forEach items="${ciclos2}" var="comPBE">
					<c:choose>
						<c:when test="${escuela.comienzoPBE.id == comPBE.id}">
							<option value="${comPBE.id}" selected="selected">${comPBE.nombre}</option>
						</c:when>
						<c:otherwise>
							<option value="${comPBE.id}" >${comPBE.nombre}</option>
						</c:otherwise>
					</c:choose>
	
				</c:forEach>
			</select>
			</td>
			<td align="left">Modalidad de trabajo</td>
			<td><select name="idModalidadTrabajoEscuela" class="textbox2" id="modalidadTrabajoEscuela" style="width: auto;" onchange="habilitarCampos()">
				<option></option>
				<c:forEach items="${modalidadesTrabajoEscuela}" var="modalidadTrabajo">
					<c:choose>
							<c:when test="${escuela.modalidadTrabajoEscuela.id == modalidadTrabajo.id}">
								<c:choose>
									<c:when test="${modalidadTrabajo.id == 2 or modalidadTrabajo.id == 4 or 
									modalidadTrabajo.id ==5}">
										<option value="${modalidadTrabajo.id}" selected="selected" disabled>${modalidadTrabajo.valor}</option>
									</c:when>
									<c:otherwise>
										<option value="${modalidadTrabajo.id}" selected="selected" >${modalidadTrabajo.valor}</option>
									</c:otherwise>								
								</c:choose>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${modalidadTrabajo.id == 2 or modalidadTrabajo.id == 4 or 
									modalidadTrabajo.id ==5}">
										<option value="${modalidadTrabajo.id}" disabled>${modalidadTrabajo.valor}</option>
									</c:when>
									<c:otherwise>
										<option value="${modalidadTrabajo.id}"  >${modalidadTrabajo.valor}</option>
									</c:otherwise>								
								</c:choose>
							</c:otherwise>
						</c:choose>		
					</c:forEach>
				</select>
			</td>
			
<!-- 			ocultar a partir de aca si es no es presencial -->
</table>



<br><br>
<table id="ocultarVirtual" >
<tr>
				<td align="left">El equipo directivo o referente facilita el espacio para el acompañamiento</td>
				<td>
					<select class="textbox2" name="idEdfea" id="edfea" style="width: auto;">
						<option></option>
						<c:forEach items="${edfea}" var="edfea">
							<c:choose>
								<c:when test="${escuela.edfea.id == edfea.id}">
									<option value="${edfea.id}" selected="selected">${edfea.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${edfea.id}" >${edfea.valor}</option>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>	
				<td align="left">El equipo directivo o referente brinda información solicitada por PFE</td>
				<td>
					<select class="textbox2" name="idEdbis" id="edbis" style="width: auto;">
						<option></option>
						<c:forEach items="${edbis}" var="edbis">
							<c:choose>
								<c:when test="${escuela.edbis.id == edbis.id}">
									<option value="${edbis.id}" selected="selected">${edbis.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${edbis.id}" >${edbis.valor}</option>
								</c:otherwise>
							</c:choose>	
						</c:forEach>
					</select>
				</td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td align="left">El equipo directivo o referente conoce las características y problemáticas de los alumnos</td> -->
<!-- 				<td> -->
				<select class="textbox2" name="idEdccpa" id="edccpa" style="width: auto;" hidden>
					<option></option>
					<c:forEach items="${edccpa}" var="edccpa">
						<c:choose>
							<c:when test="${escuela.edccpa.id == edccpa.id}">
								<option value="${edccpa.id}" selected="selected">${edccpa.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${edccpa.id}" >${edccpa.valor}</option>
							</c:otherwise>
						</c:choose>
		
					</c:forEach>
				</select>
<!-- 				</td> -->
<!-- 			</tr> -->
			<tr>	
				<td align="left">Se realizan acuerdos entre el equipo directivo o referente  y el/la EA <br>sobre la situación de los alumnos becados en riesgo</td>
				<td>
					<select class="textbox2" name="idRaeea" id="raeea" style="width: auto;">
						<option></option>
						<c:forEach items="${raeea}" var="raeea">
							<c:choose>
								<c:when test="${escuela.raeea.id == raeea.id}">
									<option value="${raeea.id}" selected="selected">${raeea.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${raeea.id}" >${raeea.valor}</option>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</select>
				</td>					
			</tr>
			<tr>
				<td align="left">El equipo directivo o referente está informado sobre el desarrollo de PFE</td>
				<td>	
					<select class="textbox2" name="idEcdPFE" id="ecdPFE" style="width: auto;">
						<option></option>
						<c:forEach items="${ecdpfe}" var="ecdPFE">
							<c:choose>
								<c:when test="${escuela.ecdPFE.id == ecdPFE.id}">
									<option value="${ecdPFE.id}" selected="selected">${ecdPFE.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${ecdPFE.id}" >${ecdPFE.valor}</option>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</select>
				</td>	
			</tr>
			<tr>
				<td ><strong>evaluación del compromiso del equipo directivo hacia el programa</strong> </td>				
					<td>
					<select  class="textbox2" name="idCed" id="ced" style="width: auto;">
						<option></option>
						<c:forEach items="${ced}" var="ced1">
							<c:choose>
								<c:when test="${escuela.ced.id == ced1.id}">
									<option value="${ced1.id}" selected="selected">${ced1.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${ced1.id}" >${ced1.valor}</option>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</select>
				</td>
			</tr>	
			<tr>
				<td >Proyección de becas. En caso de nuevas becas PFE en la zona para <br>esta escuela tu sugerencia es</td> 
				<td>	
					<select class="textbox2" name="idProyeccionPFE" id="proyeccionPFE" style="width: auto;">
						<option></option>
						<c:forEach items="${proPFE}" var="proPFE">
							<c:choose>
								<c:when test="${escuela.proyeccionPFE.id == proPFE.id}">
									<option value="${proPFE.id}" selected="selected">${proPFE.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${proPFE.id}" >${proPFE.valor}</option>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</select>
				</td>
			</tr>	
						
	</table>
	<br>
	<table >
	<tr>
				<td>Participación en Escuelas que Acompañan</td>
				<td>
					<select class="textbox2" id="eqa" name="eqa" >							
					<c:choose>
						<c:when test="${escuela.eqa == 'Si'}">
								<option value="Si" selected="selected">Sí</option>
								<option value="No" >No</option>    	
					    </c:when>													    
					    <c:when test="${escuela.eqa == 'No'}">       						
								<option value="Si" >Sí</option>
								<option value="No" selected="selected">No</option>    	
					    </c:when>
					    <c:otherwise>
					    	<option value="0" selected>Seleccionar opción</option>
					    	<option value="Si" >Sí</option>
							<option value="No" >No</option>
					    </c:otherwise>													    								
					</c:choose>			
					</select>
				</td>
				<td>Año de participación en EQA: </td>
				<td>
<!-- 			DMS señalador -->	
<!-- 					DMS quiero evitar la complejidad de guardar un dato multiple, por eso lo guardo como string en un solo campo en la bd -->
					<select multiple id="aniosParticipacionEQA" name="aniosParticipacionEQA" class="textbox2" >
						<c:forEach var="anio" items="${aniosEQA }">
							<option value="${anio}" <c:if test="${fn:contains(escuela.aniosParticipacionEQA, anio)}"> selected </c:if>>${anio}</option>
						</c:forEach>
					</select>			
				
				</td>
				<td>¿Participa de la Red de Escuelas <br>que Acompañan?</td>
				<td>
					<select class="textbox2" id="redEQA" name="redEQA" >							
					<c:choose>
						<c:when test="${escuela.redEQA == 'Si'}">
								<option value="Si" selected="selected">Sí</option>
								<option value="No" >No</option>    	
					    </c:when>													    
					    <c:when test="${escuela.redEQA == 'No'}">       						
								<option value="Si" >Sí</option>
								<option value="No" selected="selected">No</option>    	
					    </c:when>
					    <c:otherwise>
					    	<option value="0" >Seleccionar opción</option>
					    	<option value="Si" >Sí</option>
							<option value="No" >No</option>
					    </c:otherwise>													    								
					</c:choose>			
					</select>
				</td>
			</tr>
			<tr>
			
			
				<td align="left">¿Participó de otras propuestas o iniciativas de Cimientos?	</td>			
			<td>
			Si <input class="textbox2" type="radio" value="true" id="participoOtrasPropuestas" name="participoOtrasPropuestas" class=" textbox2"
			<c:if test="${escuela.participoOtrasPropuestas}"> checked="checked"</c:if> > 
			No<input class="textbox2" type="radio" id="participoOtrasPropuestas" value="false" name="participoOtrasPropuestas"
			<c:if test="${escuela.participoOtrasPropuestas == false}"> checked="checked"</c:if>></td>	
			</tr>
	</table>
	<table>
			<tr>
			<td>¿Cuáles?</td>
			<td><textarea class="textbox2" rows="4" cols="38" name="cualesOtrasPropuestas" id="cualesOtrasPropuestas" onblur="chequearLongitud(this,3000);"onkeypress="chequearLongitud(this,3000);">${escuela.cualesOtrasPropuestas}</textarea></td>			
			
			
			</tr>
	</table>			
	
	</fieldset>
	<br><br>
		<table>	
			
			<tr>
				
	
				
<!-- 				<td>Subsidio estatal *</td> -->
				<td>
<!-- 					Si -->
				<input type="radio" class="textbox2" id="subsidioEstatal" value="true" name="subsidioEstatal" class=" textbox2"style="display:none"
						<c:if test="${escuela.subsidioEstatal}"> checked="checked"</c:if> > 
<!-- 					No -->
					<input type="radio"class="textbox2"  id="subsidioEstatal" value="false" name="subsidioEstatal" style="display:none"
						<c:if test="${escuela.subsidioEstatal == false}"> checked="checked"</c:if>>
					<input type="radio" class="textbox2" id="rural" name="rural" value="0"style="display:none">
				</td>
<!-- 				<td>Implementa Secundaria 2030</td> -->
				<td>	
<!-- 				Si -->
				<input type="hidden" class="textbox2" id="is2030" value="true" name="is2030" class=" textbox2"
						<c:if test="${escuela.is2030}"> checked="checked"</c:if> > 
<!-- 					No -->
					<input type="hidden"class="textbox2"  id="i2030" value="false" name="i2030"
						<c:if test="${escuela.is2030 == false}"> checked="checked"</c:if>>
				</td>			
			
			
			</tr>
			
		</table>
		<p> 
			
		</p>
		
		
<!-- 	</fieldset>  -->
	<br>
	<br>
	
	
	
	
<center>
	<fieldset >		
		<legend><strong>INDICADORES EDUCATIVOS</strong></legend>
		<br>
		<font color="#8C3F99">(completar con los datos de la trayectoria de matrícula según lo reportado en el cuadernillo más reciente del Relevamiento Anual para Educación Común del Ministerio de Educación - CUADERNILLO CELESTE)
		</font><br><br>
		<table>
			<tr>
				<td colspan=4>
					CICLO LECTIVO (año al cual refieren los indicadores)
					<select class="textbox2" name="idCicloIndicador" id="cicloIndicador" style="width: auto;">
						
						<c:forEach items="${ciclos2}" var="comPBE">
							<c:choose>
								<c:when test="${escuela.cicloIndicador.id == comPBE.id}">
									<option value="${comPBE.id}" selected="selected">${comPBE.nombre}</option>
								</c:when>
								<c:otherwise>
									<option value="${comPBE.id}" >${comPBE.nombre}</option>
								</c:otherwise>
							</c:choose>			
						</c:forEach>
					</select>
				</td>
			</tr>
		</table>
		
		<br>
		<center>
		<table border="1">
			<thead>
				<tr>								
					<th>Año de<br>estudio</th>					
<!-- 					<th>Matrícula<br>inicial<br>(a)</th> -->
<!-- 					<th>Entrados<br>(b)</th> -->
<!-- 					<th>Salidos<br>con pase<br>(c)</th> -->
<!-- 					<th>Salidos<br>sin pase<br>(d)</th> -->
<!-- 					<th>(1)+(2)+(3)<br>Matrícula<br>final<br>(a)+(b)-(c)-(d)</th> -->
					<th>Promovidos<br>el último día<br>de clase<br>(1)</th>
					<th>Promovidos<br>con exámen<br>(2)</th>
					<th>No Promovidos<br>(3)</th>
		
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>1°</td>
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="mi1" name="mi1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mi1}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="en1" name="en1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.en1}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="scp1" name="scp1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.scp1}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="ssp1" name="ssp1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ssp1}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2"  type="hidden" id="mf1" name="mf1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mf1}">
					</td>
					
					<td><input class="textbox2"  type="text" id="pudc1" name="pudc1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pudc1}"></td>
					<td><input class="textbox2"  type="text" id="pcf1" name="pcf1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pcf1}"></td>
					<td><input class="textbox2"  type="text" id="np1" name="np1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.np1}"></td>
				</tr>
				<tr>
					<td>2°</td>
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="mi2" name="mi2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mi2}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="en2" name="en2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.en2}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="scp2" name="scp2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.scp2}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="ssp2" name="ssp2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ssp2}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2"  type="hidden" id="mf2" name="mf2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mf2}">
<!-- 					</td> -->
					
					<td><input class="textbox2"  type="text" id="pudc2" name="pudc2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pudc2}"></td>
					<td><input class="textbox2"  type="text" id="pcf2" name="pcf2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pcf2}"></td>
					<td><input class="textbox2"  type="text" id="np2" name="np2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.np2}"></td>
				</tr>
				<tr>
					<td>3°</td>
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="mi3" name="mi3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mi3}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="en3" name="en3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.en3}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="scp3" name="scp3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.scp3}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="ssp3" name="ssp3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ssp3}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2"  type="hidden" id="mf3" name="mf3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mf3}">
<!-- 					</td> -->
					
					<td><input class="textbox2"  type="text" id="pudc3" name="pudc3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pudc3}"></td>
					<td><input class="textbox2"  type="text" id="pcf3" name="pcf3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pcf3}"></td>
					<td><input class="textbox2"  type="text" id="np3" name="np3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.np3}"></td>
				</tr>
				<tr>
					<td>4°</td>
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="mi4" name="mi4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mi4}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="en4" name="en4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.en4}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="scp4" name="scp4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.scp4}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="ssp4" name="ssp4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ssp4}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2"  type="hidden" id="mf4" name="mf4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mf4}">
<!-- 					</td> -->
					
					<td><input class="textbox2"  type="text" id="pudc4" name="pudc4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pudc4}"></td>
					<td><input class="textbox2"  type="text" id="pcf4" name="pcf4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pcf4}"></td>
					<td><input class="textbox2"  type="text" id="np4" name="np4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.np4}"></td>
				</tr>			
				<tr>
					<td>5°</td>
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="mi5" name="mi5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mi5}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="en5" name="en5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.en5}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="scp5" name="scp5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.scp5}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="ssp5" name="ssp5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ssp5}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2"  type="hidden" id="mf5" name="mf5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mf5}">
<!-- 					</td> -->
					
					<td><input class="textbox2"  type="text" id="pudc5" name="pudc5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pudc5}"></td>
					<td><input class="textbox2"  type="text" id="pcf5" name="pcf5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pcf5}"></td>
					<td><input class="textbox2"  type="text" id="np5" name="np5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.np5}"></td>
				</tr>
				<tr>
					<td>6°</td>
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="mi6" name="mi6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mi6}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="en6" name="en6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.en6}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="scp6" name="scp6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.scp6}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="ssp6" name="ssp6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ssp6}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2"  type="hidden" id="mf6" name="mf6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mf6}">
<!-- 					</td> -->
					<td><input class="textbox2"  type="text" id="pudc6" name="pudc6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pudc6}"></td>
					<td><input class="textbox2"  type="text" id="pcf6" name="pcf6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pcf6}"></td>
					<td><input class="textbox2"  type="text" id="np6" name="np6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.np6}"></td>
				</tr>
				<tr>
					<td>7°</td>
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="mi7" name="mi7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mi7}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="en7" name="en7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.en7}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="scp7" name="scp7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.scp7}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2" type="hidden" id="ssp7" name="ssp7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ssp7}">
<!-- 					</td> -->
<!-- 					<td> -->
					<input class="textbox2"  type="hidden" id="mf7" name="mf7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mf7}">
<!-- 					</td> -->
					
					<td><input class="textbox2"  type="text" id="pudc7" name="pudc7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pudc7}"></td>
					<td><input class="textbox2"  type="text" id="pcf7" name="pcf7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.pcf7}"></td>
					<td><input class="textbox2"  type="text" id="np17" name="np7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.np7}"></td>
				</tr>
			</tbody>	
		</table>
</center>


<!-- DMS a partir de aca todo oculto (informacion vieja ) -->


	<br>
	<table>	
		<tr>
<!-- 			<td align="left">Detallar otros</td> -->
			<td><input type="hidden"  class="textbox2" rows="4" cols="38" name="otrosEspacios" id="otrosEspacios" onblur="chequearLongitud(this,3000);"onkeypress="chequearLongitud(this,3000);"value="${escuela.otrosEspacios}"></td>
<!-- 			<td align="left">¿Qué necesidades identifican en su escuela?</td>			 -->
			<td><form:select class="textbox2" path="necesidadesEscuela" style="display:none" >
				<form:options items="${necesidadesEscuela}" itemLabel="valor" itemValue="id" />				
				</form:select>
			</td>		
<!-- 			<td align="left">Brinde mayor información sobre las respuestas anteriores</td> -->
			<td><input type="hidden"  class="textbox2" rows="4" cols="38" name="mayorInformacion" id="mayorInformacion" onblur="chequearLongitud(this,3000);"onkeypress="chequearLongitud(this,3000);"value="${escuela.mayorInformacion}"/></td>			
		</tr>
	</table>	
	</fieldset>
	<br><br>
<!-- 	<fieldset style="width:1000px;"> -->
<%-- 		<legend><strong>ARTICULACIÓN PFE:</strong></legend>	 --%>
		<table>
			<tr>				
<!-- 				<td colspan="1" style="vertical-align:middle;">Recomendación para llegar a la Escuela (transporte, horarios, costos, etc)</td>				 -->
				<td colspan="3" style="vertical-align:middle;">	<input type="hidden"  class="textbox2" rows="4" cols="80" name="obsGenerales" id="obsGenerales" onblur="chequearLongitud(this,3000);"onkeypress="chequearLongitud(this,3000);"value="${escuela.obsGenerales}">			
				</td>
<!-- 				<td align="left">¿LA ESCUELA BRINDA ALGÚN REFERENTE PARA EL SEGUIMIENTO DE LOS BECADOS?</td> -->
				<td>	
<!-- 					Si  -->
					<input type="radio" value="true" id="referneteSiNo" name="referenteSiNo" class="required textbox2"style="display:none"
						<c:if test="${escuela.referenteSiNo}"> checked="checked"</c:if> > 
<!-- 					No -->
					<input type="radio" id="referenteSiNo" value="false" name="referenteSiNo"style="display:none"
						<c:if test="${escuela.referenteSiNo == false}"> checked="checked"</c:if>>
				</td>
<!-- 				<td align="left">Nombre y Cargo Referente</td> -->
				<td><input type="hidden" class="textbox2" id="referenteAB" name="referenteAB" value="${escuela.referenteAB}"></td>
<!-- 				<td align="left">Celular Referente</td> -->
				<td><input type="hidden" class="textbox2" id="referenteABECelular" name="referenteABCelular" value="${escuela.referenteABCelular}"></td>
	
<!-- 				<td align="left">Mail Referente</td> -->
				<td><input type="hidden" class="textbox2" id="referenteABMail" name="referenteABMail" value="${escuela.referenteABMail}"></td>
<%-- 				<td colspan=4 nowrap="nowrap" align="center"><strong>Evalúe las siguientes frases</strong></td> --%>
<%-- 				<td colspan=4 align="center"><strong>INFORMACIÓN PARA CIMIENTOS</strong></td> --%>
<!-- 				<td align="left">Programa que se implementa *</td> -->
				<td><select name="idPrograma" id="programa" class=" textbox2" style="width: auto; display:'none'" hidden>
						<option></option>
						<c:forEach items="${programas}" var="programa">
							<c:choose>
									<c:when test="${escuela.programa.id == programa.id}">
										<c:choose>
											<c:when test="${programa.id == 1 or programa.id == 3 or 
											programa.id == 4 or programa.id == 5 or 
											programa.id == 6 or programa.id == 7 or 
											programa.id == 10 or programa.id ==11}">
												<option value="${programa.id}" selected="selected" disabled>${programa.valor}</option>
											</c:when>
											<c:otherwise>
												<option value="${programa.id}" selected="selected" >${programa.valor}</option>
											</c:otherwise>								
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${programa.id == 1 or programa.id == 3 or 
											programa.id == 4 or programa.id == 5 or 
											programa.id == 6 or programa.id == 7 or 
											programa.id == 10 or programa.id ==11}">
												<option value="${programa.id}" disabled>${programa.valor}</option>
											</c:when>
											<c:otherwise>
												<option value="${programa.id}"  >${programa.valor}</option>
											</c:otherwise>								
										</c:choose>
									</c:otherwise>
								</c:choose>	
						</c:forEach>
					</select>
				</td>		
				
				<td colspan=4 align="center"><strong>
<!-- 				ACCESIBILIDAD -->
				</strong>
					<input type="hidden" name="idAccesibilidad" id="accesibilidad" value="1">
				</td>
			</tr>
	</table>
		
		
		<!-- 
		<input type="hidden" name="idComProy" id="comProy" style="width: auto;" value="1">				
		
			
			<input type="hidden" name="idComPBE" class="textbox2" id="comPBE" style="width: auto;" value="1">
				
		
		
		<input type="hidden" name="idFase" id="fase" style="width: auto;" value="1">						
		<input type="hidden" name="objetivoProyecto" id="objetivoProyecto" value="1">					
		
		
			<input type="hidden" name="idEctaes" id="ectaes" style="width: auto;" value="1">
				
		
			<input type="hidden" name="idEddes" id="eddes" style="width: auto;" value="1">
				
		
			<input type="hidden" name="idRaeea" id="raeea" style="width: auto;" value="1">
				
			
			<input type="hidden" name="idErsb" id="ersb" style="width: auto;" value="1">
				
			<input type="hidden" name="idEpep" id="epep" style="width: auto;" value="1">
			 -->
				
<!-- 		</fieldset> -->


			
		
			<input type="hidden" id="porcentajeInasistencia" name="porcentajeInasistencia"  value="${escuela.porcentajeInasistencia}" onchange="validarIndicador(this)"  maxlength="5" size="5" onkeypress="return validarDecimal(event, this);">
		
			<input type="hidden" id="indicadorRepitencia" name="indicadorRepitencia" value="${escuela.indicadorRepitencia}" onchange="validarIndicador(this)"  maxlength="5" size="5" onkeypress="return validarDecimal(event, this);">
		
			<input type="hidden" id="indicadorAbandono" name="indicadorAbandono"  value="${escuela.indicadorAbandono}" onchange="validarIndicador(this)"  maxlength="5" size="5" onkeypress="return validarDecimal(event, this);"> 
		
		<center>
		
				
					<input type="hidden"  id="cd1" name="cd1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd1}"> 
					<input type="hidden"  id="cd2" name="cd2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd2}"> 
					<input type="hidden"  id="cd3" name="cd3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd3}"> 
					<input type="hidden"  id="cd4" name="cd4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd4}"> 
					<input type="hidden"  id="cd5" name="cd5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd5}"> 
					<input type="hidden"  id="cd6" name="cd6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd6}"> 
					<input type="hidden"  id="cd7" name="cd7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd7}"> 
				
					<input type="hidden"  id="mat1" name="mat1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat1}"> 
					<input type="hidden"  id="mat2" name="mat2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat2}"> 
					<input type="hidden"  id="mat3" name="mat3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat3}"> 
					<input type="hidden"  id="mat4" name="mat4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat4}"> 
					<input type="hidden"  id="mat5" name="mat5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat5}"> 
					<input type="hidden"  id="mat6" name="mat6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat6}"> 
					<input type="hidden"  id="mat7" name="mat7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat7}"> 
				
					<input type="hidden"  id="rep1" name="rep1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep1}"> 
					<input type="hidden"  id="rep2" name="rep2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep2}"> 
					<input type="hidden"  id="rep3" name="rep3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep3}"> 
					<input type="hidden"  id="rep4" name="rep4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep4}"> 
					<input type="hidden"  id="rep5" name="rep5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep5}"> 
					<input type="hidden"  id="rep6" name="rep6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep6}"> 
					<input type="hidden"  id="rep7" name="rep7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep7}"> 
				
					<input type="hidden"  id="ab1" name="ab1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab1}"> 
					<input type="hidden"  id="ab2" name="ab2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab2}"> 
					<input type="hidden"  id="ab3" name="ab3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab3}"> 
					<input type="hidden"  id="ab4" name="ab4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab4}"> 
					<input type="hidden"  id="ab5" name="ab5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab5}"> 
					<input type="hidden"  id="ab6" name="ab6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab6}"> 
					<input type="hidden"  id="ab7" name="ab7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab7}"> 
		
		</center>
		
			
	
</center>
<center>
		<table align="center">
			<tr>
				<td>
					<input class="classnameboton" type="button" value="Registrar" onclick="enviarForm('alta')"/>
				</td>
				<td>					
					<c:if test="${!empty urlRegreso}">
				  		<input type="reset" class="classnameboton"  value="Volver" class="ui-state-default ui-corner-all" onclick="location.href='..' + '${urlRegreso}'; return false;" />
			       	</c:if>
			       	<c:if test="${empty urlRegreso}">
				  		<input class="classnameboton" type="button" value="Volver" onclick="enviarForm('volverEscuela')"/>
			       	</c:if>
				</td>
			</tr>
		</table>
</center>
		<input type="hidden" name="urlRegreso" value="${urlRegreso}"></input>
</form:form>
	
</div>
</body>
</html>