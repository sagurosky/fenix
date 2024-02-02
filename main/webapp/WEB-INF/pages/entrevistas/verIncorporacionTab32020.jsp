<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<table id="table-informe">
	<tr>
		<td nowrap="nowrap"><label>Propósito anual del Acompañamiento</label></td>
		<td width="600">
			<form:textarea path="proposito" rows="4" cols="60" cssStyle="width:98%" disabled="true"/>
		</td>		
	</tr>
	<!-- ocultado el 11-02-2016
	<tr>
		<td><label>Expectativas RA</label></td>
		<td>
			<form:textarea path="expectativasRA" rows="4" cols="60" cssStyle="width:98%" disabled="true"/>
		</td>
	</tr>
	 -->
	<!-- ocultado el 11-02-2016
	<tr>		
		<td nowrap="nowrap"><label>Destino Dinero de la Beca</label></td>
		<td>
			<form:select path="destinoDinero" disabled="true">
				<form:options items="${detalleGastos}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	-->
	<tr>
		
		<td nowrap="nowrap"><label>Observaciones</label></td>
		
		<td>
			<input type="hidden" id="destinoDinero" name="destinoDinero" value="13">
			<form:textarea path="observacionesGenerales" rows="4" cols="60" cssStyle="width:98%" disabled="true"/>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap" class="datepicker1"><label>Fecha Proxima Entrevista</label></td>
		<td><form:input path="proximaEntrevista" id="datepicker1" disabled="true"/></td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Hora Proxima Entrevista  *</label></td>
		<td>
			<form:input  path="horaProxEntrevista" id="horaProxEntrevista" size="4" disabled="true"/>Hs.
		</td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Lugar Proxima Entrevistas</label></td>
		<td>
			<form:select path="lugarProximaEntrevista" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${lugarEntrevistas}" itemLabel="nombre" itemValue="id"/>				
			</form:select>
			<input id="idProxima" type="hidden" value="${entrevista.lugarProximaEntrevista.id}"/>
		</td>
	</tr> 
	<tr>
		<td><label>Entrega Material</label></td>
		<td>
			<form:checkbox path="entregaMaterial" disabled="true"/>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Evaluacion Cobro Beca  *</label></td>
		<td>
		<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" disabled="true">
			<form:option value="">Seleccione una opción...</form:option>
			<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
		</form:select>
		</td>
	</tr>		
	<tr>
		<td nowrap="nowrap" width="32%"><label>Comentarios de revisión, intercambio RR - EA</label></td>
		<td>
			<form:textarea path="comentariosRevision" rows="4" cols="60" cssStyle="width:98%" disabled="true"/>
		</td>
	</tr>  
</table>