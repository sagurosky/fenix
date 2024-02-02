<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Supervisor Escolar</title>

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
		"sDom": '<"H"l>rt<"F"ip>'
	});
});
</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
<script type="text/javascript">
function enviarForm(action, id){
	
	if(action=='modificar'){
		document.forms['formSupervisor'].action = '<c:url value="/supervisorEscolar/modificarSupervisorView.do"/>';
	}else if(action=='eliminar'){
		document.forms['formSupervisor'].action = '<c:url value="/supervisorEscolar/eliminarSupervisorEscolar.do"/>';
	}
	
	document.forms['formSupervisor'].idSupervisor.value = id;
	document.forms['formSupervisor'].submit();
}
</script>

</head>

<body>
<div id="main-content">
<br>
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td style="vertical-align: top">
<div class="ui-state-default ui-corner-all" >
<h3 align="center">Listado de Supervision escolar</h3>

<form name="formSupervisor" method="post" >
	
	<input type="hidden" name="idSupervisor" id="idSupervisor" />

</form>

</div>
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1">

		<thead align="center">
			<tr id="fxs" style="display: none;">
				<td><a href="#ancla" onclick="subtotalizarColumna(0)">subt</a>&nbsp;
					<a href="#" onclick="agruparColumna(0)">agrupar&nbsp;</a>
					<a href="javascript:location.reload(true)">desagrupar</a></td>
				<td><a href="#ancla" onclick="subtotalizarColumna(1)">subt</a>
					<a href="#" onclick="agruparColumna(1)">agrupar&nbsp;</a>
					<a href="javascript:location.reload(true)">desagrupar</a></td>
				<td><a href="#ancla" onclick="subtotalizarColumna(2)">subt</a>
					<a href="#" onclick="agruparColumna(2)">agrupar&nbsp;</a>
					<a href="javascript:location.reload(true)">desagrupar</a></td>
			</tr>
			<tr>
				<th>Nombre</th>
				<th>Cargo</th>
				<th>Nivel</th>
				<th>Direccion</th>
				<th>Localidad</th>
				<th>Escuela</th>
				<th>Acciones</th>
			</tr>
			<tr>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${supervisorEscolars}" var="supervisorEscolar">
				<tr>
					<td align="left" valign="middle" style="font-size: 14px">${supervisorEscolar.nombre}</td>
					<td align="left" valign="middle" style="font-size: 14px">${supervisorEscolar.cargo}</td>
					<td align="left" valign="middle" style="font-size: 14px">${supervisorEscolar.nivel}</td>
					<td align="left" valign="middle" style="font-size: 14px">${supervisorEscolar.direccion}</td>
					<td align="left" valign="middle" style="font-size: 14px">${supervisorEscolar.localidad.nombre}</td>
					<td align="left" valign="middle" style="font-size: 14px">${supervisorEscolar.escuela.nombre}</td>
					<td align="center"  style="border: 0">
				
						<table>
							<tr>								
								<td>
									<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
										<a  onclick="enviarForm('modificar','${supervisorEscolar.id}')" > 
										<span class="ui-icon ui-icon-pencil" ></span>
										</a>				
									</div>
								</td>
								<td>
								<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
									<a  onclick="enviarForm('eliminar','${supervisorEscolar.id}')" > 
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

<form method="post" action="<c:url value="/supervisorEscolar/supervisorEscolarView.do"/>">
<div class="ui-state-default ui-corner-all" >
	<table align="center">
		<tr>
			<td>
				<input type="submit" value="Alta" class="ui-state-default ui-corner-all" />
			</td>
		</tr>
	</table>
</div>
</form>
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