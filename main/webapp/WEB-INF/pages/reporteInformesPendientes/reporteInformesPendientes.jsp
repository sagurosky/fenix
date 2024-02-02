<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte Informes Pendientes</title>
	
<script type="text/javascript">


$(document).ready(function() {
	oTable = $('#tabla1').dataTable( {
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


	$("thead input").keyup( function () {
		/* Filter on the column (the index) of this element */
		oTable.fnFilter( this.value, $("thead input").index(this) );
	} );
	
	$("thead input").each( function (i) {
		asInitVals[i] = this.value;
	} );
	
	$("thead input").focus( function () {
		if ( this.className == "search_init" )
		{
			this.className = "";
			this.value = "";
		}
	} );
	
	$("thead input").blur( function (i) {
		if ( this.value == "" )
		{
			this.className = "search_init";
			this.value = asInitVals[$("thead input").index(this)];
		}
	} );

	jQuery('thead select').change( function() {
	select_val = jQuery(this).val();
	if (select_val == "All" || select_val == '') {
		oTable.fnFilter("");
		oTable.fnDraw();
	} else {
		oTable.fnFilter(select_val);
	}
	jQuery('thead select').val(select_val);
} );

} );

</script>

</head>

<body>
<div id="main-content">
<form id="reporteForm" class="reporteForm"  method="post">
<center><h1>Reporte Informes Pendientes</h1></center>
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;" >
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="tabla1" width="100%" border="0" title="Informes">
		<thead align="center">
			<tr>
				<th>Nombre</th>
				<th>Estado</th>
				<th>Fecha Alta</th>
				<th>Fecha Alta2</th>
			</tr>
			<tr>
				<td><input type="text" name="search_nombre" value="Buscar Nombre" class="search_init" /></td>
				<td><input type="hidden" name="search_estado" value="Buscar Estados" class="search_init" />
					<select id="estados" name="estados">
						<option value="All">Todos</option>
						<c:forEach var="estado" items="${estados}">
							<option value="${estado.valor}">${estado.valor}</option>
						</c:forEach>
					</select>			
				</td>
				<td><input type="hidden" value="Buscar Fecha" name="search_browser2" class="search_init" /></td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${informes}" var="informe">
				<tr>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${informe.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${informe.estado}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;<fmt:formatDate value="${informe.fechaAlta}" pattern="dd/MM/yyyy"/>&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;<fmt:formatDate value="${informe.fechaAlta}" pattern="dd/MM/yyyy"/>&nbsp;</td>
				<td align="center"  style="border: 0"></td>
			</c:forEach>
	</tbody>
	
</table>
</td>
</tr>
</table>
</CENTER>
</form>	
</div>
</body>
</html>