<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@taglib prefix="display" uri="http://displaytag.sf.net"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>

<style type="text/css">
	table#exportacion{  
	background-color: #C0C2FF;
	border: 0;
	}
</style>

<script>
$(function() {
	  $("#cicloId").change(function(evt) {
	    evt.preventDefault()   
	    $.ajax( {
	      type: "GET",
	      url: "../ajax/obtenerListaPeriodos.do",
	      data: { idCiclo: $("#cicloId").val() },
	      dataType: "json",
	      success: function(data) {
	    	  var options = '';
	            options += '<option value="" selected="selected">Todos</option>'
	            $(data.periodos).each(function() {
	                options += '<option value="' + this.id + '">' + this.nombre + '</option>';
	            });
	             $("select#periodoId").html(options);
	        	
	      }
	    } )
	  })
	})


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


$(function() {
	$("#padrinoBeca").autocomplete({
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
			$("#padrinoBeca").text(ui.item.padrino);
		}
	});
});

</script>

<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Clonar Becas</title>

<script type="text/javascript">
function enviarForm(id){
	if(document.getElementById("cicloNuevoId").value == 'seleccione'){
		jAlert('warning', 'Debe seleccionar el ciclo al cual quiere clonar la/s beca/s', 'Atención!');
		return false;
	}
	if(($("input[@name=_chk]:checked").length > 0) || id !=''){
		jConfirm('Esta seguro de que desea clonar la/s beca/s seleccionada?', 'Confirmación', function(result){
		    if (result) {
				document.forms['becaForm'].action = "../beca/clonarBecas.do";
				if(id !=''){
					document.forms['becaForm'].idBeca.value = id;
				}	
				document.forms['becaForm'].submit();
		    	$.blockUI();
		    }
		 	else {
		      return false;
			}
		});	
	}
	else{
		jAlert('warning', 'Debe seleccionar el menos una beca', 'Atención!');
		return false;
		}		
}

function CheckAll(chk){
	for (i = 0; i < chk.length; i++)
		chk[i].checked = true ;	
}

function UnCheckAll(chk){
	for (i = 0; i < chk.length; i++)
		chk[i].checked = false ;
}

function validarFiltros(){
	
	if($('#zona').val() == ''){
		$('#idZona').removeAttr('value');
	}
	if($('#padrinoBeca').val() == ''){
		$('#idPadrino').removeAttr('value');
	}
	document.forms['becaForm'].action = "../beca/listaClonarBecas.do";	
	document.forms['becaForm'].submit();
	
}
</script>

</head>
<body onload="UnCheckAll(document.becaForm._chk)">
<div id="main-content">
<br><br>
<center><h3>Clonación de Becas</h3></center>
<br><br>
<form method="post" id="becaForm" name="becaForm" action="<c:url value="/beca/listaClonarBecas.do"/>">
<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">
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
			<td align="left" style="font-size: 13px; font-weight: bold">Zona:</td>
			<td align="left" >
			<input type="text" value="${zona}" id="zona" name="zona" size="21" onkeyup="reloadInputs();">
			<input name="idZona" value="${idZona}" id="idZona" type="hidden">
			</td>
		</tr>

		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Tipo Beca:</td>
			<td align="left">
				 <select id="tipoBecaId" name="tipoBecaId" class="required" style="width:150px;">
				 	<option value="0">Todos</option>
					<c:forEach var="tipoBeca" items="${tiposBecas}">
						<c:if test="${tipoBeca.id == tipoBecaId}">
							<option selected="selected" id="forma" value="${tipoBeca.id}">${tipoBeca.descripcion}</option>
						</c:if>
						<c:if test="${tipoBeca.id != tipoBecaId}">
						<option id="forma" value="${tipoBeca.id}">${tipoBeca.descripcion}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">Tipo Padrino:</td>
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
			<td align="left" style="font-size: 13px; font-weight: bold">Estado Beca:</td>
			<td align="left">
				 <select id="estadoId" name="estadoId" class="required" style="width:150px;">
					<option value="0">Todos</option>
					<c:forEach var="estado" items="${estados}">
						<c:if test="${estado.id == estadoId}">
							<option selected="selected" id="estado" value="${estado.id}">${estado.valor}</option>
						</c:if>
						<c:if test="${estado.id != estadoId}">
						<option id="ciclo" value="${estado.id}">${estado.valor}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">Mes Incorp.:</td>
			<td align="left">
				 <select id="periodoId" name="periodoId" class="required" style="width:150px;">
					<option value="0">Todos</option>
					<c:forEach var="periodo" items="${periodos}">
						<c:if test="${periodo.id == periodoId}">
							<option selected="selected" id="periodo" value="${periodo.id}">${periodo.nombre}</option>
						</c:if>
						<c:if test="${periodo.id != periodoId}">
						<option id="tipo" value="${periodo.id}">${periodo.nombre}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>	
		
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Padrino:</td>
			<td align="left">
				<input type="text" id="padrinoBeca" value="${padrinoBeca}" name="padrinoBeca" size="21">
				<input value="${idPadrino}" name="idPadrino" id="idPadrino" type="hidden">
			</td>
			<c:if test="${cicloId != cicloActual}">
				<td align="left" style="font-size: 13px; font-weight: bold">Beca Clonada:</td>
				<td align="left">
					<select name="becaClonada" id="becaClonada" class="required" style="width:150px;">
						<option value="Todos">Todos</option>
						<c:forEach items="${listClonada}" var="clonada1">
							<c:choose>
								<c:when test="${clonada == clonada1}">
									<option value="${clonada}" selected="selected">${clonada1}</option>
								</c:when>
								<c:otherwise>
									<option value="${clonada1}" >${clonada1}</option>
								</c:otherwise>
							</c:choose>					
						</c:forEach>
					</select>			
				</td>
			</c:if>	
		</tr>
		<tr align="center">
			<td colspan="4">
				<input align="middle" id="buscar" type="submit" onclick="validarFiltros()" value="Buscar" class="ui-state-default ui-corner-all" ></input>
			</td>
		</tr>
	</table>
