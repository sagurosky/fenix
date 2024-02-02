<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
<title>Lista Trabajadores Sociales</title>

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

$.fx.speeds._default = 1000;
function openDetalleZona(idTS){
	idTS = idTS;
	$.ajax({
		type: "POST",
		url: "../perfilTS/verZonasPerfilTS.do",
		data: {
			'idTS' : idTS
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
			document.forms['tsForm'].action = "../perfilTS/modificarPerfilTS.do";
			document.forms['tsForm'].idTS.value = id;
		}else if (action =='alta'){
			document.forms['tsForm'].action = "../perfilTS/altaPerfilTS.do"
		}else{
			document.forms['tsForm'].action = "../perfilTS/eliminarPerfilTS.do";
			document.forms['tsForm'].idTS.value = id;
		}
		$("#tsForm").submit();
	}	
</script>

</head>
<body>
<div id="main-content">
<form id="tsForm" class="tsForm" action="<c:url value='/perfilTS/altaPerfilTS.do' />" method="post">
	<br />
	<CENTER>
	<table align="center" >
	<tr align="center">
	<td style="vertical-align: middle;" align="center">
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all" >
		<h3 align="center">Listado de Trabajadores Sociales</h3>
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
				<c:forEach items="${listaPerfilTS}" var="ts">
					<tr>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;<a onclick="openDetalleTS('${ts.idPerfilTS}');">${ts.datosPersonales.apellido},&nbsp;${ts.datosPersonales.nombre}</a></td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${ts.datosPersonales.telefono} </td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${ts.datosPersonales.mail}</td>
						<td align="center" valign="middle" style="font-size: 14px"><a onclick="openDetalleZona('${ts.idPerfilTS}');">Ver Zonas</a></td>
						<td align="center">
						<table>
							<tr>
							<td>
								<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
									<a  onclick="enviarForm('modificar','${ts.idPerfilTS}')"> 
									<span class="ui-icon ui-icon-pencil" title="Modificar Datos Personales"> 
									</span></a>				
								</div>
							</td>
							<td>
								<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
									<a  onclick="enviarForm('eliminar','${ts.idPerfilTS}')" > 
									<span class="ui-icon ui-icon-trash" title="Eliminar Perfil"> 
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
	<!--<div class="ui-state-default ui-corner-all" >
		<table align="center">
		<tr>
			<td>
				<input type="button" onclick="enviarForm('alta','0')" value="Alta" class="ui-state-default ui-corner-all" />
			</td>
		</tr>
		</table>
	</div>


	--></td>
	</tr>
	</table>
	</CENTER>	
	<input type="hidden" name="idTS" />
</form>
</div>
<div style="display: none;" id="dialog" title="Lista de Zonas">
</div>
<div style="display: none;" id="dialogTS" title="Datos TS">
<jsp:include page="/WEB-INF/pages/detallePerfil/detalleTS.jsp"></jsp:include>
</div>
</body>
</html>