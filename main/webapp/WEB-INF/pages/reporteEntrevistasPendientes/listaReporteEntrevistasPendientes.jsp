<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte Entrevistas Pendientes - Bug 814</title>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
<script type="text/javascript">

function autoCompleteGeneric( url, tag, hiddenName ){
	$(tag).autocomplete({
		source: function(request, response) {
			$.ajax({
				url: url,
				dataType: "json",
				data: {
					style: "full",
					name_startsWith: request.term				
				},
				success: function(data) {
					response($.map(data.ItemAutoComplete, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id
						}
					}))
				}
			})
		},
		select: function(event, ui) {
			$(hiddenName).val(ui.item.id); 

		},
		open: function() {
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function() {
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	});
};

</script>



<script type="text/javascript">
$(function() {
	$('#laTabla').dataTable( {
		"sDom": '<"H"l>rt<"F"ip>',
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
<center><h2>Lista de Reporte de Entrevistas Pendientes</h2></center>
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" >

		<thead align="center">
			<tr>
				<th>Periodo</th>
				<th>Zona Cimientos</th>
				<th>Becas disponibles por zonas</th>
				<th>Becas alcanzadas por zonas</th>							
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${reporteEntrevistasPendientes}" var="reporteEntrevistasPendientes">
				<tr>
					
					<td align="left" valign="middle" style="font-size: 14px">
					&nbsp;${reporteEntrevistasPendientes.registrarObjetivoSeleccion.periodo.nombre}&nbsp;</td>					
					
					<td align="left" valign="middle" style="font-size: 14px">&nbsp; 
					&nbsp;${reporteEntrevistasPendientes.registrarObjetivoSeleccion.zona.nombre}&nbsp;</td>
										
					<td align="left" valign="middle" style="font-size: 14px">&nbsp; 
					&nbsp;${reporteEntrevistasPendientes.beca.cantidad}&nbsp;</td>	
					
					<td align="left" valign="middle" style="font-size: 14px">&nbsp; 
					&nbsp;${reporteEntrevistasPendientes.registrarObjetivoSeleccion.cantidadBecas}&nbsp;</td>																											
				</tr>
			</c:forEach>
	</tbody>
</table>

</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>