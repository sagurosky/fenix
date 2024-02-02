<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@taglib prefix="display" uri="http://displaytag.sf.net"%>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	input[name=search]{	
		font-size: x-small;
		width: 90px;
		color: gray;
		font-style: italic;
	}
	table#cuenta{  
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
<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Informe Cuentas</title>
<script type="text/javascript">
$(document).ready(function() {			  
	$('#buscar').click( function() {
		document.forms['form'].action = '<c:url value="verInformeCuentas.do"/>';
		document.forms['form'].submit();
   // 	$.blockUI();
	} ); 
} );

function enviarForm(accion,id){
	if(accion == 'modificar'){		
		jConfirm('Esta seguro de que desea modificar el estado de la cuenta del Titular seleccionado?', 'Confirmación', function(result){
		    if (result) {
				document.forms['form'].action = '<c:url value="moficarEstadoCuenta.do"/>';
				document.forms['form'].idRA.value = id;
				document.forms['form'].submit();
		    	$.blockUI();							
		    }
		 	else {
		      return false;
			}
		});
	}
	else{		
		document.forms['fallidoForm'].submit();
    	$.blockUI();
	}
}

function reloadInputs(){
	if(document.getElementById("zona").value == ""){
		document.getElementById("rr").disabled = true;
		document.getElementById("rr").value = "";
		document.getElementById("idRR").value = "";
		document.getElementById("idZona").value = "";
	}
	if(document.getElementById("rr").value == ""){
		document.getElementById("idRR").value = "";
	}
}
	
	function showFallidoDialog(id, tipoPersona){
		document.forms['fallidoForm'].id.value = id;
		document.forms['fallidoForm'].tipoPersona.value = tipoPersona;
		document.forms['fallidoForm'].idBanco.value = document.forms['form'].idBanco.value;
		document.forms['fallidoForm'].becado.value = document.forms['form'].becado.value;
		document.forms['fallidoForm'].titular.value = document.forms['form'].titular.value;
		document.forms['fallidoForm'].zona.value = document.forms['form'].zona.value;
		document.forms['fallidoForm'].idZona.value = document.forms['form'].idZona.value;
		document.forms['fallidoForm'].rr.value = document.forms['form'].rr.value;
		document.forms['fallidoForm'].estadoCuenta.value = document.forms['form'].estadoCuenta.value;
		document.forms['fallidoForm'].dniTitular.value = document.forms['form'].dniTitular.value;
		//alert(document.forms['fallidoForm'].idTipoCuenta.value);
		$( "#fallidoForm" ).dialog({
			title: "Notificar cuenta fallida",
			resizable: false,
			width: 450,
			height:280,
			modal: true,
			buttons: {
				"Notificar Fallido": function() {
					$( this ).dialog( "close" );
					enviarForm('fallido');
				},
				"Cancelar": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
	}
	
	function validarEntero(campo, valor){ 
		if (isNaN(valor)) { //Compruebo si es un valor numérico 
			$('#' + campo).val(" "); //entonces (no es numero) borro el numero 
		}
		else{
			$('#' + campo).val(valor);
		}
	}
</script>

<script type="text/javascript">
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
			$("#rr").removeAttr('disabled');
			$("#idZona").val(ui.item.id);
			$("#zona").text(ui.item.zona);
		}
	});

	$("#rr").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarRRPorNombreYZona.do?idZona=" + $("#idZona").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.rrs, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							rr: item.rr
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idRR").val(ui.item.id);
			$("#rr").text(ui.item.rr);
		}
	});
});

</script>
</head>
<!-- filtros -->

<body onload="reloadInputs();">
<div id="main-content">
<br><br>
<center><h3>Informe de Cuentas</h3></center>
<br><br>
<form onsubmit="reloadInputs();" method="post" id="form" name="form" action="<c:url value="/cuenta/verInformeCuentas.do"/>">
		<input type="hidden" name="idRA" id="idRA">
<fieldset style="font-size: 12px; margin-left: 50px; margin-right: 50px; width:980px;">
<table id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">

