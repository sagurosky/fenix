<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table id="table-informe">
	<tr>		
		<td nowrap="nowrap"><label>Incorporacion</label></td>
		<td>
			<form:select path="incorporacion" id="incorporacion" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${evaluacionIncorporacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Motivo Incorporación Pendiente   *</label></td>
		<td>
			<form:select path="motivoPendiente" id="motivoPendiente" disabled="true"  cssClass="required" onchange="habilitarMotivoPendiente(this)">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoPendiente}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Motivo   * </label></td>
		<td>
			<form:textarea path="motivoOtroPendiente" id="motivoOtroPendiente" rows="4" cols="30" disabled="true"  
			 cssClass="required" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Motivo No Incorporacion</label></td>
		<td>
			<form:select path="motivoNoIncorporacion" id="motivoNoIncorporacion" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoNoIncorporacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Motivo </label></td>
		<td>
			<form:textarea path="motivoNoIncorporacionOtro" id="motivoNoIncorporacionOtro" rows="4" cols="60" disabled="true" cssStyle="width:98%"  
			 cssClass="required" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>		
	<tr>
		<td nowrap="nowrap"><label>Observaciones No Incorporacion</label></td>
		<td>
			<form:textarea path="observacionesNoIncorporacion" id="observacionesNoIncorporacion" rows="4" cols="60" 
				disabled="true" cssStyle="width:98%" />
		</td>
	</tr>
	<tr>	
		<td><label>Realizo Entrevista</label></td>
		<td>
			<form:checkbox path="realizoEntrevista" id="realizoEntrevista" disabled="true"/>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Tipo Contacto</label></td>
		<td>
			<form:select path="tipoContacto" id="tipoContacto" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${tipoContacto}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Tipo Contacto</label></td>
		<td>
			<form:textarea path="motivoTipoContactoOtro" id="motivoTipoContactoOtro" rows="4" cols="60" disabled="true" cssStyle="width:98%"  
			 cssClass="required" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>	
</table>