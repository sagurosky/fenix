<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 120px;
		color: gray;
		font-style: italic; 
	}
		select[name=search_browser]{	
		font-size: x-small;
		width: 120px;
		color: gray;
		font-style: italic; 
	}
	
</style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Renovaci&oacute;n Autom&aacute;tica</title>
	
<script>
$.fn.dataTableExt.oApi.fnReloadAjax = function ( oSettings, sNewSource, fnCallback )
{
	if ( typeof sNewSource != 'undefined' )
	{
	oSettings.sAjaxSource = sNewSource;
	}
	this.oApi._fnProcessingDisplay( oSettings, true );
	var that = this;
	
	oSettings.fnServerData( oSettings.sAjaxSource, null, function(json) {
	/* Clear the old information from the table */
	that.oApi._fnClearTable( oSettings );
	
	/* Got the data - add it to the table */
	for ( var i=0 ; i<json.aaData.length ; i++ )
	{
	that.oApi._fnAddData( oSettings, json.aaData[i] );
	}
	
	oSettings.aiDisplay = oSettings.aiDisplayMaster.slice();
	that.fnDraw( that );
	that.oApi._fnProcessingDisplay( oSettings, false );
	
	/* Callback user function - for event handlers etc */
	if ( typeof fnCallback == 'function' )
	{
	fnCallback( oSettings );
	}
	} );
}

$.fn.dataTableExt.oApi.fnGetFilteredNodes = function ( oSettings )
{
	var anRows = [];
	for ( var i=0, iLen=oSettings.aiDisplay.length ; i<iLen ; i++ )
	{
		var nRow = oSettings.aoData[ oSettings.aiDisplay[i] ].nTr;
		anRows.push( nRow );
	}
	return anRows;
};

var oTable1;
var oTable2;
var selected =  new Array();
var asInitVals = new Array();
var totalBecas = 0;
var totalAlumnos = 0;

$(document).ready(function() {

	$('#asignacionForm').submit( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable1), oTable1);
		jQuery("#becasSeleccionadas").val(selected);
		if(selected == ""){
	        jAlert('warning', 'Por favor seleccione al menos 1 beca.', 'Atención!');
			return false;
		}
		$.blockUI();
		return true;
	} );

	
	oTable1 = $('#tabla1').dataTable({
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
						null,null,null,null,null,null,null]
	});
	
	oTable2 = $('#tabla2').dataTable({
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
		"aoColumns" : [null,null,null,null]
		                    		
	});

	
	 $("thead input").keyup( function () {
		/* Filter on the column (the index) of this element */
		oTable1.fnFilter( this.value, $("thead input").index(this)+1 );
	 } );
		
	$("thead input").each( function (i) {
		asInitVals[i] = this.value;
	} );
		
	$("thead input").focus( function () {
		if ( this.className == "search_init" )
		{
			this.className = "";
			this.value = "";
		}
	} );
	
	$("thead input").blur( function (i) {
		if ( this.value == "" )
		{
			this.className = "search_init";
			this.value = asInitVals[$("thead input").index(this)];
		}
	} );

	jQuery('thead select').change( function() {
	select_val = jQuery(this).val();
		if (select_val == "All" || select_val == '') {
			oTable1.fnFilter("");
			oTable1.fnDraw();
		} else {
			oTable1.fnFilter(select_val);
		}
		jQuery('thead select').val(select_val);
	});

		
	/* Agrega el manejador del evento click en las filas */
    $('#tabla1').delegate('tr', 'click', function(event) {
 		  var aData = oTable1.fnGetData( this );
          if ( $(this).hasClass('row_selected') ){
                     $(this).removeClass('row_selected');
                     oTable2.fnReloadAjax( "../renovacionBecas/buscarAlumnosAutomatico.do");
                     restarCantidades(aData[6]);
              }
          else{
                $(this).addClass('row_selected');
			 	oTable2.fnReloadAjax( "../renovacionBecas/buscarAlumnosAutomatico.do?becaId=" + aData[0]);
                sumarCantidades(aData[6]);
              }			
     });


			

	$('#botonSelecTodos').click( function() {
		totalBecas = 0;
		totalAlumnos = 0;
	    var aTrs = oTable1.fnGetFilteredNodes();
		var a; 	    
	    for (var i = 0; i < aTrs.length; i++) {
	        $(aTrs[i]).addClass('row_selected');
	        a = oTable1.fnGetData(aTrs[i]);
	        sumarCantidades(a[6]);
	    }		
	} );

	$('#botonDeselecTodos').click( function() {
	    var aTrs = oTable1.fnGetNodes();
	    for (var i = 0; i < aTrs.length; i++) {
	        $(aTrs[i]).removeClass('row_selected');
	    }
	    document.getElementById("cantBecas").value = 0;
		document.getElementById("cantAlum").value = 0;
		totalBecas = 0;
		totalAlumnos = 0;		
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
	    var aReturn = new Array();

	    aRowIndexes = oSelectedRows;    

	    // Se recorren las filas seleccionadas y se crea un arreglo 
	    //delimitado por comas de los ids que se envian al controller para procesarlos
	    for(var i = 0; i < aRowIndexes.length; i++){
	        // fnGetData es una funcion predefinida de DataTable
	        // Se obtienen los datos de la fila con index i
	        aRowData = oTable1.fnGetData(aRowIndexes[i]);

	        //Se guardan los valores cocatenados en un array
	        aReturn.push(aRowData[0]);
	    }

	    return aReturn;
	}

} );


function sumarCantidades(cant){
	totalBecas = parseInt(totalBecas) + parseInt(cant.slice(0,cant.indexOf("/")));
	totalAlumnos = parseInt(totalAlumnos) + parseInt(cant.slice(cant.indexOf("/") + 1, cant.length));
	document.getElementById("cantBecas").value = totalBecas;
	document.getElementById("cantAlum").value = totalAlumnos;
}

