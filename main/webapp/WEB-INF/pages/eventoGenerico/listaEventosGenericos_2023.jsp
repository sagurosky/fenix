<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript" src="/Intranet/static/js/table/tabletools/js/TableTools.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.alerts.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.tabs.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.draggable.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.accordion.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/ColVis.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/js/TableTools.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/ZeroClipboard/ZeroClipboard.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/js/TableTools.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/styles.css"/>" media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/table.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/jquery.ui.accordion.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/blitzer/jquery-ui-1.8.5.custom.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/ui-lightness/jquery-ui-1.8.5.custom.css"/>" media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/ui-lightness/jquery.alerts.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/js/table/tabletools/css/TableTools.css"/>"	media="all">
	




<title>Eventos Gen&eacute;ricos</title>

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

<script type="text/javascript" src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
<script type="text/javascript">
function enviarForm(action, id){
	if(action=='alta'){			
		if(document.getElementById("idEa2").value==0){
			alert("No seleccionaste EA");
			false;
		}else{
			document.forms['eventoForm'].action = "../eventoGenerico/altaEventoGenericoView.do";
			document.forms['eventoForm'].idEa.value = document.getElementById("idEa2").value;
			document.forms['eventoForm'].submit();
		}
	}
	if(action=='modificar'){
		document.forms['eventoForm'].action = "../eventoGenerico/modificarEventoGenerico.do";
		document.forms['eventoForm'].idEvento.value = id;
		document.forms['eventoForm'].submit();
	}
	
	if(action=='exportar'){
		document.forms['eventoForm'].action = "../eventoGenerico/exportarEventosGenericos.do";
		document.forms['eventoForm'].idEvento.value = id;		
		
		document.forms['eventoForm'].submit();
	}
	if(action=='exportarTodo'){
		var ciclo2=document.getElementById("ciclo1").value;
		document.forms['eventoForm'].ciclo.value=ciclo2;
		//alert(document.forms['eventoForm'].ciclo.value);
		document.forms['eventoForm'].action = "../eventoGenerico/exportarEventosGenericosTodos.do";
		document.forms['eventoForm'].idPerfilEA.value = id;
		document.forms['eventoForm'].idPerfilRR.value = id;
		
		document.forms['eventoForm'].submit();
	}
	if(action=='exportarTodoRR'){
		//alert(id);
		document.forms['eventoForm'].action = "../eventoGenerico/exportarEventosGenericosTodosRR.do";
		//document.forms['eventoForm'].idPerfilEA.value = id;
		document.forms['eventoForm'].idPerfilRR.value = id;
		
		document.forms['eventoForm'].submit();
	}
	
	else if(action=='eliminar'){
		jConfirm('Esta seguro de que desea eliminar el evento seleccionado ?', 'Confirmación', function(result){
		    if (result) {
		    	document.forms['eventoForm'].action = "../eventoGenerico/eliminarEventoGenerico.do";
				document.forms['eventoForm'].idEvento.value = id;
				document.forms['eventoForm'].submit();
		    } else {
		      return false;
		    }
		  });
		
	}
	
}
function enviarFormAprobar(action, id){
	if(action=='aprobar'){
		document.forms['eventoForm'].action = "../eventoGenerico/aprobarEventoGenerico.do";
		document.forms['eventoForm'].idEvento.value = id;
		document.forms['eventoForm'].submit();
	}
}
</script>
<script type="text/javascript">
$(function() {
	TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
		
	oTable = $('#laTabla').dataTable( {
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
		"aaSorting": [],	
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"sDom": '<"H"Tl>rt<"F"ip>'
	});
	
	});
</script>
<script>

    $("laTabla").click(function () {

      alert(1);

    });

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
<div class="ui-state-default ui-corner-all" align="center">

<h3 align="center">Listado de Eventos Gen&eacute;ricos
<c:if test="${!empty ea}">
	del EA: ${ea.nombre},${ea.apellido}
</c:if>
<c:if test="${!empty rr}">
	del RR: ${rr.nombre},${rr.apellido}
</c:if>
</h3>
</div>
<!-- Fin titulo -->
<div class="ui-state-default ui-corner-all" align="center">
	<table align="center">
		<c:if test="${empty rr}">
			<tr>
				<td>
					<center>
					<input type="button" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../eventoGenerico/altaEventoGenericoView.do?idEa=${idEa}'" />
					<br>					
					<select id="ciclo1" name="ciclo1">
						<option value="0">Seleccionar Ciclo a exportar</option>
						<option value="2023">2023</option>	
						<option value="2022">2022</option>
						<option value="2021">2021</option>	
						<option value="2020">2020</option>
						<option value="2019">2019</option>
						<option value="2018">2018</option>
						<option value="2017">2017</option>
						<option value="2016">2016</option>
						<option value="2015">2015</option>
						<option value="2014">2014</option>
						<option value="2013">2013</option>
						<option value="2012">2012</option>
						<option value="2011">2011</option>
						<option value="2010">2010</option>
					</select>
					<input type="button" value="Exportar a Excel" class="ui-state-default ui-corner-all" onclick="enviarForm('exportarTodo','${idEa}')" />
					</center>
				</td>
			</tr>
		</c:if>
		
		
		<c:if test="${!empty rr}">
			<tr>
				<td>
					<sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver" url = "jdbc:mysql://localhost/cimientos_testing" user = "root"  password = "root"/>
					<sql:query dataSource = "${snapshot}" var = "result">
						select perfilea, persona.apellido, persona.nombre
						from perfilea, perfilrr, persona
						where perfilea.rr_id_perfil=perfilrr.id_perfilrr
						and persona.perfilea=perfilea.id_perfilea
						and perfilrr.datos_personales=${rr.id}
						order by apellido,nombre;;
					</sql:query>
					<select id="idEa2" name="idEa2">
	  					<option value="0">Seleccionar EA para dar de alta un Evento Genérico</option>
	      					<c:forEach var = "row" items = "${result.rows}">
	            			<option value=<c:out value = "${row.perfilea}"/>><c:out value = "${row.apellido} ${row.nombre}" /></option>	               	            
		         			</c:forEach>
					</select>					
					<!-- >input type="button" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../eventoGenerico/altaEventoGenericoView.do?idEa=${rr.id}'" /-->					
					<input type="button" value="Alta" class="ui-state-default ui-corner-all" onclick="enviarForm('alta','1')" />
					<input type="button" value="Exportar a Excel" class="ui-state-default ui-corner-all" onclick="enviarForm('exportarTodoRR','${rr.id}')" />
				</td>
			</tr>
		</c:if>
								
	</table>
