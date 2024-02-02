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
<center>
	<h1>
		Lista de Encargados de Acompañamiento
	</h1>
</center>
<br />
<CENTER>
<table style="margin-left: 10px; margin-right: 10px;">
<tr >
<td style="vertical-align: top">
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0"> 
	<thead>
		<tr>
			<th>Nombre y Apellido</th>
			<th>Responsable Regional</th>
			<th>Recordatorios</th>
			

		</tr>
	</thead>
	<tbody>
		<c:forEach items="${perfilesEA}" var="perfilEA">
			<tr>
				<td align="center" style="font-size: 14px;">&nbsp;${perfilEA.datosPersonales.apellido},${perfilEA.datosPersonales.nombre}</td>				
				<td align="center"  style="font-size: 14px;" >&nbsp;
				<a  href="<c:url value='/perfilRR/detalleRr.do?idRr=${perfilEA.rr.idPerfilRR}&idRecordatorio=${recordatorio.id}'/>"> 
				${perfilEA.rr.datosPersonales.apellido},${perfilEA.rr.datosPersonales.nombre}
				</a>
				</td>				
				<td align="center" valign="top" style="font-size: 14px">&nbsp;
					<c:forEach items="${perfilEA.recordatorios}" var="recordatorio">
					<table>
					<tr>
					<td><font style="color: purple;">${recordatorio.titulo}</font></td>
					<td>${recordatorio.detalle}</td>
					<td><fmt:formatDate value="${recordatorio.fechaVencimiento}" pattern="yyyy/MM/dd"/></td>
					<td>
						<a href="<c:url value="/pago/verPagosRecordatorio.do?idRecordatorio=${recordatorio.id}"/>">
							Ver Pagos
						</a>
						</td>
					</tr>		
					</table>
					</c:forEach>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

<br />
<br/>
<br/>
<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../pago/listaPagoBecadosView.do'; return false;" />

</td>
</tr>
</table>
</CENTER>
</div>
</body>
</html>