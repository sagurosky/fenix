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
 <script>
  $(document).ready(function(){
    $("#correccionInformeCesacion").validate({
   		invalidHandler: function(form, validator) {
		var errors = validator.numberOfInvalids();
		if (errors) {
			$.unblockUI();
		}
	}
});
  });
 </script>
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

</head>
<body>
<div id="main-content">
<form id="correccionInformeCesacion" class="cmxform" action="<c:url value='/informeCesacion/correccion.do' />" method="post">
<h1 id="titulo-informe">Finalizacion de Informe de Cesación</h1>
    <table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		<tr>
			<td>Finalizado</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		
		<tr>
		<td>
		<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
			<td width="200"><label>Ciclo Lectivo:</label></td>
			<td width="600"><label>${informeCesacion.cicloActual.nombre}</label></td>
		</tr>	
		<tr>
			<td><label>Alumno</label></td>
			<td><label>${cesado.datosPersonales.nombre}&nbsp;${cesado.datosPersonales.apellido}</label></td>
		</tr>		
		<tr>
			<td><label>Fecha Nacimiento:</label></td>
			<td><label><fmt:formatDate value="${cesado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/></label></td>
		</tr>
		<tr>
			<td><label>Edad:</label></td>
			<td><label>${edad}</label></td>
		</tr>
		<tr>
			<td><label>Fecha Incorporación al PFE:</label></td>
			<td><label>${informe.fechaPBE}</label></td>
		</tr>
		<c:if test="${!empty informe.fechaReincorporacionPBE}">
			<tr>
				<td><label>Fecha Reincorporación al PFE:</label></td>
				<td><label><fmt:formatDate value="${informe.fechaReincorporacionPBE}" pattern="dd/MM/yyyy"/></label></td>
			</tr>						
		</c:if>		
		<tr>	
			<td><label>Localidad donde vive:</label></td>
			<td><label>${cesado.datosPersonales.localidad.nombre}</label>
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
				<td><label>${cesado.anioEscolar.valor}</label></td>
			</c:if>
			<c:if test="${!empty boletin}">
				<td><label>${boletin.ano.valor}</label></td>
			</c:if>
		</tr>
		<tr>		
			<td><label>A&ntilde;o adicional:</label></td>
			<td>
				<input type="checkbox" name="anioAdicional"
					<c:if test="${cesado.anioAdicional}"> checked="checked" </c:if> 
				id="anioAdicional"  disabled="true">
			</td>
		</tr>
		<tr>	
			<td><label>Institución educativa:</label></td>
			<td><label>${cesado.escuela.nombre}</label>
			</td>
		</tr>
		<tr>	
			<td><label>Localidad:</label></td>
			<td><label>${cesado.escuela.localidad.nombre}</label>
			</td>
		</tr>
		<tr>	
			<td><label>Padrino:</label></td>
			<td>
			<label>${informeCesacion.padrino.empresa.denominacion}</label>
			<label>${informeCesacion.padrino.datosPersonales.nombre}&nbsp;${informeCesacion.padrino.datosPersonales.apellido}</label>
			</td>
		</tr>
		</table>
		</td>
		</tr>
		
		<c:if test="${!empty boletin}">
		<tr>
		<td colspan="2"><h1 id="subtitulo-informe"><label>Boletín de Calificaciones</label></h1></td>
		</tr>
		<tr>	
		<td colspan="2">
		<table  border="0" align="left" cellpadding="0"
			cellspacing="0" id="table-forms">
			<tr>
				<td><label>Año:</label> 
				<input type="text" name="ano"
					id="ano" readonly="readonly" value="${boletin.ano}"
					class="text-input required" />
				</td>
			</tr>
			<tr>
				<td><label>Materias:</label>
				
						<table align="left" class="dataTables_wrapper" 
							border="1">
							<thead title="Materias">
								<tr align="center">
									<th>Materia</th>
									<th>1º TRIMESTRE</th>
									<th>2º TRIMESTRE</th>
									<th>3º TRIMESTRE</th>
								</tr>

							</thead>
							<tbody>

								<c:if test="${!empty boletin}">
									<tr align="left">
										<!-- CORRESPONDE AL TH MATERIA -->
										<td align="center" nowrap="nowrap" valign="middle"
											style="font-size: 14px; font-weight: bold;"><c:forEach
											items="${materias}" var="materia">
											<table>
												<tr>
													<td>${materia.nombre}</td>
												</tr>
											</table>
										</c:forEach></td>

										<!-- CORRESPONDE AL TH 1º TRIMESTRE -->
										<td align="left" nowrap="nowrap" valign="top"
											style="font-size: 14px"><c:forEach
											items="${primero.materias}" var="notaMateria">
											<table>
												<tr>
													<td>${notaMateria.nota}</td>
												</tr>
											</table>

										</c:forEach>
										
										</td>

										<!-- CORRESPONDE AL TH 2º TRIMESTRE -->
										<td align="left" nowrap="nowrap" valign="top"
											style="font-size: 14px"><c:forEach
											items="${segundo.materias}" var="notaMateria">
											<table>
												<tr>
													<td>${notaMateria.nota}</td>
												</tr>
											</table>
										</c:forEach>
										
										</td>

										<!-- CORRESPONDE AL TH 3º TRIMESTRE -->
										<td align="left" nowrap="nowrap" valign="top"
											style="font-size: 14px"><c:forEach
											items="${tercero.materias}" var="notaMateria">
											<table>
												<tr>
													<td>${notaMateria.nota}</td>
												</tr>
											</table>
										</c:forEach>
										
										</td>


									</tr>
								</c:if>
								
							</tbody>

						</table>
						
				</td>
			</tr>
		</table>
		
		</c:if>
		
		
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Datos Estimados de Boletín</label></h1></td>
		</tr>
		<tr>
			<td><label>Materias aprobadas</label></td>
			<td><label>${materiasAprobadas}</label></td>
		</tr>
		<tr>
			<td><label>Materias desaprobadas</label></td>
			<td><label>${materiasDesaprobadas}</label></td>
		</tr>
		<tr>
			<td><label>Inasistencias</label></td>
			<td><label>${inasistencias}</label></td>
		</tr>
		
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Inasistencias</label></h1></td>
		</tr>
		<tr>
			<td><label >Primer Trimestre:</label></td>
			<td><label>${cesado.boletin.inasistenciasPrimerTrimestre}</label></td>
		</tr>
		<tr>
			<td><label>Segundo Trimestre:</label></td>
			<td><label>${cesado.boletin.inasistenciasSegundoTrimestre}</label></td>
		</tr>
		<tr>
			<td><label>Tercer Trimestre:</label></td>
			<td><label>${cesado.boletin.inasistenciasTercerTrimestre}</label></td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Escolaridad</label></h1></td>
		</tr>
		<tr>
			<td><label>Compromiso del alumno:</label></td>
			<td>
			<label>${compromisoEscolaridad.valor}</label>
			</td>
		</tr>
		<tr>
			<td><label>Esfuerzo:</label></td>
			<td>
				<label>${informeCesacion.esfuerzo.valor}</label>
			</td>
		</tr>
		<tr>
			<td><label>Conducta:</label></td>
			<td><label>${informeCesacion.conducta}</label></td>
		</tr>
		<tr>
			<td><label>Compromiso del Responsable Adulto:</label></td>
			<td>
			<label>${compromisoRa}</label>
			</td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Participación en el Programa Futuros Egresados</label></h1></td>
		</tr>
		<tr>
			<td><label>Asitencia becado a entrevistas:</label></td>
			<td>
				<label>${asistenciaBecadoAEntrevista.valor}</label>
			</td>
		</tr>
		<tr>
			<td><label>Presentación Material:</label></td>
			<td>
			<label>${presentacionMaterial.valor}</label>
			</td>
		</tr>
		<tr>
			<td><label>Compromiso del alumno:</label></td>
			<td>
			<label>${compromisoEscolaridadPBE.valor}</label>
			</td>
		</tr>
		<tr>
			<td><label>Asitencia responsable a entrevistas:</label></td>
			<td>
			<label>
				${asistenciaRAEntrevista.valor}
			</label>	
			</td>
		</tr>
		<tr>
			<td><label>Compromiso del Responsable Adulto:</label></td>
			<td>
			<label>${compromisoRaPBE.valor }</label>
			</td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Actividad de Acompañamiento</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5" class="no-editable" readonly="readonly">${actividadAcompanamiento}</textarea></td>
		</tr>
		<c:if test="${!empty informe.detallePagosSuspendidos}">
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Suspensiones de la Beca</label></h1></td>
		</tr>
		<tr>	
			<td colspan="2"><textarea cols="60" rows="5"  class="no-editable" readonly="readonly" >${informeCesacion.detallePagosSuspendidos}</textarea></td>
		</tr>
		</c:if>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Observaciones Generales</label></h1></td>
		</tr>
		<tr>
			<td><label>Comentarios:</label></td>
		</tr>
		<tr>
		    <td><textarea cols="60" rows="5"  readonly="readonly" class="no-editable" name="comentarios">${informeCesacion.comentarios}</textarea></td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Destino del dinero de la Beca</label></h1></td>
		</tr>
		<tr>
			<td colspan="2">
			<textarea class="no-editable" readonly="readonly" cols="60" rows="5" >${detalle}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Cesación de la Beca</label></h1></td>
		</tr>
		<tr>
			<td><label>Mes de Cesación:</label></td>
		   <td><label>${mesCesacion}</label></td>
		</tr>
		<tr>
			<td><label>Motivo de Cesación:</label></td>
 			<td>	
 			<textarea cols="60" rows="5"  class="no-editable" readonly="readonly" name="motivoCesacion">${informeCesacion.motivoCesacion}</textarea>
			</td>
		</tr>
		<tr>
			<td><label>Comentarios de Cesación:</label></td>
		    <td><textarea cols="60" rows="5"  readonly="readonly" class="no-editable" name="comentariosCesacion">${informeCesacion.comentariosCesacion}</textarea></td>
		</tr>
		<tr>
			<td><label>Observaciones:</label></td>
		   	<td><textarea cols="60" rows="5"  readonly="readonly" class="no-editable" name="observaciones">${informeCesacion.observaciones}</textarea></td>
		</tr>
      <tr>
 	       <td colspan="2">
  	       <table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
	  <tr>
		<td width="50" align="center" valign="middle">
			 <input type="button" value="Volver" class="ui-state-default ui-corner-all" 
		     onclick="location.href='../alumno/listaBecadosCesadosRr.do'; return false;" />
		</td>
	  </tr>
	</table>
	</td>
	</tr>	
	</table>
	
	<input type="hidden" name="idInformeCesacion" value="${informeCesacion.id}"></input>
	<input type="hidden" name="urlInforme" value="${urlInforme}"></input>
	<input type="hidden" name="idEi" value="${idEi}"></input>
	<input type="hidden" name="idPerfilAlumno" value="${cesado.id}"></input>
</form>
</div>
</body>
</html>