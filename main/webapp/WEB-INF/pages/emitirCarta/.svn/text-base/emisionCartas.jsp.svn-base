<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="softek" uri="/softtek-fwk.tld"%>
 <%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">
<title>Emitir Carta</title>

<script type="text/javascript">
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

function enviarForm(){
	$(document).ready(function() {

		$('#botonGenerar').click( function() {
			//Hay que ver si se selecciono algun pago en alguna pagina o en la pagina actual
			if($(':checkbox:checked').length == 0){
				 jAlert('Alerta', 'Debe seleccionar al menos un alumno para la impresion de carta', 'Atencion!');
			}else{
				jConfirm('Se exportaran todas las cartas seleccionadas. Desea Continuar?', 'Confirmación', function(result){
				    if (result) {
				    	generarPdf();
				    	
				    } else {
				      return false;
				    }
				});
			}
		} );


		function generarPdf(){
			document.forms['form'].action = '<c:url value="impresionCarta.do"/>';
			$('#form').submit();
			document.forms['form'].action = '<c:url value="listaAlumnosCarta.do"/>';
			document.forms['form'].limpiarChks.value = 'true';
		}
	});
}
function habilitarInput(){
	if($('#zonaCimientos').val() != ''){
		$("#escuela").removeAttr('disabled');
	}
}
function validarFiltros(){
	
	if($('#alumno').val() == ''){
		$('#alumno').removeAttr('value');
	}
	if($('#escuela').val() == ''){
		$('#idEscuela').removeAttr('value');
	}
	if($('#zonaCimientos').val() == ''){
		$('#zonaCimientosId').removeAttr('value');
	}
	document.forms['form'].action="<c:url value='/emitirCarta/listaAlumnosCarta.do'/>";
	document.forms['form'].submit();
	
}
</script>



</head>

<body onload="habilitarInput()">
<div id="main-content">
<br>
<CENTER>



<form action ="<c:url value="listaAlumnosCarta.do"/>" method="post" id="form" name="form" >

<table style="margin-left: 0px; margin-right: 0px;">
<tr >
<td style="vertical-align: top">
<div >
<br>
<center><h3 align="center">Listado de cartas</h3></center>
</div>
<br>
<center>
<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">

<legend>Filtro de b&uacute;squeda</legend>

