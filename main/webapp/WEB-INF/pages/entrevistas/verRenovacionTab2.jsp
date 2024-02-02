<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="table-informe">
	<tr>
		<td width="210"><label>Escuela  *</label></td>
		<td nowrap="nowrap" ><label><b>${alumno.escuela.nombre}</b></label></td>
	</tr>
	<tr>
		<td><label>Modalidad Escolar</label></td>
		<td><label><b>${alumno.escuela.modalidadEscolar.valor}</b></label></td>	
	</tr>
	<tr>		
		<td><label>Año Escolar</label></td>
		<td><label><b>${alumno.anioEscolar.valor}</b></label></td>
	</tr>
	<tr>		
		<td><label>Año Adicional</label></td>
		<td>
			<input type="checkbox" name="anioAdicional" <c:if test="${alumno.anioAdicional}"> checked="checked" </c:if> 
			id="anioAdicional"  disabled="true">
		</td>
	</tr>
	<tr>	
		<td nowrap="nowrap"><label>Certificado Alumno Regular *</label></td>
		<td>
			<form:select path="certificadoAlumnoRegular" id="certificadoAlumnoRegular" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>		
		<td><label>Fotocopia Boletin  *</label></td>
		<td>
			<form:select path="fotocipiaBoletin" id="fotocipiaBoletin" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>		
		<td><label>Firma Compromiso  *</label></td>
		<td>
			<form:select path="firmaActaCompromiso" id="firmaActaCompromiso" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>	
		<td nowrap="nowrap"><label>Firma Autorizacion Cierre Caja  *</label></td>
		<td>
			<form:select path="firmaAutorizacionCierreCaja" id="firmaAutorizacionCierreCaja" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>		
		<td nowrap="nowrap" ><label>Firma Autorizacion Imagen  *</label></td>
		<td>
			<form:select path="firmaAutorizacionImagen" id="firmaAutorizacionImagen" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>		
		<td><label>Material Completo  *</label></td>
		<td>
			<form:checkbox path="materialCompleto" id="materialCompleto" disabled="true"/>
		</td>			
	</tr>  
	<tr>
		<td nowrap="nowrap" width="32%"><label>Observaciones sobre materias y exámenes</label></td>
		<td>
			<form:textarea path="observacionMateriasExamenes" id="observacionMateriasExamenes" rows="4" cols="60" disabled="true" 
				onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" cssStyle="width:98%"/>			
		</td>
		
	</tr>
</table>