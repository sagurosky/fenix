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
function enviarForm(action, id){
	
	if(action=='construccion'){
		document.forms['informeForm'].action = "../informes/construccion.do";
		document.forms['informeForm'].idInforme.value = id;
	}
	else if(action=='verEscuela'){
			document.forms['informeForm'].action ="<c:url value='/escuela/modificarEscuela.do'/>";
			document.forms['informeForm'].idEscuela.value = id;
	}
	document.forms['informeForm'].submit();
}
</script>
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
</script>	
<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.alerts.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.tabs.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.draggable.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.accordion.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/ColVis.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/js/TableTools.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/ZeroClipboard/ZeroClipboard.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/js/TableTools.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/styles.css"/>" media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/table.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/jquery.ui.accordion.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/blitzer/jquery-ui-1.8.5.custom.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/ui-lightness/jquery-ui-1.8.5.custom.css"/>" media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/ui-lightness/jquery.alerts.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/js/table/tabletools/css/TableTools.css"/>"	media="all">
	


</head>
<body>
<div id="main-content">
<br><br>
<center><h3>Listado de Informes a Actualizar</h3></center>
<br><br>
<form method="post" id="informeForm" name="informeForm" action="<c:url value="/informes/listaInformesConstruccion.do"/>">
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
			<td colspan="4">
				<input align="middle" id="buscar" type="submit" value="Buscar" class="ui-state-default ui-corner-all" ></input>
			</td>
		</tr>
	</table>
	</fieldset>
	<br><br>
<CENTER style="width: 1100px;">
<c:set var="urlRegreso" value="/informes/listaInformesConstruccion.do"></c:set>
<display:table class="displayTags_wrapper" export="true"  style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1000px; background-color: #C0C2FF;" id="informes" name="informes" requestURI="" pagesize="50" >  
	
	<display:column media="html" headerClass="sortable"  title="Alumno">
    ${informes.apellidoAlumno},${informes.nombreAlumno}
    <div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Detalle Alumno">
			<a  href="<c:url value='/fichaAlumno/fichaAlumnoView.do?idAlumno=${informes.idAlumno}&urlRegreso=${urlRegreso}'/>"> 
				<span class="ui-icon ui-icon-search" ></span>
			</a>		
		</div>
	</display:column>
	<display:column media="excel" property="nombreAlumno" ></display:column>
    <display:column media="excel" property="apellidoAlumno" ></display:column>
    <display:column property="tipoInforme" title="Tipo Informe" headerClass="sortable" />
    <display:column property="fechaCreacion"  headerClass="sortable" title="Fecha Alta" />
	<display:column headerClass="sortable" title="Escuela" media="excel">	
		${informes.escuelaNombre}
	</display:column>   
    <display:column headerClass="sortable" title="Escuela" media="html">
     ${informes.escuelaNombre}
		<!--  div style= width:0.5cm class="ui-state-default ui-corner-all" --> 
			<!--  a onclick="enviarForm('verEscuela','${informes.idEscuelaAlumno}')"> 
				< span class="ui-icon ui-icon-search" title="Ver Ficha Escuela"></span>
			</a-->				
		</div>		
	</display:column>
    <display:column media="html"  headerClass="sortable" title="Acciones" >
		<div style= width:0.5cm class="ui-state-default ui-corner-all"> 
			<a onclick="enviarForm('construccion','${informes.id}')">
				<span class="ui-icon ui-icon-pencil" title="${informes.tipoInforme}"></span>
			</a>				
		</div>
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
<input type="hidden" name="idInforme" />
<input type="hidden" id="fpSeleccionados" name="fpSeleccionados"/>
<input type="hidden" name="idEscuela" id="idEscuela">
</form>
</div>
</body>
</html>