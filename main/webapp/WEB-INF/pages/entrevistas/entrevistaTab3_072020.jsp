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

<input type="hidden" id="periodo" name="periodo" value="${periodo.nombre}">
<table id="table-informe">
	<c:if test="${entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio' }">
		<tr>
			<td nowrap="nowrap"><label>Valoración compromiso AB con el<br>acompañamiento</label></td>
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
	</c:if>
	<c:if test="${!entrevista.periodoDePago.nombre=='Julio' || !periodo.nombre=='Julio' }">
			<tr>			
				<td nowrap="nowrap"><label>Cumplimiento de propósitos<br>acordados con el EA:</label></td>
				
				<td>
					<select id="cpaEA" name="cpaEA">
						
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
				<form:textarea path="propositoAnual"  id="propositoAnual" class="textbox2 required" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>											
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
					<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
				</form:select>				
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
	
	
		<c:if test="${entrevista.entrevistaGrupal != null}">
		<tr>	
			<td>			
				<c:set var="isGrupal" value="true"></c:set>
					<b>Objetivo del encuentro y<br>actividad implementada *</b>:<br>												   					
			</td>
			<td><textarea rows="4" cols="60" id="objetivoEncuentro" name="objetivoEncuentro" class="required">${entrevista.objetivoEncuentro}</textarea> 
			</td>			
		</tr>	
	</c:if>
	<c:if test="${entrevista.entrevistaGrupal == null}">
		<tr>	
			<td>			
				<b>Objetivo del encuentro y<br>actividad implementada *</b>:<br>												   					
			<td><textarea rows="4" cols="60" id="objetivoEncuentro" name="objetivoEncuentro" class="required">${entrevista.objetivoEncuentro}</textarea> 
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
			</td>
		</tr>
	
	
		<tr>
			<td nowrap="nowrap"><label>Observaciones sobre situaciones de riesgo</label></td>
			<td>				
				<form:textarea path="ossr" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</td>
		</tr>
		
	<tr>
		<td nowrap="nowrap"><label>Principal habilidad trabajada</label></td>		
		<td>
			<form:select path="hsTrabajarAño" id="hsTrabajarAño" class="textbox2 required"> 
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
		</td>
	</tr>		
	<tr>
		<td nowrap="nowrap"><label>Principal Contenido trabajado </label></td>
		<td>
			<input type="hidden" name="contenidosTrabajarDuranteAnio" id="contenidosTrabajarDuranteAnio" value="0">
			<form:select path="contenidosTrabajarEnElAnio" class="textbox2">
				<form:options items="${contenidosTrabajarEnElAnio}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>					
		
	</tr>
	
	
	
	
	
	
	
	<tr>
		<td nowrap="nowrap"><label>Observaciones sobre<br>rendimiento<br>escolar y asistencia *</label><br><br>		
		<c:if test="${entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio' }">
			<font size="1">Atención. Este campo va al Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
		</c:if>
		</td>
		<td>
			<form:textarea path="osme" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" class="required" />
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
				<form:textarea path="osare" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</td>
		</tr>
	</c:if>
	
	<c:if test="${entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio' }">
		
		
		<tr>	
			<td><label>Usaste el fichero?</label></td>
			<td>
				<form:checkbox path="usasteFichero" id="usasteFichero" />
			</td>
		</tr>
		<tr>	
			<td><label>Completaste la brújula?</label></td>
			<td>
				<form:checkbox path="brujula" id="brujula" />
			</td>
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Qué trabajaste en acompañamiento<br>en esta primera parte del año</label>
			<br><br>
			<font size="1">Atención. Este campo va al Informe al padrino.</font><img src="../static/images/atencion.gif" width=10></td>
			<td>
				<form:textarea path="qtam" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" class="required"/>
				
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
		Fecha egreso: ${egreso}
		<c:if test="${egreso==2020}">
		
			<tr>
				<td  nowrap="nowrap"><label>Proyección post-escolar del AB</label></td>
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
				<td  nowrap="nowrap"><label>En caso que quiera estudiar,<br> qué estudios quiere hacer?</label></td>
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
				<td nowrap="nowrap"><label>Si ya lo tiene definido,<br>especificar carrera y/o institución</label></td>
			
			
				
				<td>						
					<form:textarea path="ie" rows="4" cols="70" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>					
				</td>				
			</tr>
			<tr>	
				<td><label>Tiene su CV armado</label></td>
				<td>
					<form:checkbox path="cv" id="cv" />
				</td>
			</tr>
			<tr>	
				<td><label>Tiene mail activo?</label></td>
				<td>
					<form:checkbox path="tma" id="tma" />
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap"><label><font color="#AE30CD">Celular</font></label></td>
				<td>						
					<form:input path="celular" id="celular" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>					
				</td>				
			</tr>
			<tr>
				<td nowrap="nowrap"><label><font color="#AE30CD">Teléfono RA</font></label></td>
				<td>						
					<input type="text" id="evaluacionProposito" name="evaluacionProposito"-->					
				</td>				
			</tr>
			
		</c:if>		

		
	</c:if>
	
							
										
	
	
	
	
	
	<tr>
	<td nowrap="nowrap" valign="top"><label>Evaluacion Cobro de Beca  *</label></td>
		<td>
		<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" class="required" onchange="habilitarMotivos(this)">
			<form:option value="">Seleccione una opción...</form:option>
			<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
		</form:select>
		<input type="hidden" id="horaProxEntrevista" name="horaProxEntrevista" value="12:00">
		<input type="hidden" id="lugarProximaEntrevista" name="lugarProximaEntrevista" size="39" value="${alumno.escuela.nombre}" />
		<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${alumno.escuela.id}"></input>
		<input type="hidden" name="dirMail" id="dirMail"  value="-"/>					
		<input type="hidden" name="facebook" id="facebook"  value="-"/>
		<input type="hidden" name="telFijo" id="telFijo"  value="-"/>
		<input type="hidden" name="celular" id="celular"  value="-"/>									
		<input type="hidden" name="corroboradoBoletin" id="corroboradoBoletin"  value="No"/>
		
		
		</td>
	</tr>				
	<tr>
		<td nowrap="nowrap"><label>Motivo de Suspensión  *</label></td>
		<td>
			<form:select path="motivoSuspension" id="motivoSuspension" disabled="true" class="required">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoSuspension}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>		
		<td nowrap="nowrap"><label>Motivo de Cesación  *</label></td>
		<td>
			<form:select path="motivoCesacion" id="motivoCesacion" disabled="true" class="required">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoCesacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>
			<input type="hidden" id="observacionesGenerales" name="observacionesGenerales" value="">
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
		<td nowrap="nowrap" width="35%"><label>Comentarios de revisión,<br>intercambio RR - EA</label></td>
		<td>
			<form:textarea path="comentariosRevision" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
</table></html>