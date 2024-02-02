<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="table-informe">
	<tr>		
		<td nowrap="nowrap"><label>Situación Incorporación   *</label></td>
		<td>
			<form:select path="incorporacion" id="incorporacion" class="textbox2" onchange="habilitarCamposIncorporacion(this)" >
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${evaluacionIncorporacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap" width="32%"><label>Motivo Incorporación Pendiente   *</label></td>
		<td>
			<form:select path="motivoPendiente" id="motivoPendiente" disabled="true"  class="textbox2" onchange="habilitarMotivoPendiente(this)">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoPendiente}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Motivo   * </label></td>
		<td>
			<form:textarea path="motivoOtroPendiente" id="motivoOtroPendiente" rows="4" cols="60" disabled="true" cssStyle="width:98%" 
			 class="textbox2" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Motivo No Incorporación   *</label></td>
		<td>
			<form:select path="motivoNoIncorporacion" id="motivoNoIncorporacion" class="textbox2" disabled="true"  	onchange="habilitarOtroMotivoNoIncorporacion(this)">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoNoIncorporacion}" itemLabel="valor" itemValue="id" />				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Motivo   *</label></td>
		<td>
			<form:textarea path="motivoNoIncorporacionOtro" id="motivoNoIncorporacionOtro" rows="4" cols="60" disabled="true" 
				cssStyle="width:98%" class="textbox2" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	
	<tr>
		<td>
			<label for="sel1">Situación Escolar &nbsp;&nbsp;</label>
		</td>
		<td>
				<form:select path="situacionEscolarMergeada" id="resultadoAnioEscolar" style='width:auto' class="form-control required">
			<form:option value="">Seleccione una opcion...</form:option>
			<form:options items="${resultadoAnioEscolar}" itemLabel="valor" itemValue="id"/>					
				</form:select>	  		
		</td>
	</tr>
	
	
	
	
	
	
	
	
	
	
	
			
	<tr>
		<td nowrap="nowrap"><label>Detallar información sobre la<br> situación de incorporación del estudiante</label></td>
		<td>
			<form:textarea path="observacionesNoIncorporacion" id="observacionesNoIncorporacion" name="observacionesNoIncorporacion" rows="4" cols="60"
				cssStyle="width:98%" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" class="textbox2"  placeholder="Brindar información cualitativa sobre el cierre del ciclo lectivo anterior. En caso de que adeude materias detallar ¿cuáles son? ¿Qué dificultades tiene con respecto a la materia? ¿hubo mesas de examen?, ¿cómo le fue en las últimas mesas?. Esta información se envía al padrino"/>				
		</td>
	</tr>	
	<tr>
		<td>
		
		<input type ="hidden" id="realizoEntrevista" id="realizoEntrevista" value="1">
		<input type ="hidden" id="tipoContacto" id="tipoContacto" value="">
		</td>
	</tr>
	<tr>
		<td>
		<input type ="hidden" id="motivoTipoContactoOtro" id="motivoTipoContactoOtro" value="">			
		</td>
	</tr>
	
	<tr>		
		<td nowrap="nowrap"><label>Acta de Compromiso<br>firmada por EP y RA</label></td>
		<td>
			<form:select path="firmaActaCompromiso" id="firmaActaCompromiso" class="textbox2"
					onchange="habilitarMaterialCompletoFirmaActaCompromiso(this)">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
			</form:select>
			
			
			
		</td>
	</tr>
	
	<tr>	
		<td nowrap="nowrap"><label>Notificación Cierre cuenta bancaria firmada</label></td>
		<td>
			<form:select path="firmaAutorizacionCierreCaja" id="firmaAutorizacionCierreCaja" class="textbox2" 
					onchange="habilitarMaterialCompletoFirmaAutorizacionCierreCaja(this)" >
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
			</form:select>
			
			
			
		</td>
	</tr>
	
	<tr>		
		<td nowrap="nowrap" ><label>Autorización Uso de Imagen firmada</label></td>
		<td>
			<form:select path="firmaAutorizacionImagen" id="firmaAutorizacionImagen" class="textbox2"
					onchange="habilitarMaterialCompletoFirmaAutorizacionImagen(this)">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	
	<tr>		
		<td nowrap="nowrap" width="32%"><label> Autorización Cesión de datos firmada</label></td>
		<td>
			<form:checkbox path="materialCompleto" id="materialCompleto" />
			
			
			
		</td>			
	</tr>
	
	
			
</table>