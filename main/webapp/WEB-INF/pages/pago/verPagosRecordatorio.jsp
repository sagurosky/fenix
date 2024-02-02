<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Pagos de un Recordatorio</title>
<script type="text/javascript">
$(function() {
	$('#tabla').dataTable( {
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
		"iDisplayLength": 25
	});
	});
</script>
</head>

<body>
<div id="main-content">
<center><h1>Lista de Pagos del Recordatorio: ${recordatorio.titulo}</h1></center>
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="tabla" width="100%" border="0">
<thead title="Pagos de un Recordatorios" >
	<tr align="center">
		<th>EA</th>
		<th>Fecha de Exportacion</th>
		<th>Monto</th>
		<th>Motivo</th>
	</TR>
	
</thead>
<tbody>
		
  		<c:if test="${!empty recordatorio.pagos}">
			<c:forEach items="${recordatorio.pagos}" var="pago">
			<tr align="left">
					<td align="center"  valign="top" style="font-size: 14px; ">&nbsp;${pago.becado.datosPersonales.nombre},&nbsp;${pago.becado.datosPersonales.apellido}&nbsp;</td>
					<td align="center"  valign="top" style="font-size: 14px">&nbsp;
						<fmt:formatDate value="${pago.fechaExportacion}" pattern="yyyy/MM/dd"/>&nbsp;</td>
					<td align="center"  valign="top" style="font-size: 14px">&nbsp;${pago.monto}&nbsp;</td>
					<td align="center"  valign="top" style="font-size: 14px">&nbsp;${pago.motivo}&nbsp;</td>
					
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty recordatorio.pagos}">
		<tr>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>	
					
		</tr>
		</c:if>
	</tbody>
</table>
<br></br>
		<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../pago/listaPagoBecadosView.do'; return false;" />
<br></br>
</td>
</tr>
</table>
</CENTER>
</div>
</body>
</html>