<table id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">
	 	<tr align="center">
			<tr align="center">
				<td align="left" style="font-size: 13px; font-weight: bold">Ciclo:</td>	
				<td align="left">
					 <select id="cicloId" name="cicloId" class="required"  style="width:150px;">
						<c:forEach var="ciclo" items="${ciclos}">
							<c:if test="${ciclo.id == cicloId}">
								<option selected="selected" id="ciclo" value="${ciclo.id}">${ciclo.nombre}</option>
							</c:if>
							<c:if test="${ciclo.id != cicloId}">
								<option id="ciclo" value="${ciclo.id}">${ciclo.nombre}</option>
							</c:if>
						</c:forEach>
 					</select>
				</td>
				<td align="left" style="font-size: 13px; font-weight: bold">Alumno:</td>
				<td align="left">
					<input id="alumno" width="auto;" type="text" name="nombreAlumno" value="${nombreAlumno}" />
				</td>
				
			</tr>				
			<tr align="center">
				<td align="left" style="font-size: 13px; font-weight: bold">Zona Cimientos:</td>
				<td align="left">
						<input type="hidden" name="idZonaCimientos" id="zonaCimientosId" value="${zonaCimientos.id}" />
						<input type="text" id="zonaCimientos" value="${zonaCimientos.nombre}"  />
				</td>
			
				<td align="left" style="font-size: 13px; font-weight: bold">Escuela:</td>
				<td align="left">
					<input type="hidden" name="idEscuela" 	id="idEscuela" value="${escuela.id}"/>
					<input id="escuela" type="text"  width="auto;" name="escuela"  value="${escuela.nombre}" disabled="disabled"/>
				</td>
			</tr>
			<tr align="center">	
				<td align="left" style="font-size: 13px; font-weight: bold">Estado Alumno:</td>
				<td align="left">
					<select name="idEstadoAlumno" id="estados"  >
						<option value="0">Todos</option>
						<c:forEach items="${listEstadoAlumnos}" var="estado1">
							<c:choose>
								<c:when test="${estado.id == estado1.id}">
									<option value="${estado.id}" selected="selected">${estado1.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${estado1.id}" >${estado1.valor}</option>
								</c:otherwise>
							</c:choose>
			
						</c:forEach>
					</select>
				
				</td>
				<td align="left" style="font-size: 13px; font-weight: bold">Emision Carta:</td>
				<td align="left">
						<select 	name="idEmisionCarta" id="idEmisionCarta"  >
					<option value="0">Todos</option>
					<c:forEach items="${listEmitioCarta}" var="emitioCarta1">
						<c:choose>
							<c:when test="${emitioCarta.id == emitioCarta1.id}">
								<option value="${emitioCarta.id}" selected="selected">${emitioCarta.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${emitioCarta1.id}" >${emitioCarta1.valor}</option>
							</c:otherwise>
						</c:choose>
		
					</c:forEach>
				</select>
		
				</td>
			</tr>
			
		</tr>
		<tr align="center">
			<td align="center" style="font-size: 13px; font-weight: bold"></td>
				<td align="right">
					<br>
					<input align="middle" id="buscar" type="button" value="Buscar" onclick="validarFiltros()" class="ui-state-default ui-corner-all" ></input>
				</td>
		
		</tr>
</table>
</fieldset>
<br><br>
</center>

<display:table name="sessionScope.listaAlumnos" form="form"  export="true" class="displayTags_wrapper" id="listaAlumnos" sort="external"
			decorator="org.cimientos.intranet.utils.paginacion.CartasCheckboxDecorator" uid="dtos"
			excludedParams="_chk limpiarChks nombreAlumno idZonaCimientos idEscuela idEstadoAlumno idEmisionCarta cicloId page sort dir" style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1000px; background-color: #C0C2FF;"  pagesize="50" defaultsort="50" defaultorder="ascending" 
			requestURI="/emitirCarta/listaAlumnosCarta.do" >
  	<display:column media="html" title="Seleccion" style="width: 4%"  property="checkbox" >
  	</display:column>  
  	<display:column  title="Nombre" >
  		${dtos.datosPersonales.apellido},${dtos.datosPersonales.nombre}
  	</display:column>
  	 <display:column property="escuela.nombre" title="Escuela" >
  	 </display:column>  
    <display:column property="escuela.localidad.zona.nombre" title="Zona" />
    <display:column  property="estadoAlumno.valor"   title="Estado Alumno" />
    <display:column  property="emitioCarta.valor" title="Emision Carta"  > </display:column>
    
    <display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.item_name" value="Emision Carta" />  
    <display:setProperty name="paging.banner.item_names" value="Emision Carta" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
	<display:setProperty name="export.excel.filename" value="emisionCarta.xls" />	
   	
</display:table>
<input name="page" type="hidden" value="${page}"/>
<input name="sort" type="hidden" value="${sort}"/>
<input name="dir" type="hidden" value="${dir}"/>		
<br><br>	
<div  >
	<table align="center">
		<tr>
			<td align="center">
				<input type="button" value="Imprimir Cartas" id="botonGenerar" class="ui-state-default ui-corner-all"  onclick="enviarForm()" />
				<input type="button" value="Ver lista actualizada" class="ui-state-default ui-corner-all"	 onclick="location.href='../emitirCarta/listaAlumnosCarta.do'; return false;" />
			</td>
			
		</tr>
	</table>
</div>
<input value="false" type="hidden" id="limpiarChks" name="limpiarChks">
</td>
</tr>
</table>
</form>
	
</CENTER>	
</div>
</body>
</html>