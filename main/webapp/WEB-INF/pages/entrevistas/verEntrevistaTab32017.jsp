<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	 span{ background-color: yellow; }
</style>

<table id="table-informe">
	<!-- ocultado el 11-02-2016
	<tr>
		<td><label>Rendicion Gastos</label></td>
		<td>
			<form:checkbox path="rendicionGastos" id="rendicionGastos" disabled="true"/>
		</td>
	</tr>
	 -->
	<tr>		
		<td><label>Uso de la beca</label></td>
		<td>
			<!-- form:select path="detalleGastos" id="detalleGastos" disabled="true"-->
			<form:select path="detalleGastos" id="detalleGastos">
				<form:options items="${detalleGastos}" itemLabel="valor" itemValue="id" disabled="true"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Evolución Propósito establecido</label></td>
		<td>
			<form:textarea path="evolucionMesAnterior" rows="4" cols="30" disabled="true"/>
		</td>
	</tr>
	<tr>		
		<td><label>Qué se trabajó en esta entrevista?</label></td>
		<td>
			<form:textarea path="logros" rows="4" cols="30" disabled="true"/>
		</td>
	</tr>
	<!-- 
	<tr>
		<td><label>Dificultades</label></td>
		<td>
			<form:textarea path="dificultades" rows="4" cols="30" disabled="true"/>
		</td>
	</tr>
	-->
	<tr>		
		<td><label>Propósito</label></td>
		<td>
			<form:textarea path="proposito" rows="4" cols="30" disabled="true"/>
		</td>		
	</tr>
	<!-- 
	<tr>
		<td nowrap="nowrap"><label>Compromiso RA con la escolaridad</label></td>
		<td>
			<form:select path="compromisoRA" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${compromisosRA}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	
	<tr>		
		<td nowrap="nowrap"><label>Recomendación estrategia complementaria</label></td>
		<td>
			<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
			<form:select path="estrategiaComp" disabled="true">
				<form:options items="${estrategiasComp}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>		
	</tr>
	-->
	<tr>
		<td nowrap="nowrap"><label>Habilidades y/o contenidos</label></td>
		<td>
			<form:select path="contenidosAbordados" disabled="true">
				<form:options items="${contenidosAbordados}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td><label>Situacion de Crisis</label></td>
		<td>
			<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
			<input type="hidden" name="estrategiaComp" id="estrategiaComp" value="5">
			<form:select path="situacionCrisis" disabled="true">
				<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
			</form:select>
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
				<form:options items="${lugarEntrevistas}" itemLabel="nombre" itemValue="id"/>				
			</form:select>
			<input id="idProxima" type="hidden" value="${entrevista.lugarProximaEntrevista.id}"/>
		</td>
	</tr>
	<tr>
	<td nowrap="nowrap" valign="top"><label>Evaluacion Cobro Beca  *</label></td>
		<td>
		<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" disabled="true" onchange="habilitarMotivos(this)">
			<form:option value="">Seleccione una opción...</form:option>
			<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
		</form:select>
		</td>
	</tr>			
	<tr>
		<td><label>Motivo de Suspension</label></td>
		<td>
			<form:select path="motivoSuspension" id="motivoSuspension" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoSuspension}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>		
		<td><label>Motivo de Cesacion *</label></td>
		<td>
			<form:select path="motivoCesacion" id="motivoCesacion" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoCesacion}" itemLabel="valor" itemValue="id"/>				
			</form:select><font size="1">Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
		</td>
	</tr>
	<tr>
		<td><label>Observaciones</label></td>
		<td>
			<form:textarea path="observacionesGenerales" rows="4" cols="60" disabled="true"/>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Comentarios de revisión, intercambio RR - EA</label></td>
		<td>
			<form:textarea path="comentariosRevision" rows="4" cols="60" disabled="true"/>
		</td>
	</tr>
</table>