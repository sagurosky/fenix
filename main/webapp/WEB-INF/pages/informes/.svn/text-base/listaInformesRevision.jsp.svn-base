<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 80px;
		color: gray;
		font-style: italic; 
	}
	
	table#laTabla{
		 background-color: #C0C2FF;
		 border: 0;
	}
</style>
<script type="text/javascript">
$(function() {
	$("#padrino").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarPadrinosPorNombre.do?",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.padrinos, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							padrino: item.padrino
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idPadrino").val(ui.item.id);
			$("#padrino").text(ui.item.padrino);
		}
	});
});
</script>
 
<script type="text/javascript">
function enviarForm(action, id){
	
	if(action=='revisar')
	{
		document.forms['informeForm'].action = "../informes/revision.do";
	}
	else if(action == 'supervisar')
	{
		document.forms['informeForm'].action = "../informes/supervision.do";
	}
	document.forms['informeForm'].idInforme.value = id;
	document.forms['informeForm'].submit();
}
</script>
<script type="text/javascript">
function reloadInputs(){
	if(document.getElementById("padrino").value == ""){
		document.getElementById("idPadrino").value = "";
	}
}
</script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>

<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">	

</head>
<body onload="reloadInputs();">
<div id="main-content">
<br><br>
<center><h1>Lista de Informes a Supervisar o Actualizar</h1></center>
<br><br>
<form method="post" id="informeForm" name="informeForm" action="<c:url value="/informes/listaInformesSupervision.do"/>">
	<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">
	<table id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Ciclo:</td>
			<td align="left">
					 <select id="cicloId" name="cicloId" class="required"  style="width:150px;">
					 	<option value="0">Todos</option>
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
		</tr>
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Alumno:</td>
			<td align="left">
				<input id="alumno" width="150px;" type="text" name="nombreAlumno" value="${nombreAlumno}" />
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold;">Tipo de Informe:</td>
			<td align="left">
					 <select id="tipoInforme" name="tipoInforme" class="required"  style="width:260px;">
						<option value="0">Todos</option>
						<c:forEach var="tipo" items="${tiposInforme}">
							<c:if test="${tipoInformeId == tipo}">
								<option selected="selected" id="tipo" value="${tipo}">${tipo}</option>
							</c:if>
							<c:if test="${tipoInformeId != tipo}">
							<option id="tipo" value="${tipo}">${tipo}</option>
							</c:if>
						</c:forEach>
 					</select>
			</td>
		</tr>
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Padrino:</td>
			<td align="left">
				<input type="text" id="padrino" value="${padrino}" name="padrino" size="21" onkeyup="reloadInputs();">
				<input name="idPadrino" id="idPadrino" value="${idPadrino}" type="hidden">
			</td>
				<td align="left" style="font-size: 13px; font-weight: bold">Tipo de Padrino:</td>
			<td align="left">
					 <select id="tipoId" name="tipoId" class="required" style="width:150px;">
						<option value="0">Todos</option>
						<c:forEach var="tipo" items="${tipos}">
							<c:if test="${tipo.id == tipoId}">
								<option selected="selected" id="tipo" value="${tipo.id}">${tipo.valor}</option>
							</c:if>
							<c:if test="${tipo.id != tipoId}">
							<option id="tipo" value="${tipo.id}">${tipo.valor}</option>
							</c:if>
						</c:forEach>
 					</select>
			</td>	
		</tr>
		<tr align="center">
			<td colspan="4">
				<input align="middle" id="buscar" type="submit" value="Buscar" class="ui-state-default ui-corner-all" ></input>
			</td>
		</tr>
		
	</table>
	</fieldset>
	<br><br>
<CENTER style="width: 1100px;">
<c:set var="urlRegreso" value="/informes/listaInformesSupervision.do"></c:set>
<display:table class="displayTags_wrapper" export="true"  style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1000px; background-color: #C0C2FF;" id="informes" name="informes" requestURI="" pagesize="50" >  
	
    <display:column property="padrino"  headerClass="sortable" title="Padrino" />
    <display:column property="tipoPadrino"  headerClass="sortable" title="Tipo Padrino" />
	<display:column media="html" headerClass="sortable"  title="Apellido y Nombre del Alumno">
    ${informes.apellidoAlumno},${informes.nombreAlumno}
	</display:column>
	<display:column media="excel" property="nombreAlumno" ></display:column>
    <display:column media="excel" property="apellidoAlumno" ></display:column>
    <display:column property="tipoInforme" title="Tipo Informe" headerClass="sortable" />
    <display:column property="fechaCreacion"  headerClass="sortable" title="Fecha Creación" />
    <display:column property="estadoInforme"  headerClass="sortable" title="Estado Informe" />
    <display:column media="html"  headerClass="sortable" title="Acciones"  >
   	<table>
	<tr>
		<td><c:if test="${informes.estadoInforme == 'Revision' || informes.estadoInforme == 'Construccion'}">
			<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
				<a  onclick="enviarForm('revisar','${informes.id}')">
				<span class="ui-icon ui-icon-pencil" title="${informes.tipoInforme}"> 
				</span></a>
			</div>
			</c:if>
			<c:if test="${informes.estadoInforme == 'Supervisor'}">
			<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
				<a  onclick="enviarForm('supervisar','${informes.id}')">
				<span class="ui-icon ui-icon-pencil" title="${informes.tipoInforme}"> 
				</span></a>							
			</div>
			</c:if>
		</td>
	</tr>
	</table>
    </display:column>    
    <display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.item_name" value="informe" />  
    <display:setProperty name="paging.banner.items_names" value="informes" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
    <display:setProperty name="export.excel.filename" value="listaInformes.xls" />
    	
  	
</display:table>
<table align="center">
<tr>
<td>
<input align="middle" id="buscar" type="submit" value="Buscar" class="ui-state-default ui-corner-all" ></input>
</td>
</tr>
</table>
</CENTER>
<c:if test="${size != 0}">
	<input type="hidden" name="idInforme" value="${informes.id}"></input>
	<input type="hidden" name="urlRegreso" value="${urlRegreso}"></input>
</c:if>
</form>
</div>
<center>
</center>
</body>
</html>