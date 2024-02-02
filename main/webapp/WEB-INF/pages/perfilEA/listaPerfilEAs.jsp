<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
src="/Intranet/static/js/table/tabletools/js/TableTools.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Encargados de Acompañamiento</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
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
		"sDom": '<"H"Tl>rt<"F"ip>'
	});
});
</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
<script type="text/javascript">
	function enviarForm(action, id){
		if(action=='modificar'){
			document.forms['eaForm'].action = "../perfilEA/modificarEA.do";
		}else{
			document.forms['eaForm'].action = "../perfilEA/eliminarPerfilEA.do";
		}
		document.forms['eaForm'].idEA.value = id;
		document.forms['eaForm'].submit();
	}	
</script>
<script type="text/javascript">
var idEA;

$.fx.speeds._default = 1000;
function openDetalleZona(idEA){
	idE = idEA;
	$.ajax({
		type: "POST",
		url: "../perfilEA/modificarEAView.do",
		data: {
			'idEA' : idE
		   },
		success: function(msg){
		$("#dialog").html(msg);
		$("#dialog").dialog({
			modal: true,
	        draggable: true,
	        resizable: false,
			width :250,
			height: 'auto',
			show :'slow',
			hide :'slow'
		});
		}
	});
	
}
</script>
</head>
<body>
<div id="main-content">
<form id="eaForm" class="eaForm" action="<c:url value='/perfilEA/altaPerfilEA.do' />" method="post">
	<br>
	<center>
	<table align="center" >
	<tr align="center">
	<td style="vertical-align: middle;" align="center">
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all" >
		<h3 align="center">Listado de Encargados de Acompañamiento</h3>
		</div>
		<!-- Fin titulo -->
		<table class="dataTables_wrapper" width="100%" id="laTabla" cellspacing="1"> 
	
			<thead align="center">
				<tr>
					<th>Nombre y Apellido</th>
					<th>Telefono</th>
					<th>Email</th>
					<th>Zonas</th>
					<th id="acciones">Acciones</th>
				</tr>
				<!-- Buscadores	-->
				<tr>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td></td>	
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${eas}" var="e">
					<tr>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;<a onclick="openDetalleEA('${e.idPerfilEA}');">${e.datosPersonales.apellido},&nbsp;${e.datosPersonales.nombre}</a></td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.datosPersonales.telefono}</td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.datosPersonales.mail}</td>
						<td align="center" valign="middle" style="font-size: 14px"><a onclick="openDetalleZona('${e.idPerfilEA}');">Ver Zonas</a></td>	
						<td align="center">
						<table>
							<tr>
							<td>
								<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
									<a  onclick="enviarForm('modificar','${e.idPerfilEA}')"> 
									<span class="ui-icon ui-icon-pencil" > 
									</span></a>				
								</div>
							</td>
							<td>
								<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
									<a  onclick="enviarForm('eliminar','${e.idPerfilEA}')" > 
									<span class="ui-icon ui-icon-trash" > 
									</span></a>				
								</div>
							</td>	
							</tr>
						</table>
						</td>	
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</td>
	</tr>
	</table>
	</CENTER>	
	<input type="hidden" name="idEA" />
</form>
</div>
<div style="display: none;" id="dialog" title="Lista de Zonas">
	<jsp:include page="/WEB-INF/pages/perfilEA/modificarPerfilEA.jsp"></jsp:include>
</div>
<div style="display: none;" id="dialogEA" title="Datos EA">
<jsp:include page="/WEB-INF/pages/detallePerfil/detalleEA.jsp"></jsp:include>
</div>
</body>
</html>