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
<title>Lista de Comunicados Pendientes</title>

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

<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
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
	src="<c:url  value="/static/js/table/ColVis.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"
	media="all">
	<link rel="stylesheet"
	href="<c:url  value="/static/js/table/tabletools/css/TableTools.css"/>"
	media="all">
	
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
		"iDisplayLength": 25,
		"aoColumns" : [
					/* idCandidato */{
						"bSortable" : false,
						"bSearchable" : false,
						"bVisible": false
					},
					null,
					null,
					null,
					null]
		                    		
	});
});
</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
<script type="text/javascript">


var selected =  new Array();


$(document).ready(function() {
	$('#cesacionForm').submit( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable2));
		jQuery("#cesacionSeleccionados").val(selected);
		if(selected == ""){
			alert("Debe seleccionar al menos un informe");
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
			
		
		function fnGetSelected(oTableLocal) {
		    var aReturn = new Array();

		    // fnGetNodes es una funcion predefinida de DataTable 
		    // aTrs == array de filas de la laTabla
		    var aTrs = oTableLocal.fnGetNodes();

		    // Se guardan todos los TR con class 'row_selected' en un array
		    for (var i = 0; i < aTrs.length; i++) {
		        if ($(aTrs[i]).hasClass('row_selected')) {
		            aReturn.push(aTrs[i]);
		        }
		    }

		    return aReturn;
		}

		// Esta funcion recupera el valor de la columna hidden de la laTabla 
		//(en la que esta el id)
		function fnGetIdsOfSelectedRows(oSelectedRows) {
		    var aRowIndexes = new Array();
		    var aRowData = new Array();
		    var aReturn = new Array();

		    aRowIndexes = oSelectedRows;    

		    // Se recorren las filas seleccionadas y se crea un arreglo 
		    //delimitado por comas de los ids que se envian al controller para procesarlos
		    for(var i = 0; i < aRowIndexes.length; i++){
		        // fnGetData es una funcion predefinida de DataTable
		        // Se obtienen los datos de la fila con index i
		        aRowData = oTable2.fnGetData(aRowIndexes[i]);

		        //Se guardan los valores cocatenados en un array
		        aReturn.push(aRowData[0]);
		    }

		    return aReturn;
		}

} );

</script>


<script type="text/javascript">
function enviarForm(id){
	
	document.forms['informeForm'].action = "../comunicado/verPendienteView.do";
	document.forms['informeForm'].idComunicado.value = id;
	document.forms['informeForm'].submit();
}
</script>
</head>
<body>
<div id="main-content">
<form id="informeForm" class="informeForm" action="" method="post">
	<br/>
	<CENTER>
	<table align="center" >
	<tr align="center">
	<td style="vertical-align: middle;" align="center">
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all">
		<h3 align="center">Listado de Comunicados Pendientes</h3>
		</div>
		<!-- Fin titulo -->
		<table class="dataTables_wrapper" width="630px" border="0" id="laTabla" style="background-color: #C0C2FF"> 
	
			<thead align="center"><!--
				<tr id="fxs" style="display: none;">
				<c:forEach begin="0"  end="0" var="loop">
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
					<td>
					<div class="ui-state-default ui-corner-all" style="width: auto; height: 40px;">
					</div>
				</td>
			</tr>
			 Botones para mostrar funciones	
			<tr>
				<c:forEach begin="0"  end="0">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
				--><tr>
					<th></th>
					<th>Alumno</th>
					<th>Tipo Informe</th>
					<th>Motivo de Pendiente</th>
					<th>Acciones</th>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${pendientes}" var="i">
					<tr>
						<td align="left" valign="middle" style="font-size: 14px">${i.id}</td>
						<td align="center" valign="middle" style="font-size: 14px" class="col0">${i.becado.datosPersonales.apellido},${i.becado.datosPersonales.nombre}</td>
						<td align="center" valign="middle" style="font-size: 14px">${i.nombre}</td>
						<td align="center" valign="middle" style="font-size: 14px">${i.er.motivoPendiente.valor}</td>
						<td align="center"  style="border: 0" >
					
							<table>
								<tr>
									<td>
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
											<a  onclick="enviarForm('${i.id}')">
											<span class="ui-icon ui-icon-pencil" title="Comunicado Pendiente"> 
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
	
	</td>
	</tr>
	</table>
	<br><br>
		<a name="ancla"></a>
		<div id="contenedor" style="width: 60%;">

		</div>
	</CENTER>	
	<input type="hidden" name="idComunicado" />
	<input type="hidden" id="cesacionSeleccionados" name="cesacionSeleccionados"/>

</form>
</div>
</body>
</html>