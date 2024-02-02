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
 });
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
</style>


</head>
<body onload="habilitarCampos()" >
<div id="main-content">

<form:form id="altaEscuela" action="registrarEscuela.do" method="post" commandName="escuela" name="altaEscuela">
<form:hidden path="id"/>
<c:set var="urlRegreso" value="${urlRegreso}"></c:set>
<center>
    <fieldset style="width:1000px;">
		<legend><strong>DATOS FORMALES</strong></legend>
		<table>			
			<tr>
				<td><label>Nombre (no usar comillas)*</label></td>
				<td><input type="text" id="nombre"  name="nombre" class="required textbox2" value="${escuela.nombre}"></td>
	
				<td align="right"><label>CUE</label></td>
				<td><input class="textbox2" id="cue" name="codigoUnicoEscolar" onblur="chequearLongitud(this,10);" onkeypress="chequearLongitud(this,10);" class="digits" value="${escuela.codigoUnicoEscolar}"></td>
			</tr>
			<tr>
				<td><label>Modalidad *</label></td>
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
	
				<td align="right"><label>Orientación</label></td>
				<td><input class="textbox2" type="text" id="orientacion"  name="orientacion" value="${escuela.orientacion}"></td>
			</tr>
			<tr>
				<td><label>Nivel que atiende *</label></td>
				<td><select name="idNivelAtiendeEscuela" id="nivelAtiendeEscuela" class="required textbox2" style="width: 11em;">
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
				</td>
	
				<td align="right"><label style="width: 150px">Turnos de la escuela</label>			
					<td><form:select path="turno" class="textbox2">
						<form:options items="${turnos}" itemLabel="valor" itemValue="id"/>				
						</form:select>
						<input type="hidden" id="idCantidadDeAnios" name="idCantidadDeAnios" value="7">
					</td>
				</td>
									
			</tr>
			<tr>
				<td><label>Tipo de Gestión *</label></td>
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
	
				<td align="right"><label>C&oacute;digo Postal *</label></td>
				<td><input class="textbox2" type="text" id="codigoPostal" name="codigoPostal" class="required digits" value="${escuela.codigoPostal}"></td>
			</tr>
			<tr>
				<td><label>Calle *</label></td>
				<td><input type="text" id="direccionCalle"  name="direccionCalle" class="required textbox2" value="${escuela.direccionCalle}"></td>
	
				<td align="right"><label>N&uacute;mero *</label></td>
				<td><input type="text" id="direccionNumero" name="direccionNumero" class="required digits textbox2" value="${escuela.direccionNumero}"></td>
	
			</tr>
			<tr>
				<td><label>Barrio</label></td>
				<td><input class="textbox2" type="text" id="barrio" name="barrio" value="${escuela.barrio}"></td>
				<td align="right">
					<label>Localidad *</label>
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
			</tr>		
			<tr>
			<td><label>Provincia *</label></td>
				<td><c:choose>
					<c:when test="${escuela.provincia != null}">
						<input id="nombreProvincia" value="${escuela.provincia.descripcion}" disabled="disabled"/ class="required textbox2">
						<input type="hidden" name="provincia.id" id="provinciaId" value="${escuela.provincia.id}"/>
					</c:when>
					<c:otherwise>
						<input class="textbox2" id="nombreProvincia" value=""  class="required textbox2" disabled="disabled"/>
						<input type="hidden" name="provincia.id" id="provinciaId" value="" />
					</c:otherwise>	
				</c:choose>
				</td>
	
				<td align="right"><label>Zona Cimientos *</label></td>
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
			</tr>
			<tr>
				<td><label>Tel&eacute;fono 1</label></td>
				<td><input type="text" class="textbox2" id="telefono1" name="telefono1" class="digits" value="${escuela.telefono1}"></td>
	
				<td align="right"><label>T&eacute;lefono 2</label></td>
				<td><input type="text" class="textbox2" id="telefono2" name="telefono2" class="digits" value="${escuela.telefono2}"></td>
			</tr>
			<tr>
				<td><label>Mail Institucional</label></td>
				<td><input type="text" class="textbox2" id="mail" name="mail" value="${escuela.mail}"></td>
	
				<td align="right"><label>Director</label></td>
				<td><input type="text" class="textbox2" id="director" name="director" value="${escuela.director}"></td>
			</tr>
			<tr>
				<td><label>Celular Director</label></td>
				<td><input type="text" class="textbox2" id="directorCelular" name="directorCelular" value="${escuela.directorCelular}"></td>
	
				<td align="right"><label>Mail Director</label></td>
				<td><input type="text" class="textbox2" id="directorMail" name="directorMail" value="${escuela.directorMail}"></td>
			</tr>
			<tr>
				<td><label>Vice-Director</label></td>
				<td><input type="text" class="textbox2" id="secretario" name="secretario" value="${escuela.secretario}"></td>
	
				<td align="right"><label>Celular Vice-Director</label></td>
				<td><input type="text" class="textbox2" id="secretarioCelular" name="secretarioCelular" value="${escuela.secretarioCelular}"></td>
			</tr>
			<tr>
				<td><label>Mail Vice-Director</label></td>
				<td><input type="text" class="textbox2" id="secretarioMail" name="secretarioMail" value="${escuela.secretarioMail}"></td>
	
				<td align="right"><label>Referente</label></td>
				<td><input type="text" class="textbox2" id="responsable" name="responsable" value="${escuela.responsable}"></td>
			</tr>
			<tr>
				<td><label>Celular Referente</label></td>
				<td><input type="text" class="textbox2" id="responsableCelular" name="responsableCelular" value="${escuela.responsableCelular}"></td>
	
				<td align="right"><label>Mail Referente</label></td>
				<td><input type="text" class="textbox2" id="responsableMail" name="responsableMail" value="${escuela.responsableMail}"></td>
			</tr>
			<tr>
				<td><label>Rural *</label></td>
				<td>	
					Si <input type="radio" value="true" id="rural" name="rural" class="required textbox2"
						<c:if test="${escuela.rural}"> checked="checked"</c:if> > 
					No<input type="radio" id="rural" value="false" name="rural"
						<c:if test="${escuela.rural == false}"> checked="checked"</c:if>></td>
	
				<td align="right"><label>Subsidio estatal *</label></td>
				<td>	Si<input type="radio" class="textbox2" id="subsidioEstatal" value="true" name="subsidioEstatal" class="required textbox2"
						<c:if test="${escuela.subsidioEstatal}"> checked="checked"</c:if> > 
					No<input type="radio"class="textbox2"  id="subsidioEstatal" value="false" name="subsidioEstatal"
						<c:if test="${escuela.subsidioEstatal == false}"> checked="checked"</c:if>>
				</td>
			</tr>
			<tr>
				<td colspan="1">
					<label>Observaciones generales</label>
				</td>
				<td colspan="3">
					<textarea class="textbox2" rows="4" cols="55" name="obsGenerales" id="obsGenerales" onblur="chequearLongitud(this,3000);"onkeypress="chequearLongitud(this,3000);">${escuela.obsGenerales}</textarea>			
				</td>
			</tr>
		</table>
	</fieldset> 
