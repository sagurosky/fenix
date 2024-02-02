<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 100px;
		color: gray;
		font-style: italic; 
	}
		select[name=search_browser]{	
		font-size: x-small;
		width: 100px;
		color: gray;
		font-style: italic; 
	}
	
</style>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Carga Manual de Cuentas</title>

<script type="text/javascript">
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
var asInitVals = new Array();
var oTable2;
var selected =  new Array();
var cuentas =  new Array();


$(document).ready(function() {
	$('#botonCrear').click( function() {
		var result;
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable2));
		if(selected.length < 1){
	        jAlert('warning', 'Por favor seleccione al menos 1 cuenta para el alta.', 'Atención!');
			return false;
		}
		var ctas = cuentas.toString().split(",");
		
		for (i = 0; i < ctas.length; i++) {
			if(ctas[i] == "0"){
				jAlert('warning', 'Por favor ingrese numeros de cuenta validos.', 'Atención!');
				return false;
			}

		}
	  jConfirm('Esta seguro de que desea dar de alta las cuentas seleccionadas?', 'Confirmación', function(result){
		    if (result) {
		    	jQuery("#ctasSeleccionadas").val(selected);
		    	jQuery("#nrosCuenta").val(cuentas);
		    	document.forms['form'].action = "../cuenta/guardarCuentas.do";
				document.forms['form'].submit();
				
		    } else {
		      return false;
		    }
		  });
		
	} );

	 TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
	 oTable2 = $('#tabla').dataTable({
		"sDom": '<"H"Tl>rt<"F"ip>',  
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
		       		null,
		       		null,
		       		null]
		                    		
	});

		$('#botonSelecTodos').click( function() {
		    var aTrs = oTable2.fnGetFilteredNodes();
		    for (var i = 0; i < aTrs.length; i++) {
		        $(aTrs[i]).addClass('row_selected');
		        }
			
		} );

		$('#botonDeselecTodos').click( function() {
		    var aTrs = oTable2.fnGetNodes();
		    for (var i = 0; i < aTrs.length; i++) {
		        $(aTrs[i]).removeClass('row_selected');
		        }
			
		} );

		/* Agrega el manejador del evento click en las filas */
       $('#tabla tbody').delegate('tr', 'click', function(event) {
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
		    cuentas = new Array();

		    aRowIndexes = oSelectedRows;    

		    // Se recorren las filas seleccionadas y se crea un arreglo 
		    //delimitado por comas de los ids que se envian al controller para procesarlos
		    for(var i = 0; i < aRowIndexes.length; i++){
		        // fnGetData es una funcion predefinida de DataTable
		        // Se obtienen los datos de la fila con index i
		        aRowData = oTable2.fnGetData(aRowIndexes[i]);

		        //Se guardan los valores cocatenados en un array
		        aReturn.push(aRowData[0]);

		        var nroCuenta = $('input[name=nroCuenta]', aRowIndexes[i]).val();
		        if(nroCuenta == ""){
		        	nroCuenta = 0;
		        }
		        cuentas.push(nroCuenta);
		    }
		    return aReturn;
		}



		//filtros
		var  isMultipleSeleccion = true;

		
		$("thead#cuenta input").keyup( function () {
			//Esto es un parche para que se puedan utilizar los filtros en una 
			//Seleccion multiple. 
			//Esta variable se debe poner en true,antes de la incorporacion de las funciones de la tabla
			try {
				if(isMultipleSeleccion == "undefined"){
					isMultipleSeleccion = false;
				}
			} catch (e) {
				isMultipleSeleccion = false;
			}
			if(isMultipleSeleccion){
				var index = eval($("thead#cuenta input").index(this)+ 1 );
				/* Filter on the column (the index) of this element */
				oTable2.fnFilter( this.value,index);
				$(oTable2.fnSettings().aoData).each(function (){
					$(this.nTr).removeClass('row_selected');
				});				
			}else{
				oTable2.fnFilter( this.value, $("thead#cuenta input").index(this) );
			}
		} );
		
		$("thead#cuenta input").each( function (i) {
			asInitVals[i] = this.value;
		} );
		
		$("thead#cuenta input").focus( function () {
			if ( this.className == "search_init" )
			{
				this.className = "";
				this.value = "";
			}
		} );
		
		$("thead#cuenta input").blur( function (i) {
			if ( this.value == "" )
			{
				this.className = "search_init";
				this.value = asInitVals[$("thead#cuenta input").index(this)];
			}
		} );

		jQuery('thead#cuenta select').change( function() {
			select_val = jQuery(this).val();
			if (select_val == "All" || select_val == '') {
				oTable2.fnFilter("");
				oTable2.fnDraw();
			} else {
				oTable2.fnFilter(select_val);
			}
			$(oTable2.fnSettings().aoData).each(function (){
				$(this.nTr).removeClass('row_selected');
			});
			jQuery('thead#cuenta select').val(select_val);
		} );
		

} );

