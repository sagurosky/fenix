<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<script type="text/javascript">
	function raNoFueConvocado(inputSelect){
		//alert(1);
	
		if(document.getElementById("raNoConvocado").checked==true){		
			//alert(2);
			$('#motivoNoConvocatoria').attr('disabled','disabled');
			$('#motivoNoConvocatoria').attr('value', 'Seleccione una opción:');
			//$('#motivoNoConvocatoria > option[value="0"]').attr('selected', 'selected');
			$('#participoRA').removeAttr('disabled');
			$('#motivoAusenciaRA').removeAttr('disabled');
			$('#motivoAusenciaRA').attr('value', 'Seleccione una opción:');
		}else{		
			//alert(3);
			$('#motivoNoConvocatoria').removeAttr('disabled');
			//$('#participoRA').removeAttr('disabled');
			$('#participoRA').removeAttr("checked");
			$('#participoRA').attr('disabled','disabled');	
			$('#motivoAusenciaRA').attr('disabled','disabled');
			$('#motivoAusenciaRA').attr('value', 'Seleccione una opción:');
		}	
	}
</script>
</head>
<table>
	<tr>
		<td>
			<table id="table-informe">
				<c:if test="${periodo != null && entrevista.periodoDePago == null}">
					<tr>		
						<td><label>Periodo Espacio de acompañamiento</label></td>
						<td><label><b>${periodo.nombre}</b></label></td>
					</tr>
				</c:if>
				<c:if test="${entrevista.periodoDePago != null}">
					<tr>		
						<td><label>Periodo Entrevista</label></td>
						<td><label><b>${entrevista.periodoDePago.nombre}</b></label></td>
					</tr>
				</c:if>
				<tr>
					<td class="datepicker" nowrap="nowrap"><label>Fecha De Incorporacion al PFE</label></td>
					<td ><label><b><fmt:formatDate value="${alumno.fechaPBE}" pattern="dd/MM/yyyy"/></b></label></td>
				</tr>	
				<tr>
					<td class="datepicker"><label>Fecha Entrevista</label></td>
					<td><input name="fechaEntrevista" id="datepicker" value="<fmt:formatDate value="${entrevista.fechaEntrevista}" pattern="dd/MM/yyyy"/>" disabled="disabled"></td>
				</tr>
				<tr>
					<td><label>Lugar Espacio de acompañamiento</label></td>
					<td>
						<input type="text" id="escuela" name="lugarEntrevista" size="39" value="${escuelaZona}" disabled="disabled"/>
					</td>					
				</tr>
				<tr>	
					<td><label>Participo Becado  *</label></td>
					<td>
						<form:checkbox path="participoBecado" id="participoBecado" onclick="habilitarCamposBecado(this)" />
					</td>
				</tr>
				<tr>
					<td><label>Motivo Ausencia *</label></td>
					<!-- td>
						<form:select path="motivoAusencia" id="motivoAusencia" class="required" onchange="habilitarOtrosMotivos(this)">
							<form:option value="">Seleccione una opción...</form:option>
							<form:options items="${motivoAusencias}" itemLabel="valor" itemValue="id"/>				
						</form:select>
					</td-->
					
					<td>
					<select name="motivoAusencia" id="motivoAusencia" class="required" disabled="disabled">
							<c:choose>
		    					<c:when test="${entrevista.motivoAusencia == 'ENFERMEDAD'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option value=1 selected="selected">Razones de salud propia o de terceros</option>
									<option Value=2> in justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'EVENTUALIDAD'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2  selected="selected">Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'INASISTENCIA'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=3  selected="selected">Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'CUIDADO'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6  selected="selected">Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'MOTIVOSLABORALES'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7  selected="selected">Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'DESCONOCIMIENTO'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8 selected="selected">Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'DIFICULTADES'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9  selected="selected">Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'TRAMITES'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10 selected="selected">Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'FACTORESCLIMATICOS'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11 selected="selected">Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'VIAJEAOTRALOCALIDAD'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12 selected="selected">Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusencia == 'NODEMUESTRAINTERES'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1 selected="selected">Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13 selected="selected">No demuestra interés-compromiso</option>
							    </c:when>
							    <c:otherwise>
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:otherwise>
							</c:choose>
						</select>
					</td>	
					
					
				</tr>
				<tr>
					<td><label>Otro Motivo</label></td>
					<td>
						<form:textarea path="otroMotivoAusencia" id="otroMotivoAusencia" rows="4" cols="60" cssStyle="width:98%" disabled="true"/>
					</td>
				</tr>
				<tr>
					<td><strong>RA fue convocado*</strong></td>
					<td>						
						<c:choose>
							<c:when test="${entrevista.raNoConvocado !=true}">
								<input type="checkbox" id="raNoConvocado" name="raNoConvocado" onclick="raNoFueConvocado(this)"/>	
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="raNoConvocado" name="raNoConvocado" checked onclick="raNoFueConvocado(this)"/>	
							</c:otherwise>
						</c:choose>
						<input type="hidden" value="${entrevista.raNoConvocado}">
						<input type="hidden" value="${entrevista.motivoNoConvocatoria}">
					</td>
				</tr>
				<tr>
					<td>Motivo no convocatoria</td>
					<td>						
						<c:choose>
							<c:when test="${entrevista.motivoNoConvocatoria != null}">
								<select name="motivoNoConvocatoria" id="motivoNoConvocatoria" class="required" disabled="disabled">
							</c:when>
							<c:otherwise>																				
								<select name="motivoNoConvocatoria" id="motivoNoConvocatoria" class="required" disabled="disabled">						
							</c:otherwise>
						</c:choose>
					<c:choose>
    					<c:when test="${entrevista.motivoNoConvocatoria == 'Acompañamiento virtual'}">
       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
							<option value="Acompañamiento virtual" selected="selected">Acompañamiento virtual</option>
							<option value="Entrevista grupal">Entrevista grupal</option>
							<option value="Entrevista en duplas">Entrevista en duplas</option>
							<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller) </option>
							<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>								
					    </c:when>
					    <c:when test="${entrevista.motivoNoConvocatoria == 'Entrevista grupal'}">
       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
							<option value="Acompañamiento virtual">Acompañamiento virtual</option>
							<option value="Entrevista grupal" selected="selected">Entrevista grupal</option>
							<option value="Entrevista en duplas">Entrevista en duplas</option>
							<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller) </option>
							<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>								
					    </c:when>
					    <c:when test="${entrevista.motivoNoConvocatoria == 'Entrevista en duplas'}">
       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
							<option value="Acompañamiento virtual">Acompañamiento virtual</option>
							<option value="Entrevista grupal">Entrevista grupal</option>
							<option value="Entrevista en duplas" selected="selected">Entrevista en duplas</option>
							<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller) </option>
							<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>								
					    </c:when>
					    <c:when test="${entrevista.motivoNoConvocatoria == 'Asiste a otro espacio destinado a RAs (ej. taller)'}">
       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
							<option value="Acompañamiento virtual">Acompañamiento virtual</option>
							<option value="Entrevista grupal">Entrevista grupal</option>
							<option value="Entrevista en duplas">Entrevista en duplas</option>
							<option value="Asiste a otro espacio destinado a RAs (ej. taller)" selected="selected">Asiste a otro espacio destinado a RAs (ej. taller)</option>
							<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>								
					    </c:when>
					    <c:when test="${entrevista.motivoNoConvocatoria == 'Necesidad de trabajar sólo con el alumno'}">
       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
							<option value="Acompañamiento virtual">Acompañamiento virtual</option>
							<option value="Entrevista grupal">Entrevista grupal</option>
							<option value="Entrevista en duplas">Entrevista en duplas</option>
							<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller) </option>
							<option value="Necesidad de trabajar sólo con el alumno" selected="selected">Necesidad de trabajar sólo con el alumno</option>								
					    </c:when>					    
					    <c:otherwise>
						 	<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
							<option value="Acompañamiento virtual" >Acompañamiento virtual</option>
							<option value="Entrevista grupal">Entrevista grupal</option>
							<option value="Entrevista en duplas">Entrevista en duplas</option>
							<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller) </option>
							<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>
					    </c:otherwise>
					</c:choose>
					
					
				</select>
							
					</td>
				</tr>
				<tr>
					<td><strong>RA fue convocado*</strong></td>
					<td>
						<form:checkbox path="raNoConvocado" id="raNoConvocado" onclick="raNoFueConvocado(this)" disabled="true"/>					
						
					</td>
				</tr>
				<tr>
					<td><strong>Motivo no convocatoria</strong></td>
					<td>						
						<input type="hidden" value="${entrevista.raNoConvocado}">
						<input type="hidden" value="${entrevista.motivoNoConvocatoria}">
						<c:choose>
							<c:when test="${entrevista.raNoConvocado !=true}">
								<select name="motivoNoConvocatoria" id="motivoNoConvocatoria" class="required" disabled="disabled">
							</c:when>
							<c:otherwise>																				
								<select name="motivoNoConvocatoria" id="motivoNoConvocatoria" class="required" disabled="disabled" >						
							</c:otherwise>
						</c:choose>
						<c:choose>
	    					<c:when test="${entrevista.motivoNoConvocatoria == 'Acompañamiento virtual'}">
	       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
								<option value="Acompañamiento virtual" selected="selected">Acompañamiento virtual</option>
								<option value="Entrevista grupal">Entrevista grupal</option>
								<option value="Entrevista en duplas">Entrevista en duplas</option>
								<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller)</option>
								<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>								
						    </c:when>
						    <c:when test="${entrevista.motivoNoConvocatoria == 'Entrevista grupal'}">
	       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
								<option value="Acompañamiento virtual">Acompañamiento virtual</option>
								<option value="Entrevista grupal" selected="selected">Entrevista grupal</option>
								<option value="Entrevista en duplas">Entrevista en duplas</option>
								<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller)</option>
								<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>								
						    </c:when>
						    <c:when test="${entrevista.motivoNoConvocatoria == 'Entrevista en duplas'}">
	       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
								<option value="Acompañamiento virtual">Acompañamiento virtual</option>
								<option value="Entrevista grupal">Entrevista grupal</option>
								<option value="Entrevista en duplas" selected="selected">Entrevista en duplas</option>
								<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller)</option>
								<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>								
						    </c:when>
						    <c:when test="${entrevista.motivoNoConvocatoria == 'Asiste a otro espacio destinado a RAs (ej. taller)'}">
	       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
								<option value="Acompañamiento virtual">Acompañamiento virtual</option>
								<option value="Entrevista grupal">Entrevista grupal</option>
								<option value="Entrevista en duplas">Entrevista en duplas</option>
								<option value="Asiste a otro espacio destinado a RAs (ej. taller)" selected="selected">Asiste a otro espacio destinado a RAs (ej. taller)</option>
								<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>								
						    </c:when>
						    <c:when test="${entrevista.motivoNoConvocatoria == 'Necesidad de trabajar sólo con el alumno'}">
	       						<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
								<option value="Acompañamiento virtual">Acompañamiento virtual</option>
								<option value="Entrevista grupal">Entrevista grupal</option>
								<option value="Entrevista en duplas">Entrevista en duplas</option>
								<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller)</option>
								<option value="Necesidad de trabajar sólo con el alumno" selected="selected">Necesidad de trabajar sólo con el alumno</option>								
						    </c:when>					    
						    <c:otherwise>
							 	<option value="Seleccione una opcion:">Seleccione una opci&oacute;n:</option>
								<option value="Acompañamiento virtual" >Acompañamiento virtual</option>
								<option value="Entrevista grupal">Entrevista grupal</option>
								<option value="Entrevista en duplas">Entrevista en duplas</option>
								<option value="Asiste a otro espacio destinado a RAs (ej. taller)">Asiste a otro espacio destinado a RAs (ej. taller)</option>
								<option value="Necesidad de trabajar sólo con el alumno">Necesidad de trabajar sólo con el alumno</option>
							</c:otherwise>
						</c:choose>
					
					
				</select>
							
					</td>
				</tr>
				<tr>
					<td><label>Participo RA *</label></td>
					<td>
						<form:checkbox path="participoRA" id="participoRA" onclick="habilitarCamposRA(this)" disabled="true"/>
						<input type="hidden" value="${entrevista.participoRA}">
						<input type="hidden" value="${entrevista.motivoAusenciaRA}">
					</td>
				</tr>
				<tr>
					<td><label>Motivo Ausencia RA  *</label></td>
					<td>						
						<c:choose>
							<c:when test="${entrevista.participoRA !=true}">
								<select name="motivoAusenciaRA" id="motivoAusenciaRA" class="required" disabled="disabled">
							</c:when>
							<c:otherwise>																				
								<select name="motivoAusenciaRA" id="motivoAusenciaRA" class="required" disabled="disabled" >						
							</c:otherwise>
						</c:choose>
						
							<c:choose>
		    					<c:when test="${entrevista.motivoAusenciaRA == 'ENFERMEDAD'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option value=1 selected="selected">Razones de salud propia o de terceros</option>
									<option Value=2> in justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'EVENTUALIDAD'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2  selected="selected">Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'INASISTENCIA'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3  selected="selected">Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'CUIDADO'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6  selected="selected">Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'MOTIVOSLABORALES'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7  selected="selected">Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'DESCONOCIMIENTO'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8 selected="selected">Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'DIFICULTADES'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9  selected="selected">Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'TRAMITES'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10 selected="selected">Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'FACTORESCLIMATICOS'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11 selected="selected">Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'VIAJEAOTRALOCALIDAD'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9">Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12 selected="selected">Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:when>
							    <c:when test="${entrevista.motivoAusenciaRA == 'NODEMUESTRAINTERES'}">
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1 selected="selected">Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13 selected="selected">No demuestra interés-compromiso</option>
							    </c:when>
							    <c:otherwise>
		       						<option value=0>Seleccione una opci&oacute;n:</option>
									<option Value=1>Razones de salud propia o de terceros</option>
									<option Value=2>Sin justificación-se desconoce el motivo</option>
									<option Value=3>Sin justificación-se desconoce el motivo</option>
									<option Value=4 disabled="disabled">Otros</option>
									<option Value=5 disabled="disabled">No corresponde</option>								
							    	<option Value=6>Cuidado-ayuda a terceros</option>
							    	<option Value=7>Motivos laborales</option>
							    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
							    	<option Value=9>Dificultades en el traslado</option>
							    	<option Value=10>Realización de trámites</option>
							    	<option Value=11>Factores climáticos</option>
							    	<option Value=12>Viaje a otra localidad</option>
							    	<option Value=13>No demuestra interés-compromiso</option>
							    </c:otherwise>
							</c:choose>
						</select>
					
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap" width="32%"><label>Otro Motivo</label></td>
					<td>
						<form:textarea path="otroMotivoAusenciaRA" id="otroMotivoAusenciaRA" rows="4" cols="60" cssStyle="width:98%" disabled="true" />
					</td>
				</tr>		
			</table>
		</td>
	</tr>
</table>