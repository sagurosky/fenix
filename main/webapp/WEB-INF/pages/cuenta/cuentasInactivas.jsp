<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@taglib prefix="display" uri="http://displaytag.sf.net"%>
    
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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.quicksearch.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cuentas Inactivas</title>
<script type="text/javascript">

function reloadInputs(){
	if(document.getElementById("zona").value == ""){
		document.getElementById("idZona").value = "";
	}	
}
	
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

});

function validarEntero(campo, valor){ 
	if (isNaN(valor)) { //Compruebo si es un valor numérico 
		$('#'+ campo).val(" "); //entonces (no es numero) borro el numero 
	}
	else{
		$('#'+ campo).val(valor);
	}
}
</script>
</head>

<!-- filtros -->

<body onload="reloadInputs();">
<div id="main-content">
<br><br>
<center><h3>Cuentas Inactivas</h3></center>
<br><br>
<form onsubmit="reloadInputs();" method="post" id="form" name="form" action="<c:url value="/cuenta/verCuentasInactivas.do"/>">
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
			<!--  DNI Titular -->
			<td align="left" style="font-size: 13px; font-weight: bold">DNI Titular:</td>
			<td align="left">
				<input id="dniTitular"  size="21" type="text" maxlength="8" name="dniTitular" 
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
<display:table class="displayTags_wrapper" export="true" 
	style="font-size: 12px; margin-left: 50px; margin-right: 50px; width:1000px; " uid="cuenta" id="cuentaList" 
	name="sessionScope.cuentaList" pagesize='50' defaultsort="1" defaultorder="ascending" 
	requestURI="/cuenta/verCuentasInactivas.do">  
    <c:set var="urlRegreso" value="/cuenta/verCuentasInactivas.do"></c:set>
	<display:column property="sucursalBanco.banco.nombre" style="width: 11%" headerClass="sortable" title="Banco" maxLength="35" sortable="true" sortProperty="banco"/>  
	<display:column title="Becado" media="excel">${cuentaList.idAlumno.datosPersonales.apellido},${cuentaList.idAlumno.datosPersonales.nombre}</display:column>
    <display:column style="width: 18%" headerClass="sortable" title="Becado" sortable="true" 
    	sortProperty="alumno" media="html">
    	${cuentaList.idAlumno.datosPersonales.apellido},${cuentaList.idAlumno.datosPersonales.nombre}
    	<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Detalle Alumno">
			<a href="<c:url value='/fichaAlumno/fichaAlumnoView.do?idAlumno=${cuentaList.idAlumno.id}&urlRegreso=${urlRegreso}'/>"> 
				<span class="ui-icon ui-icon-search" ></span>
			</a>		
		</div>
	</display:column>	  
    <display:column style="width: 11%" headerClass="sortable" title="Titular Cuenta" maxLength="40" sortable="true" sortProperty="titular" >
    	${cuentaList.apellido},${cuentaList.nombre}
    </display:column>	  
    <display:column property="cuilCuit" style="width: 10%" headerClass="sortable" title="CUIL" maxLength="25" sortable="true" sortProperty="cuil" />  
    <display:column property="nroCuenta" style="width: 11%" headerClass="sortable" title="Número Cuenta" maxLength="35" sortable="true" sortProperty="nroCuenta"/>
    <display:column property="idAlumno.escuela.localidad.zona.nombre" style="width: 17%" headerClass="sortable" title="Zona" maxLength="35" sortable="true" sortProperty="zona"/>
    <display:column style="width: 17%" headerClass="sortable" title="Fecha Inactividad" maxLength="35" sortable="true" sortProperty="fecha">
    	<fmt:formatDate value="${cuentaList.fechaInactivo}" pattern="dd/MM/yyyy"/>
    </display:column>
  
    <display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.items_names" value="cuentas" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
    <display:setProperty name="export.excel.filename" value="informeCuentas.xls" />
</display:table>
</CENTER>
</form>
</div>
</body>
</html>