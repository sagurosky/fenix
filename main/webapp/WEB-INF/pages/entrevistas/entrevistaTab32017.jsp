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
	<!-- ocultado el 11-02-2016
	<tr>
		<td><label>Rendicion Gastos  *</label></td>
		<td>
			<form:checkbox path="rendicionGastos" id="rendicionGastos" onclick="habilitarDetalleGastos(this)"/>
		</td>
	</tr>
	-->
	<tr>		
		<td><label>Uso de la beca  *</label></td>
		<td>
			<!-- form:select path="detalleGastos" id="detalleGastos" class="required" disabled="true"-->
			<form:select path="detalleGastos" id="detalleGastos" class="required">
				<form:options items="${detalleGastos}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap"><label>Evolución Propósito establecido</label></td>
		<td>
			<form:textarea path="evolucionMesAnterior" rows="4" cols="30" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<tr>		
		<td><label>Qué se trabajó en esta entrevista?</label></td>
		<td>
			<form:textarea path="logros" rows="4" cols="30" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	<!-- 
	<tr>
		<td><label>Dificultades</label></td>
		<td>
			<form:textarea path="dificultades" rows="4" cols="30" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>
	</tr>
	 -->
	<tr>		
		<td><label>Propósito</label></td>
		<td>
			<form:textarea path="proposito" rows="4" cols="30" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		</td>		
	</tr>
	<!-- sacado el 11-02-2016
	<c:if test="${entrevista.entrevistaGrupal == null}">	
	<tr>
		<td nowrap="nowrap"><label>Compromiso RA con la escolaridad  *</label></td>
		<td>
			<form:select path="compromisoRA" class="required">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${compromisosRA}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>	
	</c:if>
	
	<c:if test="${entrevista.entrevistaGrupal != null}">
	<tr>
		<td nowrap="nowrap"><label>Compromiso RA con la escolaridad  *</label></td>
		<td>
			<form:select path="compromisoRA" disabled="true">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${compromisosRA}" itemLabel="valor" itemValue="id"/>				
			</form:select> <font size="1">NO APLICA</font>
		</td>
	</tr>
	</c:if>		
	-->
	<tr>
		<td nowrap="nowrap"><label>Habilidades <br>y/o contenidos</label></td>
		<td>
			<form:select path="contenidosAbordados" class="required"  onclick="verificarCantidad()"
				style="width:750px;border:1px solid #04467E;background-color:#DDFFFF;color:#2D4167" >
				<form:options items="${contenidosAbordados}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	
	
<% 
ArrayList<String> actividades1 = new ArrayList<String>();
actividades1.add(0,"Autoevaluación del alumno cierre de año");
actividades1.add(1,"Autoevaluación del alumno inicio de un nuevo año");
actividades1.add(2,"Cómo vencer la timidez");
actividades1.add(3,"Cuento sobre la discriminación");
actividades1.add(4,"El juego de mi vida");
actividades1.add(5,"La alcancía");
actividades1.add(6,"Lectura acerca del dolor");
actividades1.add(7,"Lecturas para trabajar autoestima");
actividades1.add(8,"Lecturas para trabajar valores");
actividades1.add(9,"Lectura acerca del dolor");
actividades1.add(10,"Lecturas sobre la amistad");
actividades1.add(11,"Reconstruyendo la trayectoria escolar");
actividades1.add(12,"Seguimiento del plan anual");
actividades1.add(13,"Taller Adaptación a los cambios de nivel");
actividades1.add(14,"Taller Alunizaje forzoso: planificando mi futuro");
actividades1.add(15,"Taller Conociéndome para alcanzar mis logros");
actividades1.add(16,"Taller Egreso efectivo: autoconocimiento y metas");
actividades1.add(17,"Taller Elección de la orientación: conocerlas y conocerme (Parte 1)");
actividades1.add(18,"Taller Elección de la orientación: conocerlas y conocerme (Parte 2)");
actividades1.add(19,"Taller Elección vocacional: autoconocimiento");
actividades1.add(20,"Taller Elección vocacional: conociendo las carreras");
actividades1.add(21,"Taller Me conozco y me valoro");
actividades1.add(22,"Taller Proyeccción a Futuro - Identificando mis intereses");
actividades1.add(23,"Taller Sembrando el futuro");
actividades1.add(24,"Taller Trayectoria escolar y propósito");
actividades1.add(25,"Taller El valor de aceptarnos tal como somos");
actividades1.add(26,"Voces en mi cabeza");

%>
	
	
	<!-- ocultado el 11-02-2016
	<tr>		
		<td nowrap="nowrap"><label>Recomendación estrategia complementaria</label></td>
		<td>
			<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
			<form:select path="estrategiaComp">
				<form:options items="${estrategiasComp}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>		
	</tr>
	-->
	<tr>
		<td><label>Situacion de Crisis</label></td>
		<td>
			<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
			<input type="hidden" name="estrategiaComp" id="estrategiaComp" value="5">
			<form:select path="situacionCrisis">
				<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</td>
	</tr>
	<tr>
		<td nowrap="nowrap" class="datepicker1"><label>Fecha Proxima Entrevista  *</label></td>
		<td><form:input path="proximaEntrevista" id="datepicker1" class="required"/></td>
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
			<input type="text" id="lugarProximaEntrevista" name="lugarProximaEntrevista" size="39" value="${escuelaZona}" class="required" />
			<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${entrevista.lugarProximaEntrevista.id}"></input>
		</td>
	</tr>
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
			</form:select><font size="1">Este campo aparece en Informe al padrino.</font><img src="../static/images/atencion.gif" width=10>
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