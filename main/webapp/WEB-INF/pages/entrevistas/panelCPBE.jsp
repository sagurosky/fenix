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
<title>Panel CPFE</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 80px;
		color: gray;
		font-style: italic; 
	}
	
	table#laTabla{
		 background-color: #C0C2FF;
		 border: 0;
	}
</style>

<script type="text/javascript">

var oTable2;
var selected =  new Array();
var asInitVals = new Array();

$(document).ready(function() {
	$('#easForm').submit( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable2));
		jQuery("#alumnosSeleccionados").val(selected);
		if(selected == ""){
			alert("Debe seleccionar al menos un alumno");
			return false;
		}
		else
			return true;
	} );

	
	 oTable2 = $('#laTabla').dataTable({
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
		"sDom": '<"H"l>rt<"F"ip>',
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
		       		null]
		                    		
	});
	
	 $("thead input").keyup( function () {
			/* Filter on the column (the index) of this element */
			oTable2.fnFilter( this.value, $("thead input").index(this)+1 );
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
				oTable2.fnFilter("");
				oTable2.fnDraw();
			} else {
				oTable2.fnFilter(select_val);
			}
			jQuery('thead select').val(select_val);
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

<script type="text/javascript" src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
<script type="text/javascript">
	function enviarForm(action, id, tipoInforme){
		if(action=='entrevistas'){
			document.forms['easForm'].action = "../entrevistas/listaEntrevistasPorEa.do";
		}else{
			if(action=='informes'){
				document.forms['easForm'].action = "../entrevistas/listaInformesPorEa.do";
			}
			else{
				if(action=='cuentas'){
					document.forms['easForm'].action = "../entrevistas/listaCuentasPorEa.do";
				}
				else{
					if(action=='pagos'){
						document.forms['easForm'].action = "../entrevistas/listaPagosPorEa.do";
					}
				}	
			}
		}
		document.forms['easForm'].idEA.value = id;
		document.forms['easForm'].tipoInforme.value = tipoInforme;
		document.forms['easForm'].submit();
	}

	
</script>

</head>
<body>
<div id="main-content">
<form id="easForm" class="easForm" >
	<br />
	<CENTER>
	<table align="center" >
	<tr align="center">
	<td style="vertical-align: middle;" align="center">
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all" align="center">
		<h3 align="center">Panel de Control Coordinador</h3>
		</div>
		<!-- Fin titulo -->
		<table class="dataTables_wrapper" width="630px" id="laTabla" cellspacing="1"> 
			<thead align="center">
				<tr>
					<th></th>
					<th>RR</th>
					<th>EA</th>
					<th>Espacios de acompaņamiento Requeridos</th>
					<th>Informes IS1 Requeridos</th>
					<th>Informes IS2 Requeridos</th>
					<th>Informes IS3 Requeridos</th>
					<th>Cuentas RA Requeridas</th>
					<th>Pagos Requeridos</th>
				</tr>
				<tr>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${eas}" var="e">
					<tr>
						<td align="left" valign="middle" style="font-size: 14px">${e.id}</td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.nombreApellidoRR}</td>
						<td align="center" valign="middle" style="font-size: 14px">&nbsp;${e.nombreApellido}</td>
						<td>
							<table border="0">
								<tr>
									<td>
										<img src="<c:url value='/static/images/iconos/${e.colorEntrevistas}_light.png'></c:url>" width="15px">
									</td>
									<td>
										<div  style= width:0.8cm class="ui-state-default ui-corner-all" > 								
											<a href="javascript:enviarForm('entrevistas','${e.id}')" title="Ver Entrevistas" >${e.entrevistasRealizadas}/${e.entrevistas}</a>			
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td>
							<table border="0">
								<tr>
									<td>
										<img src="<c:url value='/static/images/iconos/${e.colorIS1}_light.png'></c:url>" width="15px">
									</td>
									<td>
										<div  style= width:0.8cm class="ui-state-default ui-corner-all" > 								
											<a href="javascript:enviarForm('informes','${e.id}','is1')" title="Ver Informes" >${e.informesRealizadosIS1}/${e.informesIS1}</a>			
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td>
							<table border="0">
								<tr>
									<td>
										<img src="<c:url value='/static/images/iconos/${e.colorIS2}_light.png'></c:url>" width="15px">
									</td>
									<td>
										<div  style= width:0.8cm class="ui-state-default ui-corner-all" > 								
											<a href="javascript:enviarForm('informes','${e.id}','is2')" title="Ver Informes" >${e.informesRealizadosIS2}/${e.informesIS2}</a>			
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td>
							<table border="0">
								<tr>
									<td>
										<img src="<c:url value='/static/images/iconos/${e.colorIS3}_light.png'></c:url>" width="15px">
									</td>
									<td>
										<div  style= width:0.8cm class="ui-state-default ui-corner-all" > 								
											<a href="javascript:enviarForm('informes','${e.id}','is3')" title="Ver Informes" >${e.informesRealizadosIS3}/${e.informesIS3}</a>			
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td>
							<table border="0">
								<tr>
									<td>
										<img src="<c:url value='/static/images/iconos/${e.colorRA}_light.png'></c:url>" width="15px">
									</td>
									<td>
										<div  style= width:0.8cm class="ui-state-default ui-corner-all" > 								
											<a href="javascript:enviarForm('cuentas','${e.id}','is3')" title="Ver Cuentas RA" >${e.cuentasRARealizadas}/${e.cuentasRA}</a>			
										</div>
									</td>
								</tr>
							</table>
						</td>
						<td>
							<table border="0">
								<tr>
									<td>
										<img src="<c:url value='/static/images/iconos/${e.colorPagos}_light.png'></c:url>" width="15px">
									</td>
									<td>
										<div  style= width:0.8cm class="ui-state-default ui-corner-all" > 								
											<a href="javascript:enviarForm('pagos','${e.id}','is3')" title="Ver Pagos Realizados" >${e.pagosRealizados}/${e.pagos}</a>			
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

	</td>
	</tr>
	</table>
	</CENTER>	
	<input type="hidden" name="idEA" />
	<input type="hidden" name="tipoInforme" />
</form>
</div>

</body>
</html>