<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/static/js/table/tabletools/js/TableTools.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/js/table/tabletools/ZeroClipboard/ZeroClipboard.js"/>"></script>
<link rel="stylesheet"
	href="<c:url value="/static/js/table/tabletools/css/TableTools.css"/>" media="all">
    
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Viaticos</title>

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
$(document).ready(function() {
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

	sumarMontos();
	totalizarColumna(4);
});
</script>

<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>

<script type="text/javascript">

function enviarForm(action, id){
	if(action=='modificar'){
		document.forms['reporteForm'].action ="<c:url value='/viatico/modificarViatico.do'/>";
	}

	document.forms['reporteForm'].idViatico.value = id;
	document.forms['reporteForm'].submit();
}

function sumarMontos(){
	var montos = $(".monto");
	var sumatoria = 0;
	
	for(var i = 0; i < montos.length; i++) {
		sumatoria += parseInt(montos[i].innerHTML);
	}
	$("#totalMonto").val(sumatoria);
	
	/*var sumaMonto = 0;
	var columnaTotalizar = 3;
	
	//obtengo todas las filas
	var filas = oTable.fnGetNodes();

	var columnas = new Array();

	for (var i = 0; i < filas.length; i++) {
		//idx es la posicion de la columna en la fila
		columnas[i] = (oTable.fnGetData(filas[i]));
	}
	    
	for (var i = 0; i < columnas.length; i++) {
		sumaMonto += parseInt(columnas[i][2]);
	}
	$("#totalMonto").val(sumaMonto);*/
}
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
				
				if(isNaN(parseInt(columnas[i][2]))){
					arrayTabla[j][1]+= 0;
				}else{
					arrayTabla[j][1]+= parseInt(columnas[i][2]);
				}
				encontro = true;
			}
		}

		if(encontro == false){
			var aux = new Array(2);
			aux[0] = columnas[i][idx];
			if(isNaN(parseInt(columnas[i][2]))){
				aux[1] = 0;
			}else{
				aux[1] = parseInt(columnas[i][2]);
			}
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
				{ "sTitle": "Monto" }
			]
		});
	
		tablaTot.fnAdjustColumnSizing();
		tablaTot.fnDraw();
		
		$("#fxs").toggle();
		
}
</script>

<style type="text/css">
label { width: 10em; float: left; }
label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
p { clear: both; }
.submit { margin-left: 12em; }
em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
</head>
<body>
<div id="main-content">
<br></br>
<form:form modelAttribute="viatico" commandName="viatico" name="reporteForm" id="reporteForm" method="post" >
<input type="hidden" name="idViatico" id="idViatico">


<CENTER>

	<table style="margin-left: 50px; margin-right: 50px;" >
	<tr>
	<td align="left" style="font-size: medium">Total Monto:&nbsp;
				<input id="totalMonto" value="" disabled="disabled" size="12"/></td>
	</tr>
	<tr>
	<td>
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all" align="center">
		<h3 align="center">Rendici&oacute;n de Vi&aacute;ticos</h3>
		</div>
		<!-- Fin titulo -->
		<table align="center" class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1">
			<thead title="Detalle de Viaticos">			
					<!-- Panel de funciones	-->
					<tr id="fxs" style="display: none;">
						<c:forEach begin="0" end="4" var="loop">
							<td>
								<div class="ui-state-default ui-corner-all" style="height: 40px;">
									<div title="subtotalizar columna"> 
										<a href="#ancla" onclick="subtotalizarColumna(${loop})">subtotalizar</a>				
									</div>
									<div title="agrupar columna"> 
										<a href="#" onclick="agruparColumna(${loop})">agrupar</a>				
									</div>
									<c:if test="${loop != 2}">
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
					<!-- Columnas -->				
					<tr>
						<th>Concepto Vi&aacute;tico</th>
						<th>Detalle/Comentario</th>	
						<th>Monto</th>					
						<th>Periodo</th>						
						<th>Estado del Pago</th>
						<th id="acciones">Acciones</th>					
					</tr>
					<tr>
						<c:forEach begin="0" end="4">
							<td><input name="search_browser" value="Buscar" class="search_init"/></td>
						</c:forEach>
						<td></td>
					</tr>
							
			</thead>
			
			<tbody align="center">					
									
					<c:forEach items="${viaticos}" var="viatico" varStatus="loop">
					<tr>
					
						
						<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px;" class="col0">${viatico.conceptoViatico.valor}</td>
						
						<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px;" class="col1">${viatico.comentario}</td>
						
						<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px;" class="monto col2">${viatico.valor}</td>
																								  	
						<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px;" class="col4">${viatico.periodo.nombre}</td>												
						
						<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px;" id="estadoPago" class="col5">${viatico.estadoPago.valor}</td> 	
						
						<td>
							<table>
								<tr>
									<td>									
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" title="modificar" > 
											<c:choose>
												<c:when test="${viatico.estadoPago.id == 2}">
													<a onclick="enviarForm('modificar','${viatico.id}')"> 
														<span class="ui-icon ui-icon-pencil" ></span>
													</a>
												</c:when>
												<c:otherwise>
													<a > 
														<span class="ui-icon ui-icon-pencil" ></span> 
													</a>
												</c:otherwise>											
											</c:choose>				
										</div>
									</td>																						
								</tr>
							</table>
						</td>																									
					</tr>							
					</c:forEach>

			</tbody>
		</table>
	<!-- Pie de la Tabla -->
	<div class="ui-state-default ui-corner-all" align="center">
		<table align="center">
			<tr>					
				<td align="center" valign="middle" style="font-size: 14px">					
					<input type="submit" value="Alta" class="ui-state-default ui-corner-all" 
					onclick="location.href='../viatico/altaViatico.do'; return false;" />									 								
				</td>			
			</tr>
			
		</table>
	</div>
	<!-- Fin pie -->
	
	</table>
	<br></br>
	<a name="ancla2"></a>
	<div id="contenedor2" style="width: 60%;">
	
	</div>
	<br><br>
	<a name="ancla"></a>
	<div id="contenedor" style="width: 60%;"></div>

</CENTER>
</form:form>
</div>
</body>
</html>