<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Responsables</title>

	
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

<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>

<script type="text/javascript">
$(function() {
	TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
		
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
		"sDom": '<"H"Tl>rt<"F"ip>'
	});
});
</script>	
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
<script type="text/javascript">
function enviarForm1(action, id){
	confirma = true;

	if(action=='modificar'){
		document.forms['responsableForm'].action = "../responsable/modificarResponsable.do";
	}else{
		document.forms['responsableForm'].action = "../responsable/eliminarResponsable.do";
	}

	if(confirma){
		document.forms['responsableForm'].idResponsable.value = id;
		document.forms['responsableForm'].submit();
	}
}
</script>
</head>
<body >
<div id="main-content">
<br>
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td style="vertical-align: top">
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all" >
<h3 align="center">Listado de Responsables Adultos</h3>
</div>
<!-- Fin titulo -->
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1"> 

<thead title="Listas" align="center" style="width: 100%">
	<tr>
		<th align="center">Nombre</th>
		<th align="center">Apellido</th>
		<th align="center" id="acciones">Acciones</th>
	</tr>
	<tr>
		<td><input name="search_browser" value="Buscar" class="search_init"/></td>
		<td><input name="search_browser" value="Buscar" class="search_init"/></td>
		<td></td>	
	</tr>
</thead>
<tbody>
	

	<c:forEach items="${responsables}" var="responsable">
		<tr>
			<td align="center" nowrap="nowrap" style="font-size: 14px;">&nbsp;${responsable.nombre}&nbsp;</td>
			
			<td align="center" nowrap="nowrap" style="font-size: 14px;">&nbsp;${responsable.apellido}&nbsp;</td>

		   	<td align="center"  style="border: 0">
			
			<table>
			<tr>
			<td>
			<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
					<a  onclick="enviarForm1('modificar','${responsable.id}')" > 
					<span class="ui-icon ui-icon-pencil" > 
					</span></a>				
			</div>
			</td>
			
			<td>
			<div style= width:0.5cm class="ui-state-default ui-corner-all" >
					<a onclick="enviarForm1('eliminar','${responsable.id}')">
					<span class="ui-icon ui-icon-trash" >
					</span></a>

			</div>
			</td>
			</tr>
			</table>
		</tr>
	</c:forEach>
</tbody>
</table>
<!--<div class="ui-state-default ui-corner-all" >-->
<!--	<table align="center">-->
<!--	<tr>-->
<!--		<td>-->
<!--			<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../responsable/altaResponsable.do'" />-->
<!--		</td>-->
<!--	</tr>-->
<!--	</table>-->
<!--</div>-->
<br />
<br />
<form:form name="responsableForm" method="post" commandName="responsable">
<input type="hidden" name="idResponsable" />
</form:form>
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>