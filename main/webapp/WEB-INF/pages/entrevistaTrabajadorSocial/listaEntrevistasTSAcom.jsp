<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista entrevista TS de Acompañamiento</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
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
		"aoColumnDefs": [  
		       			{ "bSortable": false, "aTargets": [ 7 ] },
		    			{ "bSortable": false, "aTargets": [ 8 ] }
		    			
		    			],
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25
	});
});
</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>

<script type="text/javascript">
function enviarForm(action, id){
	$("#idAlumno").val(id);
	if(action=='modificar'){
		document.forms['form'].action ="<c:url value='altaEntrevistaTS.do'/>";
	}
	if(action=='detalle'){
		document.forms['form'].action ="<c:url value='detalleEntrevista.do'/>";
	}
	if(action == 'obtenerCiclo'){
		document.forms['form'].action ="<c:url value='filtrarEntrevistasCiclo.do'/>";
	}
	//document.forms['form'].idEntrevista.value = id;
	document.forms['form'].submit();
}
</script>

</head>
<body>

<div id="main-content">
<br>
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td style="vertical-align: top">
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all" >
<h3 align="center">Listado de alumnos para  aprobacion TS de Acompañamiento</h3>
</div>
<!-- Fin titulo -->
<form method="post" id="form" name="form">
<input type="hidden"  name="idAlumno" id="idAlumno">
<input type="hidden" name="seleccion" value="false">
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1"> 
		<thead align="center">
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0"  end="9" var="loop">
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
				<c:forEach begin="0"  end="10">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<!-- Columnas -->
			<tr>				
				<th>Alumno</th>
				<th>DNI</th>
				<th>Escuela</th>
				<th>Año Escolar</th>
				<th>Responsable Adulto</th>
				<th>DNI del Responsable Adulto</th>
				<th>Direccion</th>
				<th>Contactos Telefónicos</th>
				<th>Teléfonos</th>
				<th>Motivo envío TS</th>
				<th id="acciones">Acciones</th>
			</tr>
			<!-- Buscadores	-->
			<tr>				
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td></td>		
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${alumnos}" var="alumno" >
				<tr>				
					<td align="center" valign="middle" style="font-size: 14px" class="col1">&nbsp;${alumno.datosPersonales.nombre},&nbsp;
																								  ${alumno.datosPersonales.apellido}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col2">${alumno.datosPersonales.dni}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col3">${alumno.escuela.nombre}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col4">${alumno.anioEscolar.valor}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col5">${alumno.responsable1.nombre},&nbsp;${alumno.responsable1.apellido} </td>
					<td align="center" valign="middle" style="font-size: 14px" class="col6">${alumno.responsable1.dni}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col7">${alumno.datosPersonales.direccion},${alumno.datosPersonales.numeroCalle},${alumno.datosPersonales.entreCalles},${alumno.datosPersonales.piso},${alumno.datosPersonales.departamento},${alumno.datosPersonales.codigoPostal},${alumno.datosPersonales.barrio},${alumno.datosPersonales.localidad.nombre}
																							${alumno.datosPersonales.provincia.descripcion}</td></td>
					<td align="center" valign="middle" style="font-size: 14px" class="col8" >
					<table width="100%">
						<tr>
							<td>
								1-&nbsp;${alumno.contactoTelefono1}
							</td>
						</tr>
						<tr>
							<td>
								2-&nbsp;${alumno.contactoTelefono2}
							</td>
						</tr>
					
					</table>			
					</td>
					
					<td align="center" valign="middle" style="font-size: 14px" class="col9">
						<table>
						<tr>
							<td>
								1- ${alumno.telefono1}
							</td>
						</tr>
						<tr>
							<td>
								2- ${alumno.telefono2}
							</td>
						</tr>
					
					</table>
					</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col10">${alumno.motivoEnvioTS.valor}</td>	
					
					<td align="center"  style="border: 0">
						<table>
							<tr>
								<td>
									<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
											<a  onclick="enviarForm('modificar','${alumno.id}')"> 
											<span class="ui-icon ui-icon-disk"  title="Alta Entrevista TS" > 
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
</form>
</td>
</tr>
</table>
<br><br>
<a name="ancla"></a>
<div id="contenedor" style="width: 60%;">

</div>
</CENTER>
</div>
</body>
</html>