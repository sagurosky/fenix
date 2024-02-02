<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Entrevistas Supervisor Escolar</title>

<script type="text/javascript">
function enviarForm(id){
	
	document.forms['modificaEntr'].action = "../entrevistaSupervisionEscolar/modificarView.do";
	document.forms['modificaEntr'].idEnt.value = id;
	document.forms['modificaEntr'].submit();
}
</script>

<script type="text/javascript">
$(function() {
	$('#laTabla').dataTable( {
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


</head>

<body>
<div id="main-content">
<center><h1>Entrevistas de Supervisor Escolar</h1></center>
<br />
<CENTER>
<table align="center" style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" >

		<thead align="center">
			<tr>
				<th>Supervisor</th>
				<th>Nivel Educativo</th>
				<th>Equipo Directivo</th>
				<th>Socio Economico Matricula</th>
				<th>Zona</th>
				<th>Fecha de Realizacion</th>
				<th>Acciones</th>
				
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${entrevistaSupervisionEscolar}" var="entrevista">
				<tr>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${entrevista.supervisorEscolar.nombre}&nbsp;</td>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${entrevista.nivelEducativo}&nbsp;</td>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${entrevista.equipoDirectivo}&nbsp;</td>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${entrevista.socioEconomicoMatricula}&nbsp;</td>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${entrevista.zona.nombre}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px">&nbsp;<fmt:formatDate value="${entrevista.fecha}" pattern="yyyy/MM/dd"/>&nbsp;</td>
					<td align="center"  style="border: 0">
						<table>
							<tr>								
								<td>
								<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
									<a  onclick="enviarForm('${entrevista.id}')" > 
									<span class="ui-icon ui-icon-pencil" > 
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

<table border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
     <td width="50" align="center" valign="middle"><input type="button" value="Alta" class="ui-state-default ui-corner-all" 
      onclick="location.href='../entrevistaSupervisionEscolar/entrevistaSupEscolarView.do'; return false;" /></td>
   </tr>
</table>    
<form:form name="modificaEntr" method="post" commandName="modificaEntr">
<input type="hidden" name="idEnt" />

</form:form>  

</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>