<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Becados Cesados</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		color: gray;
		font-style: italic; 
	}
</style>

<script type="text/javascript">
var oTable;

$(document).ready(function() {
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
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"sDom": '<"H"Tl>rt<"F"ip>'
		                    		
	});
	


} );
</script>
<script type="text/javascript" src="<c:url value="/static/js/table/funcionesTabla.js"/>"></script>
<script type="text/javascript">
function enviarForm(action, id, estadoAlumno)
{
	if(action=='entrevista'){
		document.forms['becadoForm'].action = "../entrevistas/verEntrevistaCesadaView.do?estado=" + estadoAlumno;	
	}else if(action=='boletin'){
		document.forms['becadoForm'].action = "../entrevistas/verBoletinView.do";
	}
		
	document.forms['becadoForm'].idPerfilAlumno.value = id;
	document.forms['becadoForm'].submit();
}


</script>

</head>
<body>
<div id="main-content">
<br />
<CENTER>
<table align="center" style="margin-left: 50px; margin-right: 50px;">
	<tr >
	<td style="vertical-align: top">
	<!-- Titulo de la Tabla -->
	<div class="ui-state-default ui-corner-all" align="center">
		<h3 align="center">Lista de Alumnos Inactivos del 
		<c:if test="${!empty ea}">
			EA: ${ea.apellido}, ${ea.nombre}
		</c:if> 
		<c:if test="${!empty rr}">
			RR: ${rr.apellido}, ${rr.nombre}
		</c:if> 
		</h3>
	</div>
	<!-- Fin titulo -->
	<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF"> 
			<thead align="center">
			<c:if test="${!empty ea}">
				<c:set var="end" value="6"></c:set>
			</c:if>
			<c:if test="${!empty rr}">
				<c:set var="end" value="7"></c:set>
			</c:if>
			<!-- Panel de funciones	-->
				<tr id="fxs" style="display: none;">
					
					<c:forEach begin="0" end="${end}" var="loop">
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
					<c:forEach begin="0" end="${end}">
						<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
							<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
							</span></a></div>
						</td>
					</c:forEach>
				</tr>
				<!-- Columnas -->
				<tr>
					<th>Apellido</th>
					<th>Nombre</th>
					<th>D.N.I</th>
					<c:if test="${!empty rr && empty ea}">
						<th>EA</th>
					</c:if>
					<th>Estado Alumno</th>
					<th>A&ntilde;o Escolar</th>
					<th>A&ntilde;o Adicional</th>
					<th>Fecha de Baja</th>
					<th>Bolet&iacute;n</th>
					<th>Espacio de acompañamiento</th>
				</tr>
				<tr>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>	
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<c:if test="${!empty rr && empty ea}">
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					</c:if>
				</tr>
			</thead>
			<tbody align="center">
				<c:if test="${!empty cesados}">
					<c:choose>
						<c:when test="${!empty rr && empty ea}">
							<c:set var="urlRegreso" value="/alumno/listaBecadosInactivosRr.do"></c:set>
						</c:when>
						<c:otherwise>
							<c:set var="urlRegreso" value="/alumno/listaBecadosInactivosEa.do"></c:set>
						</c:otherwise>	
					</c:choose>	
				<c:forEach items="${cesados}" var="cesado">
					<tr>						
						<td align="center"  nowrap="nowrap" valign="middle" style="font-size: 14px" class="col1">&nbsp;${cesado.datosPersonales.apellido}&nbsp;
							<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Detalle Alumno">
								<a  href="<c:url value='/fichaAlumno/fichaAlumnoView.do?idAlumno=${cesado.id}&urlRegreso=${urlRegreso}'/>"> 
									<span class="ui-icon ui-icon-search" ></span>
								</a>		
							</div>
						</td>
						<td align="center"  nowrap="nowrap" valign="middle" style="font-size: 14px" class="col0">&nbsp;${cesado.datosPersonales.nombre}&nbsp;</td>
						<td align="center"  nowrap="nowrap" valign="middle" style="font-size: 14px" class="col2">&nbsp;${cesado.datosPersonales.dni}&nbsp;</td>
						<c:if test="${!empty rr && empty ea}">
							<td align="center"  nowrap="nowrap" valign="middle" style="font-size: 14px" class="col3">&nbsp;${cesado.ea.datosPersonales.nombre}&nbsp;${cesado.ea.datosPersonales.apellido}</td>
						</c:if>
						<td align="center"  nowrap="nowrap" valign="middle" style="font-size: 14px" class="col4">&nbsp;${cesado.estadoAlumno.valor}&nbsp;</td>
						<td align="center"  nowrap="nowrap" valign="middle" style="font-size: 14px" class="col4">&nbsp;${cesado.anioEscolar.valor}&nbsp;</td>
						<c:if test="${cesado.anioAdicional}">
							<td align="center"  nowrap="nowrap" valign="middle" style="font-size: 14px" class="col4">&nbsp;Si&nbsp;</td>
						</c:if>
						<c:if test="${!cesado.anioAdicional}">
							<td align="center"  nowrap="nowrap" valign="middle" style="font-size: 14px" class="col4">&nbsp;No&nbsp;</td>
						</c:if>
						<td align="center"  nowrap="nowrap" valign="middle" style="font-size: 14px" class="col5">&nbsp;
							<fmt:formatDate value="${cesado.fechaBaja}" pattern="dd/MM/yyyy "/>&nbsp;
						</td>
						<!-- Boletín -->
						<td>
							<table border="0">
								<tr>
									<td>
										<c:if test="${cesado.estadoAlumno.id == '10'}">
											<td>												
												<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
													<a onclick="enviarForm('boletin','${cesado.id}','${cesado.estadoAlumno}')" title="Ver Boletin">
														<span class="ui-icon ui-icon-note" ></span>
													</a>			
												</div>
											</td>
										</c:if>					
									</td>
								</tr>
							</table>
						</td>
						<td>
							<table border="0">
								<tr>
									<td>							
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
										<a  onclick="enviarForm('entrevista','${cesado.id}','${cesado.estadoAlumno}')"> 
										<span class="ui-icon ui-icon-zoomin" title="Ver Entrevista"> 
										</span></a>				
										</div>
									</td>
								</tr>
							</table>
						</td>
					
				</c:forEach>
				</c:if>
			</tbody>
	</table>
	<br />
	<table align="center">
		<tr>
			<td>
			</td>
		</tr>
	</table>
	
	<form:form name="becadoForm" method="post" commandName="becado">
		<input type="hidden" name="idPerfilAlumno" />
	</form:form>
	
	<a name="ancla"></a>
	<div id="contenedor" style="width: 60%;">
	</div>
	</td>
	</tr>
</table>
</CENTER>	
</div>
</body>
</html>