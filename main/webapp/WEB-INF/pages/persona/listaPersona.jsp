<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Personas</title>

	
<script type="text/javascript">
function enviarForm(action, id){
	if(action=='modificar'){
		document.forms['personaForm'].action = "../persona/modificarPersonaView.do";
	}else if(action=='eliminar'){
		document.forms['personaForm'].action = "../persona/listaPersona.do";
	}
	document.forms['personaForm'].id.value = id;
	document.forms['personaForm'].submit();
}
</script>

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
<center><h2>Lista de Personas</h2></center>
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0">

		<thead align="center">
			<tr>
				<th>CUIL</th>
				<th>Apellido y nombre</th>
				<th>DNI</th>
				<th>Direccion</th>
				<th>e-mail</th>
				<th>Fecha de Nacimiento</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${personas}" var="persona">
				<tr>
					<td align="center" valign="top" style="font-size: 14px">&nbsp;${persona.cuilCuit}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px">&nbsp;${persona.apellido},&nbsp;${persona.nombre}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px">&nbsp;${persona.dni}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px">&nbsp;${persona.direccion}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px">&nbsp;${persona.mail}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px">&nbsp;<fmt:formatDate value="${persona.fechaNacimiento}" pattern="dd/MM/yyyy"/>&nbsp;</td>
					
				<td align="center"  style="border: 0">
			
				<table>
				<tr>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('modificar','${persona.id}')"> 
						<span class="ui-icon ui-icon-pencil" > 
						</span></a>				
					</div>
				</td>
			
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('eliminar','${persona.id}')" > 
						<span class="ui-icon ui-icon-trash" > 
						</span></a>				
					</div>
				</td>	
				</tr>
				</table>
			</c:forEach>
	</tbody>
</table>
<br />
<table align="center">
<tr>
	<td>
		<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../persona/registrarPersonaView.do'" />
		<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../persona/listaPersona.do'; return false;" />
	</td>
</tr>
</table>

<form:form name="personaForm" method="post" commandName="persona">
<input type="hidden" name="id" />
</form:form>
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>