<!-- becado, titular, zona, rr y estado cuenta. -->

		<tr align="center">
		<!-- Banco -->
			<td class="inicio" align="left" style="font-size: 13px; font-weight: bold">Banco:</td>
			<td align="left">
			 <select id="banco" name="idBanco" class="required"> 
				<option value="0">Todos</option>
				<c:forEach var="banco" items="${bancos}">
					<c:if test="${banco.id == idBanco}">
						<option selected="selected" id="banco" value="${banco.id}">${banco.nombre}</option>
					</c:if>
					<c:if test="${banco.id != idBanco}">
						<option id="banco" value="${banco.id}">${banco.nombre}</option>
					</c:if>
				</c:forEach>
			</select>
			</td>
		
            <!--  Becado  -->
			<td align="left" style="font-size: 13px; font-weight: bold">Becado:</td>
			<td align="left">
				<input type="text" value="${becado}" name="becado" id="becado" maxlength="30" size="21">
			</td>
		</tr>

		<tr align="center">
			<!--  Titular -->
			<td align="left" style="font-size: 13px; font-weight: bold">Titular:</td>
			<td align="left">
				<input type="text" value="${titular}" id="titular" name="titular" size="21" maxlength="30">
			</td>
		
			<!-- Zona -->
			<td align="left" style="font-size: 13px; font-weight: bold">Zona:</td>
			<td align="left" >
				<input type="text" value="${zona}" id="zona" name="zona" size="21" onkeyup="reloadInputs();">
				<input name="idZona" value="${idZona}" id="idZona" type="hidden">
			</td>
		</tr>	

		<tr align="center">
			<!-- Estado Cuenta -->
			<td align="left" style="font-size: 13px; font-weight: bold">Estado Cuenta:</td>
			<td align="left">
			 <select id="estadoCuenta" name="idEstadoCuenta" class="required" style="width:150px;">
				<option value="0">Todos</option>
				<c:forEach var="estadoCuenta" items="${estadoCuentas}">
					<c:if test="${estadoCuenta.id == idEstadoCuenta}">
						<option selected="selected" id="estadoCuenta" value="${estadoCuenta.id}">${estadoCuenta.valor}</option>
					</c:if>
					<c:if test="${estadoCuenta.id != idEstadoCuenta}">
					<option id="ciclo" value="${estadoCuenta.id}">${estadoCuenta.valor}</option>
					</c:if>
				</c:forEach>
				</select>
			</td>
			
			<!--  RR -->
			<td align="left" style="font-size: 13px; font-weight: bold">RR:</td>
			<td align="left">
				<input type="text" value="${rr}" id="rr" name="rr" size="21" onkeyup="reloadInputs();">
				<input name="idRR" value="${idRR}"id="idRR" type="hidden">
			</td>
		</tr>	
		<tr align="center">
			<!--  DNI Titular -->
			<td align="left" style="font-size: 13px; font-weight: bold">DNI Titular:</td>
			<td align="left">
				<input id="dniTitular"  size="21" type="text" class="digits" maxlength="8" name="dniTitular" 
					value="${dniTitular}" onkeyup="validarEntero(this.id, this.value)"/>
			</td>	
			<!--  Numero de Cuenta -->
			<td align="left" style="font-size: 13px; font-weight: bold">Número Cuenta:</td>
			<td align="left">
				<input type="text" value="${numCuenta}" id="numCuenta" name="numCuenta" 
					size="21" maxlength="30" onkeyup="validarEntero(this.id, this.value)">
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

<!-- fin - filtros -->