function restarCantidades(cant){
	totalBecas = parseInt(totalBecas) - parseInt(cant.slice(0,cant.indexOf("/")));
	totalAlumnos = parseInt(totalAlumnos) - parseInt(cant.slice(cant.indexOf("/") + 1, cant.length));
	document.getElementById("cantBecas").value = totalBecas;
	document.getElementById("cantAlum").value = totalAlumnos;
}
</script>

</head>

<body>
<div id="main-content">
<form id="asignacionForm" class="asignacionForm" action="<c:url value='/renovacionBecas/renovacionAutomatica.do' />" method="post">
<br>
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr>
<td style="vertical-align: top">
<div class="ui-state-default ui-corner-all" style="width:712px;">
	<h3 align="center">Renovaci&oacute;n Autom&aacute;tica</h3>
</div>

<table style="margin-left: 50px; margin-right: 50px;" width="700px">
	<tr>
		<td>
			<table align="center"  class="dataTables_wrapper" id="tabla1" width="700px" border="0" style="background-color: #C0C2FF">			
				<thead align="center" id="beca">
					<tr>
						<th></th>
						<th>Zona</th>
						<th>Tipo Beca</th>
						<th>Padrino</th>
						<th>Tipo Padrino</th>
						<th>Estado</th>
						<th>Becas/Alumnos</th>
					</tr>
					<tr>
						<td><input name="search_browser" value="Buscar" class="search_init"/></td>
						<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
						<td><input name="search_browser" value="Buscar" class="search_init"/></td>
						<td>
						<select  id="tipoPadrino" name="search_browser"   class="search_init">
							<option value="All">Todos</option>
							<c:forEach var="tipoP" items="${tiposPadrino}">
								<option value="${tipoP.valor}">${tipoP.valor}</option>
							</c:forEach>
						</select></td>				
						<td>
						<select  id="estado" name="search_browser"   class="search_init">
							<option value="All">Todos</option>
							<c:forEach var="estado" items="${estadosBeca}">
								<option value="${estado.valor}">${estado.valor}</option>
							</c:forEach>
						</select></td>
					</tr>
				</thead>
				<tbody align="center">
					<c:forEach items="${becas}" var="dto">
						<tr id="beca_row">
							<td>${dto.beca.id}</td>
							<td align="left" valign="middle" style="font-size: 14px">&nbsp;${dto.beca.zona.nombre}&nbsp;</td>
							<td align="left" valign="middle" style="font-size: 14px">&nbsp;${dto.beca.tipo.descripcion}&nbsp;</td>
							<td align="left" valign="middle" style="font-size: 14px">&nbsp;
							<c:if test="${dto.beca.padrino.datosPersonales != null}">
								${dto.beca.padrino.datosPersonales.apellido},&nbsp;${dto.beca.padrino.datosPersonales.nombre}
							</c:if>	
							<c:if test="${dto.beca.padrino.empresa != null}">
								${dto.beca.padrino.empresa.denominacion}
							</c:if>	
							&nbsp;
							</td>
							<td align="left" valign="middle" style="font-size: 14px">&nbsp;${dto.beca.padrino.tipo.valor}&nbsp;</td>
							<td align="left" valign="middle" style="font-size: 14px">&nbsp;${dto.beca.estado.valor}&nbsp;</td>
							<td align="left" valign="middle" style="font-size: 14px">
								${dto.beca.cantidadAsignada == null ? '0' : dto.beca.cantidad}/${dto.cantAlumnos}
							</td>
						<td align="center"  style="border: 0"></td>
					</c:forEach>
				</tbody>
			</table>
		</td>
	</tr>
</table>

<table align="center">
	<tr>
		<td>
			<label>Cantidad becas seleccionadas:</label>
			<input type="text" id="cantBecas" disabled="disabled" value="0"/>
			<label>Cantidad alumnos seleccionados:</label>
			<input type="text" id="cantAlum" disabled="disabled" value="0"/>
		</td>
	</tr>
</table>
<br>
<table align="center">
	<tr>
		<td>
			<input type="submit" value="Renovar" class="ui-state-default ui-corner-all" />
			<input align="middle" id="botonSelecTodos" type="button" value="Seleccionar todos" class="ui-state-default ui-corner-all" ></input>	
			<input align="middle" id="botonDeselecTodos" type="button" value="Deseleccionar todos" class="ui-state-default ui-corner-all" ></input>
		</td>
	</tr>
</table>

<br>
<div class="ui-state-default ui-corner-all" style="width:700px;">
	<h3 align="center">Alumnos de la beca seleccionada</h3>
</div>
<table style="margin-left: 50px; margin-right: 50px;" width="700px">
	<tr>
		<td>
			<table align="center"  class="dataTables_wrapper" id="tabla2" width="700px" border="0" title="Alumnos" style="background-color: #C0C2FF">
				<thead align="center" style="width: 700px" id="alumno">
					<tr>
						<th>Candidato</th>
						<th>Escuela</th>
						<th>Año Escolar</th>
						<th>Estado Renovación</th>
					</tr>
					<tr>
						<td><input name="search_browser" value="Buscar" class="search_init"/></td>
						<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
						<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
						<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
					</tr>	
				</thead>
				<tbody align="center" style="width: 700px; font-size: 14px;">
				
				</tbody>
			</table>
		</td>
	</tr>
</table>
<input type="hidden" id="becasSeleccionadas" name="becasSeleccionadas"/>
</td>
</tr>
</table>
</CENTER>
</form>	
</div>

</body>
</html>