</fieldset>
<br><br>
<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">
<table id="table-ciclo" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">		
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Seleccione el ciclo para el cual se clonarán las becas:</td>
			<td align="left">
				 <select id="cicloNuevoId" name="cicloNuevoId" class="required" style="width:150px;">
					<option id="cicloNuevo" value="seleccione">Seleccione</option>
					<c:forEach var="ciclo" items="${ciclos}">
						<option id="ciclo" value="${ciclo.id}">${ciclo.nombre}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
	</table>
</fieldset>
<CENTER style="width: 1100px;">
<display:table export="true" class="displayTags_wrapper" decorator="org.cimientos.intranet.utils.paginacion.ClonarBecasCheckboxDecorator" 
style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1000px; background-color: #C0C2FF;"  id="beca" name="becas" requestURI="">  
    <display:column media="html" title="Seleccion" style="width: 4%" property="checkbox" />
    <display:column title="Padrino" >
 		<c:if test="${beca.padrino.datosPersonales != null}">
			${beca.padrino.datosPersonales.apellido}, ${beca.padrino.datosPersonales.nombre}
		</c:if>	
		<c:if test="${beca.padrino.empresa != null}">
			${beca.padrino.empresa.denominacion}
		</c:if>
    </display:column>

    <display:column property="padrino.tipo.valor"   title="Tipo padrino" />
    <display:column property="periodoPago.nombre"    title="Mes Incorporac. Beca" />
	<display:column property="ciclo.nombre"  title="Ciclo Programa"  /> 
	<display:column property="estado.valor"   title="Estado"  /> 
	<display:column  property="zona.nombre"  title="Zona" />
	<display:column  property="tipo.descripcion"   title="Tipo Beca" />
	<display:column  property="cantidad"  title="Cantidad" />
	<display:column  title="Fecha Confirmación"><fmt:formatDate value='${beca.fechaAlta}' pattern='dd/MM/yyyy'/> </display:column>
	
		<display:column property="clonada" title="Clonada/Año" />
	
	<display:column title="Acciones" media="html">
		<table>
			<tr>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('${beca.id}')" title="Clonar beca"> 
						<span class="ui-icon ui-icon-copy" > 
						</span></a>				
					</div>
				</td>
			</tr>
		</table>	
	</display:column>

    <display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.item_name" value="beca" />  
    <display:setProperty name="paging.banner.items_names" value="becas" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
	<display:setProperty name="export.excel.filename" value="becas.xls" />	
</display:table>
<input type="hidden" name="idBeca" />
<br>
<table align="center" width="150px" >
	<tr>
		<td>
			<input type="button" id="botonSelecTodos" name="Check_All" class="ui-state-default ui-corner-all" value="Seleccionar todos" onClick="CheckAll(document.becaForm._chk)"/>
		</td>
		<td>
			<input type="button" id="botonDeselecTodos" name="Un_CheckAll" class="ui-state-default ui-corner-all" value="Deseleccionar todos" onClick="UnCheckAll(document.becaForm._chk)"/>
		</td>
		<td>
			<input type="button" id="clonar" class="ui-state-default ui-corner-all" value="Clonar Becas" onclick="enviarForm('')"/>
		</td>
	</tr>
</table>
</br>
</CENTER>
</form>
</div>
<center>
</center>
</body>
</html>