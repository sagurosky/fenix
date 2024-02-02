<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Corrección Informe de seguimiento Nº3</title>
<script type="text/javascript" src="<c:url  value="/static/js/funcionesIS3.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript">
	function chequearLongitud(obj){
		if (obj.value.length > 10000) {
		obj.value = obj.value.substring(0, 10000);
		}
	}
</script>
<script type="text/javascript">
$(document).ready(function(){

	$("#corregirInformeIS3").validate
	(
			{
				rules: 
				{
					'conducta': 'required',
					'compromisoAlumno' : 'required',
					'esfuerzo' : 'required',
					'asistenciaBecadoAEntrevistaPBE' : 'required',
					'presentacionMaterialPBE' : 'required',
					'compromisoAlumnoPBE' : 'required',
					'asistenciaRAEntrevistaPBE' : 'required',
					'compromisoRaPBE' : 'required',
					'compromisoRA' : 'required'
				},
				messages: 
				{
					'conducta': 'Este campo es requerido',
					'compromisoAlumno': 'Este campo es requerido',
					'esfuerzo' : 'Este campo es requerido',
					'asistenciaBecadoAEntrevistaPBE' : 'Este campo es requerido',
					'presentacionMaterialPBE' : 'Este campo es requerido',
					'compromisoAlumnoPBE' : 'Este campo es requerido',
					'asistenciaRAEntrevistaPBE' : 'Este campo es requerido',
					'compromisoRaPBE' : 'Este campo es requerido',
					'compromisoRA' : 'Este campo es requerido'
				},
			   invalidHandler: function(form, validator) 
			   {
					var errors = validator.numberOfInvalids();
					if (errors) 
					{
						$.unblockUI();
					}
				}
		});
});

function submiter(){
	$.blockUI();
	$('#materiasAprobadas').removeAttr("disabled");
	$('#materiasDesaprobadas').removeAttr("disabled");
	$('#inasistencias').removeAttr("disabled");
	$('#obsBoletin').removeAttr("disabled");
	document.forms['corregirInformeIS3'].submit();
}

