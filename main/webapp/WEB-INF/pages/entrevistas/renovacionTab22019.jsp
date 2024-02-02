<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table id="table-informe">
	<tr>
		<td width="210"><label>Escuela  *</label></td>
		<td nowrap="nowrap" ><label><b>${alumno.escuela.nombre}</b></label></td>
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
			<input type="hidden" id="certificadoAlumnoRegular" name="certificadoAlumnoRegular">
			<input type="hidden" id="fotocipiaBoletin" name="fotocipiaBoletin">
			<input type="hidden" id="firmaActaCompromiso" name="firmaActaCompromiso">
			<input type="hidden" id="firmaAutorizacionCierreCaja" name="firmaAutorizacionCierreCaja">
			<input type="hidden" id="firmaAutorizacionImagen" name="firmaAutorizacionImagen">
			<input type="hidden" id="materialCompleto" name="materialCompleto" value="1">
			
		</td>
	</tr>
	<tr>		
		<td><label>Año Egreso</label></td>
		<td><label>		
		<c:if test="${alumno.escuela.zonaCimientos.eae=='6/6'}">
			    	<c:if test="${alumno.anioAdicional}">
						${alumno.beca.ciclo.nombre+14-alumno.anioEscolar.id+1}
					</c:if>
					<c:if test="${!alumno.anioAdicional}">
						${alumno.beca.ciclo.nombre+14-alumno.anioEscolar.id}
					</c:if>
				</c:if>
				<c:if test="${alumno.escuela.zonaCimientos.eae=='7/5'}">
			    	<c:if test="${alumno.anioAdicional}">
						${alumno.beca.ciclo.nombre+13-alumno.anioEscolar.id+1}
					</c:if>
					<c:if test="${!alumno.anioAdicional}">
						${alumno.beca.ciclo.nombre+13-alumno.anioEscolar.id}
					</c:if>
				</c:if>
		</label>
		</td>
	</tr>
	
	<tr>		
		<td nowrap="nowrap"><label>Inasistencias del Período</label></td>
		<td><input type="text" class="textbox2" id="inasistenciasPeriodo" name="inasistenciasPeriodo"  value="${entrevista.inasistenciasPeriodo}"></td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Principal motivo de inasistencias</label></td>					
		<td>
			<form:select path="motivoInasistenciaR" id="motivoInasistenciaR" class="textbox2">
				<c:choose>
   					<c:when test="${entrevista.motivoInasistenciaR == 'Llegada tarde'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde" selected="selected">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>							    	
				    </c:when>		
				    <c:when test="${entrevista.motivoInasistenciaR == 'Se quedó dormido/a'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a" selected="selected">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>							    	
				    </c:when>		
				    <c:when test="${entrevista.motivoInasistenciaR == 'Cuidado-ayuda a terceros'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" selected="selected" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>							    	
				    </c:when>		
				    <c:when test="${entrevista.motivoInasistenciaR == 'Dificultades en el traslado'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado" selected="selected">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>							    	
				    </c:when>		
				    <c:when test="${entrevista.motivoInasistenciaR == 'Factores climáticos'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos" selected="selected">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>							    	
				    </c:when>		
				    <c:when test="${entrevista.motivoInasistenciaR == 'Motivos laborales'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales" selected="selected">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>							    	
				    </c:when>		
				    <c:when test="${entrevista.motivoInasistenciaR == 'Razones de salud propia'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia" selected="selected">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>							    	
				    </c:when>		
				    <c:when test="${entrevista.motivoInasistenciaR == 'Viaje a otra localidad'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad" selected="selected">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>							    	
				    </c:when>		
				    <c:when test="${entrevista.motivoInasistenciaR == 'Realización de trámites personales'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales" selected="selected">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>							    	
				    </c:when>		
				    <c:when test="${entrevista.motivoInasistenciaR == 'Otro'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro" selected="selected">Otro</option>							    	
				    </c:when>		
				    <c:otherwise>
					    <option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Llegada tarde">Llegada tarde</option>
						<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
						<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
						<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
				    	<option Value="Factores climáticos">Factores climáticos</option>
				    	<option Value="Motivos laborales">Motivos laborales</option>
				    	<option Value="Razones de salud propia">Razones de salud propia</option>
				    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
				    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
				    	<option Value="Otro">Otro</option>		
					</c:otherwise>
				</c:choose>
			</form:select>	
		</td>	
	<tr>
		<td nowrap="nowrap" width="32%"><label>Observaciones Inasistencias</label></td>
		<td>
			<form:textarea path="observacionMateriasExamenes" id="observacionMateriasExamenes" rows="4" cols="60" class="textbox2" 
				onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" cssStyle="width:98%"/>			
		</td>
		
	</tr>
	
</table>