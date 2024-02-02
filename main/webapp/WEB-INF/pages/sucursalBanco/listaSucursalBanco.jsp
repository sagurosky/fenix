<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sucursales</title>

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
function enviarForm(action, id, sucursal){
	if(action=='modificar'){
		document.forms['sucursalForm'].action = "../sucursalBanco/modificarSucursalBancoView.do";
		document.forms['sucursalForm'].id.value = id;
		document.forms['sucursalForm'].submit();
	}else if(action=='eliminar'){
		jConfirm('Esta seguro de que desea eliminar la sucursal ' + sucursal + ' ?', 'Confirmación', function(result){
		    if (result) {
				document.forms['sucursalForm'].action = "../sucursalBanco/eliminarSucursalBanco.do";
				document.forms['sucursalForm'].id.value = id;
				document.forms['sucursalForm'].submit();
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
<table align="center" >
<tr>
<td>
<div class="ui-state-default ui-corner-all" >
<h3 align="center">Listado de Sucursales Bancarias</h3>
</div>
<div class="ui-state-default ui-corner-all" >
	<table align="center">
		<tr>
			<td>
				<input type="submit" value="Registrar Sucursal" class="ui-state-default ui-corner-all" onclick="window.location.href='../sucursalBanco/registrarSucursalBancoView.do'" />
				<input type="button" value="Registrar Banco" class="ui-state-default ui-corner-all"	onclick="location.href='../banco/registrarBancoView.do'; return false;" />
			</td>
		</tr>
	</table>
</div>
	<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1"> 

		<thead align="center">
			<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0" end="4" var="loop">
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
				<c:forEach begin="0" end="5">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<!-- Columnas -->
			<tr>
				<th>id</th>
				<th>Zona</th>
				<th>N&uacute;mero Sucursal</th>
				<th>Direcci&oacute;n</th>
				<th>Banco</th>
				<th>Nombre Contacto</th>
				<th>Tel&eacute;fono Contacto</th>
				<th id="acciones">Acciones</th>
			</tr>
			<tr>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td></td>	
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${sucursalesBanco}" var="sucursal">
				<tr>
					<td align="center" valign="top" style="font-size: 14px" class="col0">&nbsp;${sucursal.id}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px" class="col0">&nbsp;${sucursal.zona.nombre}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px" class="col0">&nbsp;${sucursal.numeroSucursal}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px" class="col1">&nbsp;${sucursal.direccion}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px" class="col2">&nbsp;${sucursal.banco.nombre}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px" class="col4">&nbsp;${sucursal.nombreContacto}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px" class="col5">&nbsp;${sucursal.telContacto}&nbsp;</td>
										
				<td align="center"  style="border: 0">
			
				<table>
				<tr>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('modificar','${sucursal.id}','${sucursal.numeroSucursal}')"> 
						<span class="ui-icon ui-icon-pencil" > 
						</span></a>				
					</div>
				</td>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('eliminar','${sucursal.id}','${sucursal.numeroSucursal}')" > 
						<span class="ui-icon ui-icon-trash" > 
						</span></a>				
					</div>
				</td>	
				</tr>
				</table>
			</c:forEach>
	</tbody>
</table>
<div class="ui-state-default ui-corner-all" >
<table align="center">
<tr>
	<td>
		<input type="submit" value="Registrar Sucursal" class="ui-state-default ui-corner-all" onclick="window.location.href='../sucursalBanco/registrarSucursalBancoView.do'" />
		<input type="button" value="Registrar Banco" class="ui-state-default ui-corner-all"	onclick="location.href='../banco/registrarBancoView.do'; return false;" />
	</td>
</tr>
</table>
</div>
<form:form name="sucursalForm" method="post" commandName="sucursal">
<input type="hidden" name="id" />

</form:form>
</td>
</tr>
</table>
<br><br>
<a name="ancla"></a>
<div id="contenedor" style="width: 60%;">

</div>
</CENTER>	
</div>
</body>
</html>