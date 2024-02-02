<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>

<style type="text/css">
input[name=search_browser]{ 
	font-size: x-small;
	width: 150px; 
	color: gray;
	font-style: italic; 
}

table#laTabla{  
	background-color: #C0C2FF;
	border: 0;
}
</style>

<script type="text/javascript">
function enviarForm(action,id){
	if(action=='eliminar'){
		jConfirm('Esta seguro de que desea eliminar la Ficha de Presentación?', 'Confirmación', function(result){
		    if (result) {
				document.forms['informeForm'].action = "../informeFP/eliminarFP.do";
				document.forms['informeForm'].urlRegreso.value = "/informeFP/listaInformesFPRevision.do";
				document.forms['informeForm'].idFP.value = id;
				document.forms['informeForm'].submit();
		    } else {
		      return false;
		    }
		  });
	}
	else if(action=='editar'){
			document.forms['informeForm'].action = "../informeFP/verInformeFPRevisionView.do";
			document.forms['informeForm'].idFP.value = id;
			document.forms['informeForm'].submit();
		}
}

function validarFiltros(){
	if($('#ea').val() == ''){
		$('#idEA').removeAttr('value');
	}

	if($('#rr').val() == ''){
		$('#idRR').removeAttr('value');
	}
	
	if($('#zonaCimientos').val() == ''){
		$('#zonaCimientosId').removeAttr('value');
	}

	if($('#padrino').val() == ''){
		$('#idPadrino').removeAttr('value');
	}

	document.forms['informeForm'].submit();
}

</script>
<script type="text/javascript" src="<c:url value="/static/js/filtrosUtiles.js"/>"></script>

<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">	

</head>
<body>
<div id="main-content">
<br><br>
<center><h3>Listado de Fichas de Presentación en Revisión</h3></center>
<br><br>
<form method="post" id="informeForm" name="informeForm" action="<c:url value="/informeFP/listaInformesFPRevision.do"/>">
	<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">
	<table border="0" id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">
	
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
			<td align="left" width="300" style="font-size: 13px; font-weight: bold">Alumno:</td>
			<td align="left" width="300">
				<input id="alumno" width="150px;" type="text" name="nombreAlumno" value="${nombreAlumno}" />
			</td>
		</tr>
		
		<tr align="center">
			<td align="left" width="150" style="font-size: 13px; font-weight: bold">Estado de Informe:</td>
				<td align="left">
					<select id="estadoId" name="estadoId" style="width:150px;">
					<option value="0">Todos</option>
						<c:forEach var="estado" items="${estados}">
							<c:if test="${estado.id == estadoId}">
								<option selected="selected" id="estado" value="${estado.id}">${estado.valor}</option>
							</c:if>
							<c:if test="${estado.id != estadoId}">
								<option id="estado" value="${estado.id}">${estado.valor}</option>
							</c:if>
						</c:forEach>
	 				</select>
				</td>
				
			<td align="left" width="300" style="font-size: 13px; font-weight: bold">Zona:</td>
			<td align="left" width="300">
				<input type="hidden" name="zonaCimientosId" id="zonaCimientosId" value="${zonaCimientosId}" />
				<input type="text" 	 name="zonaCimientos" id="zonaCimientos" value="${zonaCimientos}" size="21"/>
			</td>	
		</tr>
		
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Padrino:</td>
			<td align="left">
				<input type="text" 		value="${padrino}" 	id="padrino" 	name="padrino" size="21"/>
				<input type="hidden" 	value="${idPadrino}" id="idPadrino" name="idPadrino"/>
			</td>			
			<td align="left" width="300" style="font-size: 13px; font-weight: bold">Tipo de Padrino:</td>
			<td align="left" width="300">
				<select id="tipoPadrinoId" name="tipoPadrinoId" class="required"  style="width:150px;">
				 	<option value="0">Todos</option>
					<c:forEach var="tipoPadrino" items="${tiposPadrinos}">
						<c:if test="${tipoPadrino.id == tipoPadrinoId}">
							<option selected="selected" id="tipoPadrino" value="${tipoPadrino.id}">${tipoPadrino.valor}</option>
						</c:if>
						<c:if test="${tipoPadrino.id != tipoPadrinoId}">
							<option id="tipoPadrino" value="${tipoPadrino.id}">${tipoPadrino.valor}</option>
						</c:if>
					</c:forEach>
				</select>
			</td>
		</tr>
		
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">RR:</td>
			<td align="left"+>
				<input type="text" 		value="${rr}" 	id="rr" 	name="rr" size="21"/>
				<input type="hidden" 	value="${idRR}" id="idRR" 	name="idRR"/>
			</td>
			<td align="left" width="300" style="font-size: 13px; font-weight: bold">EA:</td>
			<td align="left" width="300">
				<input type="text" value="${ea}" id="ea" name="ea" size="21" >
				<input name="idEA" value="${idEA}" id="idEA" type="hidden">
			</td>
		</tr>
		
		<tr align="center">
			<td colspan="4">
				<input align="middle" id="buscar" onclick="validarFiltros()" type="button" value="Buscar" class="ui-state-default ui-corner-all" ></input>
			</td>
		</tr>
	</table>
	</fieldset>
	<br><br>
