<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript"
src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<link rel="stylesheet"
href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ciclos</title>

<script type="text/javascript">
function enviarForm(action, id){
	if(action=='modificar'){
		document.forms['cicloForm'].action = "../ciclo/modificarView.do";
	}else if(action=='eliminar'){
		document.forms['cicloForm'].action = "../ciclo/eliminarCiclo.do";
	}else if(action == 'iniciar'){
		document.forms['cicloForm'].action = "../ciclo/iniciarCiclo.do";
	}
	document.forms['cicloForm'].idCiclo.value = id;
	document.forms['cicloForm'].submit();
}
</script>
<script type="text/javascript">

$(document).ready(function() {
	var nombreCiclo = '';
	var estadoCiclo = '';
	
	$('#boton_iniciar').click( function() {
		var cicloSeleccionado = fnGetIdsOfSelectedRows(fnGetSelected(oTable1), oTable1);
		if(cicloSeleccionado.length < 1){
	        jAlert('warning', 'Por favor seleccione un ciclo para iniciar.', 'Atención!');
			return false;
		}
		if(estadoCiclo != 'Disponible'){
	        jAlert('warning', 'El ciclo a iniciar debe estar en estado Disponible.', 'Atención!');
			return false;
		}
		jQuery("#idCiclo").val(cicloSeleccionado);
		jQuery("#nombreCiclo").html(nombreCiclo);
		$( "#dialog-confirm" ).dialog({
			resizable: false,
			height:160,
			modal: true,
			buttons: {
				"Iniciar Ciclo": function() {
					$( this ).dialog( "close" );
					enviarForm('iniciar', cicloSeleccionado);
				},
				"Cancelar": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
	} );

	
	var oTable1 = $('#tabla1').dataTable({
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
		"sDom": '<"H"Tl>rt<"F"ip>',
		"aoColumns" : [null,
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
			       		null]
	});

	
	 $("#tabla1").delegate('tr', 'click', function(event) {
			$(oTable1.fnSettings().aoData).each(function (){
				$(this.nTr).removeClass('row_selected');
			});
			$(event.target.parentNode).addClass('row_selected');
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
		function fnGetIdsOfSelectedRows(oSelectedRows, oTableLocal) {
		    var aRowIndexes = new Array();
		    var aRowData = new Array();
		    var aReturn = new Array();

		    aRowIndexes = oSelectedRows;    

		    // Se recorren las filas seleccionadas y se crea un arreglo 
		    //delimitado por comas de los ids que se envian al controller para procesarlos
		    for(var i = 0; i < aRowIndexes.length; i++){
		        // fnGetData es una funcion predefinida de DataTable
		        // Se obtienen los datos de la fila con index i
		        aRowData = oTableLocal.fnGetData(aRowIndexes[i]);

		        //Se guardan los valores cocatenados en un array
		        aReturn.push(aRowData[1]);
		        nombreCiclo = aRowData[2];
		        estadoCiclo = aRowData[6];
		    }

		    return aReturn;
		}

} );

</script>
</head>
<body>
<div id="main-content">
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td style="vertical-align: top">
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all">
<h3 align="center">Listado de Ciclos</h3>
</div>
<!-- Fin titulo -->
<table align="center"  class="dataTables_wrapper" id="tabla1" width="100%" border="0" style="background-color: #C0C2FF"> 
		<thead align="center">
			<tr>
				<th></th>
				<th></th>
				<th>Nombre</th>
				<th>Fecha de Inicio</th>
				<th>Fecha de Cierre</th>
				<th>Periodos</th>
				<th>Estado</th>
				<th>Monto Beca</th>
				<th>Acciones</th>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${ciclos}" var="ciclo">
				<tr>
					<td>
					<c:if test="${ciclo.estado.id == 1}"><img src="<c:url value='/static/images/iconos/yellow_light.png'></c:url>" width="15px"></c:if>
					<c:if test="${ciclo.estado.id == 2}"><img src="<c:url value='/static/images/iconos/green_light.png'></c:url>" width="15px"></c:if>
					<c:if test="${ciclo.estado.id == 3}"><img src="<c:url value='/static/images/iconos/gray_light.png'></c:url>" width="15px"></c:if>
					</td>
					<td>${ciclo.id}</td>
					<td align="center" nowrap="nowrap" valign="middle" style="font-size: 14px">${ciclo.nombre}</td>
					<td align="center" nowrap="nowrap"  style="font-size: 14px; font-weight: bold">&nbsp;
			  			<fmt:formatDate value="${ciclo.fechaInicio}" pattern="dd/MM/yyyy"/>&nbsp;
			  		</td>
					<td align="center" nowrap="nowrap"  style="font-size: 14px; font-weight: bold">&nbsp;
			  			<fmt:formatDate value="${ciclo.fechaFin}" pattern="dd/MM/yyyy"/>&nbsp;
			  		</td>
					<td align="left" valign="middle" style="font-size: 14px">
					<c:set var="last" value="${fn:length(ciclo.periodos)}"></c:set>
					<c:forEach varStatus="status"  var="periodo" items="${ciclo.periodos}">
						${periodo.nombre}<c:if test="${status.index != last - 1}">,</c:if>
					</c:forEach>
					</td>
					<td align="center" valign="middle" style="font-size: 14px">${ciclo.estado.valor}</td>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${ciclo.montoBeca}&nbsp;</td>					
					
				<td align="center"  style="border: 0">
			
				<table>
				<tr>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('modificar','${ciclo.id}')"> 
						<span class="ui-icon ui-icon-pencil" ></span></a>				
					</div>
				</td>
				<!-- td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('eliminar','${ciclo.id}')" > 
						<span class="ui-icon ui-icon-trash" > 
						</span></a>				
					</div>
				</td-->	
				</tr>
				</table>
			</c:forEach>
	</tbody>
</table>
<div class="ui-state-default ui-corner-all">
<table align="center">
<tr>
	<td>
		<sec:authorize access="hasRole('CPBE') or hasRole('SYS') or hasRole('SuperUsuario')">
			<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../ciclo/registrarView.do'" />
			<input type="button" id="boton_iniciar" value="Iniciar Ciclo" class="ui-state-default ui-corner-all"/>
			<input type="button" value="Volver" class="ui-state-default ui-corner-all" onclick="location.href='../ciclo/listaCiclos.do'; return false;" />
			<!-- <input type="button" value="Prueba cierre" class="ui-state-default ui-corner-all" onclick="location.href='../ciclo/pruebaCierre.do'; return false;" />--> 
		</sec:authorize>
		<sec:authorize access="not hasRole('CPBE') and not hasRole('SYS') and not hasRole('SuperUsuario')">
			<input type="submit" disabled="disabled" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../ciclo/registrarView.do'" />
			<input type="button" disabled="disabled" id="boton_iniciar" value="Iniciar Ciclo" class="ui-state-default ui-corner-all"/>
			<input type="button" disabled="disabled" value="Volver" class="ui-state-default ui-corner-all" onclick="location.href='../ciclo/listaCiclos.do'; return false;" />
			<!-- <input type="button" value="Prueba cierre" class="ui-state-default ui-corner-all" onclick="location.href='../ciclo/pruebaCierre.do'; return false;" />--> 
		</sec:authorize>
	</td>
</tr>
</table>
</div>
<form:form name="cicloForm" method="post" commandName="ciclo" >
<input type="hidden" name="idCiclo" />

</form:form>
</td>
</tr>
</table>
</CENTER>	
</div>
<div  style="display: none;" id="dialog-confirm" title="Desea abrir el ciclo seleccionado?">
	<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 40px 0;"></span>La apertura del nuevo ciclo cierra el ciclo vigente y esta acción no puede deshacerse. Desea continuar?</p>
</div>
<div   style="display: none;" id="select-one">
<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 7px 40px 0;"></span>Por favor seleccione un ciclo a iniciar.</p>
</div>
</body>
</html>