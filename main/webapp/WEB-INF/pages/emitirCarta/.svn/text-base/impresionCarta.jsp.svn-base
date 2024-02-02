<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Impresion Carta</title>

	



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

function imprimir(){
	var direccion = "../experiencia/agregarDatosPersonales.do";
	var datos = $("#datosPersonalesForm").serialize();
	$.ajax({

	type: "POST",
	cache: false,
	url: direccion,
	dataType: "json",
	processData: false,
	data: datos,
	success: function(){
	alert('se guardaron los datos');
	},
	error: function(){
	alert('no se guardaron los datos');
	}
	
	});


};	
</script>

</head>

<body>
<div id="main-content">
<center><h2>Lista de Alumnos </h2></center>
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" >

		<thead align="center">
			<tr>
				<th>Nombre Alumno</th>
				<th>Apellido Alumno</th>
				<th>Estado Alumno</th>
				<th>Nombre del Responsable</th>
				<th>Apellido del Responsable</th>
				<th>Vinculo</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${listaAlumnos}" var="alumno">
				<tr>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${alumno.datosPersonales.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${alumno.datosPersonales.apellido}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${alumno.estadoAlumno.valor}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${alumno.responsable1.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${alumno.responsable1.apellido}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${alumno.responsable1.idVinculo.valor}&nbsp;</td>
				</tr>
			</c:forEach>
		</tbody>
</table>

<form action="<c:url value="/emitirCarta/imprimirPdf.do"/>" >
	<table align="center">
		<tr>
			<td>
				<input type="submit" value="Crear Carta" class="ui-state-default ui-corner-all"   />
			</td>
			<td>
				<input type="button" value="Imprimir Carta" class="ui-state-default ui-corner-all"   onclick="mensaje()"/>
			</td>
		</tr>
	</table>
</form>	
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>