<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"><!--
$(document).ready(function(){
	$("#form").validate();
	$("input:button").button();
 	$("input:submit").button();
 	$("#hiddenBloque").css("display","none");
 	$("#bloqueTS").css("display","block");
 	$("#observacionesRATS").attr("disabled","disabled");
 	
 	disabledInputs();
 	
 	$("#submitear").click(function(){
 		$("input").removeAttr("disabled");
 		$("select").removeAttr("disabled");
 		$("textarea").removeAttr("disabled");
 		$("#form").submit();
		
 	});
 	$("#buttonVolver").click(function(){
 		document.forms['form'].action ="<c:url value='/entrevistaTrabajadorSocial/reporteEntrevistaTS.do' />";
		document.forms['form'].submit();
		
		
 	});
 
 	
 	
 });
 //Este metodo es no se puede editar la entrevista TSD
 function disabledInputs(){
	 if(${entrevistaTSDTO.isDetalleEntrevista} == true){
			$("input").attr("disabled","disabled");
			$("#buttonVolver").removeAttr("disabled");
			$("select").attr("disabled","disabled");
			$("textarea").attr("disabled","disabled");
	}
 } 
//Este metodo es para mostrar los accordiones 
function mostrar(idx){


	var selector;
		switch (idx) {
		case 1:
			selector = "#informacionTS";
			break
		case 2:
			selector = "#fichaFamiliar";
			break
		case 3:
			selector = "#ingresoEgreso";
			break
		case 4:
			selector = "#ObservacionesRA";
			break;
		case 5:
			selector = "#RecomendacionTS";
			break;	
		}

		$(selector).toggle("blind");
	}
	
function chequearLongitudRA(obj){
	if (obj.value.length > 1000) {
	obj.value = obj.value.substring(0, 1000);
	}
}
--></script>
 
</head>
<body>
<div id="main-content">

<form:form action="guardar.do" commandName="entrevistaTSDTO" modelAttribute="entrevistaTSDTO" id="form">
<input type="hidden" name="idAlumno" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.id}">
<input type="hidden" name="idResponsable1" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable1.id}">
<input type="hidden" name="idResponsable2" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable2.id}">
<input type="hidden" name="volver" value="${volver}">
<input type="hidden" name="seleccion" value="${entrevistaTSDTO.seleccion}">
<form:hidden path="entrevistaTS.id"/>
<form:hidden path="entrevistaTS.perfilAlumno.id"/>


