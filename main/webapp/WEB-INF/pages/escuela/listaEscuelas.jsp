<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="s" uri="/softtek-fwk.tld"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="softek" uri="/softtek-fwk.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>escuela</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		color: gray;
		font-style: italic; 
	}
	
	table#laTabla{
		 background-color: #C0C2FF;
		 border: 0;
		margin: 0 auto;
		width: 100%;
		clear: both;
		border-collapse: collapse;
		table-layout: fixed; // ***********add this 
		word-wrap:break-word; // ***********and this 
}
</style>

<script type="text/javascript">
$(function() {
	TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
		
	oTable = $('#laTabla').dataTable( {
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>'+
		'<option value="50">50</option>'+
		'<option value="75">75</option>'+
		'<option value="100">100</option>'+
		'<option value="-1">Todos</option>'+
		'</select> ordenes por hoja',
		"sZeroRecords": "No se encontraron ordenes",
		"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ ordenes",
		"sInfoEmtpy": "Mostrando 0 ordenes",
		"sInfoFiltered": "(filtrado de _MAX_ ordenes totales)",
		"sSearch": "Buscar",
		"oPaginate": {
			"sFirst":    "Primera",
			"sPrevious": "Anterior",
			"sNext":     "Siguiente",
			"sLast":     "Ultima"
		}
		
		},
		"bAutoWidth": false,
		
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"sDom": '<"H"Tl>rt<"F"ip>'
	});
	
	
	
});
</script>
<script type="text/javascript">
//Parche para los filtros para la seleccion multiple
	var  isMultipleSeleccion = false;

</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>

<script type="text/javascript">
function enviarForm(action, id){
	if(action=='modificar'){
		document.forms['form'].action ="<c:url value='/escuela/modificarEscuela.do'/>";
	}else if(action=='eliminar'){
		document.forms['form'].action ="<c:url value='/escuela/eliminarEscuela.do'/>";
	}else if(action == 'enviar'){
		document.forms['form'].action ="<c:url value='/escuela/viewAltaEscuela.do'/>";
	}else if(action == 'exportar'){
		document.forms['form'].action ="<c:url value='/escuela/exportarEscuela.do'/>";
	}
	document.forms['form'].idEscuela.value = id;
	document.forms['form'].submit();
}
</script>
</head>

<body>
<div id="main-content">
<br>
<CENTER>
<table >
<tr >
<td style="vertical-align: top">
<div class="ui-state-default ui-corner-all" >
<h3 align="center">Listado de Escuelas</h3>
</div>
<form method="post" action="" name="form" id="form">
<div class="ui-state-default ui-corner-all" align="center">
	<table align="center">
		<tr>
			<td>
				<input type="button" value="Alta" class="ui-state-default ui-corner-all" onclick="enviarForm('enviar','null')" />
			</td>
			<td>
				<input type="button" value="Exportar a Excel" class="ui-state-default ui-corner-all" onclick="enviarForm('exportar','null')">
			</td>
		</tr>
	</table>
</div>
<input type="hidden" name="idEscuela" id="idEscuela">
<table align="center"   id="laTabla" width="100%" border="0" style="background-color: #C0C2FF">

		<thead align="center">
			<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0" end="3" var="loop">
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
				<c:forEach begin="0" end="8">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<th>id</th>
				<th>Escuela</th>				
				<th>Localidad</th>				
				<th>Zona</th>
				<th>Provincia</th>
				<th>Programa</th>
				<th>Comienzo PFE</th>
				<th>Modalidad<br>de trabajo</th>
				<th>Modalidad</th>
				<th>Becados<br>Activos</th>
				<th>Candidatos</th>
				<th>Ultima<br>modificacion</th>
				<th id="acciones">Acciones</th>
			</tr>
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
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${listaEscuelas}" var="escuela">
				<tr>
					<td align="left" valign="middle" style="font-size: 14px" class="col0">&nbsp;${escuela.id}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col0">&nbsp;${escuela.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col1">&nbsp;${escuela.localidad.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col2">&nbsp;${escuela.localidad.zona.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col3">&nbsp;${escuela.provincia.descripcion}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 12px" class="col0">${escuela.programa}</td>
					<td align="left" valign="middle" style="font-size: 12px" class="col0">${escuela.comienzoPBE.nombre}</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col4">&nbsp;${escuela.modalidadTrabajoEscuela.valor}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col4">&nbsp;${escuela.modalidad.valor}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col4">&nbsp;<center>${escuela.becadosActivos}&nbsp;</center></td>
					<td align="left" valign="middle" style="font-size: 14px" class="col4">&nbsp;<center>${escuela.becados}&nbsp;</center></td>
					<td align="left" valign="middle" style="font-size: 14px" class="col4">&nbsp;<center>${escuela.ultimaModificacion}&nbsp;</center></td>
					<td align="center"  style="border: 0">
						<table>
							<tr>
							<td>
								<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
									
									<a  onclick="enviarForm('modificar','${escuela.id}')"> 
									<span class="ui-icon ui-icon-pencil" > 
									</span></a>				
								</div>
							</td>
							
							<c:if test="${escuela.becadosActivos==0 && escuela.becados==0 && escuela.convocatoria==0 && 
							escuela.entrevistaProxima==0 && escuela.entrevistaLugar==0 &&
							escuela.esal==0 && escuela.evge==0 && escuela.hies==0}">
							<td>
								<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
									<a  onclick="enviarForm('eliminar','${escuela.id}')" > 
									<span class="ui-icon ui-icon-trash" > 
									</span></a>				
								</div>
							</td>
							</c:if> 	
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
				<input type="button" value="Alta" class="ui-state-default ui-corner-all" onclick="enviarForm('enviar','null')" />
			</td>
			<td>
				<input type="button" value="Exportar a Excel" class="ui-state-default ui-corner-all" onclick="enviarForm('exportar','null')">
			</td>
		</tr>
	</table>
</div>
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