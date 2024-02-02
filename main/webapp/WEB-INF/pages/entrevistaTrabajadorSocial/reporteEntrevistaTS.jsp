<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista entrevista TS</title>
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
	oTable = $('#laTabla').dataTable( {
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
		"iDisplayLength": 25
	});
});
</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>

<script type="text/javascript">
function enviarForm(action , id){
	
	$("#idEntrevista").val(id);
	$("#idCiclo").val(id);
	if(action == 'obtenerCiclo'){
		document.forms['form'].action ="<c:url value='filtrarEntrevistasPorCiclo.do'/>";
	}
	if(action == 'enviar'){
		document.forms['form'].action ="<c:url value='modificarEntrevistaTS.do'/>";
	}
	if(action=='detalle'){
		document.forms['form'].action ="<c:url value='detalleEntrevista.do'/>";
	}
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
<div class="ui-state-default ui-corner-all">
<table >
	<tr>
		<td align="left">
			<h3 >Reporte de Entrevistas TS</h3>
		</td>
		<td>
	</tr>
	<tr align="center">
		<td align="center">	
			<select onchange="enviarForm('obtenerCiclo',this.value)"  >
				<c:forEach  items="${listaCiclos}" var="ciclo">
					<option value="${ciclo.id}"  <c:if test="${ciclo.id == cicloSelect}">selected="selected"</c:if> > ${ciclo.nombre}</option>					
				</c:forEach>
			</select>
		</td>
	</tr>
</table>
<!-- Fin titulo -->
<form method="post" id="form" name="form" action="<c:url value='modificarReporteTrabajadorSocial.do'/>">
<input type="hidden"  name="idEntrevista" id="idEntrevista">
<input type="hidden"  name="idCiclo" id="idCiclo">
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF"> 
		<thead align="center">
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0"  end="19" var="loop">
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
				<c:forEach begin="0"  end="20">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<th>Ciclo</th>
				<th>Periodo</th>				
				<th>Alumno</th>
				<th>DNI</th>
				<th>Escuela</th>
				<th>Año Escolar</th>
				<th>Responsable Adulto</th>
				<th>DNI del Responsable Adulto</th>
				<th>Direccion</th>
				<th>Numero de Calle</th>
				<th>Piso</th>
				<th>Departamento</th>
				<th>CP</th>
				<th>Barrio</th>
				<th>Localidad</th>
				<th>Provincia</th>
				<th>Contactos Telefónicos</th>
				<th>Teléfonos</th>
				<th>Motivo envío TS</th>
				<th>Tipo de Intervención</th>
				<th id="acciones">Acciones</th>
			</tr>
			<!-- Buscadores	-->
			<tr>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar " class="search_init"/></td>
				<td><input name="search_browser" value="Buscar " class="search_init"/></td>
				<td><input name="search_browser" value="Buscar " class="search_init"/></td>
				<td><input name="search_browser" value="Buscar " class="search_init"/></td>
				<td><input name="search_browser" value="Buscar " class="search_init"/></td>
				<td><input name="search_browser" value="Buscar " class="search_init"/></td>
				<td><input name="search_browser" value="Buscar " class="search_init"/></td>
				<td><input name="search_browser" value="Buscar " class="search_init"/></td>
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
			<c:forEach items="${listaEntrevistas}" var="entrevista">
				<tr>
				
					<td align="center" valign="middle" style="font-size: 14px" class="col1">${entrevista.nombreCiclo}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col2">${entrevista.nombrePeriodo}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col3">${entrevista.perfilAlumno.datosPersonales.apellidoNombre}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col4">${entrevista.perfilAlumno.datosPersonales.dni}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col5">${entrevista.perfilAlumno.escuela.nombre}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col6">${entrevista.perfilAlumno.anioEscolar.valor}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col7">${entrevista.perfilAlumno.responsable1.nombre},&nbsp;${entrevista.perfilAlumno.responsable1.apellido} </td>
					<td align="center" valign="middle" style="font-size: 14px" class="col8">${entrevista.perfilAlumno.responsable1.dni}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="co9">${entrevista.perfilAlumno.datosPersonales.direccion}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col10">${entrevista.perfilAlumno.datosPersonales.numeroCalle} </td>
					<td align="center" valign="middle" style="font-size: 14px" class="col11">${entrevista.perfilAlumno.datosPersonales.piso} </td>
					<td align="center" valign="middle" style="font-size: 14px" class="col12">${entrevista.perfilAlumno.datosPersonales.departamento} </td>
					<td align="center" valign="middle" style="font-size: 14px" class="col13">${entrevista.perfilAlumno.datosPersonales.codigoPostal} </td>
					<td align="center" valign="middle" style="font-size: 14px" class="col14"> ${entrevista.perfilAlumno.datosPersonales.barrio} </td>
					<td align="center" valign="middle" style="font-size: 14px" class="col15">${entrevista.perfilAlumno.datosPersonales.localidad.nombre} </td>
					<td align="center" valign="middle" style="font-size: 14px" class="col16">${entrevista.perfilAlumno.datosPersonales.provincia.descripcion} </td>
					<td align="center" valign="middle" style="font-size: 14px" class="col17" >
					<table width="100%">
						<tr>
							<td>
								1-&nbsp;${entrevista.perfilAlumno.contactoTelefono1}
							</td>
						</tr>
						<tr>
							<td>
								2-&nbsp;${entrevista.perfilAlumno.contactoTelefono2}
							</td>
						</tr>
					
					</table>			
					</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col18">
						<table>
						<tr>
							<td>
								1- ${entrevista.perfilAlumno.telefono1}
							</td>
						</tr>
						<tr>
							<td>
								2- ${entrevista.perfilAlumno.telefono2}
							</td>
						</tr>
					
					</table>
					</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col19">${entrevista.perfilAlumno.motivoEnvioTS.valor}</td>
					<td align="center" valign="middle" style="font-size: 14px" class="col20">
					<c:if test="${entrevista.perfilAlumno.entrevistaTSSeleccion}">
						<span>Info Socio Ambiental</span>
					</c:if>
					</td>	
					<td align="center"  style="border: 0">
						<table>
							<tr>
								<td>
										<div style="width:0.5cm" class="ui-state-default ui-corner-all" >
												<a  onclick="enviarForm('detalle','${entrevista.id}')"> 
												<span class="ui-icon ui-icon-search" title="Detalle Entrevista TS" ></span>
											</a>		
										</div>
								</td>
							</tr>
							</table>
					</td>
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