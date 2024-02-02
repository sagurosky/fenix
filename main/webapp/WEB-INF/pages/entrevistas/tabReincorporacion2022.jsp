<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table id="table-informe">
	<tr>		
		<td nowrap="nowrap"><label>Estado candidato   *</label></td>
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
		<td nowrap="nowrap"><label>Observaciones No Incorporación</label></td>
		<td>
			<form:textarea path="observacionesNoIncorporacion" id="observacionesNoIncorporacion" disabled="true" rows="4" cols="60"
				cssStyle="width:98%" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" class="textbox2"/>
		</td>
	</tr>	
	<tr>
		<td nowrap="nowrap"><label>Tipo Contacto   *</label></td>
		<td>
			<form:select path="tipoContacto" id="tipoContacto" class="textbox2" onchange="habilitarMotivoTipoContacto(this)">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${tipoContacto}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		<input type ="hidden" id="realizoEntrevista" id="realizoEntrevista" velue="1">
		<input type ="hidden" id="realizoEntrevista" id="realizoEntrevista" velue="1">
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Tipo Contacto   *</label></td>
		<td>
			
			<form:textarea path="motivoTipoContactoOtro" id="motivoTipoContactoOtro" rows="4" cols="60" 
				disabled="true" cssStyle="width:98%" class="textbox2" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>		
</table>