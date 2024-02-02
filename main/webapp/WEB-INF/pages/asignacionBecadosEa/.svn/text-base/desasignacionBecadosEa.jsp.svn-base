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
<title>Desasignaci&oacute;n Becados Eas</title>

	
<script type="text/javascript">
function enviarForm(action, id){
	if(action=='desasignar'){
		document.forms['eaForm'].action = "../asignacionBecadosEa/listaBecadosEaView.do";
	}
	document.forms['eaForm'].idPerfilEA.value = id;
	document.forms['eaForm'].submit();
}


</script>


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
<center><h2>Desasignaci&oacute;n Becados Eas</h2></center>
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >

<table align="center"  class="dataTables_wrapper" id="laTabla" width="610px"  border="0" title="Eas">
		<thead align="center">
			<tr>
				<th>Nombre</th>
				<th>Apellido</th>
				<th>Zonas</th>
				<th>Cantidad de becados asignados</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${perfileas}" var="ea">
			<c:if test="${ea.datosPersonales.nombre != null || ea.datosPersonales.apellido != null}">
				<tr>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${ea.datosPersonales.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${ea.datosPersonales.apellido}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">
						<c:forEach items="${ea.zona}" var="zona">
							&nbsp;${zona.nombre};&nbsp;
						</c:forEach>
					</td>
					<td align="left" valign="middle" style="font-size: 14px">
						&nbsp;${ fn:length(ea.becados) } &nbsp;
					</td>
					<td align="center"  style="border: 0">
						<table>
							<tr>
								<td>
									<input type="button"  onclick="enviarForm('desasignar','${ea.idPerfilEA}')" value="Desasignar"/>
								</td>
							</tr>
						</table>
				</td>		
			</c:if>	
			</c:forEach>
	</tbody>

</table>

<form:form name="eaForm" method="post" commandName="ea">
<input type="hidden" name="idPerfilEA" />
</form:form>
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>