<div id="accordion"  style="width:auto">
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(1)" >Información para el TS</a></h3>
		<div id="informacionTS" style="width:auto; height:auto; overflow:scroll;">
			<fieldset>
				<table>
					<tr>
						<td>
							<p>
								<label>Motivo de Rechazo</label>
								<input type="hidden" name="idMotivoRechazo" value="${entrevistaDTO.entrevistaTS.motivoRechazo.id}">
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.motivoRechazo.valor}">
							</p>
							<br></br>
						</td>
					</tr>	
					<tr>
						<td>
							<p>
								<label>Nombre Candidato</label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.nombre}">
							</p>
						</td>
						<td>
							<p>
							<label>Apellido Candidato </label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.apellido}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>Fecha Nacimiento Candidato</label>
								<input disabled="disabled" value="<fmt:formatDate value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>">
							<p>
						</td>
						<td>	
							</p>
								<label>Edad </label>
								<input name="edadAlumno" disabled="disabled" value="${entrevistaTSDTO.edadAlumno}">
							<p>
						</td>
					</tr>
					<tr>
						<td>
							<p>						
								<label>Escuela</label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.escuela.nombre}"/>
							</p>
						</td>						
					</tr>
					<tr>
						<td>
							<p>
							<label>Año Escolar</label>
							<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.anioEscolar.valor}"></input>
							</p>
						</td>
						
					</tr>
					<tr>
						<td>
							<p>
								<label>Nombre RA </label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable1.nombre}">
							</p>
						</td>
						<td>
							<p>
								<label>Apellido RA</label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable1.apellido}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>	
								<label>Vinculo del RA1 con becado</label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable1.idVinculo.valor}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>DNI RA</label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable1.dni}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
						<p>
							<label>CUIL RA</label>
							<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable1.cuilCuit}">
						</p>
						</td>
						
					</tr>
					<tr>
						<td>
							<p>
								<label>Fecha de Nacimiento RA </label>
								<input disabled="disabled" value="<fmt:formatDate value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable1.fechaNacimiento}" pattern="dd/MM/yyyy"/>">
							</p>
						</td>
						<td>
							<p>
								<label>Edad RA </label>
								<input name="edadResponsable" disabled="disabled" value="${entrevistaTSDTO.edadResponsable}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>Nacionalidad  RA </label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable1.nacionalidad}">
							</p>
						</td>
						
					</tr>
					<tr>
						<td>
							<p>
								<label>Nombre RA 2</label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable2.nombre}">
							</p>
						</td>
						<td>
							<p>
								<label>Apellido RA 2</label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable2.nombre}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>Vinculo RA 2 con becado</label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable2.idVinculo.valor}">
							</p>
						</td>
						
					</tr>
					<tr>
						<td>
							<p>
								<label>Zona Cimientos</label>
								<input disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.escuela.zonaCimientos.nombre}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
						<p>
							<p>
								<label>Calle </label>
								<input name="entrevistaTS.perfilAlumno.datosPersonales.direccion" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.direccion}">
							</p>
						</td>
						<td>
							<p>
								<label>Numero</label>
								<input name="entrevistaTS.perfilAlumno.datosPersonales.numeroCalle" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.numeroCalle}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>Piso </label>
								<input name="entrevistaTS.perfilAlumno.datosPersonales.piso" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.piso}">
							</p>
						</td>
						<td>
							<p>
								<label>Codigo Postal</label>
								<input name="entrevistaTS.perfilAlumno.datosPersonales.codigoPostal" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.codigoPostal}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>Departamento</label>
								<input name="entrevistaTS.perfilAlumno.datosPersonales.departamento" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.departamento}">
							</p>
						
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>Entre Calles </label>
								<input name="entrevistaTS.perfilAlumno.datosPersonales.entreCalles" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.entreCalles}">
							</p>
						</td>
						<td>
							<p>
								<label>Barrio</label>
								<input name="entrevistaTS.perfilAlumno.datosPersonales.barrio" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.barrio}">
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>Localidad</label>
								<select name="entrevistaTS.perfilAlumno.datosPersonales.localidad.id" id="localidadAlumno">
									<c:forEach items="${entrevistaTSDTO.localidades}" var="localidad">
										<c:choose>
											<c:when test="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.localidad.id == localidad.id}">
												<option value="${localidad.id}" selected="selected"> ${localidad.nombre}</option>
											</c:when>
											<c:otherwise>
												<option value="${localidad.id}" > ${localidad.nombre}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</p>
						</td>
						<td>
							<p>
								<label>Provincia</label>
								<select name="entrevistaTS.perfilAlumno.datosPersonales.provincia.id" id="provinciaAlumno">
									<c:forEach items="${entrevistaTSDTO.listProvincias}" var="provincia">
										<c:choose>
											<c:when test="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.provincia.id == provincia.id}">
												<option value="${provincia.id}" selected="selected"> ${provincia.descripcion}</option>
											</c:when>
											<c:otherwise>
												<option value="${provincia.id}" > ${provincia.descripcion}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</p>
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>Telefono</label>
								<input name="entrevistaTS.perfilAlumno.datosPersonales.telefono" value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.datosPersonales.telefono}">
							</p>
						</td>
						<td>
							
						</td>
					</tr>
					<tr>
						<td>
							<p>
								<label>Motivo de la Visita</label>
								<input type="hidden" name="idMotivoVisita" value="${entrevistaTSDTO.entrevistaTS.motivoVisita.id }">
								<input   disabled="disabled" value="${entrevistaTSDTO.entrevistaTS.motivoVisita.valor}">
							</p>
						</td>
						<td>
							<p>
								<label>Observacion TS </label>
								<form:textarea path="entrevistaTS.perfilAlumno.responsable1.observacionesParaTS" id="observacionesRATS" rows="4" 
								cols="40" style="font-stretch: normal;" onblur="chequearLongitudRA(this);" onkeypress="chequearLongitudRA(this);"/>
									
								
							</p>
						</td>
					</tr>
				</table>
			</fieldset>
			
		<br></br>
		</div>
		
		<h3  class="ui-accordion-header  ui-state-default ui-corner-all" align="left"><a href="#" onclick="mostrar(2)">Ficha Familiar</a></h3>
			<div id="fichaFamiliar" style="width:auto; height:auto; overflow:scroll;">
				<jsp:include page="fichaFamiliarTS.jsp"/>
				
			<br></br>	
			</div>
		<h3  class="ui-accordion-header  ui-state-default ui-corner-all" align="left"><a href="#" onclick="mostrar(3)">Ingresos/Egresos</a></h3>
			<div id="ingresoEgreso" style="width:auto; height:auto; overflow:scroll;">
				<fieldset>
					<p><label>Egresos Totales *</label>
						<input name="entrevistaTS.egresosTotales" id="egresosTotales" class="required digits" 
							value="${entrevistaTSDTO.entrevistaTS.perfilAlumno.responsable1.egresosTotales}">	
					</p>
					<p><label>Ingresos Totales</label>
						<input name="entrevistaTS.ingresosTotales" id="ingresosTotales" 
							value="${entrevistaTSDTO.entrevistaTS.ingresosTotales}" class="digits" disabled="disabled"/>		
					</p>
					<p><label>Observaciones Egresos/Ingresos</label>
						<form:textarea path="entrevistaTS.observacionesEgresoIngreso" rows="4" cols="40" id="observacionesEgresoIngreso" style="font-stretch: normal;"/>
						
					</p>
				</fieldset>
				<br></br>
			</div>
			<h3  class="ui-accordion-header  ui-state-default ui-corner-all" align="left"><a href="#" onclick="mostrar(4)">Observaciones sobre el RA</a></h3>
				<div id="ObservacionesRA" style="width:auto; height:auto; overflow:scroll;">
					<fieldset>
						<p><label>Percepciones sobre el RA</label>
							<form:textarea path="entrevistaTS.percepcionesSobreRA" rows="4" cols="40" 
							id="observacionesEgresoIngreso" style="font-stretch: normal;" onblur="chequearLongitudRA(this);" onkeypress="chequearLongitudRA(this);"/>
						</p>
					</fieldset>
				<br></br>	
				</div>
			<h3  class="ui-accordion-header  ui-state-default ui-corner-all" align="left"><a href="#" onclick="mostrar(5)">Recomendación Final TS</a></h3>
				<div id="RecomendacionTS" style="width:auto; height:auto; overflow:scroll;">
					<fieldset>
						<p><label>Recomendación TS </label>
							<select name="recomendacionTSId">
								<c:forEach items="${entrevistaTSDTO.listaRecomendacionTS}" var="recomendacionTS">
								<c:choose>
									<c:when test="${entrevistaTSDTO.entrevistaTS.recomendacionesTS.id == recomendacionTS.id }">
										<option value="${recomendacionTS.id}" selected="selected">${recomendacionTS.valor}</option>
									</c:when>
									<c:otherwise>
										<option value="${recomendacionTS.id}">${recomendacionTS.valor}</option>
									</c:otherwise>
								</c:choose>
								</c:forEach>
							
							</select>
						</p>
						<p><label>Observación General</label>
							<form:textarea path="entrevistaTS.observacionesGenerales" rows="4" cols="40" id="observacionesGenerales" style="font-stretch: normal;"/>
						</p>
					</fieldset>
				<br></br>	
				</div>		
</div>
<table align="center">
	<tr>
		<c:if test="${!entrevistaTSDTO.isDetalleEntrevista}">
		<td align="center">
			<input class="ui-state-default ui-corner-all " type="button" id="submitear" value="Guardar">
		</td>
		</c:if>
		<c:if test="${entrevistaTSDTO.isDetalleEntrevista}">
			<td>
				<input class="ui-state-default ui-corner-all " type="button" id="buttonVolver" value="Volver" />
			</td>
		</c:if>
	</tr>

</table>
	
</form:form>
</div>
</body>
</html>