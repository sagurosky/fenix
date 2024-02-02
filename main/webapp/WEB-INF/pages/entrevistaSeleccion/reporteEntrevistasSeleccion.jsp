<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="softek" uri="/softtek-fwk.tld"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">

<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.datepicker-es.js"/>"></script>

<!--<style type="text/css">-->
<!--table#exportacion{  -->
<!--	background-color: #C0C2FF;-->
<!--	border: 0;-->
<!--	}-->
<!--select {-->
<!--	width: 148px;-->
<!--}		-->
<!--</style>-->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte Entrevista Selecci&oacute;n</title>

<script>
	$(document).ready( function() {
		$("#fechaDesde").datepicker({changeMonth: true, changeYear: true, yearRange:'-5:+1' });
		$("#fechaHasta").datepicker({changeMonth: true, changeYear: true, yearRange:'-5:+1' });
	})		
</script>


<script type="text/javascript">
$(function() {
	$("#convocatoria").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarConvocatoriaPorZonaYNombre.do?idZona=" + $("#zonaCimientosId").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.json, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							ea: item.nombre
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idConvocatoria").val(ui.item.id);
			$("#convocatoria").text(ui.item.nombre);
		}
	});
});
$(function() {

	$("#zonaCimientos").keypress(function(){
		$("#zonaCimientosId").val(0);
		$("#zonaCimientos").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarZonaPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.zonas, function(item) {
							return {
								label: item.nombre,
								value: item.nombre,
								id: item.id
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#zonaCimientosId").val(ui.item.id);
				$("#convocatoria").removeAttr('disabled');
				$("#escuela").removeAttr('disabled');
			}
		});
	});

});
$(function() {
	$("#escuela").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEscuelaSeleccionNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxResults: 12,
					name_startsWith: request.term,
					idZona:$("#zonaCimientosId").val()
				},
				success: function(data) {
					response($.map(data.escuelas, function(item) {
						return {
							label: item.nombre , 
							value: item.nombre,
							id:item.id
							
						}
					}))
				}
			})
		},
		select: function(event, ui) {
			$("#idEscuela").val(ui.item.id);
		}
	});
});
</script>
	
<script type="text/javascript">

function habilitarInput(){
	if($('#zonaCimientos').val() != ''){
		$("#convocatoria").removeAttr('disabled');
		$("#escuela").removeAttr('disabled');
	}
}
function validarFiltros(){
	
	if($('#convocatoria').val() == ''){
		$('#idConvocatoria').removeAttr('value');
	}
	if($('#alumno').val() == ''){
		$('#alumno').removeAttr('value');
	}
	if($('#escuela').val() == ''){
		$('#idEscuela').removeAttr('value');
	}
	if($('#zonaCimientos').val() == ''){
		$('#zonaCimientosId').removeAttr('value');
	}
	document.forms['form'].action = "<c:url value='/entrevistaSeleccion/reporteEntrevistaSeleccion.do'/>";
	
	document.forms['form'].submit();
	
}
function enviarForm(action,id){
	document.forms['form'].idEntrevista.value = id;
	if(action=='ver'){
		document.forms['form'].accion.value = "ver";
		document.forms['form'].action ="<c:url value='/entrevistaSeleccion/detalleEntrevistaSeleccion.do?isDetalleEntrevista=true'/>";
		document.forms['form'].submit();
	}
	else if(action=='eliminar'){
		jConfirm('¿Está seguro que quiere eliminar la entrevista de seleccion de este becado/a?', 'Confirmación', function(result){
		    if (result) {
		    	document.forms['form'].action ="<c:url value='/entrevistaSeleccion/eliminarEntrevistaSeleccion.do'/>";
				document.forms['form'].submit();
		    	$.blockUI();
		    }
		 	else {
		      return false;
			}
		});		
	}
	if(action=='modificar'){
		
		document.forms['form'].accion.value = "modificar";
		document.forms['form'].action ="<c:url value='/entrevistaSeleccion/detalleEntrevistaSeleccion.do?isDetalleEntrevista=false'/>";
		document.forms['form'].submit();
	}

}

function exportarForm(){
	
		jConfirm('Esta tarea puede tomar varios minutos, deseas continuar?', 'Confirmación', function(result){
		    
			if (result) {
		    	//document.forms['formEx'].idCicloNuevo.value = $('#cicloNuevoId').val();
				
				document.forms['form'].action ="<c:url value='/entrevistaSeleccion/exportarEntrevistaSeleccion2.do'/>";
				//document.forms['form'].action ="<c:url value='/entrevistas/entrevistaSeleccion/EntrevistaSeleccionExcelView'/>";
				document.forms['form'].submit();							
		    	
			} 
			else{
			      return false;
			}
		});
	
}

