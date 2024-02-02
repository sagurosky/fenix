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
		<td nowrap="nowrap"><label>Categoría de Propósito anual</label></td>
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
		<td nowrap="nowrap"><label>HSE a trabajar durante el año</label></td>
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
			<form:select path="contenidosTrabajarDuranteAnio" id="contenidosTrabajarDuranteAnio" class="textbox2">
				<c:choose>
   					<c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Asertividad y comunicación'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación" selected="selected">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima</option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>	
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Autoconocimiento y autoestima'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación" >Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima" selected="selected">Autoconocimiento y autoestima</option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Autocontrol y determinación'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima</option>															
						<option Value="Autocontrol y determinación" selected="selected">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Autoeficacia y autoconfianza'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación" >Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza" selected="selected">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Autonomía'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación" >Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía" selected="selected">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Convivencia y Resolución de conflictos'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos" selected="selected">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Egreso efectivo y transición post-escolar'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar" selected="selected">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Elección de la orientación y cambio de ciclo'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo" selected="selected">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Empatía y trabajo con otros'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros" selected="selected">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Entusiasmo por aprender'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender" selected="selected">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Hábitos de estudio'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio" selected="selected">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Materias previas'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas" selected="selected">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Organización del tiempo'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo" selected="selected">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Participación'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación" selected="selected">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Participación en PFE'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE" selected="selected">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Pensamiento crítico y creativo'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo" selected="selected">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Planificación'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación" selected="selected">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Planificación y proyecto de vida'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida" selected="selected">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Responsabilidad y compromiso'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso"  selected="selected">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Sentido de la oportunidad'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad" selected="selected">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>				    	  						    
				    </c:when>
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Transición primaria-secundaria'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria" selected="selected">Transición primaria-secundaria</option>				    	  						    
				    </c:when>						    
				    <c:otherwise>
				    	<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convicencia y Resolución de conflictos">Convicencia y Resolución de conflictos</option>
				    	<option Value="Egreso efectivo y transición post-escolar">Egreso efectivo y transición post-escolar</option>
				    	<option Value="Elección de la orientación y cambio de ciclo">Elección de la orientación y cambio de ciclo</option>
				    	<option Value="Empatía y trabajo con otros">Empatía y trabajo con otros</option>
				    	<option Value="Entusiasmo por aprender">Entusiasmo por aprender</option>
				    	<option Value="Hábitos de estudio">Hábitos de estudio</option>
				    	<option Value="Materias previas">Materias previas</option>
				    	<option Value="Organización del tiempo">Organización del tiempo</option>
				    	<option Value="Participación">Participación</option>
				    	<option Value="Participación en PFE">Participación en PFE</option>
				    	<option Value="Pensamiento crítico y creativo">Pensamiento crítico y creativo</option>
				    	<option Value="Planificación">Planificación</option>
				    	<option Value="Planificación y proyecto de vida">Planificación y proyecto de vida</option>
				    	<option Value="Responsabilidad y compromiso">Responsabilidad y compromiso</option>
				    	<option Value="Sentido de la oportunidad">Sentido de la oportunidad</option>
				    	<option Value="Transición primaria-secundaria">Transición primaria-secundaria</option>		
				    </c:otherwise>		
				</c:choose>
			</form:select>
		</td>					
		
	</tr>
	<tr>
		<td><label>Situacion de Riesgo</label></td>
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
	<tr>																						
		<td nowrap="nowrap" width="32%"><label>Qué hizo en las Vacaciones<br>
		<font size="1">Atención. Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10></label></td>
		<td>
			<form:textarea path="realizadoVacaciones" class="textbox2" rows="4" cols="60"  cssStyle="width:98%"
				onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>		
	<tr>
	<td nowrap="nowrap" valign="top"><label>Evaluacion Cobro Beca  *</label></td>
		<td>
		<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" class="textbox2"  disabled="true" onchange="habilitarMotivoSuspension(this)">
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
	<tr>
		<td nowrap="nowrap" ><label>Observaciones Generales</label></td>
		<td>	
			
			<form:textarea path="observacionesGenerales" rows="4" cols="60" cssStyle="width:98%"  class="textbox2" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
								
			
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
</table>