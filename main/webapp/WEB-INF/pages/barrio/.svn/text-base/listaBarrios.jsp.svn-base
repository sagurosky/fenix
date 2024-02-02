<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="/softtek-fwk.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Barrios</title>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
	<script type="text/javascript"
	src="<c:url  value="/static/js/table/ColVis.min.js"/>"></script>
	<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/js/TableTools.min.js"/>"></script>
	<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/ZeroClipboard/ZeroClipboard.js"/>"></script>
	
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"
	media="all">
	<link rel="stylesheet"
	href="<c:url  value="/static/js/table/tabletools/css/TableTools.css"/>"
	media="all">

<script type="text/javascript">
$(function() {
	TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
		
	oTable = $('#laTabla').dataTable( {
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>'+
		'<option value="50">50</option>'+
		'<option value="75">75</option>'+
		'<option value="100">100</option>'+
		'<option value="-1">Todos</option>'+
		'</select> registros por hoja',
		"sZeroRecords": "No se encontraron registros",
		"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		"sInfoEmtpy": "Mostrando 0 registros",
		"sInfoFiltered": "(filtrado de _MAX_ registros totales)",
		"sSearch": "Buscar",
		"oPaginate": {
			"sFirst":    "Primera",
			"sPrevious": "Anterior",
			"sNext":     "Siguiente",
			"sLast":     "Ultima"
		}
		
		},
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"sDom": '<"H"l>rt<"F"ip>'
	});
	
});
</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
<script type="text/javascript">
function enviarForm(action, id, nombre){
	if(action=='modificar'){
		document.forms['barrioForm'].action = "../barrio/modificarView.do";
		document.forms['barrioForm'].idBarrio.value = id;
		document.forms['barrioForm'].submit();
	}else if(action=='eliminar'){
		 jConfirm('Esta seguro de que desea eliminar el barrio ' + nombre + ' ?', 'Confirmación', function(result){
			    if (result) {
			    	document.forms['barrioForm'].action = "../barrio/eliminarBarrio.do";
			    	document.forms['barrioForm'].idBarrio.value = id;
			    	document.forms['barrioForm'].submit();
			    } else {
			      return false;
			    }
			  });
		
	}
	
}
</script>

</head>
<body>
<div id="main-content">
<br>
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td style="vertical-align: top">
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all">
<h2 align="center">Listado de Barrios</h2>
	<!-- Botones -->
	<table align="center">
		<tr>
			<td>
				<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../barrio/registrarView.do'" />
			</td>
		</tr>
	</table>
</div>
<div id="pepe"></div>
<!-- Fin titulo -->
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF"> 
		<thead align="center">
			<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0" end="1" var="loop">
					<td>
						<div class="ui-state-default ui-corner-all" style="height: 40px;">
							<div title="subtotalizar columna"> 
								<a href="#ancla" onclick="subtotalizarColumna(${loop})">subtotalizar</a>				
							</div>
							<div title="agrupar columna"> 
								<a href="#" onclick="agruparColumna(${loop})">agrupar</a>				
							</div>
						</div>
					</td>
				</c:forEach>
					<td>
					<div class="ui-state-default ui-corner-all" style="width: auto; height: 40px;">
					</div>
				</td>
			</tr>
			<!-- Botones para mostrar funciones	-->
			<tr>
				<c:forEach begin="0" end="2">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<!-- Columnas -->
			<tr>
				<th>Nombre</th>
				<th>Codigo Postal</th>
				<th id="acciones">Acciones</th>
			</tr>
			<!-- Buscadores	-->
			<tr>
				<td><input name="search_browser" value="Buscar nombre" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar cod. postal" class="search_init"/></td>
				<td></td>	
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${barrios}" var="barrio">
				<tr>
					<td align="center" valign="top" style="font-size: 14px" id="${barrio.nombre}" class="col0">${barrio.nombre}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col1">&nbsp;${barrio.codPostal}&nbsp;</td>
					
				<td align="center"  style="border: 0">
				<table>
				<tr>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('modificar','${barrio.id}','${barrio.nombre}')"> 
						<span class="ui-icon ui-icon-pencil" > 
						</span></a>				
					</div>
				</td>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('eliminar','${barrio.id}','${barrio.nombre}')" > 
						<span class="ui-icon ui-icon-trash" > 
						</span></a>				
					</div>
				</td>	
				</tr>
				</table>
			</c:forEach>
	</tbody>
</table>
<!-- Pie de la Tabla -->
<div class="ui-state-default ui-corner-all" >
	<table align="center">
	<tr>
		<td>
			<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../barrio/registrarView.do'" />
		</td>
	</tr>
	</table>
</div>
<!-- Fin pie -->
<form:form name="barrioForm" method="post" commandName="barrio">
<input type="hidden" name="idBarrio" />

</form:form>
</td>
</tr>
</table>
<!-- Div para tabla subtotalizar -->
<br><br>
<a name="ancla"></a>
<div id="contenedor" style="width: 60%;">

</div>
<!-- Fin del div -->
</CENTER>
</div>
</body>
</html>