<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="softek" uri="/softtek-fwk.tld"%>

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
<title>...:: Lista Perfil RR::...</title>

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
		if(action == 'modificar'){
			document.forms['rrForm'].action = "../perfilRR/modificarPerfilRR.do";
		}else if(action == 'eliminar'){
			document.forms['rrForm'].action = "../perfilRR/eliminarPerfilRR.do";
		}
		document.forms['rrForm'].idPerfilRR.value = id;
		document.forms['rrForm'].submit();
	}
</script>
<script type="text/javascript">
var idEA;

$.fx.speeds._default = 1000;
function openDetalleZona(idRR){
	idE = idRR;
	$.ajax({
		type: "POST",
		url: "../perfilRR/verZonasPerfilRR.do",
		data: {
			'idRR' : idE
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
<form id="rrForm" class="rrForm" action="<c:url value='../perfilRR/altaPerfilRR.do' />" method="post">
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr align="center">
	<td style="vertical-align: middle;" align="center">
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all">
			<h3 align="center">Listado de Responsables de Acompañamiento</h3>
		</div>
		<!-- Fin titulo -->
		<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1"> 
			<thead align="center">
				<!-- Panel de funciones	-->
				<tr id="fxs" style="display: none;">
					<c:forEach begin="0" end="3" var="loop">
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
					<c:forEach begin="0" end="4">
						<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
							<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
							</span></a></div>
						</td>
					</c:forEach>
				</tr>
				<tr>
					<th>Apellido y Nombre</th>
					<th>Telefono</th>
					<th>E-mail</th>
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
				<c:forEach items="${perfilRR}" var="perfil">
					<tr>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;<a onclick="openDetalleRR('${perfil.idPerfilRR}');">${perfil.datosPersonales.apellido},&nbsp;${perfil.datosPersonales.nombre}</a></td>
						<td align="center" valign="middle" style="font-size: 14px">${perfil.datosPersonales.telefono}</td>
						<td align="center" valign="middle" style="font-size: 14px">${perfil.datosPersonales.mail}</td>
						<td align="center" valign="middle" style="font-size: 14px"><a onclick="openDetalleZona('${perfil.idPerfilRR}');">Ver Zonas</a></td>
						<td align="center">
							<table>
								<tr>
								<td>
									<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
										<a  onclick="enviarForm('modificar','${perfil.idPerfilRR}')"> 
										<span class="ui-icon ui-icon-pencil" > 
										</span></a>				
									</div>
								</td>
								<td>
									<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
										<a  onclick="enviarForm('eliminar','${perfil.idPerfilRR}')" > 
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
	<input type="hidden" name="idPerfilRR" />
</form>
</div>
<div style="display: none;" id="dialog" title="Lista de Zonas">
</div>
<div style="display: none;" id="dialogRR" title="Datos RR">
<jsp:include page="/WEB-INF/pages/detallePerfil/detalleRR.jsp"></jsp:include>
</div>
</body>
</html>