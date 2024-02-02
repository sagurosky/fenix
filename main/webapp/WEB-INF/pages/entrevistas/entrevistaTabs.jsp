<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
			alert("Ten�s que seleccionar no m�s de 2 habilidades y/o contenidos. Seleccionaste "+a);
		}
		
	} 
</Script>

<div id="fragment-1">    
	<table border="0" id="table-informe">
		<tr>
			<td class="datepicker" width="120px">Fecha Realizaci�n</td>
			<td width="300px"><form:input path="fechaAltaBeca" id="datepicker"/></td>
			<td width="120px"><label>Entrevista Reprogramada</label></td>
			<td>
				<form:select path="entrevistaReprogramada">
					<form:options items="${entrevistas}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
			<td><label>Lugar Entrevista</label></td>
			<td>
				<form:select path="lugarEntrevista">
					<form:options items="${lugarEntrevistas}" itemLabel="nombre" itemValue="id"/>				
				</form:select>
				<input id="idProxima" type="hidden" value="${entrevista.lugarEntrevista.id}"/>
			</td>
		</tr>
		<tr>	
			<td><label>Participo Becado</label></td>
			<td>
				<form:checkbox path="participoBecado" id="participoBecado" onclick="habilitarCamposBecado(this)"/>
			</td>
			<td><label>Motivo Ausencia</label></td>
			<td>
				<form:select path="motivoAusencia" id="motivoAusencia">
					<form:options items="${motivoAusencias}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
			<td><label>Otro Motivo</label></td>
			<td>
				<form:textarea path="otroMotivoAusencia" id="otroMotivoAusencia" rows="4" cols="30" onkeypress="chequearLongitud(this);"/>
			</td>
		</tr>
		<tr>
			<td><label>Participo RA 3</label></td>
			<td>
				<form:checkbox path="participoRA" id="participoRA" onclick="habilitarCamposRA(this)"/>
			</td>
			<td><label>Motivo Ausencia RA</label></td>
			<td>
				<form:select path="motivoAusenciaRA" id="motivoAusenciaRA">
					<form:options items="${motivoAusenciaRA}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
			<td><label>Otro Motivo</label></td>
			<td>
				<form:textarea path="otroMotivoAusenciaRA" id="otroMotivoAusenciaRA" rows="4" cols="30" onkeypress="chequearLongitud(this);" />
			</td>
		</tr>
		<tr>
			<td><label>Escuela</label></td>
			<td><label>${alumno.escuela.nombre}</label></td>
			<td><label>Modlidad Escolar</label></td>
			<td><label>${alumno.escuela.modalidadEscolar.valor}</label></td>	
			<td><label>A�o Escolar</label></td>
			<td><label>${alumno.boletin.ano}</label></td>
		</tr>		
	</table>
	           		
</div>
<div id="fragment-2">
    <table>
		<tr>	
			<td><label>Certificado Alumno Regular</label></td>
			<td>
				<form:checkbox path="certificadoAlumnoRegular" id="certificadoAlumnoRegular" disabled="true"/>
			</td>
			<td><label>Fotocopia Boletin</label></td>
			<td>
				<form:checkbox path="fotocipiaBoletin" id="fotocipiaBoletin" disabled="true"/>
			</td>	
			<td><label>Firma Compromiso</label></td>
			<td>
				<form:checkbox path="firmaActaCompromiso" id="firmaActaCompromiso" disabled="true"/>
			</td>		
		</tr>
		<tr>	
			<td><label>Firma Autorizacion Cierre Caja</label></td>
			<td>
				<form:checkbox path="firmaAutorizacionCierreCaja" id="firmaAutorizacionCierreCaja" disabled="true"/>
			</td>
			<td><label>Firma Autorizacion Imagen</label></td>
			<td>
				<form:checkbox path="firmaAutorizacionImagen" id="firmaAutorizacionImagen" disabled="true"/>
			</td>
			<td><label>Material Completo</label></td>
			<td>
				<!-- form:checkbox path="materialCompleto" id="materialCompleto" disabled="true"/-->
				<form:checkbox path="materialCompleto" id="materialCompleto"/>
			</td>			
		</tr>

		<!-- ocultado el 11-02-2016
		<tr>	
			<td><label>Carpeta</label></td>
			<td>
				<form:select path="carpeta" id="carpeta" disabled="true">
					<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
			<td><label>Cuaderno Comunicados</label></td>
			<td>
				<form:select path="cuadernoComunicados" id="cuadernoComunicados" disabled="true">
					<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
			<td><label>Informe Profesores</label></td>
			<td>
				<form:select path="informeProfesores" id="informeProfesores" disabled="true">
					<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
		</tr>
		<tr>
			<td><label>Cerfificado Asistencia</label></td>
			<td>
				<form:select path="certificadoAsistencia" id="certificadoAsistencia" disabled="true">
					<form:options items="${opciones}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
		</tr>
		-->			
		<tr>
			<td><label>Inasistencias acumuladas</label></td>
			<td>
				<form:input path="cantidadInasistencias" id="cantidadInasistencias" disabled="true" onkeypress="chequearLongitud(this);"/>
			</td>
			<td><label>Motivo Inasistencias</label></td>
			<td>
				<form:textarea path="motivoInasistencia" id="motivoInasistencia"  rows="4" cols="30" onkeypress="chequearLongitud(this);"/>
			</td>		
		</tr>    
    </table>
