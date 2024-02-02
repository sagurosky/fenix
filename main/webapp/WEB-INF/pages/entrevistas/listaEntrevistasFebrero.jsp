<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Espacio de acompañamiento</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 168px; 
		color: gray;
		font-style: italic; 
	}
</style>

<script type="text/javascript">
jQuery.fn.dataTableExt.oSort['arg_date-asc']  = function(a,b) {
	var ukDatea = a.split('/');
	var ukDateb = b.split('/');
	
	var x = (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
	var y = (ukDateb[2] + ukDateb[1] + ukDateb[0]) * 1;
	
	return ((x < y) ? -1 : ((x > y) ?  1 : 0));
};

jQuery.fn.dataTableExt.oSort['arg_date-desc'] = function(a,b) {
	var ukDatea = a.split('/');
	var ukDateb = b.split('/');
	
	var x = (ukDatea[2] + ukDatea[1] + ukDatea[0]) * 1;
	var y = (ukDateb[2] + ukDateb[1] + ukDateb[0]) * 1;
	
	return ((x < y) ? 1 : ((x > y) ?  -1 : 0));
};
var oTable;

$(document).ready(function() {
	TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
		
	 oTable = $('#laTabla').dataTable({
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
		"aaSorting": [[ 6, "desc" ]],		
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"aoColumns" : [
		       		null,
		       		null,
		       		null,
		       		null,
		       		null,
		       		{
						"bSearchable" : false,
						"bVisible": false,
						"sType": "arg_date"
					},
					{
						"bSortable" : false
					}],
							
		"sDom": '<"H"Tl>rt<"F"ip>'
		                    		
	});
} );
</script>
<script type="text/javascript" src="<c:url value="/static/js/table/funcionesTabla.js"/>"></script>
<script type="text/javascript">
function enviarForm(action, id,idTipoEntrevista){
	if(action=='modificar'){
		document.forms['entrevistaForm'].action = "../entrevistas/modificarEntrevistasView.do";
	}else if(action=='ver'){
		document.forms['entrevistaForm'].action = "../entrevistas/verEntrevistasView.do";
	}
	document.forms['entrevistaForm'].entrevistaId.value = id;
	document.forms['entrevistaForm'].tipoEntrevistaId.value = idTipoEntrevista;
	document.forms['entrevistaForm'].submit();
}
</script>

</head>
<body>
<div id="main-content">
<br>
<center>
<h1>
<a  href="<c:url value='/fichaAlumno/fichaAlumnoView.do?idAlumno=${alumno.id}&urlRegreso=${urlRegreso}'/>">${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</a></h1></center>
<br>
<CENTER>
<table align="center" >
<tr align="center">
<td style="vertical-align: top">
	<!-- Titulo de la Tabla -->
	<div class="ui-state-default ui-corner-all" align="center">
		<h3 align="center">Lista de Espacio de acompañamiento - Febrero 2020</h3>
	</div>
	<!-- Fin titulo -->
	<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF"> 
		<thead align="center">
		<tr id="fxs" style="display: none;">
						<td>
						<div class="ui-state-default ui-corner-all" style="width: auto; height: 40px;">
						</div>
					</td>
				</tr>
				<!-- Columnas -->
				<tr>
				<th>Periodo </th>
				<th>Tipo </th>
				<th>Forma </th>
				<th>Evaluación del Cobro de la Beca</th>
				<th>Estado </th>
				<th>Fecha Carga</th>
				<th>Acciones</th>
			</tr>
				<tr>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>	
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				</tr>
			</thead>
		
		<tbody align="center">
			<c:forEach items="${entrevistas}" var="e">
				<tr>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.periodoDePago.nombre}&nbsp;</td>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.tipoEntrevista.valor}&nbsp;</td>
					<c:if test="${e.entrevistaGrupal != null}">
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;Grupal&nbsp;</td>
					</c:if>
					<c:if test="${e.entrevistaGrupal == null}">
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;Individual&nbsp;</td>
					</c:if>						
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;
		   				${e.evaluacionCobroBeca.valor}&nbsp;
					</td>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.estadoEntrevista.valor}&nbsp;</td>
				<td align="center" valign="middle" style="font-size: 14px"><fmt:formatDate value="${e.fechaCarga}" pattern="dd/MM/yyyy"/>&nbsp;</td>
					<td align="center"  style="border: 0">
						<table>
							<tr>
								<c:if test="${e.estadoEntrevista.valor == 'En construccion'}">
									<td>
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
											<a  onclick="enviarForm('modificar','${e.id}','${e.tipoEntrevista.id}')"> 
											<span class="ui-icon ui-icon-pencil" title="Editar Entrevista"> 
											</span></a>				
										</div>
									</td>
								</c:if>
								<td>
									<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
										<a  onclick="enviarForm('ver','${e.id}','${e.tipoEntrevista.id}')"> 
										<span class="ui-icon ui-icon-zoomin" title="Ver Entrevista"> 
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
<br />
<table align="center">
	<tr>
		<td>
						
				<input type="submit" value="Alta Ent. Febrero" class="ui-state-default ui-corner-all" onclick="window.location.href='../entrevistas/registrarEntrevistasView.do?tipo=fe&idAlumno=' + ${alumno.id}" />
					
		</td>
	</tr>
</table>
<br />
<table align="center">
	<tr>
		<td>
			<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
		</td>
	</tr>
</table>
<form:form name="entrevistaForm" method="post" commandName="entrevista">
<input type="hidden" name="entrevistaId" />
<input type="hidden" name="tipoEntrevistaId" />

</form:form>
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>