</center>	
	<br>
	<br>
<center>
	<fieldset style="width:1000px; text-align: left;">		
		<legend><strong>INFORMACION CIMIENTOS</strong></legend>
		<br></br>
		<input type="hidden" name="idEstadoEscuela" id="estadoEscuela" class="required textbox2" value="2">
		<input type="hidden" id="motivoNoSeleccion" name="motivoNoSeleccion" value="${escuela.motivoNoSeleccion}">
		<p>
			<label  style="width: 550px">Programa que se implementa *</label>
			<select name="idPrograma" id="programa" class="required textbox2" style="width: auto;">
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
		</p>
		<p>
			<label style="width: 550px">Modalidad de trabajo</label>
			<select name="idModalidadTrabajoEscuela" class="textbox2" id="modalidadTrabajoEscuela" style="width: auto;" onchange="habilitarCampos()">
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
		</p>
		<input type="hidden" name="idComProy" id="comProy" style="width: auto;" disabled="disabled">				
		
		<p>
			<label style="width: 550px"> Año de comienzo de PFE</label>
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
		</p>
		<p>
			<label style="width: 550px">Cuenta con espacio adecuado para hacer las entrevistas?</label>				
			Si <input type="radio" class="textbox2" value="true" id="ccephe" name="ccephe" class="required textbox2"
			<c:if test="${escuela.ccephe}"> checked="checked"</c:if> > 
			No<input type="radio" class="textbox2" id="ccephe" value="false" name="ccephe"
			<c:if test="${escuela.ccephe == false}"> checked="checked"</c:if>>
		</p>
		<input type="hidden" name="idFase" id="fase" style="width: auto;" disabled="disabled">						
		<input type="hidden" name="objetivoProyecto" id="objetivoProyecto" >					
		<p>
			<label style="width: 550px">Observaciones <strong>Este campo va a la FP e IS1</strong><img src="../static/images/atencion.gif" width=10></label>
			<textarea class="textbox2" rows="4" cols="50" name="observaciones" id="observaciones" onblur="chequearLongitud(this,3000);"onkeypress="chequearLongitud(this,3000);">${escuela.observaciones}</textarea>			
		</p>
		<!-- COMIENZO NUEVOS 2018 -->
		<p>
			<label style="width: 550px">Compromiso del equipo directivo</label>
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
		
		</p>
		
		<p>
			<label style="width: 550px">Trabaja con otras organizaciones</label>				
			Si <input class="textbox2" type="radio" value="true" id="tcoo" name="tcoo" class="required textbox2"
			<c:if test="${escuela.tcoo}"> checked="checked"</c:if> > 
			No<input class="textbox2" type="radio" id="tcoo" value="false" name="tcoo"
			<c:if test="${escuela.tcoo == false}"> checked="checked"</c:if>>
		</p>
		<p>
			<label style="width: 550px">Detalle sobre otras Organizaciones</label>
			<textarea class="textbox2" rows="4" cols="50" name="dsoo" id="dsoo" onblur="chequearLongitud(this,3000);"onkeypress="chequearLongitud(this,3000);">${escuela.dsoo}</textarea>			
		</p>
		<p>
		<fieldset style="width:1000px;">
			<legend><strong>Accesibilidad</strong></legend>				
			<input type="hidden" name="idAccesibilidad" id="accesibilidad" value="0">						
		
			<p>
				<label style="width: 550px">Está ubicada dentro de un barrio de emergencia</label>
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
				
			</p>
			<p>
				<label style="width: 550px">Tiene problemas de anegamiento cuando llueve</label>
				<select class="textbox2" name="idTpacl" id="tpacl" style="width: auto;">
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
				
			</p>
			<p>
				<label style="width: 550px">Se puede llegar fácilmente en transporte público</label>
				<select class="textbox2" name="idSplftp" id="splftp" style="width: auto;">
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
				
			</p>
			<p>
				<label style="width: 550px">Está ubicada sobre una calle pavimentada</label>
				<select class="textbox2" name="idEuscp" id="euscp" style="width: auto;">
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
				
			</p>
		</fieldset>
		<br><br>
		<p>
			<label style="width: 550px">Proyección en PFE</label>
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
		</p>
		<p>
			<label style="width: 550px">La escuela cuenta con todos los años de la escuela secundaria</label>
			<select class="textbox2" name="idEctaes" id="ectaes" style="width: auto;">
				<option></option>
				<c:forEach items="${ectaes}" var="ectaes">
					<c:choose>
						<c:when test="${escuela.ectaes.id == ectaes.id}">
							<option value="${ectaes.id}" selected="selected">${ectaes.valor}</option>
						</c:when>
						<c:otherwise>
							<option value="${ectaes.id}" >${ectaes.valor}</option>
						</c:otherwise>
					</c:choose>
	
				</c:forEach>
			</select>
		</p>
		<p>
			<label style="width: 550px">El equipo directivo tiene disponibilidad para los encuentros de seguimiento</label>
			<select class="textbox2" name="idEddes" id="eddes" style="width: auto;">
				<option></option>
				<c:forEach items="${desplegableEscuela}" var="desplegable1">
					<c:choose>
						<c:when test="${escuela.eddes.id == desplegable1.id}">
							<option value="${desplegable1.id}" selected="selected">${desplegable1.valor}</option>
						</c:when>
						<c:otherwise>
							<option value="${desplegable1.id}" >${desplegable1.valor}</option>
						</c:otherwise>
					</c:choose>
	
				</c:forEach>
			</select>
		</p>
		<p>
			<label style="width: 550px">El equipo directivo facilita el espacio para el acompañamiento</label>
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
		</p>
		<p>
			<label style="width: 550px">El equipo directivo brinda información solicitada por PFE</label>
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
		</p>
		<p>
			<label style="width: 550px">El equipo directivo conoce las características y problemátivas de los alumnos</label>
			<select class="textbox2" name="idEdccpa" id="edccpa" style="width: auto;">
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
		</p>
		<p>
			<label style="width: 550px">Se realizan acuerdos entre la escuela y el EA, sobre la situación de los alumnos becados</label>
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
		</p>
		<p>
			<label style="width: 550px">Existe un referente para el seguimiento de los becados</label>
			<select class="textbox2" name="idErsb" id="ersb" style="width: auto;">
				<option></option>
				<c:forEach items="${ersb}" var="ersb">
					<c:choose>
						<c:when test="${escuela.ersb.id == ersb.id}">
							<option value="${ersb.id}" selected="selected">${ersb.valor}</option>
						</c:when>
						<c:otherwise>
							<option value="${ersb.id}" >${ersb.valor}</option>
						</c:otherwise>
					</c:choose>
	
				</c:forEach>
			</select>
		</p>
		<p>
			<label style="width: 550px">La escuela participo de los encuentros pautados</label>
			<select class="textbox2" name="idEpep" id="epep" style="width: auto;">
				<option></option>
				<c:forEach items="${epep}" var="epep">
					<c:choose>
						<c:when test="${escuela.epep.id == epep.id}">
							<option value="${epep.id}" selected="selected">${epep.valor}</option>
						</c:when>
						<c:otherwise>
							<option value="${epep.id}" >${epep.valor}</option>
						</c:otherwise>
					</c:choose>
	
				</c:forEach>
			</select>
		</p>
		<p>
			<label style="width: 550px">La escuela tiene el conocimiento necesario sobre el desarrollo del PFE</label>
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
		</p>
		</fieldset>
