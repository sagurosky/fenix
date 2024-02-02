<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Estado de Pago de Becados</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		color: gray;
		font-style: italic; 
	}
</style>
<script type="text/javascript">
var oTable;

$(document).ready(function() {
	TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
		
	 oTable = $('#laTabla').dataTable({
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
} );
</script>
<script type="text/javascript" src="<c:url value="/static/js/table/funcionesTabla.js"/>"></script>
<script type="text/javascript">
function enviarForm(action, id)
{
	if(action=='eliminar'){
		 jConfirm('Recuerde corregir el error antes de cambiar el estado del pago.', 'Confirmación', function(result){
			    if (result) {
			    	document.forms['pagoForm'].action = "../entrevistas/cambiarEstadoPago.do";
			    	document.forms['pagoForm'].idPago.value = id;
			    	document.forms['pagoForm'].submit();
			    } else {
			      return false;
			    }
			  });
		
	}
}
</script>

<style type="text/css">
label { width: 10em; float: left; }
label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
p { clear: both; }
.submit { margin-left: 12em; }
em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

</head>
<body>
<div id="main-content">
<br>
<CENTER>
	<table style="margin-left: 50px; margin-right: 50px;">
	<tr >
	<td >
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all" align="center">
			<h3 align="center">Detalle de Estado de Pago de Becados</h3>
		</div>
		<!-- Fin titulo -->
		<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF"> 
		<thead title="Detalle de Estado de Pago de Becados">
		<tr id="fxs" style="display: none;">
						<td>
						<div class="ui-state-default ui-corner-all" style="width: auto; height: 40px;">
						</div>
					</td>
				</tr>
				<!-- Columnas -->
			<tr align="center">
				<th>Becado</th>
				<th>Periodo</th>
				<th>Monto</th>
				<th>Monto Extra</th>
				<th>Estado de Pago</th>
				<th>Motivo Fallo</th>
				<th>Cambiar Estado</th>
			</TR>	
				<tr>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>	
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				</tr>
			</thead>


			

		<tbody>			

		<c:forEach items="${listaPagoBecados}" var="pago">
		<tr align="left">
				<td align="center" nowrap="nowrap" valign="middle" style="font-size: 14px;" >&nbsp;${pago.becado.datosPersonales.apellido},&nbsp;${pago.becado.datosPersonales.nombre}&nbsp;</td>
				<td align="center" nowrap="nowrap" valign="middle" style="font-size: 14px;">&nbsp;${pago.periodo.nombre}&nbsp;</td>
				<td align="center" nowrap="nowrap" valign="middle" style="font-size: 14px">&nbsp;${pago.monto}&nbsp;</td>
				<td align="center" nowrap="nowrap" valign="middle" style="font-size: 14px">&nbsp;${pago.extra}&nbsp;</td>
				<td align="center" nowrap="nowrap" valign="middle" style="font-size: 14px">&nbsp;${pago.estadoPago.valor}&nbsp;</td>
				<td align="center" nowrap="nowrap" valign="middle" style="font-size: 14px">&nbsp;${pago.motivo}&nbsp;</td>
				<td align="center" nowrap="nowrap" valign="middle">
					<c:if test="${pago.estadoPago.valor == 'Fallido'}">
						<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
							<a  onclick="enviarForm('eliminar','${pago.id}')"> 
								<span class="ui-icon ui-icon-pencil" title="Corregir"> 
							</span></a>				
						</div>
					</c:if>
				</td>
									
		</tr>
		</c:forEach>

		</tbody>
	</table>
		
	<br></br>
	<center>
			<c:if test="${retorno == 'cpbe'}">
				<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarTodosEas.do'; return false;" />
			</c:if>
			<c:if test="${retorno == 'rr'}">
				<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarEas.do'; return false;" />
			</c:if>
			<c:if test="${retorno != 'rr' && retorno != 'cpbe'}">
				<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
			</c:if>
	</center>
	
	</td>
	
	</tr>
	</table>

</CENTER>
<form:form name="pagoForm" method="post" commandName="pago">
	<input type="hidden" name="idPago" />
</form:form>
</div>
</body>
</html>