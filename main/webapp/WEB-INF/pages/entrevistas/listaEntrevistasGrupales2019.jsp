<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script type="text/javascript" src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>
<script type="text/javascript" src="/Intranet/static/js/table/tabletools/js/TableTools.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Encuentro Grupales</title>

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
});

</script>

<script type="text/javascript" src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript">
	function enviarForm(action,id) {		
		alert(action+id);
		if(action=='eliminar'){
			jConfirm('Esta seguro de que desea eliminar el encuentro Grupal?', 'Confirmación', function(result){
			    if (result) {
					document.forms['entrevistaForm'].action = "../entrevistas/elimiarEntrevistaGrupalSuperUsuarioView.do";
					document.forms['entrevistaForm'].entrevistaId.value = id;
					document.forms['entrevistaForm'].submit();
					$.blockUI();
			    } else {
			      return false;
			    }
			  });
		}else{
			if(action=='exportar'){
				alert();
			
			}
	}

</script>

<script type="text/javascript">
	function exportarForm(action,id) {		
		if(action=='exportar'){
			
			document.forms['entrevistaForm'].action = "../entrevistas/exportarEntrevistasGrupales.do";
			document.forms['entrevistaForm'].entrevistaId.value = id;
			document.forms['entrevistaForm'].submit();
		}
		if(action=='exportarTodo'){
			//alert(id);
			
		}
		
	}
		
</script>
			
<script>
	function exportarFormTodo(action,id) {
		alert(document.forms['entrevistaForm'].idPerfilEA.value);
		document.forms['entrevistaForm'].action = "../entrevistas/exportarEntrevistasGrupalesTodos.do";
		document.forms['entrevistaForm'].idPerfilEA.value = id;		
		document.forms['entrevistaForm'].submit();
	}

function exportarFormTodoRR(action,id) {
		//alert();
		document.forms['entrevistaForm'].action = "../entrevistas/exportarEntrevistasGrupalesTodosRR.do";
		document.forms['entrevistaForm'].idPerfilRR.value = id;		
		document.forms['entrevistaForm'].submit();
	}


</script>		

</head>
<body>
<div id="main-content">
<div class="ui-state-default ui-corner-all" align="center">
	<table align="center">
		<c:if test="${empty rr}">
			<tr>
				<td>									
					<input type="button" value="Exportar a Excel" class="ui-state-default ui-corner-all" onclick="exportarFormTodo('exportarTodo','${idEa}')" />
				</td>
			</tr>
		</c:if>
		<c:if test="${empty ea}">
			<tr>
				<td>									
					<input type="button" value="Exportar a Excel" class="ui-state-default ui-corner-all" onclick="exportarFormTodoRR('exportarTodo','${rr.id}')" />
				</td>
			</tr>
		</c:if>
	</table>
</div>
<form id="entrevistaForm" class="entrevistaForm">
	<br/>
	<CENTER>
	<table align="center" >
	<tr align="center">
	<td style="vertical-align: middle;" align="center">
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all" align="center">
		<h3 align="center">Listado de Encuentro Grupales
			<c:if test="${!empty ea}">
				del EA: ${ea.nombre},${ea.apellido}
			</c:if>
			<c:if test="${!empty rr}">
				del RR: ${rr.nombre},${rr.apellido}
			</c:if>
		</h3>
		</div>
		<!-- Fin titulo -->
		<table align="center" class="dataTables_wrapper" width="630px" id="laTabla" cellspacing="1"> 
	
			<thead align="center">
				<!-- Panel de funciones	-->
				<tr id="fxs" style="display: none;">
					<c:forEach begin="0" end="2" var="loop">
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
				<c:if test="${empty rr && !empty ea}">
					<c:set var="end" value="4"></c:set>
				</c:if>
				<c:if test="${!empty rr && empty ea}">
					<c:set var="end" value="5"></c:set>
				</c:if>
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
					<c:if test="${!empty rr && empty ea}">
						<th>EA</th>
					</c:if>
					<th>Fecha</th>
					<th>Lugar</th>
					<th>Zona</th>
					<th>Periodo</th>
					<th>Acciones</th>
				</tr>
				<tr>
					<c:forEach begin="0" end="2">
						<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					</c:forEach>
					<td></td>
				</tr>
			</thead>
			<tbody align="center">
				<c:forEach items="${entrevistas}" var="e">
					<tr>
						<c:if test="${!empty rr && empty ea}">
							<td align="center" valign="middle" style="font-size: 14px" class="col0">&nbsp;${e.ea.datosPersonales.apellido},${e.ea.datosPersonales.nombre}&nbsp;</td>
						</c:if>		
						<td align="center" valign="middle" style="font-size: 14px" class="col0"><fmt:formatDate value="${e.fechaEntrevista}" pattern="dd/MM/yyyy"/></td>
						<td align="center" valign="middle" style="font-size: 14px" class="col1">&nbsp;${e.lugarEntrevista.nombre}&nbsp;</td>
						<td align="center" valign="middle" style="font-size: 14px" class="col2">&nbsp;${e.lugarEntrevista.localidad.zona.nombre}&nbsp;</td>
						<td align="center" valign="middle" style="font-size: 14px" class="col3">&nbsp;${e.periodo}&nbsp;</td>
						<td>
							<table>
								<tr>
									<td>
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
											<a onclick="openDetalleEntrevistaGrupal('${e.id}');"> 
												<span class="ui-icon ui-icon-search" title="Detalle Entrevista"></span>
											</a>
															
										</div>
										
										
									
									</td>
									<td>
									
									<!--  para poder exportar las entrevistas de a uno-->
									<div style="width: 0.5cm" class="ui-state-default ui-corner-all">
										<a onclick="exportarForm('exportar','${e.id}')"> 
											<img src="../static/images/excel.gif" width=15 /></a>
									</div>
									</td>									
									<c:if test="${!empty rr && empty e.periodo}">
										<td>
											<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
												<a  onclick="enviarForm('eliminar','${e.id}')" > 
													<span class="ui-icon ui-icon-trash" ></span>
												</a>				
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
		<br/>
	
	</td>
	</tr>
	</table>
	<br><br>
	
	<a name="ancla"></a>
	<div id="contenedor" style="width: 60%;">
	
	</div>
	</CENTER>
	<input type="hidden" name="idPerfilEA" value="${idEa}"/>	
	<input type="hidden" name="idPerfilRR" value="${rr.id}"/>
	<input type="hidden" name="entrevistaId" value="${e.id}" />
</form>
</div>
<div style="display: none;" id="dialogEntrevistaGrupal" title="Datos Encuentro Grupal">
<jsp:include page="/WEB-INF/pages/entrevistas/detalleEntrevistaGrupal.jsp"></jsp:include>
</div>
</body>
</html>