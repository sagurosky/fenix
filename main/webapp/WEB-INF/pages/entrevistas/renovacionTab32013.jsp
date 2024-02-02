<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="table-informe">
	<!--  ocultado el 11-02-2016
	<tr>
		<td nowrap="nowrap"><label>Expectativas RA</label></td>
		<td>
			<form:textarea path="expectativasRA" rows="4" cols="60" cssStyle="width:98%" disabled="true"  onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	 -->
	<!-- ocultado el 11-02-2016
	<tr>				
		<td nowrap="nowrap"><label>Destino Dinero de la Beca  *</label></td>
		<td>
			<form:select path="destinoDinero" class="required" disabled="true" >
				<form:options items="${detalleGastos}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
		
	</tr>
	-->
	<tr>
		
		<td><label>Observaciones</label></td>
		<td>
			<input type="hidden" id="destinoDinero" name="destinoDinero" value="13">
			<form:textarea path="observacionesGenerales" rows="4" cols="60" cssStyle="width:98%" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>	
		<td class="datepicker1" nowrap="nowrap"><label>Fecha Proxima Entrevista  *</label></td>
		<td><form:input path="proximaEntrevista" id="datepicker1" disabled="true"  cssClass="required"/></td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Hora Proxima Entrevista  *</label></td>
		<td>
			<form:input path="horaProxEntrevista" onkeypress="return dFilter (event.keyCode, this, '##:##');" id="horaProxEntrevista" size="4" cssClass="required" onblur="validarHoras(this)"/>Hs.
		</td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Lugar Proxima Entrevista  *</label></td>
		<td>
			<input type="text" id="lugarProximaEntrevista" name="lugarProximaEntrevista" size="39" value="${escuelaZona}" class="required" disabled="true" />
			<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${entrevista.lugarProximaEntrevista.id}"></input>
		</td>
	</tr> 
	<tr>
		<td><label>Entrega Material  </label></td>
		<td>
			<form:checkbox path="entregaMaterial"/>
		</td>
	</tr>
	<tr>
	<td nowrap="nowrap" valign="top"><label>Evaluacion Cobro Beca  *</label></td>
		<td>
		<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" cssClass="required" disabled="true" onchange="habilitarMotivoSuspension(this)">
			<form:option value="">Seleccione una opción...</form:option>
			
			
			<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
			
		</form:select>
		</td>
	</tr>	
	<tr>
		<td nowrap="nowrap"><label>Motivo de Suspension  *</label></td>
		<td>
			<form:select path="motivoSuspension" id="motivoSuspension" disabled="true" class="required">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoSuspension}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>		
	<c:if test="${tipoPerfil != 'ea'}">   
		<tr>		
			<td><label>Paga Entrevista</label></td>
			<td>
				<form:checkbox path="pagaEntrevista" checked="checked"/>
			</td>
		</tr>
	</c:if>	
	
	<tr>
		<td nowrap="nowrap" width="32%"><label>Comentarios de revisión, intercambio RR - EA</label></td>
		<td>
			<form:textarea path="comentariosRevision" rows="4" cols="60" cssStyle="width:98%" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
</table>