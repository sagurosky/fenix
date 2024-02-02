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
			//$('#motivoAusenciaRA').removeAttr('disabled');
			//$('#motivoAusenciaRA').attr('value', 'Seleccione una opción:');
		}else{		
			//alert(3);
			$('#motivoNoConvocatoria').removeAttr('disabled');
			//$('#participoRA').removeAttr('disabled');
			$('#participoRA').removeAttr("checked");
			$('#participoRA').attr('disabled','disabled');	
			//$('#motivoAusenciaRA').attr('disabled','disabled');
			//$('#motivoAusenciaRA').attr('value', 'Seleccione una opción:');
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
						<td><label>Periodo Entrevista</label></td>
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
					<td><label><b><fmt:formatDate value="${alumno.fechaPBE}" pattern="dd/MM/yyyy"/></b></label></td>
				</tr>					
				<tr>		
					<td nowrap="nowrap"><label>Entrevista Reprogramada</label></td>
					<td>
						<form:select path="entrevistaReprogramada" disabled="true">
							<form:options items="${entrevistas}" itemLabel="valor" itemValue="id"/>				
						</form:select>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap"><label>Tipo encuentro acompañamiento:</label></td>					
						<td>
						<form:select path="tipoEncuentroAcompanamiento" id="tipoEncuentroAcompanamiento" class="textbox2" disabled="true">
							<c:choose>
		    					<c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Encuentro Individual'}">
		       						<option value="0">Seleccione una opci&oacute;n:</option>
									<option value="Encuentro Individual" selected="selected">Encuentro Individual</option>
									<option Value="Encuentro grupal">Encuentro grupal</option>									
									<option Value="Intercambio virtual" >Intercambio virtual</option>
									<option Value="Visita a empresa">Visita a empresa</option>								
							    	<option Value="Visita a universidad">Visita a universidad</option>
							    	<option Value="Encuentro Red de Egresados">Encuentro Red de Egresados</option>
							    	<option Value="Otro">Otro</option>							    	
							    </c:when>																		
							    <c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Encuentro grupal'}">
		       						<option value="0">Seleccione una opci&oacute;n:</option>
									<option value="Encuentro Individual" >Encuentro Individual</option>
									<option Value="Encuentro grupal" selected="selected">Encuentro grupal</option>									
									<option Value="Intercambio virtual" >Intercambio virtual</option>
									<option Value="Visita a empresa">Visita a empresa</option>								
							    	<option Value="Visita a universidad">Visita a universidad</option>
							    	<option Value="Encuentro Red de Egresados">Encuentro Red de Egresados</option>
							    	<option Value="Otro">Otro</option>							    	
							    </c:when>						
							    <c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Intercambio virtual'}">
		       						<option value="0">Seleccione una opci&oacute;n:</option>
									<option value="Encuentro Individual">Encuentro Individual</option>
									<option Value="Encuentro grupal">Encuentro grupal</option>									
									<option Value="Intercambio virtual"  selected="selected">Intercambio virtual</option>
									<option Value="Visita a empresa">Visita a empresa</option>								
							    	<option Value="Visita a universidad">Visita a universidad</option>
							    	<option Value="Encuentro Red de Egresados">Encuentro Red de Egresados</option>
							    	<option Value="Otro">Otro</option>							    	
							    </c:when>						
							    <c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Visita a empresa'}">
		       						<option value="0">Seleccione una opci&oacute;n:</option>
									<option value="Encuentro Individual" >Encuentro Individual</option>
									<option Value="Encuentro grupal">Encuentro grupal</option>									
									<option Value="Intercambio virtual" >Intercambio virtual</option>
									<option Value="Visita a empresa" selected="selected">Visita a empresa</option>								
							    	<option Value="Visita a universidad">Visita a universidad</option>
							    	<option Value="Encuentro Red de Egresados">Encuentro Red de Egresados</option>
							    	<option Value="Otro">Otro</option>							    	
							    </c:when>						
							    <c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Visita a universidad'}">
		       						<option value="0">Seleccione una opci&oacute;n:</option>
									<option value="Encuentro Individual">Encuentro Individual</option>
									<option Value="Encuentro grupal">Encuentro grupal</option>									
									<option Value="Intercambio virtual" >Intercambio virtual</option>
									<option Value="Visita a empresa">Visita a empresa</option>								
							    	<option Value="Visita a universidad" selected="selected">Visita a universidad</option>
							    	<option Value="Encuentro Red de Egresados">Encuentro Red de Egresados</option>
							    	<option Value="Otro">Otro</option>							    	
							    </c:when>						
							    <c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Encuentro Red de Egresados'}">
		       						<option value="0">Seleccione una opci&oacute;n:</option>
									<option value="Encuentro Individual">Encuentro Individual</option>
									<option Value="Encuentro grupal">Encuentro grupal</option>									
									<option Value="Intercambio virtual" >Intercambio virtual</option>
									<option Value="Visita a empresa">Visita a empresa</option>								
							    	<option Value="Visita a universidad">Visita a universidad</option>
							    	<option Value="Encuentro Red de Egresados" selected="selected">Encuentro Red de Egresados</option>
							    	<option Value="Otro">Otro</option>							    	
							    </c:when>		
							    <c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Otro'}">
		       						<option value="0">Seleccione una opci&oacute;n:</option>
									<option value="Encuentro Individual">Encuentro Individual</option>
									<option Value="Encuentro grupal">Encuentro grupal</option>									
									<option Value="Intercambio virtual" >Intercambio virtual</option>
									<option Value="Visita a empresa">Visita a empresa</option>								
							    	<option Value="Visita a universidad">Visita a universidad</option>
							    	<option Value="Encuentro Red de Egresados">Encuentro Red de Egresados</option>
							    	<option Value="Otro" selected="selected">Otro</option>							    	
							    </c:when>	
							    <c:otherwise>
							    	<option value="0">Seleccione una opci&oacute;n:</option>
									<option value="Encuentro Individual">Encuentro Individual</option>
									<option Value="Encuentro grupal">Encuentro grupal</option>									
									<option Value="Intercambio virtual" >Intercambio virtual</option>
									<option Value="Visita a empresa">Visita a empresa</option>								
							    	<option Value="Visita a universidad">Visita a universidad</option>
							    	<option Value="Encuentro Red de Egresados">Encuentro Red de Egresados</option>
							    	<option Value="Otro" >Otro</option>
							    </c:otherwise>					
							</c:choose>
						</form:select>		
						</td>				
				<tr>				
				<tr>	
					<td><label>Participo Becado  *</label></td>
					<td>
						<form:checkbox path="participoBecado" id="participoBecado" onclick="habilitarCamposBecado(this)" disabled="true"/>
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
									<option Value=2 selected="selected">Sin justificación-se desconoce el motivo</option>
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
									<option Value=3 selected="selected">Sin justificación-se desconoce el motivo</option>
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
						<form:textarea path="otroMotivoAusencia" id="otroMotivoAusencia" rows="4" cols="30" disabled="true"/>
					</td>
				</tr>
				<tr>
					<td><strong>RA fue convocado*</strong></td>
					<td>						
						<c:choose>
							<c:when test="${entrevista.raNoConvocado !=true}">
								<input type="checkbox" id="raNoConvocado" name="raNoConvocado" onclick="raNoFueConvocado(this)" disabled="true"/>	
							</c:when>
							<c:otherwise>
								<input type="checkbox" id="raNoConvocado" name="raNoConvocado" checked onclick="raNoFueConvocado(this)" disabled="true"/>	
							</c:otherwise>
						</c:choose>
						
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
						
			</table>
		</td>
	</tr>
</table>