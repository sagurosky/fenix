<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Aprobar Espacio de acompañamiento</title>

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

var selected =  new Array();
var extras =  new Array();


$(document).ready(function() {

		    
	$.unblockUI();
	
	$('#entrevistaForm').submit( function() {
		
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable));
		jQuery("#extra").val(extras);
		jQuery("#entrevistasSeleccionadas").val(selected);
		if(selected == ""){
			jAlert('warning', 'Debe seleccionar al menos una entrevista', 'Atención!');
			return false;
		}
		else
		{
			$.blockUI();
			return true;
		}
	} );

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
		"aaSorting": [[ 8, "desc" ], [ 1, "asc" ], [ 3, "asc" ]],
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"sDom": '<"H"Tl>rt<"F"ip>',
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
		       		null,
		       		null,
		       		{ "sType": "arg_date" },
		       		null,
		       		null]
		                    		
	});
	

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
		    // aTrs == array de filas de la tabla
		    var aTrs = oTableLocal.fnGetNodes();

		    // Se guardan todos los TR con class 'row_selected' en un array
		    for (var i = 0; i < aTrs.length; i++) {
		        if ($(aTrs[i]).hasClass('row_selected')) {
		            aReturn.push(aTrs[i]);
		            //var valor = $('input', $(aTrs[i])).val();
		            //alert(valor);
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
		    extras = new Array();
		    aRowIndexes = oSelectedRows;    

		    // Se recorren las filas seleccionadas y se crea un arreglo 
		    //delimitado por comas de los ids que se envian al controller para procesarlos
		    for(var i = 0; i < aRowIndexes.length; i++){
		        // fnGetData es una funcion predefinida de DataTable
		        // Se obtienen los datos de la fila con index i
		        aRowData = oTable.fnGetData(aRowIndexes[i]);
		        
		        //Se guardan los valores cocatenados en un array
		        aReturn.push(aRowData[0]);
		        var valorExtra = $('input[name=input_extra]', aRowIndexes[i]).val();
		        if(valorExtra == ""){
		        	valorExtra = 0;
		        }
		        valorExtra = valorExtra.replace(",", ".");
				extras.push(valorExtra);
		    }

		    return aReturn;
		}

} );


</script>
<script type="text/javascript">
//Parche para los filtros para la seleccion multiple
	var  isMultipleSeleccion = true;

</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
<script type="text/javascript">
function enviarForm(action, id,idTipoEntrevista){
	
	if(action=='modificar'){
		document.forms['entrevistaForm'].action = "../entrevistas/modificarEntrevistasRRView.do";
	}else if(action=='eliminar'){
		document.forms['entrevistaForm'].action = "../entrevistas/eliminarEntrevistasView.do";
	}
	document.forms['entrevistaForm'].entrevistaId.value = id;
	document.forms['entrevistaForm'].tipoEntrevistaId.value = idTipoEntrevista;
	document.forms['entrevistaForm'].submit();
}


</script>

</head>
<body>
<div id="main-content">
<br></br>
<!--<form:form name="entrevistaForm" class="entrevistaForm" action="<c:url value='/entrevistas/aprobarEntrevistasRR.do' />" method="post" >-->
<form id="entrevistaForm" class="entrevistaForm" action="<c:url value='/entrevistas/aprobarEntrevistasRR.do' />" method="post">
	<CENTER>
	<table align="center" >
	<tr align="center">
	<td style="vertical-align: middle;" align="center">
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all" align="center">
		<h3 align="center">Listado de Espacio de acompañamiento</h3>
		</div>
		<!-- Fin titulo -->
		<table class="dataTables_wrapper" width="630px" border="0" id="laTabla" cellspacing="1"> 
			<thead align="center">
				<!-- Panel de funciones	-->
				<tr id="fxs" style="display: none;">
					<c:forEach begin="0" end="8" var="loop">
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
				<!-- Botones para mostrar funciones	-->
				<tr>
					<c:forEach begin="0" end="9">
						<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
							<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
							</span></a></div>
						</td>
					</c:forEach>
				</tr>
				<tr>
					<th></th>
					<th>Zona</th>
					<th>EA</th>
					<th>Becado</th>
					<th>Periodo</th>
					<th>Tipo Entrevista</th>
					<th>Evaluacion Cobro</th>
					<th>Banco</th>
					<th>Fecha Carga</th>
					<th>Extra</th>
					<th id="acciones">Acciones</th>
				</tr>
				<tr>
					<c:forEach begin="0" end="9">
						<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					</c:forEach>
					<td></td>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${entrevistas}" var="e">
					<tr>
						<td align="left" valign="middle" style="font-size: 14px">${e.id}</td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.perfilAlumno.escuela.zonaCimientos.nombre}&nbsp;</td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.ea.datosPersonales.apellido},${e.ea.datosPersonales.nombre}&nbsp;</td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.perfilAlumno.datosPersonales.apellido},${e.perfilAlumno.datosPersonales.nombre}&nbsp;</td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.periodoDePago.nombre}&nbsp;</td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.tipoEntrevista.valor}&nbsp;</td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.evaluacionCobroBeca.valor}&nbsp;</td>							
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.perfilAlumno.responsable1.sucursalBanco.banco.nombre}&nbsp;</td>
						<td align="center" valign="middle" style="font-size: 14px"><fmt:formatDate value="${e.fechaCarga}" pattern="dd/MM/yyyy"/></td>
						<td align="center" valign="middle" style="font-size: 14px">
							<c:choose>							
								<c:when test="${e.evaluacionCobroBeca.valor=='Aprobado'}">
									<input name="input_extra" value="0" size="10" type="text" id="input_extra" onkeypress="return validarDecimal(event, this);"></input>
								</c:when> 						
								<c:otherwise>
									<input disabled="disabled" name="input_extra" value="0" size="10" type="text" id="input_extra"></input>
								</c:otherwise>
							</c:choose>
						</td>
						<td align="center"  style="border: 0">
					
							<table>
								<tr>
									<td>
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
											<a  onclick="enviarForm('modificar','${e.id}','${e.tipoEntrevista.id}')">
											<span class="ui-icon ui-icon-pencil" > 
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
		<div class="ui-state-default ui-corner-all" align="center">
		<table align="center">
		<tr>
			<td>
				<input type="submit" value="Aprobar Espacio de acompañamiento" class="ui-state-default ui-corner-all" />
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
	<input type="hidden" name="entrevistaId" />
	<input type="hidden" id="entrevistasSeleccionadas" name="entrevistasSeleccionadas"/>
	<input type="hidden" name="tipoEntrevistaId" />
	<input type="hidden" name="extra" id="extra"/>
<!--</form:form>-->
</form>
</div>
</body>
</html>