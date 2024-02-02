<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<table id="table-informe">
	<tr>		
		<td nowrap="nowrap"><label>Incorporacion   *</label></td>
		<td>
			<form:select path="incorporacion" id="incorporacion" class="required" onchange="habilitarCamposIncorporacion(this)" >
				<form:option value="">Seleccione una opci�n...</form:option>
				<form:options items="${evaluacionIncorporacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap" width="32%"><label>Motivo Incorporaci�n Pendiente   *</label></td>
		<td>
			<form:select path="motivoPendiente" id="motivoPendiente" disabled="true"  cssClass="required" onchange="habilitarMotivoPendiente(this)">
				<form:option value="">Seleccione una opci�n...</form:option>
				<form:options items="${motivoPendiente}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Motivo   * </label></td>
		<td>
			<form:textarea path="motivoOtroPendiente" id="motivoOtroPendiente" rows="4" cols="60" disabled="true" cssStyle="width:98%" 
			 cssClass="required" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Motivo No Incorporacion   *</label></td>
		<td>
			<form:select path="motivoNoIncorporacion" id="motivoNoIncorporacion" class="required" disabled="true" 
				onchange="habilitarOtroMotivoNoIncorporacion(this)">
				<form:option value="">Seleccione una opci�n...</form:option>
				<form:options items="${motivoNoIncorporacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Motivo   *</label></td>
		<td>
			<form:textarea path="motivoNoIncorporacionOtro" id="motivoNoIncorporacionOtro" rows="4" cols="60" disabled="true" 
				cssStyle="width:98%" cssClass="required" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>		
	<tr>
		<td nowrap="nowrap"><label>Observaciones No Incorporacion</label></td>
		<td>
			<form:textarea path="observacionesNoIncorporacion" id="observacionesNoIncorporacion" disabled="true" rows="4" cols="60"
				cssStyle="width:98%" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>	
		<td nowrap="nowrap"><label>Realizo Entrevista</label></td>
		<td>
			<form:checkbox path="realizoEntrevista" id="realizoEntrevista" disabled="true" onclick="habilitarTipocontacto(this)"/>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Tipo Contacto   *</label></td>
		<td>
			<form:select path="tipoContacto" id="tipoContacto" cssClass="required" onchange="habilitarMotivoTipoContacto(this)">
				<form:option value="">Seleccione una opci�n...</form:option>
				<form:options items="${tipoContacto}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Otro Tipo Contacto   *</label></td>
		<td>
			<form:textarea path="motivoTipoContactoOtro" cssClass="required" id="motivoTipoContactoOtro" rows="4" cols="60" 
				disabled="true" cssStyle="width:98%" cssClass="required" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>		
</table>