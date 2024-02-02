<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<title>Informe de Cesacion</title>
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
	function chequearLongitud(obj){
		if (obj.value.length > 10000) {
		obj.value = obj.value.substring(0, 10000);
		}
	}
</script>
</head>
<body>
<div id="main-content">
<form:form id="supervisionInformeCesacion" commandName="informe" cssClass="cmxform"  modelAttribute="informe" action="" method="post">
<h1 id="titulo-informe">:: Informe de Cesación ::</h1>
    <table  border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
    	<tr>
			<td>${informe.estado.valor}</td>
		</tr>
		
    	<tr>
			<td ><h1 id="subtitulo-informe">Datos del Becado</h1></td>
		</tr>
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
			<td width="200"><label>Ciclo Lectivo:</label></td>
			<td width="600"><label>${informe.cicloActual.nombre}</label></td>
		</tr>	
		<tr>
			<td><label>Alumno:</label></td>
			<td><label>${informe.becado.datosPersonales.nombre}&nbsp;${informe.becado.datosPersonales.apellido}</label></td>
		</tr>
		<tr>
			<td><label>Fecha Nacimiento:</label></td>
			<td><label><fmt:formatDate value="${informe.becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/></label></td>
		</tr>
		<tr>
			<td><label>Edad:</label></td>
			<td><label>${informe.edad}</label></td>
		</tr>
		<tr>
			<td><label>Fecha Incorporación al PFE:</label></td>
			<td><label><fmt:formatDate value="${informe.fechaPBE}" pattern="dd/MM/yyyy"/></label></td>
		</tr>	
		<c:if test="${!empty informe.fechaReincorporacionPBE}">
			<tr>
				<td><label>Fecha Reincorporación al PFE:</label></td>
				<td><label><fmt:formatDate value="${informe.fechaReincorporacionPBE}" pattern="dd/MM/yyyy"/></label></td>
			</tr>						
		</c:if>	
		<tr>	
			<td><label>Localidad donde vive:</label></td>
			<td><label>${informe.becado.datosPersonales.localidad.nombre}</label>
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
		<tr>	
			<td><label>Padrino:</label></td>
			<td><label>
					${informe.padrino.empresa.denominacion}			
					${informe.padrino.datosPersonales.nombre}&nbsp;${informe.padrino.datosPersonales.apellido}
				</label>
			</td>		
		</tr>
		</table>
		</td>
		</tr>
		
	
		<c:if test="${!empty boletin && incluirBoletinCheck == true}">
			<tr>
				<td colspan="2"><h1 id="subtitulo-informe"><label>Boletín de Calificaciones</label></h1></td>
			</tr>
			
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Incluir el boletín en informe a padrinos </label></td>
							<td style="vertical-align: middle;"><input type="checkbox" name="incluirBoletinCheck" 
										<c:if test="${incluirBoletinCheck}"> checked="checked" </c:if> 
									id="incluirBoletinCheck"  disabled="true">
							</td> 							
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td>&nbsp;</td>
      		</tr>	
			
			<tr>	
				<td colspan="2">
					<table>	
						<tr>
							<td>
								<label>
									Recuerda que las materias y/o asistencias, días hábiles que contengan en todos los trimestres los valores "No aplica" y/o "No existe" y/o "Sin dato", no serán agregados al PDF para el padrino.
								</label>
							</td>
						</tr>
					</table>
					<jsp:include page="/WEB-INF/pages/informes/boletinView.jsp"></jsp:include>
				</td>
			</tr>
			
			<tr>
				<td>&nbsp;</td>
      		</tr>
      	
			<c:if test="${!empty boletin.materiasPrevias}">			
				<tr>			
					<td colspan="2">
						<jsp:include page="/WEB-INF/pages/informes/previasView.jsp"></jsp:include>
					</td>
				</tr>			
			</c:if>						
		</c:if>			
	
		<c:if test="${datosEstimadosCheck == true || !empty informe.materiasAprobadas || !empty informe.materiasDesaprobadas 
				|| !empty informe.inasistencias ||!empty informe.obsBoletin}">
			<tr>
				<td colspan="2"><h1 id="subtitulo-informe"><label>Datos estimados de bolet&iacute;n</label></h1></td>
			</tr>
		</c:if>

		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
					<c:if test="${datosEstimadosCheck == true}">
						<tr>
							<td width="300"><label>Incluir datos estimados en informe a padrinos</label></td>
							<td width="600" style="vertical-align: middle;"><input type="checkbox" name="datosEstimadosCheck" 
										<c:if test="${datosEstimadosCheck}"> checked="checked" </c:if> 
									id="datosEstimadosCheck"  disabled="true">
							</td> 							
						</tr>
					</c:if>
					<c:if test="${!empty informe.materiasAprobadas}">
						<tr>
							<td width="300"><label>Materias aprobadas:</label></td>
							<td width="600">${informe.materiasAprobadas}</td>
						</tr>
					</c:if>
					<c:if test="${!empty informe.materiasDesaprobadas}">
						<tr>
							<td width="300"><label>Materias desaprobadas:</label></td>
							<td width="600">${informe.materiasDesaprobadas}</td>
						</tr>
					</c:if>
					<c:if test="${!empty informe.inasistencias}">
						<tr>
							<td width="300"><label>Inasistencias:</label></td>
							<td width="600">${informe.inasistencias}</td>
						</tr>
					</c:if>
					<c:if test="${!empty informe.obsBoletin}">
						<tr>
							<td width="300"><label>Observaciones de bolet&iacute;n:</label></td>
							<td style="text-align: justify;" width="600">${informe.obsBoletin}</td>
						</tr>
					</c:if>
				</table>
			</td>
		</tr>
		
		<c:if test="${!empty informe.compromisoEscolaridad.valor || !empty informe.esfuerzo.valor || !empty informe.conducta.valor || !empty informe.compromisoRa.valor}">
			<tr>
				<td><h1 id="subtitulo-informe"><label>Escolaridad</label></h1></td>
			</tr>
		</c:if>
		
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
					<c:if test="${!empty informe.compromisoEscolaridad.valor}">
						<tr>
							<td width="300"><label>Compromiso del alumno:</label></td>
							<td width="600">${informe.compromisoEscolaridad.valor}</td>
						</tr>
					</c:if>
						
					<c:if test="${!empty informe.esfuerzo.valor}">
						<tr>
							<td><label>Esfuerzo:</label></td>
							<td>${informe.esfuerzo.valor}</td>
						</tr>
					</c:if>
						
					<c:if test="${!empty informe.conducta.valor}">
						<tr>
							<td><label>Conducta:</label></td>
							<td>${informe.conducta.valor}</td>
						</tr>
					</c:if>
						
					<c:if test="${!empty informe.compromisoRa.valor}">
						<tr>
							<td><label>Compromiso del Responsable Adulto:</label></td>
							<td>${informe.compromisoRa.valor}</td>
						</tr>
					</c:if>
				</table>
			</td>
		</tr>
		
		<c:if test="${!empty informe.asistenciaBecadoAEntrevista.valor || !empty informe.presentacionMaterial.valor || !empty informe.compromisoEscolaridadPBE.valor
					|| !empty informe.asistenciaRAEntrevista.valor || !empty informe.compromisoRaPBE.valor}">
		<tr>
			<td ><h1 id="subtitulo-informe"><label>Participación en el Programa Futuros Egresados</label></h1></td>
		</tr>
		</c:if>
		
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<c:if test="${!empty informe.asistenciaBecadoAEntrevista.valor}">
		<tr>
			<td width="300"><label>Asitencia becado a entrevistas:</label></td>
			<td width="600">${informe.asistenciaBecadoAEntrevista.valor}</td>
		</tr>
		</c:if>
		
		<c:if test="${!empty informe.presentacionMaterial.valor}">
		<tr>
			<td><label>Presentación material:</label></td>
			<td>${informe.presentacionMaterial.valor}</td>
		</tr>
		</c:if>
		
		<c:if test="${!empty informe.compromisoEscolaridadPBE.valor}">
		<tr>
			<td><label>Compromiso del alumno:</label></td>
			<td>${informe.compromisoEscolaridadPBE.valor}</td>
		</tr>
		</c:if>
		
		<c:if test="${!empty informe.asistenciaRAEntrevista.valor}">
		<tr>
			<td><label>Asistencia Responsable Adulto a entrevistas:</label></td>
			<td>${informe.asistenciaRAEntrevista.valor}</td>
		</tr>
		</c:if>
		
		<c:if test="${!empty informe.compromisoRaPBE.valor}">
		<tr>
			<td><label>Compromiso del Responsable Adulto:</label></td>
			<td>${informe.compromisoRaPBE.valor}</td>
		</tr>
		</c:if>
		</table>
		</td>
		</tr>
		
		<c:if test="${!empty informe.actividadAcompanamiento}">
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
			<td width="200"><h1 id="subtitulo-informe"><label>Actividad de Acompañamiento</label></h1></td>
		</tr>
		<tr>	
			<td width="600">${informe.actividadAcompanamiento}</td>
		</tr>
		</table>
		</td>
		</tr>
		</c:if>
		
		<c:if test="${!empty informe.detallePagosSuspendidos}">
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
			<td width="200"><h1 id="subtitulo-informe"><label>Suspensiones de la Beca</label></h1></td>
		</tr>
		<tr>	
			<td width="600">${informe.detallePagosSuspendidos}</td>
		</tr>
		</table>
		</td>
		</tr>
		</c:if>
		
		<tr>
			<td><h1 id="subtitulo-informe"><label>Cesación de la Beca</label></h1></td>
		</tr>
		
		
		<c:if test="${!empty informe.mesCesacion}">
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
		<tr>
			<td width="200"><label>Mes de Cesación:</label></td>
			<td style="text-align: justify;" width="600">${informe.mesCesacion}</td>
		</tr>
		</table>
		</td>
		</tr>
		</c:if>
		
		<c:if test="${!empty informe.motivoCesacion}">
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
		<tr>
			<td width="200"><label>Motivo de Cesación:</label></td>
			<td style="text-align: justify;" width="600">${informe.motivoCesacion}</td>
		</tr>
		</table>
		</td>
		</tr>
		</c:if>
		
		<c:if test="${!empty informe.comentariosCesacion}">
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
		<tr>
			<td width="200"><label>Comentarios de Cesación:</label></td>
			<td style="text-align: justify;" width="600">${informe.comentariosCesacion}</td>
		</tr>
		</table>
		</td>
		</tr>
		</c:if>
		
		
		<c:if test="${!empty informe.observaciones}">
		<tr>
			<td><h1 id="subtitulo-informe"><label>Observaciones Generales</label></h1></td>
		</tr>
		<tr>
	  		<td style="text-align: justify;" width="860">${informe.observaciones}</td>
		</tr>
		</c:if>
		
		<c:if test="${!empty informe.detalle}">
		<tr>
			<td><h1 id="subtitulo-informe"><label>Destino del dinero de la Beca</label></h1></td>
		</tr>
		<tr>
			<td style="text-align: justify;" width="860">${informe.detalle}</td>
		</tr>
		<tr>
      	    <td>&nbsp;</td>
      	</tr>
		</c:if>
		
		
      	
      	<c:if test="${!empty informe.comentarios}">
      	<tr>
			<td><h1 id="subtitulo-informe"><label>Comentarios de Revisión</label></h1></td>
		</tr>
		<tr>
			<td><label>Comentarios:</label></td>
		</tr>
		<tr>
		    <td style="text-align: justify;" width="860">${informe.comentarios}</td>
		</tr>
		</c:if>
		
		<tr>
      	    <td>&nbsp;</td>
      	</tr>
    	
      	<tr>
 	       <td colspan="2">
  	       <table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
             <tr>
		  	  	  
			  <td width="50" align="center" valign="middle">
			  	<input type="button" value="Volver" class="ui-state-default ui-corner-all" 
		       	onclick="history.back();"/>
		       </td>
              <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
			 </tr>
	       </table> 
	       </td>
	   </tr>
	</table>
	<input type="hidden" name="id" value="${informe.id}"></input>
	<input type="hidden" name="ei.id" value="${informe.ei.id}"></input>
	<input type="hidden" name="beca.id" value="${informe.beca.id}"></input>
	<input type="hidden" name="padrino.id" value="${informe.padrino.id}"></input>
	<input type="hidden" name="eaPerfil.idPerfilEA" value="${informe.eaPerfil.idPerfilEA}"></input>
	<input type="hidden" name="rrPerfil.idPerfilRR" value="${informe.rrPerfil.idPerfilRR}"></input>
	<input type="hidden" name="fechaAlta"  value="<fmt:formatDate value="${informe.fechaAlta}" pattern="dd/MM/yyyy"/>" ></input>
	<input type="hidden" name="estado" value="${informe.estado}"></input>
	<input type="hidden" name="fechaPBE" value="<fmt:formatDate value="${informe.fechaPBE}" pattern="dd/MM/yyyy"/>"></input>
	<input type="hidden" name="informe" value="${informe}"></input>
	<input type="hidden" name="becado.id" value="${informe.becado.id}"></input>	
	<input type="hidden" name="urlInforme" value="${urlInforme}"></input>
	<input type="hidden" name="edad" value="${informe.edad}"></input>
	<input type="hidden" name="nombre" value="${informe.nombre}"></input>
	<input type="hidden" name="cicloActual.id" value="${informe.cicloActual.id}"></input>
	<input type="hidden" name="esfuerzo"  value="${informe.esfuerzo.id}"/>
	<input type="hidden" name="compromisoEscolaridad"  value="${informe.compromisoEscolaridad.id}"/>	
	<input type="hidden" name="compromisoRa"  value="${informe.compromisoRa.id}"/>	
	<input type="hidden" name="asistenciaBecadoAEntrevista"  value="${informe.asistenciaBecadoAEntrevista.id}"/>	
	<input type="hidden" name="presentacionMaterial"  value="${informe.presentacionMaterial.id}"/>	
	<input type="hidden" name="compromisoEscolaridadPBE"  value="${informe.compromisoEscolaridadPBE.id}"/>	
	<input type="hidden" name="asistenciaRAEntrevista"  value="${informe.asistenciaRAEntrevista.id}"/>	
	<input type="hidden" name="compromisoRaPBE"  value="${informe.compromisoRaPBE.id}"/>	
	<input type="hidden" name="motivoCesacion"  value="${informe.motivoCesacion}"/>	
	<input type="hidden" name="conducta"  value="${informe.conducta.id}"/>	
	
</form:form>
</div>
</body>
</html>