<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Parametros</title>

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
	
</head>

<body>
<div id="main-content">
<br></br>
<center><h3>Seleccione la Categoria</h3></center>
<br />
<CENTER>
<table align="center" >
<tr align="center">
<td style="vertical-align: middle;" align="center">
<form method="post" action="<c:url value="/parametro/verParametros.do"/>">
	<SELECT NAME="idParametro" onchange="submit()"> 
   		<OPTION VALUE="1">Area</OPTION> 
   		<OPTION VALUE="2">Puesto</OPTION> 
   		<OPTION VALUE="3">Monto Beca</OPTION>
   		<OPTION VALUE="4">Adicional</OPTION>
   		<OPTION VALUE="5">Adicional Ingreso</OPTION>
   		<OPTION VALUE="6">Extra</OPTION>
   		<OPTION VALUE="7">Materia</OPTION>
	</SELECT> 
	<input class="ui-state-default ui-corner-all " type="submit" value=" Seleccionar Parametros " />	
</form>
</td>
</tr>
</table>
</CENTER>
<br/>

<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td style="vertical-align: top">
<div class="ui-state-default ui-corner-all" >
<h3 align="center">Listado de Parametros Activos</h3>
</div>
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1"> 
<thead align="center" title="Parametros">
	<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0" end="1" var="loop">
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
				<c:forEach begin="0" end="2">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
	<!-- Columnas -->
	<tr>
		<th>Nombre</th>
		<th>Categoria</th>
		<th id="acciones">Acciones</th>
	</tr>
	<tr>
		<td><input name="search_browser" value="Buscar" class="search_init"/></td>
		<td><input name="search_browser" value="Buscar" class="search_init"/></td>
		<td></td>	
	</tr>
</thead>
<tbody align="center">
		<c:forEach items="${listado}" var="parametro">
			<tr>
				<td>${parametro.valor}</td>
				<td>												
					<c:if test="${parametro.tipo == 1}">AREA</c:if>
					<c:if test="${parametro.tipo == 2}">PUESTO</c:if>
					<c:if test="${parametro.tipo == 3}">MONTO de BECA</c:if>
					<c:if test="${parametro.tipo == 4}">ADICIONAL</c:if>
					<c:if test="${parametro.tipo == 5}">ADICIONAL de INGRESO</c:if>
					<c:if test="${parametro.tipo == 6}">EXTRA</c:if>
					<c:if test="${parametro.tipo == 7}">MATERIAS</c:if>
				</td>
				
				<td  align="center">
				<table>
				<tr>
				<td>	
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
					<a  href="<c:url value="/parametro/modificarParametroView.do?idParametro=${parametro.id}"/>"> 
					<span class="ui-icon ui-icon-pencil" > 
					</span></a>				
					</div>
				</td>
				<td align="right">	
					<div style= width:0.5cm class="ui-state-default ui-corner-all" >
					<a  href="<c:url value="/parametro/darBajaParametro.do?idParametro=${parametro.id}"/>">
					<span class="ui-icon ui-icon-trash" >
					</span></a>
					</div>
				</td>
				</tr>
				</table>
				
			</tr>
		</c:forEach>
		</tbody>
	</table>
<div class="ui-state-default ui-corner-all" >
<form action="<c:url value="/parametro/altaParametrosView.do"/>">
	<input type="hidden" value="${tipoParametro}" name="tipoParametro"/>
	
	<input class="ui-state-default ui-corner-all " type="submit" value="Agregar Parametros" />	
</form>
</div>
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