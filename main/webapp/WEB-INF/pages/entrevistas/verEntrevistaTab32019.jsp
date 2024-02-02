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
	<c:if test="${entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio' }">
		<tr>
			<td nowrap="nowrap"><label>Valoración compromiso AB con el<br>acompañamiento</label></td>
			<td>
				<select id="ecabp" name="ecabp" disabled="disabled">
					
	   					<c:if test="${entrevista.ecabp == 'Malo'}">
							<option value="0" >Seleccione una opción</option>
							<option value="Malo" selected="selected">Malo</option>
							<option value="Regular">Regular</option>
							<option value="Bueno">Bueno</option>
							<option value="Muy Bueno">Muy Bueno</option>
							<option value="Excelente">Excelente</option>
						</c:if>
						<c:if test="${entrevista.ecabp == 'regular'}">
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
			<td nowrap="nowrap"><label>Valoración Compromiso RA con el <br>acompañamiento</label></td>
			<td>
				<select id="vcrae" name="vcrae" disabled="disabled">
					
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
	</c:if>
	<c:if test="${!entrevista.periodoDePago.nombre=='Julio' || !periodo.nombre=='Julio' }">
			<tr>			
				<td nowrap="nowrap"><label>Cumplimiento de propósitos<br>acordados con el EA:</label></td>
				
				<td>
					<select id="cpaEA" name="cpaEA"  disabled="disabled">
						
		   					<c:if test="${entrevista.cpaEA == 'Si'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Si" selected="selected">Si</option>
								<option value="No">No</option>
							</c:if>
							<c:if test="${entrevista.cpaEA == 'No'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Si">Si</option>
								<option value="No" selected="selected">No</option>
							</c:if>
							<c:if test="${entrevista.cpaEA != 'Si' && entrevista.cpaEA != 'No' }">
								<option value="0" >Seleccione una opción</option>
									<option value="Si">Si</option>
									<option value="No">No</option>
							</c:if>
							
					</select>
				</td>
		</tr>
	</c:if>
	<c:if test="${entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio' }">
		<tr>
			<td nowrap="nowrap"><label>Seguimientos de Propósito anual</label></td>
			<td>
				<form:textarea path="propositoAnual"  id="propositoAnual" class="textbox2" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"  disabled="disabled"/>											
			</td>											   		
			</tr>
		</c:if>
	
	<c:if test="${entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio' }">
		<tr>		
			<td><label>Situacion de Riesgo</label></td>
			<td>
				<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
				<input type="hidden" name="estrategiaComp" id="estrategiaComp" value="5">
				<form:select path="situacionCrisis">
					<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"  disabled="disabled"/>				
				</form:select>
				<input type="hidden" id="horaProxEntrevista" name="horaProxEntrevista" value="12:00">
				<input type="hidden" id="lugarProximaEntrevista" name="lugarProximaEntrevista" size="39" value="${escuelaZona}" />
				<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${entrevista.lugarProximaEntrevista.id}"></input>
			</td>
		</tr>	
	</c:if>
	<c:if test="${!entrevista.periodoDePago.nombre=='Julio' || !periodo.nombre=='Julio' }">	
		<tr>		
			<td></td>
			<td>
				<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
				<input type="hidden" name="estrategiaComp" id="estrategiaComp" value="5">
				<input type="hidden" name="situacionCrisis" id="situacionCrisis" value="">					
				<input type="hidden" id="horaProxEntrevista" name="horaProxEntrevista" value="12:00">
				<input type="hidden" id="lugarProximaEntrevista" name="lugarProximaEntrevista" size="39" value="${escuelaZona}" disabled="true" />
				<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${entrevista.lugarProximaEntrevista.id}"></input>
				<input type="hidden" name="ossr" id="ossr" value="">
			</td>
		</tr>
	</c:if>
	<c:if test="${!entrevista.periodoDePago.nombre=='Julio' || !periodo.nombre=='Julio' }">
		<tr>
			<td nowrap="nowrap"><label>Observaciones sobre situaciones de riesgo</label></td>
			<td>
				<form:textarea path="ossr" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" disabled="disabled"/>
			</td>
		</tr>
	</c:if>	
	<tr>
		<td nowrap="nowrap"><label>Observaciones sobre rendimiento<br>escolar y asistencia</label><br><br>
		<font size="1">Atención. Este campo va al Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
		</td>
		<td>
			<form:textarea path="osme" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"  disabled="disabled"/>
		</td>
	</tr>
	<c:if test="${entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio' }">	
		<tr>
			<td></td>
			<td>
				<input type="hidden" id="osare" name="osare" value="">				
			</td>
		</tr>
	</c:if>
	<c:if test="${!entrevista.periodoDePago.nombre=='Julio' || !periodo.nombre=='Julio' }">	
		<tr>
			<td nowrap="nowrap"><label>Observac.sobre alumnos<br>renovados p/excepción</label></td>
			<td>
				<form:textarea path="osare" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" disabled="disabled"/>
			</td>
		</tr>
	</c:if>
	
	<c:if test="${entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio' }">
		<tr>
		<td nowrap="nowrap"><label>Principal habilidad trabajada durante<br>la primera parte año</label></td>		
		<td>
			<form:select path="hsTrabajarAño" id="hsTrabajarAño" class="textbox2"  disabled="disabled"> 
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
		<td nowrap="nowrap"><label>Contenidos abordados</label></td>
		<td>
			<form:select path="contenidosTrabajarDuranteAnio" id="contenidosTrabajarDuranteAnio" class="textbox2"  disabled="disabled">
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
				<form:checkbox path="usasteFichero" id="usasteFichero"  disabled="disabled"/>
			</td>
		</tr>
		<tr>	
			<td><label>Completaste la brújula?</label></td>
			<td>
				<form:checkbox path="brujula" id="brujula"  disabled="disabled"/>
			</td>
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Qué trabajaste en acompañamiento<br>en esta primera parte del año</label>
			<br><br>
			<font size="1">Atención. Este campo va al Informe al padrino.</font><img src="../static/images/atencion.gif" width=10></td>
			<td>
				<form:textarea path="qtam" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" disabled="disabled"/>
				
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
				<td  nowrap="nowrap"><label>Proyección post-escolar del AB</label></td>
				<td>	
					<select id="sarpepe" name="sarpepe" disabled="disabled">				
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
				</td>				
			</tr>
			<tr>
				<td  nowrap="nowrap"><label>En caso que quiera estudiar,<br> qué estudios quiere hacer?</label></td>
				<td>	
					<select id="te" name="te" disabled="disabled">				
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
				<td nowrap="nowrap"><label>Si ya lo tiene definido,<br>especificar carrera y/o institución</label></td>
				<td>						
					<form:textarea path="ie" rows="4" cols="70" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" disabled="disabled"/>					
				</td>				
			</tr>
			<tr>	
				<td><label>Tiene su CV armado</label></td>
				<td>
					<form:checkbox path="cv" id="cv"  disabled="disabled"/>
				</td>
			</tr>
			<tr>	
				<td><label>Tiene mail activo?</label></td>
				<td>
					<form:checkbox path="tma" id="tma"  disabled="disabled"/>
				</td>
			</tr>
		</c:if>		

		
	</c:if>
	
	<tr>
	<td nowrap="nowrap" valign="top"><label>Evaluacion Cobro Beca  *</label></td>
		<td>
		<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" class="required" onchange="habilitarMotivos(this)" disabled="disabled">
			<form:option value="">Seleccione una opción...</form:option>
			<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
		</form:select>
		</td>
	</tr>				
	<tr>
		<td nowrap="nowrap"><label>Motivo de Suspension  *</label></td>
		<td>
			<form:select path="motivoSuspension" id="motivoSuspension"  class="required"  disabled="disabled">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoSuspension}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Motivo de Cesacion  *</label></td>
		<td>
			<form:select path="motivoCesacion" id="motivoCesacion"  class="required"  disabled="disabled">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoCesacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td><label>Observaciones</label></td>
		<td>
			<form:textarea path="observacionesGenerales" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" disabled="disabled"/>
		</td>
	</tr>
	<c:if test="${tipoPerfil != 'ea'}">  
	<tr>		
		<td><label>Paga Entrevista</label></td>
		<td>
			<form:checkbox path="pagaEntrevista" checked="checked" disabled="disabled"/>
		</td>
	</tr>
	</c:if>
	<tr>
		<td nowrap="nowrap" width="35%"><label>Comentarios de revisión,<br>intercambio RR - EA</label></td>
		<td>
			<form:textarea path="comentariosRevision" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" disabled="disabled"/>
		</td>
	</tr>
</table>