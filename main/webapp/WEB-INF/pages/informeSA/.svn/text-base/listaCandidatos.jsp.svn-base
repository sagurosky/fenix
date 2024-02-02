<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Informes S.A.</title>

<script type="text/javascript">
$(function() {
	$('#tablaCandidatos').dataTable( {
		"sDom": '<"H"l>rt<"F"ip>',
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
		"iDisplayLength": 25
	});
	});
</script>

<script type="text/javascript">
function enviarForm(action, id){
	if(action=='lista'){
		document.forms['informeSAForm'].action = "../informeSA/listaEntrevistasView.do";
	}else if(action=='boletin'){
		document.forms['informeSAForm'].action = "../entrevistas/registrarBoletinView.do";
	}else if(action=='alta'){
		document.forms['informeSAForm'].action = "../informeSA/registrarInformeSAView.do";
	}
	document.forms['informeSAForm'].id.value = id;
	document.forms['informeSAForm'].submit();
}


</script>

</head>
<body>
<div id="main-content">
<center>
	<h1>Lista de Informes SA de Candidatos</h1>
</center>
<br />
<CENTER>
<table align="center" >
<tr align="center">
<td style="vertical-align: middle;" align="center">
	<table class="dataTables_wrapper" width="100%" border="0" id="tablaCandidatos"> 

		<thead align="center">
			<tr>
				<th>Alumno</th>
				<th>Escuela</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${alumnos}" var="a">
				<tr>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${a.datosPersonales.nombre}&nbsp;${a.datosPersonales.apellido}</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${a.escuela.nombre}&nbsp;</td>
					
					<td align="center"  style="border: 0">
				
						<table>
							<tr>								
								<td>
									<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
										<a  onclick="enviarForm('alta','${a.id}')" > 
										<span class="ui-icon ui-icon-plus" ></span>
										</a>				
									</div>
								</td>	
							</tr>
						</table>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
<br />
<table align="center">

</table>

<form:form name="informeSAForm" method="post" commandName="informeSA">
<input type="hidden" name="id" />

</form:form>
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>