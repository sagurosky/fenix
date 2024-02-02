<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Becados</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		color: gray;
		font-style: italic; 
	}
</style>

<script type="text/javascript" src="<c:url value="/static/js/table/funcionesTabla.js"/>"></script>
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
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25
	});
	});
</script>
<script type="text/javascript" src="<c:url value="/static/js/table/funcionesTabla.js"/>"></script>
</head>
<body>
<div id="main-content">
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all" align="center">
<h2 align="center">Listado de Becados 
<c:if test="${!empty ea}">
	del EA: ${ea.apellido}, ${ea.nombre}
</c:if>
<c:if test="${!empty rr}">
	del RR: ${rr.datosPersonales.apellido},  ${rr.datosPersonales.nombre}
</c:if>
</h2>
</div>
<!-- Fin titulo -->
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF">
		<thead align="center">
		<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
			   
				<c:forEach begin="0" end="${!empty rr ? 8 : 7}" var="loop">
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
				<c:forEach begin="0" end="${!empty rr ? 8 : 7}">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<!-- Columnas -->
			<tr align="center">
				<th>Zona</th>
				<c:if test="${!empty rr && empty ea}">
					<th>EA</th>
				</c:if>
				<th>Becado</th>
				<th>Escuela</th>
				<th>A&ntilde;o Escolar</th>
				<th>Fecha de Incorporación al PFE</th>
				<th>Padrino</th>
				<th>DNI</th>
				<th>Estado Alumno</th>
			</tr>
			<tr>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<c:if test="${!empty rr && empty ea}">
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>	
				</c:if>
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
		<c:if test="${!empty becados}">
			<c:choose>
				<c:when test="${!empty rr && empty ea}">
					<c:set var="urlRegreso" value="/reporteBecadosAB/reporteBecadosABViewRr.do"></c:set>
				</c:when>
				<c:otherwise>
					<c:set var="urlRegreso" value="/reporteBecadosAB/reporteBecadosABViewEa.do"></c:set>
				</c:otherwise>	
			</c:choose>	
			<c:forEach items="${becados}" var="becado">
				<tr>
					<td align="left" valign="middle" nowrap="nowrap" style="font-size: 14px" class="col5">&nbsp;${becado.escuela.localidad.zona.nombre}&nbsp;</td>
					<c:if test="${!empty rr && empty ea}">
						<td align="center" valign="middle" nowrap="nowrap" style="font-size: 14px" class="col6">&nbsp;${becado.ea.datosPersonales.apellido},${becado.ea.datosPersonales.nombre}</td>
					</c:if>
					<td align="center" valign="middle" nowrap="nowrap" style="font-size: 14px" class="col0">&nbsp;${becado.datosPersonales.apellido}&nbsp;${becado.datosPersonales.nombre}&nbsp;
						<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Detalle Alumno">
							<a  href="<c:url value='/fichaAlumno/fichaAlumnoView.do?idAlumno=${becado.id}&urlRegreso=${urlRegreso}'/>"> 
								<span class="ui-icon ui-icon-search" ></span>
							</a>		
						</div>
					</td>
					<td align="left" valign="middle" nowrap="nowrap" style="font-size: 14px" class="col1">&nbsp;${becado.escuela.nombre}&nbsp;</td>
					<td align="left" valign="middle" nowrap="nowrap" style="font-size: 14px" class="col4">&nbsp;${becado.anioEscolar.valor}&nbsp;</td>
					<td align="left" valign="middle" nowrap="nowrap" style="font-size: 14px" class="col8">&nbsp;<fmt:formatDate value="${becado.fechaPBE}" pattern="dd/MM/yyyy"/>&nbsp;</td>	
					<td align="left" valign="middle" nowrap="nowrap" style="font-size: 14px" class="col2">&nbsp;
					<c:if test="${becado.beca.padrino.datosPersonales != null}">
						${becado.beca.padrino.datosPersonales.nombre},${becado.beca.padrino.datosPersonales.apellido}&nbsp;
					</c:if>
					<c:if test="${becado.beca.padrino.datosPersonales == null}">
						${becado.beca.padrino.empresa.denominacion}
					</c:if>
					</td>
					<td align="left" valign="middle" nowrap="nowrap" style="font-size: 14px" class="col3">&nbsp;${becado.datosPersonales.dni}&nbsp;</td>
					<td align="left" valign="middle" nowrap="nowrap" style="font-size: 14px" class="col7">
					<c:choose>
						<c:when test="${becado.estadoAlumno.id == 20 || becado.estadoAlumno.id == 22}">
							${becado.estadoRenovacion.valor}
						</c:when>
						<c:otherwise>
							${becado.estadoAlumno.valor}
						</c:otherwise>
					</c:choose>
					
					</td>
				</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty becados}">
		<tr>
				<td><c:out value=""/></td>
				<c:if test="${!empty rr}">
				<td><c:out value=""/></td>
				</c:if>
				<td><c:out value=""/></td>					
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>					
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>			
		</tr>
		</c:if>	
	    </tbody>
</table>
<br />
<br></br>
<br></br>
</td>
</tr>
</table>
<br><br>
<a name="ancla"></a>
<div id="contenedor" style="width: 60%;"></div>
</CENTER>	
</div>
</body>
</html>