<CENTER style="width: 1100px;">
<c:set var="urlRegreso" value="/informeFP/listaInformesFPRevision.do"></c:set>
<display:table class="displayTags_wrapper" export="true" style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1000px; background-color: #C0C2FF;" 
											id="informes" name="informes" requestURI="" pagesize="50" defaultsort="8">  
	
	<display:column media="html" headerClass="sortable"  title="Alumno" sortable="true" sortProperty="alumno">
    ${informes.apellidoAlumno},${informes.nombreAlumno}
    <div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Detalle Alumno">
		<a  href="<c:url value='/fichaAlumno/fichaAlumnoView.do?idAlumno=${informes.idAlumno}&urlRegreso=${urlRegreso}'/>"> 
		<span class="ui-icon ui-icon-search" ></span>
		</a>		
	</div>
	</display:column>
	<display:column media="excel" property="nombreAlumno"></display:column>
    <display:column media="excel" property="apellidoAlumno"></display:column>
    <display:column property="zona"  headerClass="sortable" title="Zona" sortable="true" sortProperty="zona"/>
    <display:column property="estadoInforme"  title="Estado Informe"/>
    <display:column property="padrino"  headerClass="sortable" title="Padrino" sortable="true" sortProperty="padrino"/>
    <display:column property="tipoPadrino"  headerClass="sortable" title="Tipo Padrino"/>
    <display:column property="ea"  headerClass="sortable" title="EA" sortable="true" sortProperty="ea"/>
    <display:column property="rr"  headerClass="sortable" title="RR" sortable="true" sortProperty="rr"/>
    <display:column property="fechaCreacion"  headerClass="sortable" title="Fecha Alta" sortable="true" sortProperty="fechaAlta"/>
    <display:column media="html"  headerClass="sortable" title="Acciones">
	    <table>
			<tr>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all"> 
						<a  onclick="enviarForm('editar','${informes.id}')">
							<span class="ui-icon ui-icon-pencil" title="Informe FP"></span>
						</a>				
					</div>
				</td>
				<sec:authorize access="hasRole('SuperUsuario') or hasRole('SEL')">			
					<td>
						<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
							<a  onclick="enviarForm('eliminar','${informes.id}')" > 
								<span class="ui-icon ui-icon-trash" ></span>
							</a>				
						</div>
					</td>
				</sec:authorize>
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
	<input type="hidden" name="urlRegreso" value="${urlRegreso}"></input>
</c:if>
<input type="hidden" name="idFP" />
<input type="hidden" id="fpSeleccionados" name="fpSeleccionados"/>
</form>
</div>
</body>
</html>