<CENTER  style="width: 1100px;">
<display:table class="displayTags_wrapper" export="true" style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1000px;" 
	uid="cuenta" id="cuentaList" name="sessionScope.cuentaList" pagesize='50' defaultsort="1" defaultorder="ascending" 
	requestURI="">  
    <c:set var="urlRegreso" value="/cuenta/verInformeCuentas.do"></c:set>
	<display:column property="banco"  sortable="true" sortProperty="titular.banco" style="width: 9%" headerClass="sortable" title="Banco" />
    <display:column title="Becado" media="excel">${cuentaList.apellidoAlumno},${cuentaList.nombreAlumno}</display:column>
    <display:column sortable="true" sortProperty="alumno.apellido" style="width: 18%" headerClass="sortable" title="Becado" media="html">
    	${cuentaList.apellidoAlumno},${cuentaList.nombreAlumno}
    	<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Detalle Alumno">
			<a href="<c:url value='/fichaAlumno/fichaAlumnoView.do?idAlumno=${cuentaList.idAlumno}&urlRegreso=${urlRegreso}'/>"> 
				<span class="ui-icon ui-icon-search" ></span>
			</a>		
		</div>
	</display:column>	  
    <display:column property="titular" sortable="true" sortProperty="titular.apellido" style="width: 17%" headerClass="sortable" title="Titular Cuenta" maxLength="30" />  
    <display:column property="nroCuil" sortable="true" sortProperty="titular.cuil" style="width: 10%" headerClass="sortable" title="CUIL" maxLength="25" />  
    <display:column property="nroCuenta" sortable="true" sortProperty="nroCuenta" style="width: 11%" headerClass="sortable" title="Número Cuenta" maxLength="35" />  
    <display:column property="rr" sortable="true" sortProperty="rr.apellido" style="width: 13%" headerClass="sortable" title="RR" maxLength="25" />
    <display:column property="zona" sortable="true" sortProperty="alumno.zona" style="width: 11%" headerClass="sortable" title="Zona" maxLength="35" />
    <display:column sortable="true" property="fechaExportacion" style="width:" headerClass="sortable" title="Fecha exportación" maxLength="35" format="{0,date,dd/MM/yyyy}"/>
    <display:column property="estado.valor" style="width: 9%" headerClass="sortable" title="Estado" maxLength="20" />
    <display:column property="motivoFallido" style="width: 11%" headerClass="sortable" title="Motivo Fallido" maxLength="35" />
 	<display:column title="Acciones" media="html">
		<table>
			<tr>
				<c:if test="${(empty cuentaList.estado) || (!empty cuentaList.estado && cuentaList.estado.valor != 'Activa')}"> 
					<td>
						<div style="width:0.5cm" class="ui-state-default ui-corner-all"> 
							<a onclick="showFallidoDialog('${cuentaList.id}','${cuentaList.tipoPersona}')" title="Notificar Fallido">
								<span class="ui-icon ui-icon-alert" ></span>
							</a>
						</div>
					</td>
				</c:if> 
				<sec:authorize access="hasRole('ADM') or hasRole('SYS')">
					<c:if test="${!empty cuentaList.nroCuenta && (empty cuentaList.estado || (!empty cuentaList.estado && cuentaList.estado.valor != 'Activa'))}"> 
						<td>
							<div style= width:0.5cm class="ui-state-default ui-corner-all" > 
								<a onclick="enviarForm('modificar','${cuentaList.id}')" title="Activar Cuenta"> 
									<span class="ui-icon ui-icon-copy" ></span>
								</a>				
							</div>
						</td>
					</c:if>
				</sec:authorize>
			</tr>
		</table>	
	</display:column>
<%--     <display:column media="html" property="notificarFallido" headerClass="sortable" style="width: 5%" title="Notificar Fallido" maxLength="15" />   --%>
    <display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.items_names" value="cuentas" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
    <display:setProperty name="export.excel.filename" value="informeCuentas.xls" />
</display:table>
</CENTER>
</form>
</div>

<center>
<div style="display: none;" title="Notificar Creación Cuenta Fallida">
	<form id="fallidoForm" class="cmxform" name="fallidoForm" action="<c:url value='/cuenta/notificarCuentaFallida.do' />" method="post">
		<input type="hidden" name="id" id="id">
		<input type="hidden" name="tipoPersona" id="tipoPersona">
		<input type="hidden" name="idBanco" id="idBanco"> 
		<input type="hidden" name="becado" id="becado">
		<input type="hidden" id="titular" name="titular">
		<input type="hidden" id="numCuenta" name="numCuenta">
		<input type="hidden" id="zona" name="zona">
		<input name="idZona"id="idZona" type="hidden">
		<input type="hidden" id="rr" name="rr">
		<input type="hidden" id="estadoCuenta" name="idEstadoCuenta">		
		<input type="hidden" id="dniTitular" name="dniTitular">		
		<div id="left-content">
		    <table border="0" align="left" cellpadding="0" cellspacing="0">
				<tr>
			        <td width="20%" valign="top">Motivo:</td>
			        <td width="80%">
					<textarea rows="10" cols="40" name="motivo"></textarea> 
					</td>
			    </tr>
		 	</table><br/>  
		</div>
</form>
</div>
</center>
</body>
</html>