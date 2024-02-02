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
<title>Listado Informes IS2</title>

<script type="text/javascript">

var oTable2;
var selected =  new Array();


$(document).ready(function() {
	$('#cesacionForm').submit( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable2));
		jQuery("#cesacionSeleccionados").val(selected);
		if(selected == ""){
			alert("Debe seleccionar al menos un informe");
			return false;
		}
		else
			return true;
	} );

	
	 oTable2 = $('#tabla').dataTable({
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>' +
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
		"aoColumns" : [
					/* idCandidato */{
						"bSortable" : false,
						"bSearchable" : false,
						"bVisible": false
					},
					null,
		       		null]
		                    		
	});

} );

</script>

<script type="text/javascript">
function enviarForm(action, id){
	
	if(action=='modificar'){
		document.forms['IS2Form'].action = "../informeIS2/modificarView.do";
	}
	document.forms['IS2Form'].idInformeIS2.value = id;
	document.forms['IS2Form'].submit();
}
</script>

</head>
<body>
<div id="main-content">
<form id="IS2Form" class="IS2Form" action="" method="post">
	<center>
		<h1>
			Lista de Informes en Construcción
		</h1>
	</center>
	<br/>
	<CENTER>
	<table align="center" >
	<tr align="center">
	<td style="vertical-align: middle;" align="center">
		<table class="dataTables_wrapper" width="630px" border="0" id="tabla"> 
	
			<thead align="center">
				<tr>
					<th></th>
					<th>Alumno</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${informes}" var="i">
					<tr>
						<td align="left" valign="middle" style="font-size: 14px">${i.id}</td>
						<td align="center" valign="middle" style="font-size: 14px">${i.becado.datosPersonales.apellido},${i.becado.datosPersonales.nombre}</td>
						
						<td align="center"  style="border: 0">
					
							<table>
								<tr>
									<td>
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
											<a  onclick="enviarForm('modificar','${i.id}')">
											<span class="ui-icon ui-icon-pencil" title="Informe Cesacion"> 
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
		<br/>
		
	
	</td>
	</tr>
	</table>
	</CENTER>	
	<input type="hidden" name="idInformeIS2" />
</form>
</div>
</body>
</html>