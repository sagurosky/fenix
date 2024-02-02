<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Usuarios</title>

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
		"iDisplayLength": 25,
		"sDom": '<"H"Tl>rt<"F"ip>'
	});
});
</script>

<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>

<script type="text/javascript">
function enviarForm(action, id,usuario){
	if(action=='modificar'){
		document.forms['usuarioForm'].action = "../usuario/registrarView.do";
		document.forms['usuarioForm'].idUsuario.value = id;
		document.forms['usuarioForm'].submit();
	}else{
		if(action=='eliminar'){
			jConfirm('¿ Está seguro de que desea poner en estado inactivo al usuario "' + usuario + '" ? Tenga en cuanta que se desactivaran todos los perfiles', 'Confirmación', function(result){
			    if (result) {
					document.forms['usuarioForm'].action = "../usuario/eliminarUsuario.do";
					document.forms['usuarioForm'].idUsuario.value = id;
					document.forms['usuarioForm'].submit();
			    } else {
			      return false;
			    }
			  });
			}  
			else{
				if(action=='activar'){
					jConfirm('¿ Está seguro de que desea poner en estado activo al usuario "' + usuario + '" ?', 'Confirmación', function(result){
					    if (result) {
							document.forms['usuarioForm'].action = "../usuario/activarUsuario.do";
							document.forms['usuarioForm'].idUsuario.value = id;
							document.forms['usuarioForm'].submit();
					    } else {
					      return false;
					    }
					  });
				}
				}	
			} 
}


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
<div class="ui-state-default ui-corner-all">
<h3 align="center">Listado de Usuarios</h3>
	<!-- Botones -->
</div>
<!-- Fin titulo -->
<div class="ui-state-default ui-corner-all">
	<table align="center">
		<tr>
			<td>
				<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../usuario/registrarView.do'" />
			</td>
		</tr>
	</table>
</div>
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" cellspacing="1">

		<thead align="center">
			<tr>
				<th>Usuario</th>
				<th>Nombre Real</th>
				<th>Perfiles</th>
				<th>Estado</th>
				<th>Acciones</th>
			</tr>
			<!-- Buscadores	-->
			<tr>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td></td>
				<td></td>	
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${usuarios}" var="usuario">
				<tr>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${usuario.usuario}&nbsp;</td>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${usuario.persona.apellido}, ${usuario.persona.nombre}&nbsp;</td>
					<td align="center" valign="middle" style="font-size: 14px">&nbsp;${usuario.persona.nombrePerfiles}&nbsp;</td>
					<c:choose>
						<c:when test="${usuario.activo}">
							<td align="center" valign="middle" style="font-size: 14px">Activo</td>
						</c:when>
						<c:otherwise>
							<td align="center" valign="middle" style="font-size: 14px">Inactivo</td>
						</c:otherwise>
					</c:choose>
					<td align="center" valign="middle" style="font-size: 14px">
						<table>
						<tr>
							<c:if test="${usuario.activo}">
								<td align="center" valign="middle">
									<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
										<a  onclick="enviarForm('modificar','${usuario.id}','${usuario.usuario}')" title="Editar Usuario"> 
										<span class="ui-icon ui-icon-pencil" > 
										</span></a>				
									</div>
								</td>
								<td>
									<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
										<a  onclick="enviarForm('eliminar','${usuario.id}','${usuario.usuario}')" title="Desactivar Usuario"> 
										<span class="ui-icon ui-icon-circle-close" > 
										</span></a>				
									</div>
								</td>	
							</c:if>
							<c:if test="${!usuario.activo}">
								<td>
									<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
										<a  onclick="enviarForm('activar','${usuario.id}','${usuario.usuario}')" title="Activar Usuario"> 
										<span class="ui-icon ui-icon-circle-check" > 
										</span></a>				
									</div>
								</td>
							</c:if>
						</tr>
						</table>
					</td>
			</c:forEach>
	</tbody>
</table>
<div class="ui-state-default ui-corner-all">
<table align="center">
<tr>
	<td>
		<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../usuario/registrarView.do'" />
	</td>
</tr>
</table>
</div>
<form:form name="usuarioForm" method="post" commandName="usuario">
<input type="hidden" name="idUsuario" />
</form:form>
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>