</div>
<div id="fragment-3">            
    <table>
  		<tr>
			<!-- 
			<td><label>Rendicion Gastos</label></td>
			<td>
				<form:checkbox path="rendicionGastos" id="rendicionGastos" disabled="true"/>
			</td>
			 -->
			<td><label>Uso de la beca</label></td>
			<td>
				<!-- form:select path="detalleGastos" id="detalleGastos" disabled="true"-->
				<form:select path="detalleGastos" id="detalleGastos">
					<form:options items="${detalleGastos}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>	
			<td><label>Evolucion Mes Anterior</label></td>
			<td>
				<form:textarea path="evolucionMesAnterior" rows="4" cols="30" onkeypress="chequearLongitud(this);"/>
			</td>
		</tr>
		<tr>
			<td><label>Qu� se trabaj� en esta entrevista?</label></td>
			<td>
				<form:textarea path="logros" rows="4" cols="30" onkeypress="chequearLongitud(this);"/>
			</td>
			<!-- 
			<td><label>Dificultades</label></td>
			<td>
				<form:textarea path="dificultades" rows="4" cols="30" onkeypress="chequearLongitud(this);"/>
			</td>
			 -->
			<td><label>Proposito</label></td>
			<td>
				<form:textarea path="proposito" rows="4" cols="30" onkeypress="chequearLongitud(this);"/>
			</td>		
		</tr>
		<!--  ocultado el 11-02-2016
		<tr>
			<td><label>Compromiso RA con la escolaridad</label></td>
			<td>
				<form:select path="compromisoRA">
					<form:options items="${compromisosRA}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
			<td><label>Recomendaci�n estrategia complementaria</label></td>
			<td>
				<form:select path="estrategiaComp">
					<form:options items="${estrategiasComp}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>		
		-->	
		<tr>
			<td><label>Habilidades y/o contenidos</label></td>
			<td>
				<form:select path="contenidosAbordados" class="required">
					<form:options items="${contenidosAbordados}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
		</tr>
		<tr>
			<td><label>Objetivos A�o</label></td>
			<td>
				<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">
				<input type="hidden" name="estrategiaComp" id="estrategiaComp" value="5">
				<form:textarea path="objetivosAno" rows="4" cols="30" onkeypress="chequearLongitud(this);"/>
			</td>	
			<!-- ocultado el 11-02-2016 
			<td><label>Expectativas RA</label></td>
			<td>
				<form:textarea path="expectativasRA" rows="4" cols="30" onkeypress="chequearLongitud(this);"/>
			</td>
			-->
		</tr>
		
	</table>
</div>
<div id="fragment-4">
	<table>	
		<tr>
			<td><label>Destino Dinero de la Beca</label></td>
			<!-- ocultado el 11-02-2016
			<td>
				<form:select path="destinoDinero">
					<form:options items="${detalleGastos}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
			 -->
		
			<td><label>Situacion de Crisis</label></td>
			<td>
				<input type="hidden" id="destinoDinero" name="destinoDinero" value="13">
				<form:select path="situacionCrisis">
					<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
		</tr>
		<tr>
			<td><label>Evaluacion Cobro Beca</label></td>
			<td>
				<form:select path="evaluacionCobroBeca" id="evaluacionCobroBeca" onchange="habilitarMotivos(this)">
					<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
		</tr>
		<tr>
			<td><label>Motivo de Suspension</label></td>
			<td>
				<form:select path="motivoSuspension" id="motivoSuspension" disabled="true">
					<form:options items="${motivoSuspension}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
			<td><label>Motivo de Cesacion</label></td>
			<td>
				<form:select path="motivoCesacion" id="motivoCesacion" disabled="true">
					<form:options items="${motivoCesacion}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
		</tr>
		<tr>
			<td><label>Observaciones</label></td>
			<td>
				<form:textarea path="observacionesGenerales" rows="4" cols="60" onkeypress="chequearLongitud(this);"/>
			</td>
		</tr>
		<tr>
			<td class="datepicker1"><label>Fecha Proxima Entrevista</label></td>
			<td><form:input path="proximaEntrevista" id="datepicker1"/></td>
			<td><label>Lugar Proxima Entrevistas</label></td>
			<td>
				<form:select path="lugarProximaEntrevista">
					<form:options items="${lugarEntrevistas}" itemLabel="nombre" itemValue="id"/>				
				</form:select>
				<input id="idProxima" type="hidden" value="${entrevista.lugarProximaEntrevista.id}"/>
			</td>
		</tr>
		<tr>
			<td><label>Entrega Material</label></td>
			<td>
				<form:checkbox path="entregaMaterial"/>
			</td>
			<td><label>Paga Entrevista</label></td>
			<td>
				<form:checkbox path="pagaEntrevista"/>
			</td>
		</tr>
		<!--  
		<tr>
			<td><label>Estado de la entrevista</label></td>
			<td>
				<form:select path="estadoEntrevista">
					<form:options items="${estadoEntrevista}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
		</tr>
		-->	
	</table>					   
</div>