<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Encuentro Grupal ::..</title>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
	<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script> 
<script type="text/javascript">
	$(function() {
		$("#grupal").validate();
		$('#fecha').datepicker({
			changeMonth: true,
			changeYear: true,
		 	yearRange:'-1:+1'
		});
	});
</script>
 <script>
 function chequearLongitud(obj){
		if (obj.value.length > 10000) {
		obj.value = obj.value.substring(0, 10000);
		}
	}
 </script>
 <script type="text/javascript">
$(function() {
	 
	$("#escuela").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEscuelaPorEA.do?idEA=" + $("#idEA").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.escuelas, function(item) {
						return {
							label: item.labelEscuelaZona,
							value: item.labelEscuelaZona,
							id: item.id
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#lugarE").val(ui.item.id);
		}
	});



});

</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>  
 
</head>
<body>
<div id="main-content">

	<h1 id="titulo-informe">Alta Encuentro Grupal</h1>

<form id="grupal" class="cmxform" action="<c:url value='/entrevistas/guardarGrupal.do' />" method="post">
	<table align="left" id="table-informe">
		
		<tr>
			<td>
				<b>Estudiantes:</b>
				<ol>
					<c:forEach items="${alumnos}" var="a">
						<li><b>&nbsp;${a.datosPersonales.nombre}&nbsp;${a.datosPersonales.apellido}</b></li>
					</c:forEach>
				</ol>
			</td>
		</tr>
		<tr>
			<td>
				<b>Otros Participantes:</b><br>
					
					<c:if test="${op1=='RA'}">
						<input type="checkbox" name="op1" id="op1" value="RA" checked="checked"> RA<br>
					</c:if>
					<c:if test="${op1==null}">
						<input type="checkbox" name="op1" id="op1" value="RA"> RA<br>
					</c:if>							
					<c:if test="${op2!=null}">
						<input type="checkbox" name="op2" id="op2" value="Invitado Externo" checked="checked"> Invitado Externo<br>
					</c:if>
					<c:if test="${op2==null}">
						<input type="checkbox" name="op2" id="op2" value="Invitado Externo"> Invitado Externo<br>
					</c:if>
					<c:if test="${op3!=null}">
						<input type="checkbox" name="op3" id="op3" value="Referentes Escolares" checked="checked"> Referentes Escolares<br>
					</c:if>
					<c:if test="${op3==null}">
						<input type="checkbox" name="op3" id="op3" value="Referentes Escolares" > Referentes Escolares<br>
					</c:if>
					<c:if test="${op5!=null}">
						<input type="checkbox" name="op5" id="op5" value="Padrinos" checked="checked"> Padrinos<br>
					</c:if>
					<c:if test="${op5==null}">
						<input type="checkbox" name="op5" id="op5" value="Padrinos" > Padrinos<br>
					</c:if>
					<c:if test="${op6!=null}">
						<input type="checkbox" name="op6" id="op6" value="Egresados" checked="checked"> Egresados<br>
					</c:if>
					<c:if test="${op6==null}">
						<input type="checkbox" name="op6" id="op6" value="Referentes Escolares" > Egresados<br>
					</c:if>
					<c:if test="${op4!=null}">
						<input type="checkbox" name="op4" id="op4" value="Otro" checked="checked"> Otro
					</c:if>
					<c:if test="${op4==null}">
						<input type="checkbox" name="op4" id="op4" value="Otro" > Otro
					</c:if>
			</td>
		</tr>	
		<tr>
			<td><b>Indicar Otro Participante</b>	
				<input type="text" name="op" id="op" value="${op}">
			</td>
		</tr>		

		<c:if test="${periodo != null}">
			<tr>		
				<td><b>Mes del Encuentro Grupal</b></td>
				<td>
					<b>${periodo.nombre}</b>
				</td>
			</tr>
		</c:if>
		<tr>
			<td><b>Fecha Realizaci&oacuten</b></td>
			<td>${fecha}		
				<input id="fecha" name="fecha" class="date required" value="${fecha}"/>
			</td>
		</tr>
		<tr>
			<td><b>Escuela</b></td>
			<td>	
				<input type="text" id="escuela" size="39" class="required" />
				<input type="hidden" class="required" id="lugarE" name="lugarE"></input>
			</td>
		</tr>
		<tr>
			<td><b>Tipo de encuentro</b></td>
			<td>
				<select id="tipoEncuento" name="tipoEncuentro">
					<option value="0">Seleccionar</option>
					<option value="Grupal en Escuela">Grupal en Escuela</option>				
					<option value="Visita a Empresa">Visita a Empresa</option>
					<option value="Visita a Universidad">Visita a Universidad</option>
					<option value="Salida recreativa">Salida Recreativa</option>					
					<option value="Otro">Otro</option>
				</select>
			</td>
		</tr>
		
		
								
		<tr>
			<td><b>Objetivo del encuentro y Actividad Implementada</b></td>
			<td>						   
				<textarea rows="10" cols="50" name="objetivo" id="objetivo" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" placeholder="La información registrada aquí aparecerá en entrevista mensual de cada becado en el campo Objetivo del encuentro y actividad implementada + Observaciones del estudiante"></textarea>
			</td>
		</tr>
		
		<tr>
			<td nowrap="nowrap"><label>Principal HSE trabajada &nbsp;&nbsp;</label></td>
			<td>	
				<select  name="hsTrabajarAño" id="hsTrabajarAño" style='width:auto' class="form-control"> 
					<c:choose>
			 			<c:when test="${entrevista.hsTrabajarAño == 'Autoconcepto'}">
			   				<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Autoconcepto" selected="selected">Autoconcepto</option>
							<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
							<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
							<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
					    	<option Value="Toma de decisiones">Toma de decisiones</option>
					    	<option Value="Otra">Otra</option>				    	  						    
					    </c:when>	
					    <c:when test="${entrevista.hsTrabajarAño == 'Planificación y organización del tiempo'}">
			   				<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Autoconcepto" >Autoconcepto</option>
							<option Value="Planificación y organización del tiempo" selected="selected">Planificación y organización del tiempo</option>									
							<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
							<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
					    	<option Value="Toma de decisiones">Toma de decisiones</option>
					    	<option Value="Otra">Otra</option>				    	  						    
					    </c:when>	
					    <c:when test="${entrevista.hsTrabajarAño == 'Relaciones interpersonales'}">
			   				<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Autoconcepto">Autoconcepto</option>
							<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
							<option Value="Relaciones interpersonales"  selected="selected">Relaciones interpersonales</option>
							<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
					    	<option Value="Toma de decisiones">Toma de decisiones</option>
					    	<option Value="Otra">Otra</option>				    	  						    
					    </c:when>	
					    <c:when test="${entrevista.hsTrabajarAño == 'Responsabilidad y autonomía'}">
			    				<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Autoconcepto">Autoconcepto</option>
							<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
							<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
							<option Value="Responsabilidad y autonomía" selected="selected">Responsabilidad y autonomía</option>								
					    	<option Value="Toma de decisiones">Toma de decisiones</option>
					    	<option Value="Otra">Otra</option>				    	  						    
					    </c:when>	
					    <c:when test="${entrevista.hsTrabajarAño == 'Toma de decisiones'}">
			    				<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Autoconcepto">Autoconcepto</option>
							<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
							<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
							<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
					    	<option Value="Toma de decisiones" selected="selected">Toma de decisiones</option>
					    	<option Value="Otra">Otra</option>				    	  						    
					    </c:when>					    
					    <c:when test="${entrevista.hsTrabajarAño == 'Otra'}">
			    				<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Autoconcepto">Autoconcepto</option>
							<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
							<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
							<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
					    	<option Value="Toma de decisiones" >Toma de decisiones</option>
					    	<option Value="Otra" selected="selected">Otra</option>				    	  						    
					    </c:when>
					   	<c:otherwise>
					    	<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Autoconcepto">Autoconcepto</option>
							<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
							<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
							<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
					    	<option Value="Toma de decisiones">Toma de decisiones</option>
					    	<option Value="Otra">Otra</option>		
					    </c:otherwise>		
					</c:choose>
				</select>
			</td>
		</tr>
		
		<tr>
			<td nowrap="nowrap"><label>&nbsp;&nbsp;Otra&nbsp; &nbsp;</label></td>										
			<td>	
				<textarea  class="form-control" name="observacionesGenerales" id="observacionesGenerales" rows="4" style="width:270px"></textarea>
			</td>		
		</tr>
		<tr>
			<td nowrap="nowrap"><label>Principales Contenidos trabajados &nbsp;&nbsp;</label></td>
			<td>
				<form:select path="contenidosTrabajarEnElAnio" style='width:auto' class="form-control" multiple="multiple" id="contenidosTrabajarEnElAnio" name="contenidosTrabajarEnElAnio">
					<form:options items="${contenidosTrabajarEnElAnio}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</td>
		</tr>		
		<tr>	
			<td nowrap="nowrap"><label>Otro contenido trabajado &nbsp;&nbsp;</label></td>										
			<td>	
				<textarea  class="form-control" name="motivoInasistencia" id="motivoInasistencia" rows="4" style="width:270px"></textarea>				
			</td>
		</tr>	
				
		
		
		
		<tr>
			<td><b>Evaluación General del Encuentro</b></td>
			<td>						   
				<select id="temas" name="temas">
					<option value="0">Seleccionar</option>
					<option value="Malo">Malo</option>				
					<option value="Regular">Regular</option>
					<option value="Bueno">Bueno</option>
					<option value="Muy Bueno">Muy Bueno</option>
					<option value="Excelente">Excelente</option>					
				</select>
			</td>
		</tr>
		<tr>
			<td><b>Observaciones generales</b></td>
			<td>						   
				<textarea rows="4" cols="30" name="observaciones" id="observaciones" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"></textarea>
			</td>
		</tr>
		<tr>
			<td align="center">
				<br>
				<button type="submit" class="btn btn-primary">Guardar</button>
			</td>
			<td align="left">
				<br>
				<button type="submit" class="btn btn-primary" onclick="location.href='../entrevistas/listarBecados.do'; return false;">Volver</button>
			</td>
		</tr>
	</table>
	<br><br><br>
	<input type="hidden" id="alumnosSeleccionados" name="alumnosSeleccionados" value="${alumnosSeleccionados}"/>
</form>
<input id="idEA" type="hidden" value="${idEA}"/>
</div>
</body>
</html>