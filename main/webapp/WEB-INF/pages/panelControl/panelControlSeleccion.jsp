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
<title>...::Panel de Control Selecci&oacute;n::...</title>

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
	
<style type="text/css">

input[name=search_browser]{	font-size: x-small; width: 85px;}

#busquedaPeriodo { width: 200px; height: 50px; 
					padding: 0.5em; display: none; 
						z-index: 100; font-size: x-small;}

#desde { width: 50px; }
#hasta { width: 50px; }
#capaEfectos2 { display: none;}
#capaEfectos { display: none;}

</style>

<script type="text/javascript">

function buscarPorPeriodo(){
	$("#busquedaPeriodo").toggle();
}


	//init de la tabla de jquery
	

var asInitVals = new Array();

$(function() {
	
	$("#capaEfectos2").toggle("blind");
	$("#capaEfectos").show("5000");
	$("#busquedaPeriodo").draggable();
	$("#desde").datepicker();
	$("#hasta").datepicker();

	$("#mostrar").click(function(event){
		event.preventDefault();
		$("#capaEfectos2").show("slow");
	});
	
	totalizarColumna(1);
	$("#fxs").toggle();
	
});
</script>

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
				
				if(isNaN(parseInt(columnas[i][3]))){
					arrayTabla[j][1]+= 0;
				}else{
					arrayTabla[j][1]+= parseInt(columnas[i][3]);
				}
				arrayTabla[j][2]+= parseInt(columnas[i][4]);
				arrayTabla[j][3]+= parseInt(columnas[i][5]);
				arrayTabla[j][4]+= parseInt(columnas[i][6]);
				encontro = true;
			}
		}

		if(encontro == false){
			var aux = new Array(2);
			aux[0] = columnas[i][idx];
			if(isNaN(parseInt(columnas[i][3]))){
				aux[1] = 0;
			}else{
				aux[1] = parseInt(columnas[i][3]);
			}
			aux[2] = parseInt(columnas[i][4]);
			aux[3] = parseInt(columnas[i][5]);
			aux[4] = parseInt(columnas[i][6]);
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
				{ "sTitle": "Objetivo Selección" },
				{ "sTitle": "Becas Disponibles" },
				{ "sTitle": "Becas Asignadas" },
				{ "sTitle": "Becados Cesados" }
			]
		});
	
		tablaTot.fnAdjustColumnSizing();
		tablaTot.fnDraw();
		
		$("#fxs").toggle();
		
}
</script>

</head>

<body>
<div id="main-content">
<br>
<CENTER>
<table style="margin-left: 50px; margin-right: 50px; z-index: 0;">
<tr >
<td style="vertical-align: top">
<div class="ui-state-default ui-corner-all" >
<h3 align="center">Panel de Control Selecci&oacute;n</h3>
</div>
<table align="center" class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1">

		<thead align="center">
			<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0" end="7" var="loop">
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
				<c:forEach begin="0" end="7">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<!-- Columnas -->
			<tr>
				<th><div title="Zona">Zona</div></th>
				<th><div title="Ciclo">Ciclo</div></th>
				<th><div title="Periodo">Periodo<a href="#" onclick="buscarPorPeriodo()"></a></div></th>
				<th><div title="Objetivo Seleccion">Objetivo Selecci&oacute;n</div></th>
				<th><div title="Becas por zonas">Becas disponibles</div></th>
				<th><div title="Becas asignadas">Becas asignadas</div></th>
				<th><div title="Becados Cesados">Becados Cesados</div></th>
				<th><div title="Becados sin Padrino">Becados sin Padrino</div></th>							
			</tr>
			<tr>
				<c:forEach begin="0" end="7">
					<td>
						<input name="search_browser" value="Buscar" class="search_init"/>
					</td>
				</c:forEach>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${listaBecas}" var="panelControlDTO">
				<tr>
					<td align="left" valign="middle" style="font-size: 14px" class="col0">
					&nbsp;${panelControlDTO.nombreZona} &nbsp;</td>
					
					<td align="left" valign="middle" style="font-size: 14px" class="col1">
					&nbsp;${panelControlDTO.nombreCiclo}&nbsp;</td>
					
					<td align="left" valign="middle" style="font-size: 14px" class="col2">
					&nbsp;${panelControlDTO.nombrePeriodo} &nbsp;</td>					
								
					<td align="center" valign="middle" style="font-size: 14px" class="col3"> 
					${panelControlDTO.becasObjetivosSeleccion}</td>
							
					<td align="center" valign="middle" style="font-size: 14px" class="col4"> 
					${panelControlDTO.becasDisponibles}</td>	
					
					<td align="center" valign="middle" style="font-size: 14px" class="col5"> 
					${panelControlDTO.becasAsignadas}</td>
					
					<td align="center" valign="middle" style="font-size: 14px" class="col6"> 
					${panelControlDTO.becadosCesados}</td>
					
					<td align="center" valign="middle" style="font-size: 14px" class="col7">
					${panelControlDTO.becadosSinPadrino}</td>
				</tr>
			</c:forEach>
	</tbody>
</table>

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
	<div id="busquedaPeriodo" style="background-color: gray;">
		Busqueda avanzada de periodo&nbsp;|&nbsp;<a href="#" onclick="buscarPorPeriodo()">X</a><br><br>
		<table>
			<tr>
				<td>Desde&nbsp;</td><td><input id="desde"/></td><td>Hasta&nbsp;</td><td><input id="hasta"/>&nbsp;<input type="button" value="do"/></td>
			</tr>
		</table>
	</div>
</div>
</body>
</html>