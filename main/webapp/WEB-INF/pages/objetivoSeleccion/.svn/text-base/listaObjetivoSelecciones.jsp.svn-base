<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte de objetivos de selecci&oacute;n</title>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
	<script type="text/javascript"
	src="<c:url  value="/static/js/table/ColVis.min.js"/>"></script>
	<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/js/TableTools.min.js"/>"></script>
	<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/ZeroClipboard/ZeroClipboard.js"/>"></script>
	
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"
	media="all">
	<link rel="stylesheet"
	href="<c:url  value="/static/js/table/tabletools/css/TableTools.css"/>"
	media="all">

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 100px;
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
	TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
		
	oTable = $('#laTabla').dataTable( {
		"sDom": '<"H"Tl>rt<"F"ip>',
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

	totalizarColumna(0);
	$("#fxs").toggle();
	
});
</script>

<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>

<script type="text/javascript">
function totalizarColumna(idx){
	
	var columnaTotalizar = 3;
	
	//obtengo todas las filas
	var filas = oTable.fnGetNodes();

	var columnas = new Array();

	for (var i = 0; i < filas.length; i++) {
		//idx es la posicion de la columna en la fila
		columnas[i] = (oTable.fnGetData(filas[i]));
	}

	//es el array que va a contener los datos para la nueva tabla
	var arrayTabla = new Array();
	    
	for (var i = 0; i < columnas.length; i++) {
		var encontro = false;

		for(var j = 0; j < arrayTabla.length; j++){
			if(columnas[i][idx] == arrayTabla[j][0]){
				arrayTabla[j][1]+= parseInt(columnas[i][3]);
				arrayTabla[j][2]+= parseInt(columnas[i][4]);
				arrayTabla[j][3]+= parseInt(columnas[i][5]);
				encontro = true;
			}
		}

		if(encontro == false){
			var aux = new Array(2);
			aux[0] = columnas[i][idx];
			aux[1] = parseInt(columnas[i][3]);
			aux[2] = parseInt(columnas[i][4]);
			aux[3] = parseInt(columnas[i][5]);
			arrayTabla.push(aux);
		}
	}

	// $('#contenedor').html('<div class="ui-state-default ui-corner-all" ><a href="#" onclick="cerrarTabla()">cerrar</a></div>');
	$('#contenedor2').html( '<table cellpadding="0" cellspacing="0" border="0" class="display" id="ejemplo2"></table>' );
	$('#contenedor2').append('<div class="ui-state-default ui-corner-all" ><table align="center">'+
		'<tr><td><a href="#" onclick="cerrarTabla(\'contenedor2\')"><b>Cerrar<b> </a></td></tr></table></div>' );

	var tablaTot = $('#ejemplo2').dataTable({
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
		"aaData": arrayTabla,
		"aoColumns": [
		        { "sTitle": "Nombre" },
				{ "sTitle": "Cantidad Becas" },
				{ "sTitle": "Becados Cesados" },
				{ "sTitle": "Becas a Disponer" }
			]
		});
	
		tablaTot.fnAdjustColumnSizing();
		tablaTot.fnDraw();
		
		$("#fxs").toggle();
		
}
</script>
	
</head>

<body >
<div id="main-content" >
<br></br>
<form id="reporteForm" class="reporteForm" action="<c:url value="/objetivoSeleccion/altaObjetivoSeleccionView.do"/>" method="post">

<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all">
<h3 align="center">Reporte de objetivos de selecci&oacute;n</h3>
</div>
<!-- Fin titulo -->
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1">
		<thead align="center">
			<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0" end="5" var="loop">
					<td>
						<div class="ui-state-default ui-corner-all" style="height: 40px;">
							<div title="subtotalizar columna"> 
								<a href="#ancla" onclick="subtotalizarColumna(${loop})">subtotalizar</a>				
							</div>
							<div title="agrupar columna"> 
								<a href="#" onclick="agruparColumna(${loop})">agrupar</a>				
							</div>
							<c:if test="${loop < 3}">
								<div title="totalizar columna"> 
									<a href="#ancla2" onclick="totalizarColumna(${loop})">totalizar</a>				
								</div>
							</c:if>
						</div>
					</td>
				</c:forEach>
					<td>
					<div class="ui-state-default ui-corner-all" style="width: auto; height: 40px;">
					</div>
				</td>
			</tr>
			<!-- Botones para mostrar funciones	-->
			<tr>
				<c:forEach begin="0" end="5">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<tr>				
				<th>Ciclo</th>					
				<th>Periodo</th>
				<th>Zona</th>
				<th>Cantidad de Becas</th>	
				<th>Becados Cesados</th>
				<th>Becas a Disponer Por Egreso</th>
				
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
				<c:forEach var="objSeleccion" items="${listObjSelDTO}" varStatus="loop">
						<tr>
							<td align="left" valign="middle" style="font-size: 14px" class="col0">&nbsp;${objSeleccion.cicloPrograma.nombre}&nbsp;</td>
							<td align="left" valign="middle" style="font-size: 14px" class="col1">&nbsp; ${objSeleccion.periodo.nombre}&nbsp;</td>
							<td align="left" valign="middle" style="font-size: 14px" class="col2">&nbsp;${objSeleccion.zona.nombre}&nbsp;</td>	
							<td align="center" valign="middle" style="font-size: 14px" class="col3">${objSeleccion.cantidadBecas}</td>	
							<td align="center" valign="middle" style="font-size: 14px" class="col4">${objSeleccion.cantidadBecasCesadas}</td>
							<td align="center" valign="middle" style="font-size: 14px" class="col5">${objSeleccion.cantidadBecasDisponiblesPorEgreso}</td> 
						</tr>
					</c:forEach>																
				
			
		</tbody>
		
</table>
<br>
</td>
</tr>


</table>
<br></br>
<a name="ancla2"></a>
<div id="contenedor2" style="width: 60%;">

</div>
<br><br>
<a name="ancla"></a>
<div id="contenedor" style="width: 60%;">

</div>
</CENTER>
</form>	
</div>
</body>
</html>