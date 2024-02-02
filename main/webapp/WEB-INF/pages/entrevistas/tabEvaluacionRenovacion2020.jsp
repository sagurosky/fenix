<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>





<table id="table-informe">

	<tr align="left">
			
			
			
	</tr>

	<tr>		
		<td nowrap="nowrap" ><label>Situación Escolar Diciembre</label></td>
		<td>
			${entrevista.situacionEscolarDiciembre.valor}				
		</td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Situación Renovación  Diciembre</label></td>
		<td>
			${entrevista.evaluacionRenovacionFinal.valor}		
		</td>
	</tr>
	<tr>
	   <td nowrap="nowrap" ><label>Situación Escolar Actual*</label></td>
        <td>
         <form:select path="situacionEscolarMergeada" id="situacionEscolar" class="textbox2">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${situacionEscolar}" itemLabel="valor" itemValue="id"/>	
			</form:select><font size="1">Atención. Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
       	</td>
    </tr>
    <tr>
	   <td nowrap="nowrap"><label>Situación Renovación  * </label></td>
       <td>
         <form:select path="evaluacionRenovacionMergeada" id="evaluacionRenovacion" class="textbox2" onchange="habilitarCamposRenovacion(this)">
				<form:option value=""> Seleccione una opción...</form:option>
				<form:options items="${evaluacionRenovacion}" itemLabel="valor" itemValue="id"/>	
		</form:select><font size="1">Atención. Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
       </td>
       
    </tr>
	
	<tr>
		<td width="28%"><label>Motivo Pendiente *</label></td>
		<td>
			<form:select path="motivoPendiente" id="motivoPendiente" disabled="true"  class="textbox2" onchange="habilitarMotivoPendiente(this)">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoPendiente}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	
	<tr>
		<td></td>
		<td>
			<font size="1"><b>Queremos informarle que la renovación de la beca de ${alumno.datosPersonales.nombre} ${alumno.datosPersonales.apellido} 
								de la zona de ${alumno.escuela.localidad.zona.nombre} aún está pendiente debido a que ...</b>
			</font>
		</td>
	</tr>
	<tr>
		<td><label>Otro Motivo * </label></td>
		<td>
			<form:textarea path="motivoOtro" id="motivoOtro" rows="4" cols="60"   cssStyle="width:98%"
				 class="textbox2" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<table>
				<tr>
					<td>
						<font size="1">
							<b>Quedo a disposición ante cualquier consulta.</b>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<font size="1">
							<b>Saludos,</b>
						</font>
					</td>
				</tr>
				<tr>
					<td>
						<font size="1">Atención. Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Motivo principal de no renovacion  *</label></td>
		<td>
			<form:select path="motivoNoRenovacion" id="motivoNoRenovacion" class="textbox2" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoNoRenovacion}" itemLabel="valor" itemValue="id"/>				
			</form:select><font size="1">Atención. Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
			
			
		</td>
	</tr>
	
	<tr>
		<td nowrap="nowrap"><label>Observaciones materias pendientes</label></td>
		<td>
			<form:textarea path="obsMateriasPendientes" class="textbox2" id="obsMateriasPendientes" rows="4" cols="60" cssStyle="width:98%"
				 onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>		
			<td nowrap="nowrap"><label>Renueva con excepción</label></td>		
		<td>	
			<!-- input type="checkbox" 	name="excepcionR" id="excepcionR" value="${entrevista.excepcion}"-->			
			<!-- form:checkbox path="excepcion" id="excepcionR" name="excepcionR"/-->
			<input type="hidden" name="excepcionR" id="excepcionR" value="${entrevista.excepcion}">
			<select id="excepcionR2" name="excepcionR2">
				<c:choose>		
					<c:when test="${entrevista.excepcion == true}">
	     				<option value=0>Seleccione una opci&oacute;n:</option>
						<option value="1" selected="selected">Sí</option>
						<option Value="2">No</option>
					</c:when>
					<c:when test="${entrevista.excepcion == false}">
	     				<option value=0>Seleccione una opci&oacute;n:</option>
						<option value="1" >Sí</option>
						<option Value="2" selected="selected">No</option>
					</c:when>
					<c:otherwise>
						<option value=0>Seleccione una opci&oacute;n:</option>
						<option value="1" >Sí</option>
						<option Value="2" >No</option>
					</c:otherwise>
				</c:choose>
			</select>
		</td>
	</tr>
	<tr>		
			<td nowrap="nowrap"><label>Motivo de Excepción</label></td>		
		<td>				
			<form:select path="motivoExcepcion" id="motivoExcepcion" class="textbox2">
				<c:choose>
	  				<c:when test="${entrevista.motivoExcepcion == 'Cambio de escuela'}">
	     				<option value=0>Seleccione una opci&oacute;n:</option>
						<option value="Cambio de escuela" selected="selected">Cambio de escuela</option>
						<option Value="Repitencia"2>Repitencia</option>
					</c:when>
					<c:when test="${entrevista.motivoExcepcion == 'Repitencia'}">
	     				<option value=0>Seleccione una opci&oacute;n:</option>
						<option value="Cambio de escuela">Cambio de escuela</option>
						<option Value="Repitencia"  selected="selected">Repitencia</option>
					</c:when>
					 <c:otherwise>
					 	<option value=0>Seleccione una opci&oacute;n:</option>
						<option value="Cambio de escuela">Cambio de escuela</option>
						<option Value="Repitencia">Repitencia</option>
					</c:otherwise>
				</c:choose>
			</form:select>			 	
		</td>
	</tr>	
	
	<tr>		
			<td nowrap="nowrap"><label>Observaciones sobre alumno renovado por excepción</label></td>		
		<td>	
			<textarea rows="4" cols="60" id="observacionesExcepcion" name="observacionesExcepcion">${entrevista.observacionesExcepcion}</textarea>
		</td>
	</tr>
	<!-- tr>	
		<td><label>Realizo Entrevista</label></td>
		<td>
			<form:checkbox path="realizoEntrevista" id="realizoEntrevista" disabled="true" onclick="habilitarTipocontacto(this)"/>
			
		</td>
	</tr-->
	<tr>
		<td><label>Tipo Contacto</label></td>
		<td>
			<input type="hidden" 	name="realizoEntrevista" id="realizoEntrevista" value="1" >
			<form:select path="tipoContacto" id="tipoContacto" disabled="true"  class="textbox2" onchange="habilitarMotivoTipoContacto(this)">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${tipoContacto}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Tipo Contacto</label></td>
		<td>
			<form:textarea path="motivoTipoContactoOtro" id="motivoTipoContactoOtro" rows="4" cols="60" disabled="true" cssStyle="width:98%" 
			 	class="textbox2" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	
</table>

