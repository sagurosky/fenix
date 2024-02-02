<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Corrección Informe de Cesacion</title>
<script type="text/javascript"	src="<c:url value="/static/js/funcionesEntrevista.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>

<style type="text/css">
.td
{
text-indent: 30px;
}
.fechas
{
text-indent: 60px;
text-transform: inherit;
font-family: cursive;
font-size: small;
font-stretch: ultra-condensed;
color: purple;
font-weight: bold;
vertical-align: top;
}
.column-right 
{
	vertical-align: top;
}
.title-right 
{
	text-indent: 20px;
	margin-left: 20px;
	font-weight: bold;
	color: purple;
	font-family: cursive;
	
}
.tabla
{
	background-image:url('../static/images/papel.jpg');
	color:black;
	font-family:sans-serif;
	align:center; 
	border:0; 
}
</style>
<script type="text/javascript">
$(document).ready(function(){

	$("#corregirInformeIS2").validate
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

function enviarForm(action, id, idBecado){
	
	if(action == 'finalizar')
	{
		document.forms['corregirInformeIS2'].action = "../informeIS2/finalizar.do";
		$.blockUI();
		$('#corregirInformeIS2').submit();
	}
    if(action == 'supervisar'){
    	if (document.forms['corregirInformeIS2'].suspensiones != null) {
			if (document.forms['corregirInformeIS2'].suspensiones.value == "") { 
			      jAlert('warning', 'El campo "Suspensiones de la Beca" no puede estar vacio', 'Atención!');
			      document.forms['corregirInformeIS2'].suspensiones.focus();
				}else{
					document.forms['corregirInformeIS2'].action = "../informeIS2/supervisar.do?accion=" + 'informeIS2/correccionInformeIS2View.do';
					$.blockUI();
					document.forms['corregirInformeIS2'].submit();
				}
    	}else{
			document.forms['corregirInformeIS2'].action = "../informeIS2/supervisar.do?accion=" + 'informeIS2/correccionInformeIS2View.do';
			$.blockUI();
			document.forms['corregirInformeIS2'].submit();
		}
	}
	if(action == 'guardar'){
		if (document.forms['corregirInformeIS2'].suspensiones != null) {
			if (document.forms['corregirInformeIS2'].suspensiones.value == "") { 
			      jAlert('warning', 'El campo "Suspensiones de la Beca" no puede estar vacio', 'Atención!');
			      document.forms['corregirInformeIS2'].suspensiones.focus();
				}else{
					document.forms['corregirInformeIS2'].action ="../informeIS2/correccion.do";
					$.blockUI();
					document.forms['corregirInformeIS2'].submit();
				}
		}else{
			document.forms['corregirInformeIS2'].action ="../informeIS2/correccion.do";
			$.blockUI();
			document.forms['corregirInformeIS2'].submit();
		}
	}
	document.forms['corregirInformeIS2'].idInformeIS2.value = id;
	document.forms['corregirInformeIS2'].idAlumno.value = idBecado;
}

function chequearLongitud(obj){
	if (obj.value.length > 10000) {
	obj.value = obj.value.substring(0, 10000);
	}
}
</script>

</head>
<body>
<div id="main-content">
<form id="corregirInformeIS2" class="cmxform" action="" method="post">
<h1 id="titulo-informe">:: Informe de Seguimiento Nº 2 ::</h1>
	<c:set var="url" value="${url}"></c:set>
    <table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		<tr>
			<td>Correcci&oacute;n</td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe">Datos del Becado</h1></td>
		</tr>
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
		<tr>
			<td width="200"><label>Ciclo lectivo:</label></td>
			<td width="600"><label>${informe.cicloActual.nombre}</label></td>
		</tr> 
		<tr>
			<td><label>Alumno:</label></td>
			<td><label>${becado.datosPersonales.nombre}&nbsp;${becado.datosPersonales.apellido}</label></td>
		</tr>
		<tr>
			<td>Foto cargada</td>
			<td colspan="2">
				<img src="../fichaAlumno/mostrarImagen.do?dni=${becado.datosPersonales.dni}" width="90px" height="90px">
			</td>
		</tr>	
		<tr>
			<td><label>Fecha nacimiento:</label></td>
			<td><label><fmt:formatDate value="${becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/></label></td>
		</tr>
		<tr>
			<td><label>Edad:</label></td>
			<td><label>${edad}</label></td>
		</tr>
		<tr>	
			<td><label>Localidad donde vive:</label></td>
			<td><label>${becado.datosPersonales.localidad.nombre}</label>
			</td>
		</tr>
		<tr>	
			<td><label>A&ntilde;o que cursa:</label></td>
			<c:if test="${empty boletin}">
				<td><label>${becado.anioEscolar.valor}</label></td>
			</c:if>
			<c:if test="${!empty boletin}">
				<td><label>${boletin.ano.valor}</label></td>
			</c:if>
		</tr>
		<tr>		
			<td><label>A&ntilde;o adicional:</label></td>
			<td>
				<input type="checkbox" name="anioAdicional"
					<c:if test="${becado.anioAdicional}"> checked="checked" </c:if> 
				id="anioAdicional"  disabled="true">
			</td>
		</tr>
		<tr>	
			<td><label>Institución educativa:</label></td>
			<td><label>${becado.escuela.nombre}</label>
			</td>
		</tr>
		<tr>	
			<td><label>Localidad:</label></td>
			<td><label>${becado.escuela.localidad.nombre}</label>
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
			<td><label>Fecha incorporaci&oacute;n al PFE:</label></td>
			<td><label><fmt:formatDate value="${becado.fechaPBE}" pattern="dd/MM/yyyy"/></label></td>
		</tr>	
		<tr>	
			<td><label>Padrino:</label></td>
			<td><label>
				${informe.padrino.empresa.denominacion}			
				${informe.padrino.datosPersonales.nombre}&nbsp;${informe.padrino.datosPersonales.apellido}</label>
			</td>
		</tr>
		</table>
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
		<c:if test="${empty boletin}">
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Datos estimados de bolet&iacute;n</label></h1></td>
		</tr>
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
		<tr>
			<td width="200"><label>Materias aprobadas</label></td>
			<td width="600"><input name="materiasAprobadas" type="text" onkeypress="return soloNumeros(event);" value="${materiasAprobadas}" class="required numeric text-input"></input></td>
		</tr>
		<tr>
			<td><label>Materias desaprobadas</label></td>
			<td><input name="materiasDesaprobadas" type="text" onkeypress="return soloNumeros(event);" value="${materiasDesaprobadas}" class="required numeric text-input"></input></td>
		</tr>
		<tr>
			<td><label>Inasistencias</label></td>
			<td><input name="inasistencias" type="text" onkeypress="return validarDecimal(event, this);"value="${inasistencias}" class="required numeric text-input"></input></td>
		</tr>
		<tr>
			<td><label>Observaciones de bolet&iacute;n</label></td>
			<td colspan="2"><textarea cols="60" rows="5" name="obsBoletin" class="required" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${obsBoletin}</textarea></td>
		</tr>
		</table>
		</td>
		</tr>
		</c:if>
		
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Escolaridad</label></h1></td>
		</tr>
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
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
		</table>
		</td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Participaci&oacute;n en el Programa Futuros Egresados</label></h1></td>
		</tr>
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
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
		</table>
		</td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Actividad de acompa&ntilde;amiento</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5"  class="required" name="actividadAcompanamiento" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${actividadAcompanamiento}</textarea></td>
		</tr>
		<c:if test="${!empty suspensiones}">
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Suspensiones de la beca</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5" class="required" name="suspensiones" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${suspensiones}</textarea></td>
		</tr>
		</c:if>
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
			<td colspan="2"><textarea cols="60" rows="5" name="obsFamiliares" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${obsFamiliares}</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Observaciones generales</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5"  name="obsGenerales" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${obsGenerales}</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Destino del dinero de la beca</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5" class="required" name="utilizacionBeca" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${utilizacionBeca}</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Comentarios:</label></h1></td>
		</tr>
		<tr>
		   	<td colspan="2"><textarea cols="60" rows="5" name="comentarios" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${comentarios}</textarea></td>
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
		  	  	<input class="ui-state-default ui-corner-all " onclick="enviarForm('guardar','${idInformeIS2}','${becado.id}')" type="button" value="Guardar" />
		  	  </td>	
		  	  <td width="50" height="0" align="center" valign="middle">
		  	  	<input class="ui-state-default ui-corner-all " onclick="enviarForm('supervisar','${idInformeIS2}','${becado.id}')" type="button" value="Supervisar" />
		  	  </td>	
		  	  <td width="50" height="0" align="center" valign="middle">
		  	  	<input class="ui-state-default ui-corner-all " onclick="enviarForm('finalizar','${idInformeIS2}','${becado.id}')" type="button" value="Finalizar" />
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
	<input type="hidden" name="idInformeIS2" value="${idInformeIS2}"></input>
	<input type="hidden" name="idEi" value="${idEi}"></input>
	<input type="hidden" name="edad" value="${edad}"></input>
	<input type="hidden" name="idAlumno" value="${becado.id}"></input>
</form>
</div>
</body>
</html>