</script>
</head>

<body onload="habilitarInput()">
<div id="main-content">
<br><br>
<center><h3>Reporte Entrevistas Selecci&oacute;n</h3></center>
<br><br>

<form method="post"  id="form" name="form" action="<c:url value='/entrevistaSeleccion/reporteEntrevistaSeleccion.do'/>">
<input type="hidden"  name="idEntrevista" id="idEntrevista">
<input type="hidden"  name="accion" id="accion">
<center>
<fieldset style="font-size: 12px; margin-left: 50px; margin-right: 50px; width:1100px;">

<legend>Filtro de b&uacute;squeda</legend>

<table id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">
	 	<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold;" >Ciclos:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
			<td align="left">
				<select name="idCiclo" id="ciclo">
					<option value="0">Todos</option>
					<c:forEach items="${listaCiclos}" var="ciclo1">
						<c:choose>
							<c:when test="${ciclo.id == ciclo1.id}">
								<option value="${ciclo1.id}" selected="selected">${ciclo1.nombre}</option>
							</c:when>
							<c:otherwise>
								<option value="${ciclo1.id}" >${ciclo1.nombre}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">Zona Cimientos:</td>
			<td align="left">
				<input type="hidden" name="idZonaCimientos" id="zonaCimientosId" value="${zonaCimientos.id}"/>
				<input type="text" name="zonaCimientos" id="zonaCimientos" value="${zonaCimientos.nombre}"/>
			</td>
			</tr>
			
			<tr align="center">
				<td align="left" style="font-size: 13px; font-weight: bold">Escuela:</td>
				<td align="left">
					<input type="hidden" name="idEscuela" 	id="idEscuela" value="${escuela.id}"/>
					<input id="escuela" type="text" name="escuela"  value="${escuela.nombre}" disabled="disabled"/>
				</td>
				<td align="left" style="font-size: 13px; font-weight: bold">Año Escolar</td>
				<td align="left">
					<select 	name="idAnioEscolar" id="idAnioEscolar"  >
					<option value="0">Todos</option>
					<c:forEach items="${listaAnioEscolar}" var="anioEscolar1">
						<c:choose>
							<c:when test="${anioEscolar.id == anioEscolar1.id}">
								<option value="${anioEscolar.id}" selected="selected">${anioEscolar1.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${anioEscolar1.id}" >${anioEscolar1.valor}</option>
							</c:otherwise>
						</c:choose>
		
					</c:forEach>
				</select>
				</td>
			</tr>
				
			<tr align="center">
				<td align="left" style="font-size: 13px; font-weight: bold">Alumno:</td>
				<td align="left">
					<input id="alumno" type="text" name="nombreAlumno" value="${nombreAlumno}" />
				</td>
				<td align="left" style="font-size: 13px; font-weight: bold;" >Estado Alumno Entrevista:</td>
				<td align="left">
				<select style="width: 200px;" name="idEstadoAlumno" id="estados">
					<option value="0">Todos</option>
					<c:forEach items="${listEstadoAlumnos}" var="estado1">
						<c:choose>
							<c:when test="${estado.id == estado1.id}">
								<option value="${estado.id}" selected="selected">${estado1.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${estado1.id}">${estado1.valor}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select>
				</td>
			</tr>
			
			<tr align="center">	
				<td align="left" style="font-size: 13px; font-weight: bold">Convocatoria:</td>
				<td align="left">
					<input type="hidden" name="idConvocatoria" id="idConvocatoria" 	value="${convocatoria.idConvocatoria}" />
					<input type="text" id="convocatoria" value="${convocatoria.nombre}" disabled="disabled" />
				</td>
			
				
				<td align="left" style="font-size: 13px; font-weight: bold">EAE:</td>
				<td align="left">
					<select name="eae" id="eae" style="width:150px;">
					<c:choose>
						<c:when test="${eae == '6/6'}">
							<option value="todos">Todos</option>
							<option value="6/6" selected="selected">6/6</option>
							<option value="7/5">7/5</option>
						</c:when>
						<c:when test="${eae == '7/5'}">
							<option value="todos">Todos</option>
							<option value="6/6">6/6</option>
							<option value="7/5" selected="selected">7/5</option>
						</c:when>
						<c:otherwise>
							<option value="todos" selected="selected">Todos</option>
							<option value="6/6">6/6</option>
							<option value="7/5">7/5</option>
						</c:otherwise>
					</c:choose>
					</select>						
				</td>
			</tr>
			<tr align="center">
				<td align="left" width="500" style="font-size: 13px; font-weight: bold">Fecha Creacion Desde:</td>
				<td align="left" width="300">
	        		<input name="fechaDesde" id="fechaDesde" class="text-input date" value="<fmt:formatDate value="${fechaDesde}" pattern="dd/MM/yyyy"/>" />dd/mm/aaaa
	        	</td>
	
				<td align="left" width="300" style="font-size: 13px; font-weight: bold">Fecha Creacion Hasta:</td>
				<td align="left" width="300">
	        		<input name="fechaHasta" id="fechaHasta" class="text-input date" value="<fmt:formatDate value="${fechaHasta}" pattern="dd/MM/yyyy"/>" />dd/mm/aaaa
	        	</td>
			</tr>
			<tr align="center">
				<td align="center" style="font-size: 13px; font-weight: bold"></td>
				<td align="right">
					<br>
					<input align="middle" id="buscar" type="button" value="Buscar" onclick="validarFiltros()" class="ui-state-default ui-corner-all" ></input>
				</td>
				<td align="right">
					<br>
					<input align="middle" id="exportar" type="button" value="Exportación Especial" onclick="exportarForm()" class="ui-state-default ui-corner-all" ></input>
				</td>
					
			</tr>
</table>
</fieldset>
</center>
<br><br>
<CENTER style="width:1200px;">
<display:table class="displayTags_wrapper" export="true" style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1100px; background-color: #C0C2FF;"  id="dto"  name="entrevistas" pagesize="50" defaultsort="50" defaultorder="ascending" requestURI="" >
	<display:column property="nombreCiclo" title="Ciclo"  ></display:column>
	<display:column property="perfilAlumno.escuelaSeleccion.zonaCimientos.nombre" title="Zona"  ></display:column>
	<display:column property="perfilAlumno.escuelaSeleccion.nombre" style="width: 15%"  title="Escuela" ></display:column>
	<display:column property="perfilAlumno.anioEscolar.valor" title="Año Escolar" ></display:column>
	<display:column property="perfilAlumno.eae" title="E.A.E." ></display:column>
	<display:column  title="Alumno" >
	 ${dto.perfilAlumno.datosPersonales.apellido},${dto.perfilAlumno.datosPersonales.nombre}
	</display:column>
	<display:column property="perfilAlumno.datosPersonales.dni" title="DNI" ></display:column>
	
	<display:column title="Estado Alumno" >
		<c:if test="${dto.perfilAlumno.estadoAlumno.valor == 'En condiciones de renovar'}">
			En condiciones de renovar
		</c:if>
		<c:if test="${dto.perfilAlumno.estadoAlumno.valor == 'Pendiente'}">
			Pendiente
		</c:if>
		<c:if test="${dto.perfilAlumno.estadoAlumno.id != 20 && dto.perfilAlumno.estadoAlumno.id != 22}">
			${dto.perfilAlumno.estadoAlumno.valor}
		</c:if>	
	</display:column>
	
	<display:column property="nombrePeriodo" title="Periodo de Asignacion"  sortProperty="nombrePeriodo" sortable="true" headerClass="sortable"></display:column>
	<display:column title="Fecha de carga de Entrevista" sortProperty="fechaCargaEntrevista" sortable="true" headerClass="sortable" >
	<fmt:formatDate value='${dto.fechaCargaEntrevista}' pattern='dd/MM/yyyy'/>
	</display:column>
	<display:column property="convocatoria.nombre" title="Convocatoria" ></display:column>
	<display:column title="Ingresa con excepción" >
		
		${dto.excepcion}
	</display:column>
	<display:column title="Situación Escolar Año Anterior" >
		
		${dto.situacionEscolarAnioAnterior}
	</display:column>
	<display:column  title="Acciones" media="html" >
		<table>
			<tr>								
				<td>
					<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Detalle entrevista de selección">
						<a onclick="enviarForm('ver','${dto.id }')">
							<span class="ui-icon ui-icon-search"></span>
						</a>				
					</div>
				</td>
				<sec:authorize access="hasRole('SuperUsuario')">
					<td>
						<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Editar entrevista de selección">
							<a onclick="enviarForm('modificar','${dto.id }')">
								<span class="ui-icon ui-icon-pencil"></span>
							</a>				
						</div>
					</td>
					<td>
						<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Eliminar entrevista de selección">
							<a onclick="enviarForm('eliminar','${dto.id }')">
								<span class="ui-icon ui-icon-trash"></span>
							</a>				
						</div>
					</td>
				</sec:authorize>
			</tr>
		</table>		
	</display:column>
 	<display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.item_name" value="Reporte Entrevista Seleccion" />  
    <display:setProperty name="paging.banner.item_names" value="Reporte Entrevista Seleccion" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
    <display:setProperty name="export.excel.filename" value="Reporte_Entrevista_Seleccion.xls" />	
 
    	
   
</display:table>										
</CENTER>	
</form>

<br><br>

</div>
</body>
</html>