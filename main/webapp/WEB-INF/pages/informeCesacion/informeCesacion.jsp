<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Informe de Cesación en Construcción</title>
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
<form id="altaInformeCesacion" class="cmxform" action="<c:url value='/informeCesacion/generar.do' />" method="post">
<h1 id="titulo-informe">Informe de Cesación en Construcción</h1>
    <table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		
		
		<tr>
			<td width="400"><label>Ciclo Lectivo:</label></td>
			<td width="600"><label>${informe.cicloActual.nombre}</label></td>
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
			<td><label></label></td>
		</tr>	
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
			<td><label>${cesado.beca.padrino.empresa.denominacion}</label>
			<label>${cesado.beca.padrino.datosPersonales.nombre}&nbsp;${cesado.beca.padrino.datosPersonales.apellido}</label>
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
			<td><input name="materiasAprobadas" type="text" class="required numeric text-input"></input></td>
		</tr>
		<tr>
			<td><label>Materias desaprobadas</label></td>
			<td><input name="materiasDesaprobadas" type="text" class="required numeric text-input"></input></td>
		</tr>
		<tr>
			<td><label>Inasistencias</label></td>
			<td><input name="inasistencias" type="text" class="required numeric text-input"></input></td>
		</tr>
		<tr>
			<td><label>Observaciones de bolet&iacute;n</label></td>
			<td colspan="2"><textarea cols="60" rows="5" class="required" name="obsBoletin"></textarea></td>
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
			<select name="compromisoEscolaridad" id="compromisoEscolaridad" >
				<form:option value="">Seleccione una opción...</form:option>
				<c:forEach var="compromisoEscolaridad" items="${compromisoEscolaridades}">
					<option selected="selected" value="${compromisoEscolaridad.id}">${compromisoEscolaridad.valor}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label>Conducta:</label></td>
			<td><input name="conducta" value="${cesado.conducta}"></input></td>
		</tr>
		<tr>
			<td><label>Esfuerzo:</label></td>
			<td>
				<select name="esfuerzo" id="esfuerzo" >
				<form:option value="">Seleccione una opción...</form:option>
				<c:forEach var="esfuerzo" items="${esfuerzos}">
					<option value="${esfuerzo.id}">${esfuerzo.valor}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label>Compromiso del Responsable Adulto:</label></td>
			<td>
			<select name="compromisoRa" id="compromisoRa" >
				<form:option value="">Seleccione una opción...</form:option>
				<c:forEach var="compromisoRa" items="${compromisosRa}">
					<option selected="selected" value="${compromisoRa.id}">${compromisoRa.valor}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Participación en el Programa Futuros Egresados</label></h1></td>
		</tr>
		<tr>
			<td><label>Asitencia becado a entrevistas:</label></td>
			<td>
				<select name="asistenciaBecadoAEntrevista" id="asistenciaBecadoAEntrevista" >
				<form:option value="">Seleccione una opción...</form:option>
				<c:forEach var="asistenciaBecadoAEntrevista" items="${asistenciaBecados}">
					<option value="${asistenciaBecadoAEntrevista.id}">${asistenciaBecadoAEntrevista.valor}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label>Presentación Material:</label></td>
			<td>
				<select name="presentacionMaterial" id="presentacionMaterial" >
				<form:option value="">Seleccione una opción...</form:option>
				<c:forEach var="presentacionMaterial" items="${presentacionMateriales}">
					<option value="${presentacionMaterial.id}">${presentacionMaterial.valor}</option>
				</c:forEach>
			</select>
			</td>

		</tr>
		<tr>
			<td><label>Compromiso del alumno:</label></td>
			<td>
			<select name="compromisoEscolaridadPBE" id="compromisoEscolaridadPBE" >
				<form:option value="">Seleccione una opción...</form:option>
				<c:forEach var="compromisoEscolaridadPBE" items="${compromisoEscolaridades}">
					<option selected="selected" value="${compromisoEscolaridadPBE.id}">${compromisoEscolaridadPBE.valor}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label>Asitencia responsable a entrevistas:</label></td>
			<td>
				<select name="asistenciaRAEntrevista" id="asistenciaRAEntrevista" >
				<form:option value="">Seleccione una opción...</form:option>
				<c:forEach var="asistenciaRAEntrevista" items="${asistenciaRAs}">
					<option value="${asistenciaRAEntrevista.id}">${asistenciaRAEntrevista.valor}</option>
				</c:forEach>
			</select>
			</td>

		</tr>
		<tr>
			<td><label>Compromiso del Responsable Adulto:</label></td>
			<td>
			<select name="compromisoRaPBE" id="compromisoRaPBE" >
				<form:option value="">Seleccione una opción...</form:option>
				<c:forEach var="compromisoRaPBE" items="${compromisosRa}">
					<option selected="selected" value="${compromisoRaPBE.id}">${compromisoRaPBE.valor}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Actividad de Acompañamiento</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><textarea cols="60" rows="5" name="actividadAcompanamiento"></textarea></td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Utilización de la Beca</label></h1></td>
		</tr>
		<tr>
			<td colspan="2">
				<c:if test="${!empty detalles}">
				<c:forEach items="${detalles}" var="detalle">
					<input name="detalle" value="${detalle.valor},"></input>
				</c:forEach>
				</c:if>
				<c:if test="${empty detalles}">
					<textarea cols="60" rows="5" name="detalle" ></textarea>
				</c:if>
			</td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Cesación de la Beca</label></h1></td>
		</tr>
		<tr>
			<td><label>Mes de Cesación:</label></td>
		   <td><textarea cols="60" rows="5" name="mesCesacion" value="${mesCesacion}" class="required text-input"></textarea></td>
		</tr>
		<tr>
			<td><label>Motivo de Cesación:</label></td>
		    <td><label>${motivoCesacion}</label></td>
		</tr>
		<tr>
			<td><label>Comentarios:</label></td>
		    	<td><label><textarea cols="60" rows="5" name="comentarios"></textarea></label></td>

		</tr>
		<tr>
			<td><label>Observaciones:</label></td>
		   		<td><label><textarea  cols="60" rows="5"  name="observaciones"></textarea></label></td>

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
		  	  	<input class="ui-state-default ui-corner-all " type="submit" value="Guardar Construcción" />
		  	  </td>		  
			  <td width="50" align="center" valign="middle">
			  	<input type="button" value="Volver" class="ui-state-default ui-corner-all" 
		       	onclick="location.href='../informeCesacion/informeCesacion.do?idPerfilAlumno='${cesado.id}'; return false;" />
		       </td>
              <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
			 </tr>
	       </table> 
	       </td>
	   </tr>
	</table>
	<input type="hidden" name="urlInforme" value="${urlInforme}"></input>
	<input type="hidden" name="idEi" value="${idEi}"></input>
	<input type="hidden" name="edad" value="${edad}"></input>
	<input type="hidden" name="idPerfilAlumno" value="${cesado.id}"></input>
</form>
</div>
</body>
</html>