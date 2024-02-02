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
<title>Becados EA</title>
<script>
var oTable2;
var selected =  new Array();


$(document).ready(function() {
	$('#asignacionForm').submit( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable2));
		jQuery("#becadosSeleccionados").val(selected);
		return true;
	} );

	 oTable2 = $('#tabla2').dataTable({
			"oLanguage": {
			"sLengthMenu": 'Mostrar <select>'+
			'<option value="10">10</option>'+
			'<option value="25">25</option>'+
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
			"iDisplayLength": 10,
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
		

		/* Agrega el manejador del evento click en las filas */
		$('#tabla2').delegate('tr', 'click', function(event) {
		 if ( $(this).hasClass('row_selected') )
				$(this).removeClass('row_selected');
			else
				$(this).addClass('row_selected');
		});
		
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
		        aRowData = oTable2.fnGetData(aRowIndexes[i]);

		        //Se guardan los valores cocatenados en un array
		        aReturn.push(aRowData[0]);
		    }

		    return aReturn;
		}

} );

</script>
	
</head>

<body>
<div id="main-content">
<form id="asignacionForm" class="asignacionForm"  action="<c:url value='/asignacionBecadosEa/desasignacionBecadosEa.do' />" method="post">
<center><h2>Becados EA</h2></center>
<br />
<CENTER>
<div id="">
<jsp:include page="/WEB-INF/pages/asignacionBecadosEa/listaBecados.jsp"></jsp:include>
</div>

<table align="center">
<tr>
	<td>
		<input type="submit" value="Desasignar" class="ui-state-default ui-corner-all" />
	</td>
	<td>
		<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../asignacionBecadosEa/desasignacionBecadosEaView.do'; return false;" />
	</td>
</tr>
</table>

<input type="hidden" id="becadosSeleccionados" name="becadosSeleccionados"/>
<input type="hidden" id="idPerfilEA" name="idPerfilEA" value="${idPerfilEA}"/>

</CENTER>
</form>	
</div>
</body>
</html>