</div>
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1">

		<thead align="center">
			<!-- Panel de funciones	-->
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0" end="6" var="loop">
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
				<c:set var="end" value="6"></c:set>
			</c:if>
			<c:if test="${!empty rr && empty ea}">
				<c:set var="end" value="7"></c:set>
			</c:if>
			<tr>
				<c:forEach begin="0" end="${end}">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<tr>
				<th>Zona</th>
				<c:if test="${!empty rr && empty ea}">
					<th>EA</th>
				</c:if>
				<th>Localidad</th>
				<th>Provincia</th>
				<th>Zona</th>
				<th>Fecha del evento</th>
				<th>Lugar</th>
				<th>Tipo</th>
				<th>Evaluaci&oacute;n</th>
				<!-- <th>Observaciones</th>  -->
				<th id="acciones">Acciones</th>
			</tr>
			<tr>
				<c:forEach begin="0" end="6">
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				</c:forEach>
				<td></td>	
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${eventos}" var="evento">
				<tr>
					<td align="left" valign="middle" style="font-size: 14px" class="col0">&nbsp;${evento.lugarEncuentro.localidad.zona.nombre}&nbsp;</td>
					<c:if test="${!empty rr && empty ea}">
						<td align="left" valign="middle" style="font-size: 14px" class="col0">&nbsp;${evento.ea.datosPersonales.apellido},${evento.ea.datosPersonales.nombre}&nbsp;</td>
					</c:if>		
					<td align="left" valign="middle" style="font-size: 14px" class="col1">&nbsp;<fmt:formatDate value="${evento.fechaCarga}" pattern="dd/MM/yyyy"/>&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col2">&nbsp;<fmt:formatDate value="${evento.fechaEvento}" pattern="dd/MM/yyyy"/>&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col3">&nbsp;${evento.lugarEncuentro.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col4">&nbsp;${evento.tipoEvento.valor}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px" class="col5">&nbsp;${evento.evaluacionEncuentro.valor}&nbsp;</td>
					<!-- <td align="left" valign="middle" style="font-size: 14px" class="col6">&nbsp;${evento.observaciones}&nbsp;</td>  -->
					
					<td align="center"  style="border: 0">
						<table>
							<tr>
								<c:if test="${empty rr && !empty ea}">
									<td>
									<div style="width: 0.5cm" class="ui-state-default ui-corner-all">
									<a onclick="enviarForm('modificar','${evento.id}')"> <span
										class="ui-icon ui-icon-pencil"> </span></a></div>
									</td>
									
									<td>
									
									<!--  para poder exportar los eventos genericos de a uno-->
									<div style="width: 0.5cm" class="ui-state-default ui-corner-all">
										<a onclick="enviarForm('exportar','${evento.id}')"> 
											<img src="../static/images/excel.gif" width=15 /></a>
									</div>
									</td>
<!--									<td>-->
<!--									<div style="width: 0.5cm" class="ui-state-default ui-corner-all">-->
<!--									<a onclick="enviarForm('eliminar','${evento.id}')"> <span-->
<!--										class="ui-icon ui-icon-trash"> </span></a></div>-->
<!--									</td>-->
								</c:if>
								<c:if test="${!empty rr && empty ea}">
								<td>
									<div style="width: 0.5cm" class="ui-state-default ui-corner-all">
									<a onclick="enviarFormAprobar('aprobar','${evento.id}')"> <span
										class="ui-icon ui-icon-pencil"> </span></a></div>
									
										
									</td>
									<td>
									
									<!--  para poder exportar los eventos genericos de a uno-->
									<div style="width: 0.5cm" class="ui-state-default ui-corner-all">
										<a onclick="enviarForm('exportar','${evento.id}')"> 
											<img src="../static/images/excel.gif" width=15 /></a>
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
	<c:if test="${empty rr}">
	<tr>
		<td>
			<input type="button" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../eventoGenerico/altaEventoGenericoView.do?idEa=${idEa}'" />
			<input type="button" value="Exportar a Excel" class="ui-state-default ui-corner-all" onclick="enviarForm('exportarTodo','${idEa}')" />
		</td>
	</tr>
	</c:if>
	</table>
</div>
<form:form name="eventoForm" method="post" commandName="evento">
<input type="hidden" name="idEvento" value="${evento.id}"/>
<input type="hidden" name="idPerfilEA" value="${idEa}"/>
<input type="hidden" name="idPerfilRR" value="${rr.id}"/>
<input type="hidden" name="idEa" id="idEa"/>
<input type="hidden" name="ciclo" id="ciclo"/>
</form:form>


</table>
</CENTER>	
</div>
</body>
</html>