function enviarForm(action, id, idBecado){
	
	if(action == 'finalizar')
	{
		document.forms['corregirInformeIS3'].action = "../informeIS3/finalizar.do";
		validarCheckDatosEstimadosBoletin($("#datosEstimadosCheck").is(":checked"));
		$.blockUI();
		$('#materiasAprobadas').removeAttr("disabled");
		$('#materiasDesaprobadas').removeAttr("disabled");
		$('#inasistencias').removeAttr("disabled");
		$('#obsBoletin').removeAttr("disabled");
		$("#corregirInformeIS3").submit();
	}
	else if(action == 'supervisar')
	{
		if (document.forms['corregirInformeIS3'].suspensiones != null) {
			if (document.forms['corregirInformeIS3'].suspensiones.value == "" ) { 
			      jAlert('warning', 'El campo "Suspensiones de la Beca" no puede estar vacio', 'Atención!');
			      document.forms['corregirInformeIS3'].suspensiones.focus();
				}else{
				document.forms['corregirInformeIS3'].action = "../informeIS3/supervisionGuardar.do?action=" + action;
				submiter();
			}
			}else{
				document.forms['corregirInformeIS3'].action = "../informeIS3/supervisionGuardar.do?action=" + action;
				submiter();
			}
		}
	else if(action == 'guardar')
	{
		if (document.forms['corregirInformeIS3'].suspensiones != null) {
			if (document.forms['corregirInformeIS3'].suspensiones.value == "" ) { 
			      jAlert('warning', 'El campo "Suspensiones de la Beca" no puede estar vacio', 'Atención!');
			      document.forms['corregirInformeIS3'].suspensiones.focus();
				}else{
					document.forms['corregirInformeIS3'].action = "../informeIS3/correccionGuardar.do";
					submiter();
				}
			}else{
				document.forms['corregirInformeIS3'].action = "../informeIS3/correccionGuardar.do";
				submiter();
			}
	}
	document.forms['corregirInformeIS3'].idInformeIS3.value = id;
	document.forms['corregirInformeIS3'].idAlumno.value = idBecado;
	
}
</script>
</head>
<body onload="cargarDatos();">
<div id="main-content">
<form id="corregirInformeIS3" class="cmxform" action="" method="post">
<h1 id="titulo-informe">:: Informe de Seguimiento Nº 3 ::</h1>
<input type="hidden" id="estadoEntrevista" name="estadoEntrevista" value="${estadoEntrevista}"></input>
  <table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		
		<tr>
		<td colspan="2">${informe.estado.valor}</td>
		</tr>
		
		<tr>
		<td colspan="2"><h1 id="subtitulo-informe"><label>Datos del alumno</label></h1></td>
		</tr>   
		<tr>
			<td ><label>Ciclo lectivo:</label></td>
			<td ><label>${informe.cicloActual.nombre}</label></td>
		</tr>   	
		<tr>
			<td width="150"><label>Alumno</label></td>
			<td width="600"><label>${informe.becado.datosPersonales.nombre}&nbsp;${informe.becado.datosPersonales.apellido}</label></td>
		</tr>
		<tr>
			<td><label>Fecha de nacimiento:</label></td>
			<td><label><fmt:formatDate value="${informe.becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/></label></td>
		</tr>
		<tr>
			<td><label>Edad:</label></td>
			<td><label>${informe.edad}</label></td>
		</tr>
		<tr>	
			<td><label>Localidad donde vive:</label></td>
			<td><label>${informe.becado.datosPersonales.localidad.nombre}</label>
			</td>
		</tr>
		<tr>	
			<td><label>A&ntilde;o que cursa:</label></td>
			<c:if test="${empty boletin}">
				<td><label>${informe.becado.anioEscolar.valor}</label></td>
			</c:if>
			<c:if test="${!empty boletin}">
				<td><label>${boletin.ano.valor}</label></td>
			</c:if>
		</tr>
		<tr>		
			<td><label>A&ntilde;o adicional:</label></td>
			<td>
				<input type="checkbox" name="anioAdicional"
					<c:if test="${informe.becado.anioAdicional}"> checked="checked" </c:if> 
				id="anioAdicional"  disabled="true">
			</td>
		</tr>
		<tr>	
			<td><label>Institución educativa:</label></td>
			<td><label>${informe.becado.escuela.nombre}</label>
			</td>
		</tr>
		<tr>	
			<td><label>Localidad:</label></td>
			<td><label>${informe.becado.escuela.localidad.nombre}</label>
			</td>
		</tr>
		<c:if test="${!empty informe.becado.responsable2}">
			<tr>
				<td><label>Responsable Adulto:</label></td>						
				<td><label>${informe.becado.responsable2.nombre },&nbsp;${informe.becado.responsable2.apellido}</label>					
			</tr>
			<c:if test="${!empty informe.becado.responsable2.idVinculo}">
				<tr>
					<td><label>V&iacute;nculo:</label></td>
					<td><label>${informe.becado.responsable2.idVinculo.valor}</label></td>
				</tr>
			</c:if>
		</c:if>
		<c:if test="${empty informe.becado.responsable2}">
			<tr>
				<td><label>Responsable Adulto:</label></td>						
				<td><label>${informe.becado.responsable1.nombre },&nbsp;${informe.becado.responsable1.apellido}</label>					
			</tr>
			<c:if test="${!empty informe.becado.responsable1.idVinculo}">
				<tr>
					<td><label>V&iacute;nculo:</label></td>
					<td><label>${informe.becado.responsable1.idVinculo.valor}</label></td>
				</tr>
			</c:if>
		</c:if>
		<tr>
			<td><label>Fecha de incorporación al PFE:</label></td>
			<td><label><fmt:formatDate value="${informe.becado.fechaPBE}" pattern="dd/MM/yyyy"/></label></td>
		</tr>	
		<tr>
			<td><label>Padrino:</label></td>
			<td><label>${informe.padrino.empresa.denominacion}</label>
			<label>${informe.padrino.datosPersonales.nombre}&nbsp;${informe.padrino.datosPersonales.apellido}</label>
			</td>
		</tr>
		
		<c:if test="${!empty boletin}">
		<tr>
		<td colspan="2"><h1 id="subtitulo-informe"><label>Bolet&iacute;n de calificaciones</label></h1></td>
		</tr>		
		<tr>
			<td colspan="2">
					<jsp:include page="/WEB-INF/pages/informes/boletinView.jsp"></jsp:include>
			</td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Datos estimados de bolet&iacute;n</label></h1></td>
		</tr>
		<tr>
			<td><label>Incluir datos estimados en informe a padrinos</label></td>
				<c:choose>
				<c:when test="${datosEstimadosCheck == true}">
					<td><input type="checkbox" name="datosEstimadosCheck" checked="checked" id="datosEstimadosCheck" onclick="habilitarDatosEstimadosBoletin();" onchange="habilitarDatosEstimadosBoletin();"></input></td>
				</c:when>
				<c:when test="${datosEstimadosCheck == false}">
					<td><input type="checkbox" name="datosEstimadosCheck" id="datosEstimadosCheck" onclick="habilitarDatosEstimadosBoletin();" onchange="habilitarDatosEstimadosBoletin();"></input></td>
				</c:when>
			</c:choose>		
		</tr>
		<tr>
			<td><label>Materias aprobadas</label></td>
			<td><input name="materiasAprobadas" type="text" id="materiasAprobadas" disabled="disabled" onkeypress="return soloNumeros(event);" value="${materiasAprobadas}" class="required numeric text-input"></input></td>
		</tr>
		<tr>
			<td><label>Materias desaprobadas</label></td>
			<td><input name="materiasDesaprobadas" type="text" id="materiasDesaprobadas" disabled="disabled" onkeypress="return soloNumeros(event);" value="${materiasDesaprobadas}" class="required numeric text-input"></input></td>
		</tr>
		<tr>
			<td><label>Inasistencias</label></td>
			<td><input name="inasistencias" type="text" id="inasistencias" disabled="disabled" onkeypress="return validarDecimal(event, this);" value="${inasistencias}" class="required numeric text-input"></input></td>
		</tr>
		<tr>
			<td><label>Observaciones de bolet&iacute;n</label></td>
			<td colspan="2"><textarea cols="60" rows="5" class="required" id="obsBoletin" disabled="disabled" name="obsBoletin" onblur="chequearLongitud(this);" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${obsBoletin}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Escolaridad</label></h1></td>
		</tr>
		<tr>
			<td width="300"><label>Compromiso del alumno:</label></td>
			<td width="600">
			<select name="compromisoAlumno" id="compromisoAlumno"  class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach var="compromisoAlumno" items="${valores}">
				<c:choose>
					<c:when test="${informe.compromisoAlumno.id == compromisoAlumno.id}">
						<option selected="selected" value="${compromisoAlumno.id}">${compromisoAlumno.valor}</option>
					</c:when>
					<c:otherwise>
						<option value="${compromisoAlumno.id}">${compromisoAlumno.valor}</option>
					</c:otherwise>
				</c:choose>				
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label>Conducta:</label></td>
			<td>
			<select name="conducta" id="conducta"  class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach var="conducta" items="${valores}">	
				<c:choose>
					<c:when test="${informe.conducta.id == conducta.id}">
						<option selected="selected" value="${conducta.id}">${conducta.valor}</option>
					</c:when>
					<c:otherwise>
						<option value="${conducta.id}" >${conducta.valor}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label>Esfuerzo:</label></td>
			<td>
			<select name="esfuerzo" id="esfuerzo"  class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach var="esfuerzo" items="${valores}">
				<c:choose>
					<c:when test="${informe.esfuerzo.id == esfuerzo.id}">
						<option selected="selected" value="${esfuerzo.id}">${esfuerzo.valor}</option>
					</c:when>
					<c:otherwise>
						<option value="${esfuerzo.id}">${esfuerzo.valor}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label>Compromiso del Responsable Adulto:</label></td>
			<td>
			<select name="compromisoRA" id="compromisoRA"  class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach var="compromisoRA" items="${valores}">
				<c:choose>
					<c:when test="${informe.compromisoRA.id == compromisoRA.id}">
						<option selected="selected" value="${compromisoRA.id}">${compromisoRA.valor}</option>
					</c:when>
					<c:otherwise>
						<option value="${compromisoRA.id}">${compromisoRA.valor}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Participaci&oacute;n en el Programa Futuros Egresados</label></h1></td>
		</tr>
		<tr>
		<td>
		<tr>
			<td width="300"><label>Asistencia becado a entrevistas:</label></td>
			<td width="600">
			<select name="asistenciaBecadoAEntrevistaPBE" id=asistenciaBecadoAEntrevistaPBE  class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach var="asistenciaBecadoAEntrevistaPBE" items="${valores}">
				<c:choose>
					<c:when test="${informe.asistenciaBecadoAEntrevistaPBE.id == asistenciaBecadoAEntrevistaPBE.id}">
						<option selected="selected" value="${asistenciaBecadoAEntrevistaPBE.id}">${asistenciaBecadoAEntrevistaPBE.valor}</option>
					</c:when>
					<c:otherwise>
						<option value="${asistenciaBecadoAEntrevistaPBE.id}">${asistenciaBecadoAEntrevistaPBE.valor}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label>Presentaci&oacute;n material:</label></td>
			<td>
			<select name="presentacionMaterialPBE" id="presentacionMaterialPBE"  class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach var="presentacionMaterialPBE" items="${valores}">
				<c:choose>
					<c:when test="${informe.presentacionMaterialPBE.id == presentacionMaterialPBE.id}">
						<option selected="selected" value="${presentacionMaterialPBE.id}">${presentacionMaterialPBE.valor}</option>
					</c:when>
					<c:otherwise>
						<option value="${presentacionMaterialPBE.id}">${presentacionMaterialPBE.valor}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</td>

		</tr>
		<tr>
			<td><label>Compromiso del alumno:</label></td>
			<td>
			<select name="compromisoAlumnoPBE" id="compromisoAlumnoPBE"  class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach var="compromisoAlumnoPBE" items="${valores}">
				<c:choose>
					<c:when test="${informe.compromisoAlumnoPBE.id == compromisoAlumnoPBE.id}">
						<option selected="selected" value="${compromisoAlumnoPBE.id}">${compromisoAlumnoPBE.valor}</option>
					</c:when>
					<c:otherwise>
						<option  value="${compromisoAlumnoPBE.id}">${compromisoAlumnoPBE.valor}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label>Asistencia Responsable Adulto a entrevistas:</label></td>
			<td>
			<select name="asistenciaRAEntrevistaPBE" id="asistenciaRAEntrevistaPBE"  class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach var="asistenciaRAEntrevistaPBE" items="${valores}">
				<c:choose>
					<c:when test="${informe.asistenciaRAEntrevistaPBE.id == asistenciaRAEntrevistaPBE.id}">
						<option selected="selected" value="${asistenciaRAEntrevistaPBE.id}">${asistenciaRAEntrevistaPBE.valor}</option>
					</c:when>
					<c:otherwise>
						<option value="${asistenciaRAEntrevistaPBE.id}">${asistenciaRAEntrevistaPBE.valor}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</td>

		</tr>
		<tr>
			<td><label>Compromiso del Responsable Adulto:</label></td>
			<td>
			<select name="compromisoRaPBE" id="compromisoRaPBE" class="required">
				<option value="">Seleccione una opci&oacute;n:</option>
				<c:forEach var="compromisoRaPBE" items="${valores}">
				<c:choose>
					<c:when test="${informe.compromisoRaPBE.id == compromisoRaPBE.id}">
						<option selected="selected" value="${compromisoRaPBE.id}">${compromisoRaPBE.valor}</option>
					</c:when>
					<c:otherwise>
						<option value="${compromisoRaPBE.id}">${compromisoRaPBE.valor}</option>
					</c:otherwise>
				</c:choose>
				</c:forEach>
			</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Actividad de acompa&ntilde;amiento</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5"  class="required" name="actividadAcompanamiento" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${actividadAcompanamiento}</textarea></td>
		</tr>
		<c:if test="${!empty informe.suspensiones}">
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Suspensiones de la beca</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5" class="required" name="suspensiones" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${suspensiones}</textarea></td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Destino del dinero de la beca</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5" class="required" name="utilizacionBeca" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${utilizacionBeca}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Evaluación de renovación</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5" id="evalRenovacionBeca" name="evalRenovacionBeca" disabled="disabled" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${evalRenovacionBeca}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Motivo de no renovación</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5" id="motivoNoRenovacion" name="motivoNoRenovacion" disabled="disabled" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${motivoNoRenovacion}</textarea></td>
		</tr>
		
		<c:choose>
			<c:when test="${estadoEntrevista == 'Finalizada' }">
				<tr>
					<td colspan="2"><h1 id="subtitulo-informe"><label>Situación de renovación</label></h1></td>
				</tr>
				<tr>
					<td colspan="2"><textarea cols="60" rows="5" id="situacionRenovacion" name="situacionRenovacion" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${situacionRenovacion}</textarea></td>
				</tr>
			</c:when>
			<c:when test="${estadoEntrevista != 'Finalizada' }">
				<tr>
					<td colspan="2"><h1 id="subtitulo-informe"><label>Situación de renovación</label></h1></td>
				</tr>
				<tr>
					<td colspan="2"><textarea cols="60" rows="5" id="situacionRenovacion" disabled="disabled" name="situacionRenovacion" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${situacionRenovacion}</textarea></td>
				</tr>
			</c:when>
		</c:choose>
		
		
		<c:choose>
			<c:when test="${evalRenovacionBeca == 'Fin participación PFE' && estadoEntrevista == 'Finalizada'}">
				<tr>
					<td colspan="2"><h1 id="subtitulo-informe"><label>Proyección año próximo</label></h1></td>
				</tr>
				<tr>
					<td colspan="2"><textarea cols="60" rows="5" id="proyAnioProximo" name="proyAnioProximo"   onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${informe.proyAnioProximo}</textarea></td>
				</tr>
		
				<tr>
					<td colspan="2"><h1 id="subtitulo-informe"><label>Observaciones proyección año próximo</label></h1></td>
				</tr>
				<tr>
				   	<td colspan="2"><textarea cols="60" rows="5"  name="observaciones" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${observaciones}</textarea></td>
				</tr>		
			</c:when>
			<c:when test="${evalRenovacionBeca == 'Fin participación PFE' && estadoEntrevista != 'Finalizada'}">
				<tr>
					<td colspan="2"><h1 id="subtitulo-informe"><label>Proyección año próximo</label></h1></td>
				</tr>
				<input type="hidden" name="proyAnioProximo" value="${proyAnioProximo}"></input>
				<input type="hidden" name="observaciones" value="${observaciones}"></input>
				<tr>
					<td colspan="2"><textarea cols="60" rows="5" id="proyAnioProximo" name="proyAnioProximo" disabled="disabled" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${informe.proyAnioProximo}</textarea></td>
				</tr>
				<tr>
					<td colspan="2"><h1 id="subtitulo-informe"><label>Observaciones proyección año próximo</label></h1></td>
				</tr>
				<tr>
				   	<td colspan="2"><textarea cols="60" rows="5"  name="observaciones"  disabled="disabled" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${observaciones}</textarea></td>
				</tr>
			</c:when>
		</c:choose>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Observaciones personales</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5" name="obsPersonales" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${obsPersonales}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Observaciones familiares</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5"  name="obsFamiliares" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${obsFamiliares}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Observaciones generales</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5"  name="obsGenerales" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${obsGenerales}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Comentarios:</label></h1></td>
		</tr>
		<tr>
		   	<td colspan="2"><textarea cols="60" rows="5"  name="comentarios" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${comentarios}</textarea></td>
		</tr>
		<tr>
      	    <td>&nbsp;</td>
       	    <td>&nbsp;</td>
      	</tr>
     	<tr>
        	<td>&nbsp;</td>
    	    <td>&nbsp;</td>
    	</tr>
      	<tr>
 	       <td colspan="2">
  	       <table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
             <tr>
		  	  <td width="50" height="0" align="center" valign="middle">
		  	  	<input class="ui-state-default ui-corner-all " onclick="enviarForm('guardar','${idInformeIS3}','${becado.id}')" type="button" value="Guardar" />
		  	  </td>	
		  	  <td width="50" height="0" align="center" valign="middle">
		  	  	<input class="ui-state-default ui-corner-all " onclick="enviarForm('supervisar','${idInformeIS3}','${becado.id}')" type="button" value="Supervisar" />
		  	  </td>	
		  	  <td width="50" height="0" align="center" valign="middle">
		  	  	<input class="ui-state-default ui-corner-all " onclick="enviarForm('finalizar','${idInformeIS3}','${becado.id}')" type="button" value="Finalizar" />
		  	  </td>		  
			  <td width="50" align="center" valign="middle">
			  	<input type="button" value="Volver" class="ui-state-default ui-corner-all" 
		       	onclick="location.href='../informes/listaInformesCorreccion.do'; return false;" />
		       </td>
              <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
			 </tr>
	       </table> 
	       </td>
	   </tr>
	</table>
	<input type="hidden" name="idInformeIS3" value="${idInformeIS3}"></input>
	<input type="hidden" name="idEi" value="${idEi}"></input>
	<input type="hidden" name="edad" value="${edad}"></input>
	<input type="hidden" name="evalRenovacionBeca" value="${evalRenovacionBeca}"></input>
	<input type="hidden" name="motivoNoRenovacion" value="${motivoNoRenovacion}"></input>	
	<input type="hidden" name="idAlumno" value="${becado.id}"></input>

</form>
</div>
</body>
</html>