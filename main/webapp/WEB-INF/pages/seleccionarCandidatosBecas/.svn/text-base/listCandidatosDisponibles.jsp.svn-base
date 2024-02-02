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
<title>Insert title here</title>

<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
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
	
<script type="text/javascript">

$(document).ready(function() {

	oTable.fnSetColumnVis(0, false);
	
	/*$('#form').submit( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable2));
		jQuery("#alumnosSeleccionados").val(selected);
		if(selected == ""){
			alert("Debe seleccionar al menos un alumno");
			return false;
		}
		else
			return true;
	} );
	
		oTable2.fnSetColumnVis(0, false);
		
		// Agrega el manejador del evento click en las filas
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
*/
} );

</script>
</head>

<body>
<div id="main-content">
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all" >
<h2 align="center">Seleccion Becas Candidato</h2>
	<!-- Botones -->
	<table align="center">
		<tr>
			<td>
				<input class="ui-state-default ui-corner-all " type="submit" value="Alta" />
			</td>
		</tr>
	</table>
</div>
<!-- Fin titulo -->
<form action="<c:url value='/seleccionarCandidatosBecas/guardarCandidatos.do'/>" method="post" id="form"  >
	<input type="hidden" name="alumnosSeleccionados" id="alumnosSeleccionados" >
	<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF">
	
			<thead align="center">
				<tr>	
					<th>id</th>			
					<th>Nombre</th>
					<th>Apellido</th>
					<th>Estado</th>														
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${listCandidatos}" var="candidato">
					<tr>
						<td align="left" valign="middle" style="font-size: 14px">${candidato.id}</td>
						<td align="left" valign="middle" style="font-size: 14px">&nbsp; ${candidato.datosPersonales.nombre}</td>					
						<td align="left" valign="middle" style="font-size: 14px">&nbsp;${candidato.datosPersonales.apellido}</td>					
						<td align="left" valign="middle" style="font-size: 14px">&nbsp;${candidato.estadoAlumno.valor}</td>																																			
					</tr>
				</c:forEach>
		</tbody>
	</table>
	<!-- Pie de la Tabla -->
	<div class="ui-state-default ui-corner-all" >
		<table align="center">
		<tr>
			<td>
				<input class="ui-state-default ui-corner-all " type="submit" value="Alta"  />
			</td>
		</tr>
		</table>
	</div>
	<!-- Fin pie -->
</form>
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>