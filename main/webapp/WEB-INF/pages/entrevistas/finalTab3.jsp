<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	 span{ background-color: yellow; }
</style>
<table id="table-informe">
	<!-- ocultado el 11-02-2016
	<tr>
		<td><label>Rendicion Gastos  *</label></td>
		<td>
			<form:checkbox path="rendicionGastos" id="rendicionGastos" disabled="true" onclick="habilitarDetalleGastos(this)"/>
		</td>
	</tr>
	 -->
	<tr>
			<td nowrap="nowrap"><label>Valoración compromiso AB<br>con el Progama *</label></td>
			<td>
				<select id="ecabp" name="ecabp">
					
	   					<c:if test="${entrevista.ecabp == 'Malo'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo" selected="selected">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						<c:if test="${entrevista.ecabp == 'Regular'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular" selected="selected">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						<c:if test="${entrevista.ecabp == 'Bueno'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno" selected="selected">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						<c:if test="${entrevista.ecabp == 'Muy Bueno'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno" selected="selected">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						<c:if test="${entrevista.ecabp == 'Excelente'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente" selected="selected">Excelente</option>
						</c:if>
						
						<c:if test="${entrevista.ecabp != 'Malo' && entrevista.ecabp != 'Regular'  && entrevista.ecabp != 'Bueno'  && entrevista.ecabp != 'Muy Bueno'  && entrevista.ecabp != 'Excelente'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						
				</select>
			</td>
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Valoración Compromiso RA<br>con el Programa *</label></td>
			<td>
				<select id="vcrae" name="vcrae">
					
	   					<c:if test="${entrevista.vcrae == 'Malo'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo" selected="selected">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						<c:if test="${entrevista.vcrae == 'Regular'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular" selected="selected">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						<c:if test="${entrevista.vcrae == 'Bueno'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno" selected="selected">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						<c:if test="${entrevista.vcrae == 'Muy Bueno'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno" selected="selected">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						<c:if test="${entrevista.vcrae == 'Excelente'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente" selected="selected">Excelente</option>
						</c:if>
						
						<c:if test="${entrevista.vcrae != 'Malo' && entrevista.vcrae != 'Regular'  && entrevista.vcrae != 'Bueno'  && entrevista.vcrae != 'Muy Bueno'  && entrevista.vcrae != 'Excelente'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						
				</select>
			</td>
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Seguiiento del<br>Propósito anual *</label></td>
			<td>
				<form:textarea path="propositoAnual"  id="propositoAnual" class="textbox2" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>											
			</td>											   		
		</tr>
		
		<tr>
			<td nowrap="nowrap"><label>¿Qué trabajaste en el acompañamiento<br>en esta 2º parte del año *</label>
			<br><br>
			<font size="1">Atención. Este campo va al Informe al padrino.</font><img src="../static/images/atencion.gif" width=10></td>
			<td>
				<form:textarea path="qtam" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
				<!-- input type="hidden" id="evaluacionProposito" name="evaluacionProposito"-->	
			</td>
		</tr>	
		<tr>
			<td nowrap="nowrap"><label>Observaciones sobre<br>rendimiento<br>escolar y asistencia<br>durante la 2º parte del año *</label><br><br>		
			
				<font size="1">Atención. Este campo va al Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
			
			</td>
			<td>
				<form:textarea path="osme" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</td>
		</tr>
		<tr>
		<td nowrap="nowrap"><label>Principal habilidad<br>trabajada durante<br>la 2º parte del año *</label></td>		
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
			<font size="1">Atención. Este campo va al Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
		</td>					
		</tr>
		<tr>
		<td nowrap="nowrap"><label>Principal Contenido trabajado durante<br>la 2da parte del año *</label></td>
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
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Autoeficacia y autoconfianza'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación" >Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza" selected="selected">Autoeficacia y autoconfianza</option>
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
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Autonomía'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación" >Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía" selected="selected">Autonomía</option>
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
				    <c:when test="${entrevista.contenidosTrabajarDuranteAnio == 'Convivencia y Resolución de conflictos'}">
      					<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima/option>															
						<option Value="Autocontrol y determinación">Autocontrol y determinación</option>								
				    	<option Value="Autoeficacia y autoconfianza">Autoeficacia y autoconfianza</option>
				    	<option Value="Autonomía">Autonomía</option>
				    	<option Value="Convivencia y Resolución de conflictos" selected="selected">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Convivencia y Resolución de conflictos">Convivencia y Resolución de conflictos</option>
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
				    	<option Value="Transición primaria-secundaria" selected="selected">Transición primaria-secundaria</option>				    	  						    
				    </c:when>						    
				    <c:otherwise>
				    	<option value="0">Seleccione una opci&oacute;n:</option>
						<option value="Asertividad y comunicación">Asertividad y comunicación</option>
						<option Value="Autoconocimiento y autoestima">Autoconocimiento y autoestima</option>															
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
				    </c:otherwise>		
				</c:choose>
			</form:select>
			<font size="1">Atención. Este campo va al Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
		</td>							
		</tr>	
		<tr>	
			<td><label>Usaste el fichero?</label></td>
			<td>
				<form:checkbox path="usasteFichero" id="usasteFichero" />
			</td>
		</tr>
		<tr>	
			<td><label>¿Usaste la Brújula de Habilidades?</label></td>
			<td>
				<form:checkbox path="brujula" id="brujula" />
			</td>
		</tr>
		
	
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
	
	<c:if test="${egreso==2020}">
			
			<tr>
				<td  nowrap="nowrap"><label><font color="#AE30CD">Proyección post-escolar *</font></label></td>
				<td>	
					<select id="sarpepe" name="sarpepe">				
	   					<c:if test="${entrevista.sarpepe == 'Tiene pensado estudiar'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Tiene pensado estudiar" selected="selected">Tiene pensado estudiar</option>
							<option value="Tiene pensado estudiar y trabajar">Tiene pensado estudiar y trabajar</option>
							<option value="Tiene pensado trabajar">Tiene pensado trabajar</option>
							<option value="Aun no lo sabe">Aun no lo sabe</option>
						</c:if>
						<c:if test="${entrevista.sarpepe == 'Tiene pensado estudiar y trabajar'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Tiene pensado estudiar">Tiene pensado estudiar</option>
							<option value="Tiene pensado estudiar y trabajar" selected="selected">Tiene pensado estudiar y trabajar</option>
							<option value="Quiere trabajar">Quiere trabajar</option>
							<option value="Aun no lo sabe">Aun no lo sabe</option>
						</c:if>
						<c:if test="${entrevista.sarpepe == 'Tiene pensado trabajar'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Tiene pensado estudiar">Tiene pensado estudiar</option>
							<option value="Tiene pensado estudiar y trabajar">Tiene pensado estudiar y trabajar</option>
							<option value="Tiene pensado trabajar"  selected="selected">Tiene pensado trabajar</option>
							<option value="Aun no lo sabe">Aun no lo sabe</option>
						</c:if>
						<c:if test="${entrevista.sarpepe == 'Aun no lo sabe'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Tiene pensado estudiar">Tiene pensado estudiar</option>
							<option value="Tiene pensado estudiar y trabajar">Tiene pensado estudiar y trabajar</option>
							<option value="Tiene pensado trabajar">Tiene pensado trabajar</option>
							<option value="Aun no lo sabe" selected="selected">Aun no lo sabe</option>
						</c:if>
						<c:if test="${entrevista.sarpepe != 'Tiene pensado estudiar' && entrevista.sarpepe != 'Tiene pensado estudiar y trabajar' 
								&& entrevista.sarpepe != 'Tiene pensado trabajar' && entrevista.sarpepe != 'Aun no lo sabe'}">
							<option value="0" >Seleccione una opción</option>
								<option value="Tiene pensado estudiar">Tiene pensado estudiar</option>
								<option value="Tiene pensado estudiar y trabajar">Tiene pensado estudiar y trabajar</option>
								<option value="Tiene pensado trabajar">Tiene pensado trabajar</option>
								<option value="Aun no lo sabe">Aun no lo sabe</option>
						</c:if>				
					</select>
					<font size="1">Atención. Este campo va al Informe al padrino.</font><img src="../static/images/atencion.gif" width=10></td>
								
			</tr>
			<tr>
				<td  nowrap="nowrap"><label><font color="#AE30CD">En caso que quiera estudiar,<br> qué estudios quiere realizar? *</font></label></td>
				<td>	
					<select id="te" name="te">				
	   					<c:if test="${entrevista.te == 'Universitarios'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Universitarios" selected="selected">Universitarios</option>
							<option value="Terciarios">Terciarios</option>
							<option value="Curso-oficio">Curso-oficio</option>
							<option value="Aun no lo sabe">Aun no lo sabe</option>
						</c:if>
						<c:if test="${entrevista.te == 'Terciarios'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Universitarios">Universitarios</option>
							<option value="Terciarios" selected="selected">Terciarios</option>
							<option value="Curso-oficio">Curso-oficio</option>
							<option value="Aun no lo sabe">Aun no lo sabe</option>
						</c:if>
						<c:if test="${entrevista.te == 'Curso-oficio'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Universitarios">Universitarios</option>
							<option value="Terciarios">Terciarios</option>
							<option value="Curso-oficio" selected="selected">Curso-oficio</option>
							<option value="Aun no lo sabe">Aun no lo sabe</option>
						</c:if>
						<c:if test="${entrevista.te == 'Aun no lo sabe'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Universitarios">Universitarios</option>
							<option value="Terciarios" selected="selected">Terciarios</option>
							<option value="Curso-oficio">Curso-oficio</option>
							<option value="Aun no lo sabe"  selected="selected">Aun no lo sabe</option>
						</c:if>
						<c:if test="${entrevista.te != 'Si' && entrevista.te != 'No' }">
							<option value="0" >Seleccione una opción</option>
								<option value="Universitarios">Universitarios</option>
								<option value="Terciarios">Terciarios</option>
								<option value="Curso-oficio">Curso-oficio</option>
								<option value="Aun no lo sabe">Aun no lo sabe</option>
						</c:if>				
					</select>
				</td>		
			
			<tr>
				<td nowrap="nowrap"><label><font color="#AE30CD">Especificar nombre de Estudios o Carrera que le interesa</font></label></td>										
				<td>						
					<form:textarea path="ie" rows="4" cols="70" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>					
				</td>				
			</tr>
			<tr>
				<td nowrap="nowrap"><label><font color="#AE30CD">Si ya lo tiene definido, especificar Institución</font></label></td>
				<td>						
					<form:input path="facebook" id="facebook" size="70" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>					
				</td>				
			</tr>
			
			<tr>	
				<td><label><font color="#AE30CD">Tiene su CV armado? *</font></label></td>
				<td>
					
					<form:checkbox path="cv" id="cv" />
				</td>
			</tr>
			<tr>	
				<td><label><font color="#AE30CD">Tiene mail activo? *</font></label></td>
				<td>
					<form:checkbox path="tma" id="tma" />
				</td>
			</tr>
			
			<tr>
				<td nowrap="nowrap"><label><font color="#AE30CD">Dirección de mail *</font></label></td>
				<td>						
					<form:input path="dirMail" id="dirMail"  size="70" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>					
				</td>				
			</tr>
			<tr>
				<td nowrap="nowrap"><label><font color="#AE30CD">Celular EP *</font></label></td>
				<td>						
					<form:input path="celular" id="celular" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>					
				</td>				
			</tr>
			<tr>
				<td nowrap="nowrap"><label><font color="#AE30CD">Teléfono RA</font></label></td>
				<td>						
					<input type="text" id="evaluacionProposito" name="evaluacionProposito">					
				</td>				
			</tr>
			<tr>
				<td nowrap="nowrap"><label><font color="#AE30CD">Teléfono fijo</font></label></td>
				<td>						
					<form:input path="telFijo" id="telFijo" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>					
				</td>				
			</tr>
		</c:if>	
		
		<tr>		
			<td><label>Situación de Riesgo extra-escolar</label></td>
			<td>
				<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
				<input type="hidden" name="estrategiaComp" id="estrategiaComp" value="5">
				<form:select path="situacionCrisis">
					<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
				</form:select>
				<input type="hidden" id="horaProxEntrevista" name="horaProxEntrevista" value="12:00">
				<input type="hidden" id="lugarProximaEntrevista" name="lugarProximaEntrevista" size="39" value="${alumno.escuela.nombre}"  />
				<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${alumno.escuela.id}"></input>
				
			
			</td>
		</tr>	
		
		<tr>		
			<td><label>Situación de Riesgo escolar</label></td>
			<td>
				<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
				<input type="hidden" name="estrategiaComp" id="estrategiaComp" value="5">
				<form:select path="situacionCrisis">
					<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
		</tr>	
		
		
		<c:if test="${egreso!=2020}">
		<input type="checkbox" name="cv" id="cv" checked style="display:none">
		<input type="checkbox" name="tma" id="tma" checked style="display:none">
		<input type="checkbox" name="usasteFichero" id="usasteFichero" checked style="display:none">
		<input type="checkbox" name="brujula" id="brujula" checked >
		<input type="hidden" name="te" id="te" value="-">
		<input type="hidden" name="dirMail" id="dirMail" value="-">
		<input type="hidden" name="celular" id="celular" value="-">		
		<input type="hidden" name="sarpepe" id="sarpepe" value="-">
		
		</c:if>
	
	
	<tr>
		<td nowrap="nowrap"><label>Resultado Año Escolar * </label></td>
		<td>
			<form:select path="situacionEscolarMergeada" id="resultadoAnioEscolar"  class="required">
					<form:option value="">Seleccione una opcion...</form:option>
					<form:options items="${resultadoAnioEscolar}" itemLabel="valor" itemValue="id"/>
					
			</form:select>						
			<font size="1">Atención. Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>			
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Fue corroboardo con boletín? *</label></td>
		<td>
			<select id="corroboradoBoletin" name="corroboradoBoletin">
				<c:choose>
   					<c:when test="${entrevista.corroboradoBoletin == 'Sí'}">
						<option value="Sí" selected="selected">Sí</option>
						<option value="No">No</option>				
					</c:when>
					<c:when test="${entrevista.corroboradoBoletin == 'No'}">
						<option value="Sí">Sí</option>
						<option value="No" selected="selected">No</option>				
					</c:when>
					<c:otherwise>
						<option value="Sí">Sí</option>
						<option value="No">No</option>
					</c:otherwise>
				
				</c:choose>
			</select>
		</td>
	</tr>	
	
	<tr>		
		<td nowrap="nowrap"><label>Evaluacion de renovación *</label></td>
		<td>
			<form:select path="evaluacionRenovacionFinal" id="evaluacionRenovacionFinal" class="required" onchange="habilitarRenovacion(this)">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${evaluacionRenovacionFinal}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Motivo de no renovación *</label></td>
		<td>
			<form:select path="motivoNoRenovacion" id="motivoNoRenovacion" class="required" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoNoRenovacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>
			
		</td>
	</tr>
	
	<tr>
	<td nowrap="nowrap"><label>Evaluación Cobro Beca  *</label></td>
		<td>
		<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" class="required" onchange="habilitarMotivos(this)">
			<form:option value="">Seleccione una opción...</form:option>
			<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
		</form:select>
		</td>
	</tr>			
	<tr>
		<td nowrap="nowrap"><label>Motivo de Suspensión *</label></td>
		<td>
			<form:select path="motivoSuspension" id="motivoSuspension" class="required" disabled="true" >
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
		<td nowrap="nowrap"><label>Comentarios de revisión,<br>intercambio RR - EA</label></td>
		<td>
			<form:textarea path="comentariosRevision" rows="4" cols="30" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
</table>