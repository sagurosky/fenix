<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>


<Script>
	function verificarCantidad(){
		//alert(document.getElementById("contenidosAbordados").length);
		var e = document.getElementById("contenidosAbordados");
		var a=0;
		for (var i = 0; i < e.length; i++){				
				if(e.options[i].selected == true){
				var name = e[i].getAttribute("text");
				a++;								
				}
		}
		if(a>2){
			alert("Tenés que seleccionar no más de 2 habilidades y/o contenidos. Seleccionaste "+a);
		}
		
	} 
</Script>

<Script>
	function verificarCantidad(){
		//alert(document.getElementById("contenidosAbordados").length);
		var e = document.getElementById("contenidosAbordados");
		var a=0;
		for (var i = 0; i < e.length; i++){				
				if(e.options[i].selected == true){
				var name = e[i].getAttribute("text");
				a++;								
				}
		}
		if(a>2){
			alert("Tenés que seleccionar no más de 2 habilidades y/o contenidos. Seleccionaste "+a);
		}
		
	} 
</Script>
<style>
	 span{ background-color: yellow; }
</style>



<table id="table-informe">
	<c:if test="${entrevista.periodoDePago.nombre=='Julio'}">
		<tr>
			<td nowrap="nowrap"><label>Evaluación compromiso del AB con el programa</label></td>
			<td>
				<select id="ecabp" name="ecabp">
					
	   					<c:if test="${entrevista.ecabp == 'Si'}">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT" selected="selected">CAT</option>
							<option value="CAT">CAT</option>
						</c:if>
						<c:if test="${entrevista.ecabp == 'No'}">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT">CAT</option>
							<option value="CAT" selected="selected">CAT</option>
						</c:if>
						<c:if test="${entrevista.ecabp != 'Si' && entrevista.ecabp != 'No' }">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT">CAT</option>
							<option value="CAT">CAT</option>
						</c:if>
						
				</select>
			</td>
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Valoración Compromiso RA con la escolaridad</label></td>
			<td>
				<select id="vcrae" name="vcrae">
					
	   					<c:if test="${entrevista.vcrae == 'Si'}">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT" selected="selected">CAT</option>
							<option value="CAT">CAT</option>
						</c:if>
						<c:if test="${entrevista.vcrae == 'No'}">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT">CAT</option>
							<option value="CAT" selected="selected">CAT</option>
						</c:if>
						<c:if test="${entrevista.vcrae != 'Si' && entrevista.vcrae != 'No' }">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT">CAT</option>
							<option value="CAT">CAT</option>
						</c:if>
						
				</select>
			</td>
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Avance en el cumplimiento del propósito anual</label></td>
			<td>
				<select id="acpa" name="acpa">
					
	   					<c:if test="${entrevista.acpa == 'Si'}">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT" selected="selected">CAT</option>
							<option value="CAT">CAT</option>
						</c:if>
						<c:if test="${entrevista.acpa == 'No'}">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT">CAT</option>
							<option value="CAT" selected="selected">CAT</option>
						</c:if>
						<c:if test="${entrevista.acpa != 'Si' && entrevista.acpa != 'No' }">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT">CAT</option>
							<option value="CAT">CAT</option>
						</c:if>
						
				</select>
			</td>
		</tr>
	</c:if>
	
	<tr>
		<c:if test="${entrevista.periodoDePago.nombre=='Julio'}">
		<td nowrap="nowrap"><label>Redefinición de propósito a diciembre:</label></td>
		</c:if>
		<c:if test="${entrevista.periodoDePago.nombre!='Julio'}">
		<td nowrap="nowrap"><label>Cumplimiento de propósitos <br>acordados con el EA: </label></td>
		</c:if>
		<td>
			<select id="cpaEA" name="cpaEA">
				
   					<c:if test="${entrevista.cpaEA == 'Si'}">
						<option value="0" >Seleccione una opción</option>
						<option value="CAT" selected="selected">CAT</option>
						<option value="CAT">CAT</option>
					</c:if>
					<c:if test="${entrevista.cpaEA == 'No'}">
						<option value="0" >Seleccione una opción</option>
						<option value="CAT">CAT</option>
						<option value="CAT" selected="selected">CAT</option>
					</c:if>
					<c:if test="${entrevista.cpaEA != 'Si' && entrevista.cpaEA != 'No' }">
						<option value="0" >Seleccione una opción</option>
							<option value="CAT">CAT</option>
							<option value="CAT">CAT</option>
					</c:if>
					
			</select>
		</td>
	</tr>
	<c:if test="${entrevista.periodoDePago.nombre=='Julio'}">
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
		</c:if>
	

	<tr>
		<td><label>Situacion de Riesgo</label></td>
		<td>
			<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
			<input type="hidden" name="estrategiaComp" id="estrategiaComp" value="5">
			<form:select path="situacionCrisis">
				<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
			</form:select>
			<input type="hidden" id="horaProxEntrevista" name="horaProxEntrevista" value="12:00">
			<input type="hidden" id="lugarProximaEntrevista" name="lugarProximaEntrevista" size="39" value="${escuelaZona}" disabled="true" />
			<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${entrevista.lugarProximaEntrevista.id}"></input>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Observaciones sobre situaciones de riesgo</label></td>
		<td>
			<form:textarea path="ossr" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Observaciones sobre materias y exámenes</label></td>
		<td>
			<form:textarea path="osme" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Observac.sobre alumnos renovados p/excepción</label></td>
		<td>
			<form:textarea path="osare" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	
	<c:if test="${entrevista.periodoDePago.nombre=='Julio'}">
		<tr>
		<td nowrap="nowrap"><label>HSE sobre las que trabajaste primera mitad año</label></td>
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
		<td nowrap="nowrap"><label>Contenidos abordados</label></td>
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
			<td><label>Usaste el fichero</label></td>
			<td>
				<form:checkbox path="usasteFichero" id="usasteFichero" />
			</td>
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Qué trabajaste en acompañamiento estos meses</label></td>
			<td>
				<form:textarea path="qtam" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</td>
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Estrategias que utilizaste en el acompañamiento<br>estos meses:</label></td>			
			<td>
				<select id="euam" name="euam">
					
	   					<c:if test="${entrevista.euam == 'Si'}">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT" selected="selected">CAT</option>
							<option value="CAT">CAT</option>
						</c:if>
						<c:if test="${entrevista.euam == 'No'}">
							<option value="0" >Seleccione una opción</option>
							<option value="CAT">CAT</option>
							<option value="CAT" selected="selected">CAT</option>
						</c:if>
						<c:if test="${entrevista.euam != 'Si' && entrevista.euam != 'No' }">
							<option value="0" >Seleccione una opción</option>
								<option value="CAT">CAT</option>
								<option value="CAT">CAT</option>
						</c:if>
						
				</select>
			</td>
		</tr>
		
		<!-- ESTO SOLO ES PARA LOS EGRESADOS -->
		
		<c:set var="egreso" value="${0}"/>
		<c:if test="${alumno.escuela.zonaCimientos.eae=='6/6'}">
	    	<c:if test="${alumno.anioAdicional}">
				<c:set var="egreso" value="${alumno.beca.ciclo.nombre+14-alumno.anioEscolar.id+1}" />
				
			</c:if>
			<c:if test="${!alumno.anioAdicional}">
				
				<c:set var="egreso" value="${alumno.beca.ciclo.nombre+14-alumno.anioEscolar.id}" />
			</c:if>
		</c:if>
		<c:if test="${alumno.escuela.zonaCimientos.eae=='7/5'}">
	    	<c:if test="${alumno.anioAdicional}">
				
				<c:set var="egreso" value="${alumno.beca.ciclo.nombre+13-alumno.anioEscolar.id+1}" />
			</c:if>
			<c:if test="${!alumno.anioAdicional}">
				<c:set var="egreso" value="${alumno.beca.ciclo.nombre+13-alumno.anioEscolar.id}" />
			</c:if>
		</c:if>
		<c:if test="${egreso==2018}">
		
			<tr>
				<td  nowrap="nowrap"><label>Situación alumno respecto al proyecto educativo<br> post-escolar</label></td>
				<td>	
					<select id="sarpepe" name="sarpepe">				
	   					<c:if test="${entrevista.sarpepe == 'No lo tiene definido aún'}">
							<option value="0" >Seleccione una opción</option>
							<option value="No lo tiene definido aún" selected="selected">No lo tiene definido aún</option>
							<option value="No quiere trabajar">No quiere trabajar</option>
							<option value="Quiere trabajar">Quiere trabajar</option>
						</c:if>
						<c:if test="${entrevista.sarpepe == 'No quiere trabajar'}">
							<option value="0" >Seleccione una opción</option>
							<option value="No lo tiene definido aún">No lo tiene definido aún</option>
							<option value="No quiere trabajar" selected="selected">No quiere trabajar</option>
							<option value="Quiere trabajar">Quiere trabajar</option>
						</c:if>
						<c:if test="${entrevista.sarpepe == 'Quiere trabajar'}">
							<option value="0" >Seleccione una opción</option>
							<option value="No lo tiene definido aún">No lo tiene definido aún</option>
							<option value="No quiere trabajar">No quiere trabajar</option>
							<option value="Quiere trabajar"  selected="selected">Quiere trabajar</option>
						</c:if>
						<c:if test="${entrevista.sarpepe != 'No lo tiene definido aún' && entrevista.sarpepe != 'No quiere trabajar' && entrevista.sarpepe != 'Quiere trabajar'  }">
							<option value="0" >Seleccione una opción</option>
								<option value="No lo tiene definido aún">No lo tiene definido aún</option>
								<option value="No quiere trabajar">No quiere trabajar</option>
								<option value="Quiere trabajar">Quiere trabajar</option>
						</c:if>				
					</select>
				</td>				
			</tr>
			<tr>
				<td  nowrap="nowrap"><label>En caso que quiera estudiar. Qué estudios<br> quiere hacer?</label></td>
				<td>	
					<select id="te" name="te">				
	   					<c:if test="${entrevista.te == 'Universitarios'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Universitarios" selected="selected">Universitarios</option>
							<option value="Terciarios">Terciarios</option>
						</c:if>
						<c:if test="${entrevista.te == 'Terciarios'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Universitarios">Universitarios</option>
							<option value="Terciarios" selected="selected">Terciarios</option>
						</c:if>
						<c:if test="${entrevista.te != 'Si' && entrevista.te != 'No' }">
							<option value="0" >Seleccione una opción</option>
								<option value="Universitarios">Universitarios</option>
								<option value="Terciarios">Terciarios</option>
						</c:if>				
					</select>
				</td>		
			<tr>
			<tr>
				<td colspan=2 nowrap="nowrap"><label>En caso que quiera estudiar, especificar detalle de carrera o estudio 
						   Incluir bajada más pequeña de aclaración o signo de exclamación que aclare:<br> 
						   Si no lo tiene definido escribir "Sin definición"</label></td>
				<td>						
			</tr>
			<tr>
				<td colspan=2>
					<form:textarea path="ec" rows="4" cols="70" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>					
				</td>				
			</tr>
			<tr>
				<td colspan=2 nowrap="nowrap"><label>Si ya lo tiene definido, especificar en qué institución quiere estudiar
						   Incluir bajada más pequeña de aclaración o signo de exclamación que aclare:<br>
						   Si no lo tiene definido escribir "Sin definición"</label></td>
			</tr>
			
			<tr>	
				<td colspan=2>						
					<form:textarea path="ie" rows="4" cols="70" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>					
				</td>				
			</tr>
			<tr>	
				<td><label>Tiene su CV armado</label></td>
				<td>
					<form:checkbox path="cv" id="cv" />
				</td>
			</tr>
		</c:if>		

		
	</c:if>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<tr>
	<td nowrap="nowrap" valign="top"><label>Evaluacion Cobro Beca  *</label></td>
		<td>
		<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" class="required" onchange="habilitarMotivos(this)">
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
	<tr>		
		<td nowrap="nowrap"><label>Motivo de Cesacion  *</label></td>
		<td>
			<form:select path="motivoCesacion" id="motivoCesacion" disabled="true" class="required">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoCesacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td><label>Observaciones</label></td>
		<td>
			<form:textarea path="observacionesGenerales" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
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
		<td nowrap="nowrap" width="35%"><label>Comentarios de revisión, intercambio RR - EA</label></td>
		<td>
			<form:textarea path="comentariosRevision" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
</table>