</center>
<center>
		<fieldset style="width:1000px;text-align: left;">
		<legend><strong>INDICADORES y RECURSOS ESCOLARES</strong></legend>
		<br>
		<p>
			<label style="width: 550px">Ciclo Lectivo</label>
			<select class="textbox2" name="cicloLectivo" id="cicloLectivo" style="width: auto;">
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
		</p>
		<p>
			<label style="width: 550px">Matr&iacute;cula total escuela</label>
			<input class="textbox2" type="text" id="matricula" name="matricula" class="digits" value="${escuela.matricula}" maxlength="5"  size="5">
		</p>
		<p>
			<label style="width: 550px">Asistencia</label>
			<input class="textbox2" type="text" id="porcentajeInasistencia" name="porcentajeInasistencia"  value="${escuela.porcentajeInasistencia}" onchange="validarIndicador(this)"  maxlength="5" size="5" onkeypress="return validarDecimal(event, this);"> %
		</p>
		<p>
			<label style="width: 550px">Repitencia</label>
			<input class="textbox2" type="text" id="indicadorRepitencia" name="indicadorRepitencia" value="${escuela.indicadorRepitencia}" onchange="validarIndicador(this)"  maxlength="5" size="5" onkeypress="return validarDecimal(event, this);"> %
		</p>
		<p>
			<label style="width: 550px">Abandono</label>
			<input class="textbox2" type="text" id="indicadorAbandono" name="indicadorAbandono"  value="${escuela.indicadorAbandono}" onchange="validarIndicador(this)"  maxlength="5" size="5" onkeypress="return validarDecimal(event, this);"> %
		</p>
				
		<p>
			<label style="width: 550px">Recursos con los que cuenta la Escuela. <strong>Este campo va a la FP e IS1</strong><img src="../static/images/atencion.gif" width=10></label>			
			<form:select class="textbox2" path="espacioApoyo">
				<form:options items="${espaciosApoyo}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</p>
		<br>
		<center>
		<table border="1">
			<thead>
				<tr>								
					<th>ITEM</th>					
					<th>1º</th>
					<th>2º</th>
					<th>3º</th>
					<th>4º</th>
					<th>5º</th>
					<th>6º</th>
					<th>7º</th>
		
				</tr>
			</thead>
			
			<tbody>
				<tr>
					<td>Cantidad de divisiones por año escolar</td>
					<td><input class="textbox2" type="text" id="cd1" name="cd1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd1}"></td>
					<td><input class="textbox2" type="text" id="cd2" name="cd2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd2}"></td>
					<td><input class="textbox2" type="text" id="cd3" name="cd3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd3}"></td>
					<td><input class="textbox2" type="text" id="cd4" name="cd4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd4}"></td>
					<td><input class="textbox2"  type="text" id="cd5" name="cd5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd5}"></td>
					<td><input class="textbox2"  type="text" id="cd6" name="cd6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd6}"></td>
					<td><input class="textbox2"  type="text" id="cd7" name="cd7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.cd7}"></td>
				</tr>
				<tr>
					<td>Matrícula por año escolar</td>
					<td><input class="textbox2"  type="text" id="mat1" name="mat1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat1}"></td>
					<td><input class="textbox2"  type="text" id="mat2" name="mat2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat2}"></td>
					<td><input class="textbox2"  type="text" id="mat3" name="mat3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat3}"></td>
					<td><input class="textbox2"  type="text" id="mat4" name="mat4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat4}"></td>
					<td><input class="textbox2"  type="text" id="mat5" name="mat5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat5}"></td>
					<td><input class="textbox2"  type="text" id="mat6" name="mat6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat6}"></td>
					<td><input class="textbox2"  type="text" id="mat7" name="mat7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.mat7}"></td>
				</tr>
				<tr>
					<td>Repitencia</td>
					<td><input class="textbox2"  type="text" id="rep1" name="rep1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep1}"></td>
					<td><input class="textbox2"  type="text" id="rep2" name="rep2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep2}"></td>
					<td><input class="textbox2"  type="text" id="rep3" name="rep3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep3}"></td>
					<td><input class="textbox2"  type="text" id="rep4" name="rep4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep4}"></td>
					<td><input class="textbox2"  type="text" id="rep5" name="rep5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep5}"></td>
					<td><input class="textbox2"  type="text" id="rep6" name="rep6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep6}"></td>
					<td><input class="textbox2"  type="text" id="rep7" name="rep7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.rep7}"></td>
				</tr>
				<tr>
					<td>Abandono</td>
					<td><input class="textbox2"  type="text" id="ab1" name="ab1" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab1}"></td>
					<td><input class="textbox2"  type="text" id="ab2" name="ab2" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab2}"></td>
					<td><input class="textbox2"  type="text" id="ab3" name="ab3" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab3}"></td>
					<td><input class="textbox2"  type="text" id="ab4" name="ab4" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab4}"></td>
					<td><input class="textbox2"  type="text" id="ab5" name="ab5" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab5}"></td>
					<td><input class="textbox2"  type="text" id="ab6" name="ab6" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab6}"></td>
					<td><input class="textbox2"  type="text" id="ab7" name="ab7" size="5" onchange="validarIndicador(this)" onkeypress="return validarDecimal(event, this);" value="${escuela.ab7}"></td>
				</tr>			
			
			</tbody>	
		
		
		</table>
		</center>
		
			
	</fieldset>
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