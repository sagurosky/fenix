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
	input[name=search]{ 
	font-size: x-small;
	color: gray;
	font-style: italic; 
	}
	table#informe{  
	background-color: #C0C2FF;
	border: 0;
	}
</style>
<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.quicksearch.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">

<script type="text/javascript">

	function reloadInputs(){
		if(document.getElementById("zona").value == ""){
			document.getElementById("idZona").value = "";
		}

		if(document.getElementById("padrino").value == ""){
			document.getElementById("idPadrino").value = "";
		}
	}

	function enviarForm(action,idB, idE, nombre, cantidad){

		if(action=='enviar'){
			document.forms['informeForm'].action = "../envioInformes/enviar.do";
		}
		document.forms['informeForm'].idBeca.value = idB;
		document.forms['informeForm'].idEstado.value = idE;
		document.forms['informeForm'].nombreInforme.value = nombre;
		document.forms['informeForm'].cantidad.value = cantidad;
		document.forms['informeForm'].submit();
		$.blockUI();
	}

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


$(function() {
	$("#zona").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarZonaPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.zonas, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							zona: item.zona
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idZona").val(ui.item.id);
			$("#zona").text(ui.item.zona);
		}
	});
});

</script>

</head>
<body onload="reloadInputs();">
<div id="main-content">
<br><br>
<center><h3>Listado para el envío de informes de Padrinos Corporativos</h3></center>
<br><br>
<form onsubmit="reloadInputs();" method="post" id="form" name="form" action="<c:url value="/envioInformes/listaInformesCorporativos.do"/>">
<CENTER>

<!-- filtros -->
<fieldset style="font-size: 12px; margin-left: 47px; margin-right: 47px; width:995px;">
<table id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">

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
		<!--  Padrino -->
			<td align="left" style="font-size: 13px; font-weight: bold">Padrino:</td>
			<td align="left">
				<input type="text" id="padrino" name="padrino" value="${padrino}" size="21" maxlength="30" onkeyup="reloadInputs();">
				<input name="idPadrino" value="${idPadrino}"  id="idPadrino" type="hidden">
			</td>
		</tr>

		<tr align="center">
		<!-- Zona -->
			<td align="left" style="font-size: 13px; font-weight: bold">Zona:</td>
			<td align="left" >
				<input type="text" value="${zona}" id="zona" name="zona" size="21" onkeyup="reloadInputs();">
				<input name="idZona" value="${idZona}" id="idZona" type="hidden">
			</td>
		<!-- Tipo de Informe -->
			<td align="left" style="font-size: 13px; font-weight: bold">Tipo de Informe:</td>
			<td align="left">
					 <select id="tipoInforme" name="tipoInforme" class="required"  style="width:260px;">
						<option value="0">Todos</option>
						<c:forEach var="tipo" items="${tiposInforme}">
							<c:if test="${tipoInforme == tipo}">
								<option selected="selected" id="tipo" value="${tipo}">${tipo}</option>
							</c:if>
							<c:if test="${tipoInforme != tipo}">
							<option id="tipo" value="${tipo}">${tipo}</option>
							</c:if>
						</c:forEach>
 					</select>
			</td>
		</tr>

		<tr align="center">
		<!-- Estado Informe -->
			<td class="inicio" align="left" style="font-size: 13px; font-weight: bold">Estado Informe:</td>
			<td align="left">
			 <select id="estadoInforme" name="idEstadoInforme" class="required"> 
				<option value="0">Todos</option>
				<c:forEach var="estadoInforme" items="${estadoInforme}">
					<c:if test="${estadoInforme.id == 5 || estadoInforme.id == 6 || estadoInforme.id == 7}">	
						<c:if test="${estadoInforme.id == idEstadoInforme}">
							<option selected="selected" id="estadoInforme" value="${estadoInforme.id}">${estadoInforme.valor}</option>
						</c:if>
						<c:if test="${estadoInforme.id != idEstadoInforme}">
							<option id="estadoInforme" value="${estadoInforme.id}">${estadoInforme.valor}</option>
						</c:if>
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
	</CENTER>
<br><br>
<!-- fin - filtros -->
<CENTER style="width: 1300px;">
<display:table export="true" class="displayTags_wrapper" style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1200px; background-color: #C0C2FF;" uid="informe" name="informes" pagesize='50' defaultsort="1" defaultorder="ascending" requestURI="">  
		
		<display:column property="descripcionPadrino" style="width: 18%" headerClass="sortable" title="Padrino" maxLength="50" />  
	    <display:column property="beca.zona.nombre" style="width: 8%" headerClass="sortable" title="Zona" maxLength="30" />  
	    <display:column property="nombreInforme" style="width: 12%" headerClass="sortable" title="Tipo de Informe" maxLength="30" />  
	    <display:column property="estadoInforme.valor" style="width: 8%" headerClass="sortable" title="Estado Informe" maxLength="20" />
	    <display:column property="cantidad" style="width: 3%" headerClass="sortable" title="Cantidad" maxLength="20" />
	<table>
		<tr>
			<td>
				<display:column media="html" property="acciones" style="width: 6%" headerClass="sortable" title="Acciones" maxLength="20" />
			</td>
		</tr>
	</table>

    <display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.item_name" value="informe" />  
    <display:setProperty name="paging.banner.item_names" value="informes" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
    <display:setProperty name="export.excel.filename" value="informesPadrinosCorporativos.xls" />
</display:table>
</CENTER>
</form>
</div>
<form:form name="informeForm" method="post" commandName="informe">
<input type="hidden" name="idBeca" />
<input type="hidden" name="idEstado" />
<input type="hidden" name="nombreInforme" />
<input type="hidden" name="cantidad" />
</form:form>

<br><br>
</body>
</html>