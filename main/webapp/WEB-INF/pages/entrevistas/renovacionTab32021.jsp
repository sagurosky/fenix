<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.textbox2
	 { 
	  border: 1px solid #DBE1EB; 
	  font-size: 14px; 
	  font-family: Arial, Verdana; 
	  padding-left: 2px; 
	  padding-right: 2px; 
	  padding-top: 2px; 
	  padding-bottom: 2px; 
	  border-radius: 4px; 
	  -moz-border-radius: 4px; 
	  -webkit-border-radius: 4px; 
	  -o-border-radius: 4px; 
	  background: #FFFFFF; 
	  background: linear-gradient(left, #FFFFFF, #f5ebf2); 
	  background: -moz-linear-gradient(left, #FFFFFF, #f5ebf2); 
	  background: -webkit-linear-gradient(left, #FFFFFF, #f5ebf2); 
	  background: -o-linear-gradient(left, #FFFFFF, #f5ebf2); 
	  color: #2E3133; 	 
	 } 
	 .textbox2:focus 
	  { 
	  color: #2E3133; 
	  border-color: #FBFFAD; 
	  }	  
</style>

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
		
		<td nowrap="nowrap"><label>Propósito Anual<br>
		<font size="1">Atención. Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10></label></td>
		<td>
			
			<form:textarea path="propositoAnioComienza" class="textbox2" rows="4" cols="60" cssStyle="width:98%" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			<input type="hidden" id="destinoDinero" name="destinoDinero" value="13">
			
			<input type="hidden" id="proximaEntrevista" name="proximaEntrevista">
			<input type="hidden" id="horaProxEntrevista" name="horaProxEntrevista" value="12:00">
			<input type="hidden" id="lugarProximaEntrevista" name="lugarProximaEntrevista" size="39" value="${escuelaZona}"  />
			<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${entrevista.lugarProximaEntrevista.id}"></input>
			<input type="hidden" id="entregaMaterial" name="entregaMaterial" value="1">
			<input type="hidden" id="comentariosRevision" name="comentariosRevisionl" value=" ">
		</td>
		<tr>
		<td nowrap="nowrap"><label>Categoría de Propósito anual *</label></td>
		<td>
			<form:select path="propositoAnual" id="propositoAnual" class="textbox2">
				<c:choose>
   					<c:when test="${entrevista.propositoAnual == 'Compromiso con la escolaridad'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Compromiso con la escolaridad" selected="selected">Compromiso con la escolaridad</option>
						<option Value="Rendimiento escolar">Rendimiento escolar</option>									
						<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
						<option Value="Compromiso con el programa">Compromiso con el programa</option>								
				    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
				    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
				    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
				    </c:when>	
				    <c:when test="${entrevista.propositoAnual == 'Rendimiento escolar'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
						<option Value="Rendimiento escolar" selected="selected">Rendimiento escolar</option>									
						<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
						<option Value="Compromiso con el programa">Compromiso con el programa</option>								
				    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
				    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
				    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
				    </c:when>	
				    <c:when test="${entrevista.propositoAnual == 'Egreso efectivo y proyecto de vida'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
						<option Value="Rendimiento escolar">Rendimiento escolar</option>									
						<option Value="Egreso efectivo y proyecto de vida"  selected="selected">Egreso efectivo y proyecto de vida</option>
						<option Value="Compromiso con el programa">Compromiso con el programa</option>								
				    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
				    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
				    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
				    </c:when>	
				    <c:when test="${entrevista.propositoAnual == 'Compromiso con el programa'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
						<option Value="Rendimiento escolar">Rendimiento escolar</option>									
						<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
						<option Value="Compromiso con el programa" selected="selected">Compromiso con el programa</option>								
				    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
				    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
				    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
				    </c:when>	
				    <c:when test="${entrevista.propositoAnual == 'Relaciones interpersonales'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
						<option Value="Rendimiento escolar">Rendimiento escolar</option>									
						<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
						<option Value="Compromiso con el programa">Compromiso con el programa</option>								
				    	<option Value="Relaciones interpersonales" selected="selected">Relaciones interpersonales</option>
				    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
				    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
				    </c:when>	
				    <c:when test="${entrevista.propositoAnual == 'Dificultades personales o familiares'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
						<option Value="Rendimiento escolar">Rendimiento escolar</option>									
						<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
						<option Value="Compromiso con el programa">Compromiso con el programa</option>								
				    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
				    	<option Value="Dificultades personales o familiares" selected="selected">Dificultades personales o familiares</option>
				    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
				    </c:when>	
				    <c:when test="${entrevista.propositoAnual == 'Actividades extra-escolares'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
						<option Value="Rendimiento escolar">Rendimiento escolar</option>									
						<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
						<option Value="Compromiso con el programa">Compromiso con el programa</option>								
				    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
				    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
				    	<option Value="Actividades extra-escolares" selected="selected">Actividades extra-escolares</option>				    						    
				    </c:when>
				    <c:otherwise>
				    	<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
						<option Value="Rendimiento escolar">Rendimiento escolar</option>									
						<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
						<option Value="Compromiso con el programa">Compromiso con el programa</option>								
				    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
				    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
				    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>
				    </c:otherwise>		
				</c:choose>
			</form:select>
			
		</td>											   		
		</tr>
		<tr>
		<td nowrap="nowrap"><label>HSE a trabajar durante el año *</label></td>
		<td>
			<form:select path="hsTrabajarAño" id="hsTrabajarAño" class="textbox2"> 
				<c:choose>
   					<c:when test="${entrevista.hsTrabajarAño == 'Autoconcepto'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Autoconcepto" selected="selected">Autoconcepto</option>
						<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
						<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
						<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
				    	<option Value="Toma de decisiones">Toma de decisiones</option>				    	  						    
				    </c:when>	
				    <c:when test="${entrevista.hsTrabajarAño == 'Planificación y organización del tiempo'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Autoconcepto" >Autoconcepto</option>
						<option Value="Planificación y organización del tiempo" selected="selected">Planificación y organización del tiempo</option>									
						<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
						<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
				    	<option Value="Toma de decisiones">Toma de decisiones</option>				    	  						    
				    </c:when>	
				    <c:when test="${entrevista.hsTrabajarAño == 'Relaciones interpersonales'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Autoconcepto">Autoconcepto</option>
						<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
						<option Value="Relaciones interpersonales"  selected="selected">Relaciones interpersonales</option>
						<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
				    	<option Value="Toma de decisiones">Toma de decisiones</option>				    	  						    
				    </c:when>	
				    <c:when test="${entrevista.hsTrabajarAño == 'Responsabilidad y autonomía'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Autoconcepto">Autoconcepto</option>
						<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
						<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
						<option Value="Responsabilidad y autonomía" selected="selected">Responsabilidad y autonomía</option>								
				    	<option Value="Toma de decisiones">Toma de decisiones</option>				    	  						    
				    </c:when>	
				    <c:when test="${entrevista.hsTrabajarAño == 'Toma de decisiones'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Autoconcepto">Autoconcepto</option>
						<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
						<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
						<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
				    	<option Value="Toma de decisiones" selected="selected">Toma de decisiones</option>				    	  						    
				    </c:when>					    
				    <c:otherwise>
				    	<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Autoconcepto">Autoconcepto</option>
						<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
						<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
						<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
				    	<option Value="Toma de decisiones">Toma de decisiones</option>		
				    </c:otherwise>		
				</c:choose>
			</form:select>
			<font size="1">Atención. Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
		</td>					
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Contenidos a trabajar en el año</label></td>
			<td>
				<input type="hidden" name="contenidosTrabajarDuranteAnio" id="contenidosTrabajarDuranteAnio" value="0">
				<form:select path="contenidosTrabajarEnElAnio" class="textbox2">
					<form:options items="${contenidosTrabajarEnElAnio}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>					
			
		</tr>
	<tr>
		<td><label>Situación de Riesgo</label></td>
		<td>			
			<form:select path="situacionCrisis" class="textbox2">
				<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	
	<tr>
		<td><label>Observaciones sobre situaciones de riesgo</label></td>
		<td>
			<form:textarea path="observacionesSR" rows="4" cols="60" cssStyle="width:98%"  class="textbox2" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>		
		
	<tr>																						
		<td nowrap="nowrap" width="32%"><label>Un dato curioso del estudiante *<br>
		<font size="1">Atención. Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10></label></td>
		<td>
			<form:textarea path="realizadoVacaciones" class="textbox2" rows="4" cols="60"  cssStyle="width:98%"
				onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>		
	
	<tr>
	<td nowrap="nowrap" valign="top"><label>Evaluación Cobro Beca  *</label></td>
		<td>
		<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" class="textbox2"   onchange="habilitarMotivoSuspension(this)">
			<form:option value="">Seleccione una opción...</form:option>
			
			
			<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
			
		</form:select>
		</td>
	</tr>	
	<tr>
		<td nowrap="nowrap"><label>Motivo de Suspension  *</label></td>
		<td>
			<form:select path="motivoSuspension" id="motivoSuspension" disabled="true" class="textbox2" >
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoSuspension}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>	
		
	<c:if test="${tipoPerfil != 'ea'}">   
		<tr>		
			<td><label>Paga Encuentro de Acompañamiento</label></td>
			<td>
				<form:checkbox path="pagaEntrevista" checked="checked"/>
			</td>
		</tr>
	</c:if>			
</table>