</script>

</head>
<body>
<div id="main-content">
<br><br>
<center><h3>Carga Manual de Cuentas</h3></center>
<br><br>
<form id="form" name="form" class="cmxform" method="post">

<CENTER>

<table style="margin-left: 50px; margin-right: 50px;" width="800px">
<tr >
<td >
<div id="">
<table align="center"  class="dataTables_wrapper" id="tabla" width="100%" border="0" style="background-color: #C0C2FF">
<thead title="creacion de cuentas" align="center" style="width: 100%" id="cuenta">
	<tr align="center">
		<th></th>
		<th>Becado</th>
		<th>Titular Cuenta</th>
		<th>CUIL</th>
		<th>RR</th>
		<th>Zona</th>		
		<th>Nº Cuenta</th>
	</tr>
	<tr>
		<td><input name="search_browser" value="Buscar" class="search_init"/></td>
		<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
		<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
		<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
		<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
		<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
	</tr>	
</thead>
		<tbody align="center">
		<c:forEach items="${cuentasACrear}" var="cuenta">
			<tr>
				<td align="left" valign="middle" style="font-size: 14px" >${cuenta.id}-${cuenta.tipoPersona}</td>
				<td align="center" valign="middle" style="font-size: 14px" >&nbsp;<c:if test="${cuenta.apellidoAlumno != null}"> ${cuenta.apellidoAlumno}, ${cuenta.nombreAlumno}</c:if>&nbsp;</td>
				<td align="left" valign="middle" style="font-size: 14px" >&nbsp;${cuenta.apellido}, ${cuenta.nombre}&nbsp;</td>
				<td align="left" valign="middle" style="font-size: 14px" >&nbsp;${cuenta.nroCuil}&nbsp;</td>
				<td align="left" valign="middle" style="font-size: 14px" >&nbsp;<c:if test="${cuenta.apellidoRR != null}"> ${cuenta.apellidoRR}, ${cuenta.nombreRR}</c:if>&nbsp;</td>
				<td align="left" valign="middle" style="font-size: 14px" >&nbsp;${cuenta.zona}&nbsp;</td>
				<td align="left" valign="middle" style="font-size: 14px"><input onkeypress="return soloNumeros(this.event);" size="11" id="nroCuenta" name="nroCuenta"> </td>
			</tr>
		</c:forEach>
		</tbody>

</table>
</div>
<br></br>
	<input type="hidden" id="ctasSeleccionadas" name="ctasSeleccionadas"/>
	<input type="hidden" id="nrosCuenta" name="nrosCuenta"/>

<input align="middle" id="botonCrear" type="button" value="Crear Cuentas" class="ui-state-default ui-corner-all" ></input>
<input align="middle" id="botonSelecTodos" type="button" value="Seleccionar todos" class="ui-state-default ui-corner-all" ></input>	
<input align="middle" id="botonDeselecTodos" type="button" value="Deseleccionar todos" class="ui-state-default ui-corner-all" ></input>	
</td>
</tr>
</table>
</CENTER>
</form>
</div>
</body>
</html>