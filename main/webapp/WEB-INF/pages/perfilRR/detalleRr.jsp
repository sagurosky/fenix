<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Ver Eas</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type="text/javascript">
$(function() {
	$('#laTabla').dataTable( {
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>'+
		'<option value="50">50</option>'+
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
<center>
	<h1>
		Responsable Regional: ${rr.datosPersonales.apellido},${rr.datosPersonales.nombre}
	</h1>
</center>
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td style="vertical-align: top">
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0"> 
	<thead>
		<tr>
			<th>Nombre y Apellido</th>			
			<th>Recordatorios</th>
			<th>Motivo de Pago Fallido</th>

		</tr>
	</thead>
	<tbody>
			<tr>
				<td align="center"  style="font-size: 14px;" >&nbsp;${rr.datosPersonales.apellido},${rr.datosPersonales.nombre}
				</td>				
				<td  style="font-size: 14px">&nbsp;
				<c:forEach items="${rr.recordatorios}" var="recordatorio">
					<font style="color: purple;">${recordatorio.titulo}</font>
				</c:forEach>
				</td>
				<td align="left" style="font-size: 14px">
				<c:forEach items="${pagos}" var="pago">
					
					<font style="font-size: 14px;">Pago nº:&nbsp;${pago.id}</font>
					${pago.motivo}<br></br>
					
				</c:forEach>
				</td>
			</tr>
	</tbody>
</table>

<br />
<br/>
<br/>
		<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="javascript:history.go(-1)" />
</td>
</tr>
</table>
</CENTER>
</div>
</body>
</html>