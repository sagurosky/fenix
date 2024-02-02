<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Lista Previas del Boletin ::..</title>
<script type="text/javascript">

$(function() {
	$('#laTabla').dataTable( {
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
		"iDisplayLength": 25
	});
	});
function guardar(idMateria, idAlumno){
	if(window.opener == null){
		document.forms['modificarBoletin'].action = "../entrevistas/altaNotaPeriodo.do";
	}else {
		document.forms['modificarBoletin'].action = "../entrevistas/modificarBoletinView.do";
	}
	document.forms['modificarBoletin'].idAlumno.value = idAlumno;
	document.forms['modificarBoletin'].idMateria.value = idMateria;
	document.forms['modificarBoletin'].submit();
}
</script>



<script type="text/javascript">
var idA;
var idPt;
var idSt;
var idTt;
var idUrl;

$.fx.speeds._default = 1000;


function openDialogPrevia(idAlumno,idTrimestre,urlInforme){
	idA = idAlumno;
	idT = idTrimestre;
	idUrl = urlInforme;
	
	$.ajax({
		type: "POST",
		url: "../entrevistas/altaNotaPrevia.do",
		data: {
				'idAlumno' : idA,
			    'idTrimestre' : idT,
			    'urlInforme' : idUrl
			   },
		success: function(msg){
		$("#dialogPrevia").html(msg);
		$("#dialogPrevia").dialog({
			position: 'middle',
			modal: false,
		    draggable: true,
		    resizable: false,
			width : 550,
			height: 'auto',
			show :'slow',
			hide :'slow'
		});
		}
		});
}


</script>
<script type="text/javascript" src="<c:url value="/static/js/table/funcionesTabla.js"/>"></script>

</head>
<body>
<div id="main-content">
<br>
<CENTER>
<table align="center" style="margin-left: 50px; margin-right: 50px;">
<tr >
<td style="vertical-align: top">
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all" align="center">
	
<h1 align="left" id="titulo-informe">Carga de Previas de : ${alumno.datosPersonales.apellido}&nbsp;${alumno.datosPersonales.nombre}</h1>
</div>
<br>
<form id="modificarBoletin" class="cmxform" action="<c:url value='/entrevistas/modificarDatosBoletin.do' />" method="post">
  <!-- Fin titulo -->
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF"> 
		<thead align="center">
		<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0" end="3" var="loop">
					<td>
						<div class="ui-state-default ui-corner-all" style="height: 40px;">
							<div  style= width:0.5cm title="subtotalizar"> 
								<a href="#ancla" onclick="subtotalizarColumna(${loop})"> 
								<span class="ui-icon ui-icon-circle-plus" > 
								</span></a>				
							</div>
							<div  style= width:0.5cm title="agrupar columna"> 
								<a  onclick="agruparColumna(${loop})"> 
								<span class="ui-icon ui-icon-circle-minus" > 
								</span></a>				
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
				<c:forEach begin="0" end="3">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<!-- Columnas -->
						<tr align="center">
							<th>Materia</th>
							<th>MARZO</th>
							<th>JULIO</th>
							<th>DICIEMBRE</th>
						</tr>
						<tr>
							<td><input name="search_browser" value="Buscar" class="search_init"/></td>
							<td><input name="search_browser" value="Buscar" class="search_init"/></td>	
							<td><input name="search_browser" value="Buscar" class="search_init"/></td>
							<td><input name="search_browser" value="Buscar" class="search_init"/></td>
						</tr>
					</thead>
					<tbody>
							<tr align="center">
							<!-- CORRESPONDE AL TH MATERIA -->
								<td align="center" nowrap="nowrap" valign="middle"
									style="font-size: 14px; font-weight: bold;"><c:forEach
									items="${marzo.previas}" var="previa">
									<table>
										<tr>
											<td>${previa.materia.nombre}</td>
										</tr>
									</table>
								</c:forEach></td>
								
								<!-- CORRESPONDE AL TH MARZO -->
								<td align="center" nowrap="nowrap" valign="middle"
									style="font-size: 14px; font-weight: bold;"><c:forEach
									items="${marzo.previas}" var="previa">
									<table>
										<tr>
											<td>&nbsp;${previa.nota}&nbsp;</td>
											<td>&nbsp;${previa.estado}&nbsp;</td>
										</tr>
									</table>
								</c:forEach>
								<CENTER>
								
								<div align="center" style="width: 0.5cm"
									class="ui-state-default ui-corner-all"><a
									title="Agregar"
									onclick="openDialogPrevia('${alumno.id}','${marzo.id}');"> <input
									type="hidden" name="idTrimestre" value="${marzo.id}" /> <span
									class="ui-icon ui-icon-circle-plus"></span> </a></div>
								
								</CENTER>
								</td>

								<!-- CORRESPONDE AL TH JULIO -->
								<td align="center" nowrap="nowrap" valign="middle"
									style="font-size: 14px; font-weight: bold;"><c:forEach
									items="${julio.previas}" var="previa">
									<table>
										<tr>
											<td>&nbsp;${previa.nota}&nbsp;</td>
											<td>&nbsp;${previa.estado}&nbsp;</td>
										</tr>
									</table>
								</c:forEach>
								<CENTER>
								<div align="center" style="width: 0.5cm"
									class="ui-state-default ui-corner-all"><a
									title="Agregar"
									onclick="openDialogPrevia('${alumno.id}','${julio.id}');"> <input
									type="hidden" name="idTrimestre" value="${julio.id}" /> <span
									class="ui-icon ui-icon-circle-plus"></span> </a></div>
								</CENTER>
								</td>
								
								<!-- CORRESPONDE AL TH DICIEMBRE -->
								<td align="center" nowrap="nowrap" valign="middle"
									style="font-size: 14px; font-weight: bold;">
									<c:forEach items="${diciembre.previas}" var="previa">
									<table>
										<tr>
											<td>&nbsp;${previa.nota}&nbsp;</td>
											<td>&nbsp;${previa.estado}&nbsp;</td>
										</tr>
									</table>
								</c:forEach>
								<CENTER>
								<div align="center" style="width: 0.5cm"
									class="ui-state-default ui-corner-all"><a
									title="Agregar"
									onclick="openDialogPrevia('${alumno.id}','${diciembre.id}');"> <input
									type="hidden" name="idTrimestre" value="${diciembre.id}" /> <span
									class="ui-icon ui-icon-circle-plus"></span> </a></div>
								</CENTER>
								</td>
							</tr>
						<c:if test="${empty boletin.previas}">
							<tr>
								<td><c:out value="" /></td>
								<td><c:out value="" /></td>
								<td><c:out value="" /></td>
								<td><c:out value="" /></td>
							</tr>
						</c:if>
					</tbody>
				</table>
				</td>
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>			
			</tr>
			<tr>
				<td align="center">
					<input name="volver" type="button" value="Volver"  
					class="ui-state-default ui-corner-all " align="middle" 
					onclick="location.href='../entrevistas/modificarBoletinView.do?idAlumno=${alumno.id}'; return false;"/>
				</td>
			</tr>
			<tr>	
				<td>
					<input type="hidden" name="idAlumno" value="${alumno.id}" />
					<input type="hidden" name="urlInforme" value="${urlInforme}"></input>
				</td>
			</tr>	
		</table>
	</td>
	</tr>
</table>	
</form>
</CENTER>
</div>
<div style="display: none;" id="dialogPrevia" title="Registro de Previa">
	<jsp:include page="/WEB-INF/pages/entrevistas/altaPrevia.jsp"></jsp:include>
</div>
</body>
</html>