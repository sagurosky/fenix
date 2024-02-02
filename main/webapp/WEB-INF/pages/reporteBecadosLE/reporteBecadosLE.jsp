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
<title>Reporte Becados en Lista de Espera</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 150px;
		color: gray;
		font-style: italic; 
	}
	
	table#laTabla{
		 background-color: #C0C2FF;
		 border: 0;
	}
</style>


<script type="text/javascript">
//Parche para los filtros para la seleccion multiple
	var  isMultipleSeleccion = true;

</script>
	
 <script type="text/javascript">

$(function() {
	oTable = $('#laTabla').dataTable( {
		"sDom": '<"H"l>rt<"F"ip>',
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
		
		"oPaginate": {
			"sFirst":    "Primera",
			"sPrevious": "Anterior",
			"sNext":     "Siguiente",
			"sLast":     "Ultima"
		}
		
		},
		"aoColumns" : [
			{ "bVisible": false },
			null,
			null,
			null,
			null,
			null
			],
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"sDom": '<"H"l>rt<"F"ip>'
	});
	var cont=1;
	

});
</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
		
<script type="text/javascript">
$(document).ready(function() {
	
	$('#form').submit( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable));
		jQuery("#alumnosSeleccionados").val(selected);
		if(selected == ""){
			alert("Debe seleccionar al menos un alumno");
			return false;
		}
		else
			return true;
	} );


	/* Agrega el manejador del evento click en las filas */
	$('#laTabla').delegate('tr', 'click', function(event) {
	 if ( $(this).hasClass('row_selected') )
			$(this).removeClass('row_selected');
		else
			$(this).addClass('row_selected');
	});
	
} );

function fnGetSelected(oTableLocal) {
    var aReturn = new Array();

    // fnGetNodes es una funcion predefinida de DataTable 
    // aTrs == array de filas de la tabla
    var aTrs = oTableLocal.fnGetNodes();

    // Se guardan todos los TR con class 'row_selected' en un array
    for (var i = 0; i < aTrs.length; i++) {
        if ($(aTrs[i]).hasClass('row_selected')) {
            aReturn.push(aTrs[i]);
        }
    }

    return aReturn;
}

// Esta funcion recupera el valor de la columna hidden de la tabla 
//(en la que esta el id)
function fnGetIdsOfSelectedRows(oSelectedRows) {
    var aRowIndexes = new Array();
    var aRowData = new Array();
    var aReturn = "";

    aRowIndexes = oSelectedRows;    

    // Se recorren las filas seleccionadas y se crea un arreglo 
    //delimitado por comas de los ids que se envian al controller para procesarlos
    for(var i = 0; i < aRowIndexes.length; i++){
        // fnGetData es una funcion predefinida de DataTable
        // Se obtienen los datos de la fila con index i
        aRowData = oTable.fnGetData(aRowIndexes[i]);

        //Se guardan los valores cocatenados en un array
        aReturn += aRowData[0] + ",";
    }

    return aReturn;
}	

function enviarForm1(action){
	confirma = true;
	
	if(action=='eliminar'){
		document.forms['reporteForm'].action = "../reporteBecadosLE/eliminarReporteBecadosLE.do";
	} 
	else{
		if(action=='aprobado'){
			 document.forms['reporteForm'].action = "../reporteBecadosLE/aprobadoReporteBecadosLE.do";
		}
		else
		{
				document.forms['reporteForm'].action = "../reporteBecadosLE/aprobadoTSReporteBecadosLE.do";
		}
	}
	
		
	$("#alumnosSeleccionados").val(fnGetIdsOfSelectedRows(fnGetSelected(oTable)));
	$("#reporteForm").submit();

}

</script>
</head>

<body>
<div id="main-content">
<form id="reporteForm" class="reporteForm"  method="post" action="../reporteBecadosLE/eliminarReporteBecadosLE.do">
<br />
<CENTER>
<input type="hidden" name="alumnosSeleccionados" id="alumnosSeleccionados" />
<table style="margin-left: 50px; margin-right: 50px;" width="610px">
<tr >
<td style="vertical-align: top">
<div class="ui-state-default ui-corner-all" >
<h2 align="center">Reporte Becados en Lista de Espera</h2>
<br>
<br>
</div>

<table align="center"  class="dataTables_wrapper" id="laTabla"  border="0" title="Becados" style="background-color: #C0C2FF;width: 800px">

		<thead align="center">
			<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
			
				<c:forEach begin="1" end="4" var="loop">
					<td>
						<div class="ui-state-default ui-corner-all" style="height: 40px;">
							<div title="subtotalizar columna"> 
								<a href="#ancla" onclick="subtotalizarColumna(${loop})">subtotalizar</a>				
							</div>
							<div title="agrupar columna"> 
								<a href="#" onclick="agruparColumna(${loop})">agrupar</a>				
							</div>
						</div>
					</td>
				</c:forEach>
			</tr>
			<!-- Botones para mostrar funciones	-->
			<tr>
				<c:forEach begin="1" end="4">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<tr>											
				<th>Becado </th>			
				<th>Escuela </th>
				<th>Zona </th>
				<th>Estado Becado </th>
				<th>Acciones</th>
			</tr>
		<tr>
			<td><input type="text" name="search_browser" value="Buscar" class="search_init" /></td>
			<td><input type="text" name="search_browser" value="Buscar" class="search_init" /></td>
			<td><input type="text" name="search_browser" value="Buscar" class="search_init" /></td>
			<td><input type="text" name="search_browser" value="Buscar" class="search_init" /></td>
					
		</tr>
			
		</thead>
		<tbody align="center">
			<c:forEach items="${alumnos}" var="alumno">			
				<tr>
					<td align="left" valign="middle" style="font-size: 14px" >${alumno.id}</td>
					
					<td align="left" valign="middle" style="font-size: 14px" class="col1">&nbsp;${alumno.datosPersonales.apellido},
									${alumno.datosPersonales.nombre}&nbsp;</td>				
					<td align="left" valign="middle" style="font-size: 14px" class="col2">&nbsp;${alumno.escuela.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col3">&nbsp;${alumno.escuela.localidad.zona.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col4">&nbsp;${alumno.estadoAlumno.valor}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" >
						<div style=width:0.5cm class="ui-state-default ui-corner-all" title="Link Detalle">							
										<a href="#" onclick="openDetalleAlumno('${alumno.id}');">													
											<span class="ui-icon ui-icon-search" ></span>
										</a>							
									</div></td>
				</tr>
			</c:forEach>
		</tbody>
		
</table>

<div class="ui-state-default ui-corner-all" align="center">
<br>
<br>
<table align="center">
		<tr>					
			<td align="center" valign="middle" style="font-size: 14px">
				<input class="ui-state-default ui-corner-all " type="button" value="Aprobado" 
					onclick="enviarForm1('aprobado')" />		
				<input class="ui-state-default ui-corner-all " type="button" value="Eliminar" 
					onclick="enviarForm1('eliminar')"/>					
					 
										
			</td>			
		</tr>
</table>
</div>	
</td>
</tr>
</table>
<br><br>
<a name="ancla"></a>
<div id="contenedor" style="width: 60%;">

</div>
</CENTER>
</form>	
</div>
<div style="display: none;" id="dialogAlumno" title="Datos Alumno" align="left">
<jsp:include page="/WEB-INF/pages/detallePerfil/detalleAlumno.jsp"></jsp:include>
</div>
</body>
</html>