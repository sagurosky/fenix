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
<title>Alta de  Objetivo Seleccion</title>

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
$(function() {
	TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
		
	oTable = $('#tabla1').dataTable( {
		"sDom": '<"H"l>rt<"F"ip>',
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select >'+
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
		"sDom": '<"H"Tl>rt<"F"ip>',
		"aoColumnDefs": [  
			{ "bSortable": false, "aTargets": [ 0 ] },
			{ "bSortable": false, "aTargets": [ 1 ] },
			{ "bSortable": false, "aTargets": [ 2 ] },
			{ "bSortable": false, "aTargets": [ 3 ] },
			{ "bSortable": false, "aTargets": [ 4 ] },
			{ "bSortable": false, "aTargets": [ 5] }
			]
	});
});
</script>


</head>
<script type="text/javascript">
function enviarForm(action,idCiclo, idPeriodo){
	if(action=='guardar'){
		document.forms['reporteForm'].action ='<c:url value="/objetivoSeleccion/altaObjetivoSeleccionView.do"/>';
	}else if(action=='modificar'){
		document.forms['reporteForm'].action ='<c:url value="/objetivoSeleccion/modificarObjetivoSeleccionView.do"/>';
	}
	if(action == 'obtenerCiclo'){
		$('#idCiclo').val(idCiclo);
		document.forms['reporteForm'].action='<c:url value="/objetivoSeleccion/listaObjetivoSeleccionAnioActual.do" />';
			document.forms['reporteForm'].submit();
		return;
	}
	$('#idCiclo').val(idCiclo);
	$('#idPeriodo').val(idPeriodo);
	document.forms['reporteForm'].submit();
}

</script>
<body >
<div id="main-content" >
<br></br>
<form id="reporteForm"  action="" method="post" >
<input type="hidden" name="idCiclo" id="idCiclo">
<input type="hidden" name="idPeriodo" id="idPeriodo">


<CENTER>
<table style="margin-left: 50px; margin-right: 50px;" >
<tr >
<td >
		
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all">
<table >
	<tr>
		<td align="left">
			<h3 >Lista de periodos para el alta de objetivos  </h3>
		</td>
		<td>
	</tr>
	<tr align="center">
		<td align="center">	
			<select onchange="enviarForm('obtenerCiclo',this.value,null)"  >
				<c:forEach  items="${listaCiclos}" var="ciclo">
					<option value="${ciclo.id}"  <c:if test="${ciclo.id == cicloSelect}">selected="selected"</c:if> > ${ciclo.nombre}</option>					
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
</div>
<table align="center"  class="dataTables_wrapper" id="tabla1" width="100%" cellspacing="1">

		<thead align="center">
			<tr>				
				<th>Ciclo</th>					
				<th>Periodo</th>
				<th>Zona</th>
				<th>Cantidad de Becas</th>	
				<th>Becados Cesados</th>
				<th>Becas a Disponer Por Egreso</th>
				<th id="acciones">Acciones</th>
			</tr>
			
					
		</thead>
		<tbody align="center">
				<c:forEach var="objSeleccionDTO" items="${listObjSelDTO}" varStatus="loop">
						<tr >
							<td align="left" valign="middle" style="font-size: 14px"  >&nbsp;${objSeleccionDTO.cicloPrograma.nombre }&nbsp;</td>
							<td align="left" valign="middle" style="font-size: 14px"  >&nbsp;&nbsp; ${objSeleccionDTO.periodo.nombre}</td>
							<td align="left" valign="middle" style="font-size: 14px"  >
							<table>
								<c:forEach items="${objSeleccionDTO.zonaCimientos}" var="zona">
									<tr>
										<td>
											${zona.nombre}
										</td>
									</tr>
								</c:forEach>
							</table>
							</td>	
							<td align="center" valign="middle" style="font-size: 14px">
							<table>
								<c:forEach items="${objSeleccionDTO.cantidadBecas}" var="cantidadBecas">
									<tr>
										<td>
											${cantidadBecas}
										</td>
									</tr>
								</c:forEach>
							</table>
							</td>	
							<td align="center" valign="middle" style="font-size: 14px" >
							<table>
								<c:forEach items="${objSeleccionDTO.cantidadBecasCesadas}" var="cantidadBecasCesadas">
									<tr>
										<td>
											${cantidadBecasCesadas}
										</td>
									</tr>
								</c:forEach>
							</table>
							</td>
							<td align="center" valign="middle" style="font-size: 14px"> 
							<table>
								<c:forEach items="${objSeleccionDTO.cantidadBecasDisponiblesPorEgreso}" var="cantidadBecasCesadasDisPorEgreso">
									<tr>
										<td>
											${cantidadBecasCesadasDisPorEgreso}
										</td>
									</tr>
								</c:forEach>
							</table>
							</td>
							<td align="center" valign="middle" style="font-size: 14px">
								<table>
									<tr>
										<c:choose>
											<c:when test="${empty objSeleccionDTO.zonaCimientos}">
													<td>
														<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
															<a  onclick="enviarForm('guardar','${objSeleccionDTO.cicloPrograma.id}','${objSeleccionDTO.periodo.id}')"> 
																<span class="ui-icon ui-icon-disk" title="Agregar"></span>
															</span></a>				
														</div>
													</td>
											</c:when>
											<c:otherwise>
													<td>
														<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
															<a  onclick="enviarForm('modificar','${objSeleccionDTO.cicloPrograma.id}','${objSeleccionDTO.periodo.id}')"> 
															<span class="ui-icon ui-icon-pencil" title="Modificar objetivo"> 
															</span></a>				
														</div>
													</td>
											
											</c:otherwise>
										
										</c:choose>
									</tr>
								</table>
								
							</td>
						</tr>
					</c:forEach>																
				
			
		</tbody>
		
</table>
<br>
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
</body>
</html>