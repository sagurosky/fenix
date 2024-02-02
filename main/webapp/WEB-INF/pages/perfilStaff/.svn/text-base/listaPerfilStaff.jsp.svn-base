<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<title>Staff</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 90px;
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
function enviarForm1(action, id)
{
	confirma = true;
	if(action=='modificar'){
		document.forms['staffForm'].action = "../perfilStaff/modificarPerfilStaff.do";
	}else{ 
		 	if(action=='mostrar'){
			 document.forms['staffForm'].action = "../perfilStaff/mostrarPerfilStaff.do";
			}else{	
			document.forms['staffForm'].action = "../perfilStaff/eliminarPerfilStaff.do";}
		}
		if(confirma){
		document.forms['staffForm'].id.value = id;
		document.forms['staffForm'].submit();
}
}



</script>

</head>
<body>
<div id="main-content">
<br></br>

	<!-- Titulo de la Tabla -->
	<div class="ui-state-default ui-corner-all">
	<h3 align="center">Listado de Staff</h3>

	</div>
	<!-- Fin titulo -->
	<div class="ui-state-default ui-corner-all" align="center">
		<table align="center">
			<tr>
				<td>
					<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../perfilStaff/altaPerfilStaff.do?nombre= '" />
				</td>
			</tr>
		</table>
	</div>
	<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" style="background-color: #C0C2FF">
		<thead align="center">
			<tr id="fxs" style="display: none;">
				<c:forEach begin="0"  end="12" var="loop">
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
				<c:forEach begin="1"  end="2" var="loop">
					<td>
						<div class="ui-state-default ui-corner-all" style="width: auto; height: 40px;"></div>
					</td>
				</c:forEach>
			</tr>
			<!-- Botones para mostrar funciones	-->
			<tr>
				<c:forEach begin="0"  end="14">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
		<tr>
			<th>Legajo</th>
			<th>Apellido y nombre</th>
			<th>E-mail</th>
			<th>F Ingreso</th>
			<th>Mod Contratación</th>
			<th>Monto Ingreso</th>
			<th>Fecha Baja</th>
			<th>Dedicación</th>
			<th>Equipo</th>
			<th>Titular Cta</th>
			<th>CUIL</th>
			<th>Nro Cta</th>
			<th>C.B.U.</th>
			<th>Estado</th>
			<th id="acciones">Acciones</th>
		</tr>
		<tr>
			<c:forEach begin="1" end="13">
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
			</c:forEach>
			<td></td>
		</tr>
		</thead>

	<tbody align="center">
		<c:forEach items="${perfilStaffs}" var="perfilStaff">
			<tr>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.legajo}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.datosPersonales.apellido},&nbsp;${perfilStaff.datosPersonales.nombre}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.datosPersonales.mail}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;<fmt:formatDate value="${perfilStaff.fechaIngreso}" pattern="yyyy/MM/dd"/>&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.modalidadContratacion.valor}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.montoIngreso}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;<fmt:formatDate value="${perfilStaff.fechaBaja}" pattern="yyyy/MM/dd"/>&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.cargaHoraria.valor}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.equipo}&nbsp;</td>				
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.titularCuenta}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.cuilTitularCuenta}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.nroCuenta}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilStaff.cbu}&nbsp;</td>
				<td align="center" valign="top" style="font-size: 14px">
					<c:choose>
						<c:when test="${perfilStaff.activo}">Activo</c:when>
						<c:otherwise>Inactivo</c:otherwise>
					</c:choose>
				</td>
				<td align="center"  style="border: 0">
			
				<table>
				<tr>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm1('modificar','${perfilStaff.id}')"> 
						<span class="ui-icon ui-icon-pencil" > 
						</span></a>				
					</div>
				</td>
				
				<!-- 
					<c:if test="${perfilStaff.activo == true}">
					<td>
						<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
							<a  onclick="enviarForm1('eliminar','${perfilStaff.id}')" > 
							<span class="ui-icon ui-icon-trash" > 
							</span></a>				
						</div>
					</td>
					</c:if>
				 -->	
				</tr>
				</table>		
		
			</c:forEach>
	</tbody>
</table>
<div class="ui-state-default ui-corner-all" align="center">
<table align="center">
<tr>
	<td>
		<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../perfilStaff/altaPerfilStaff.do?nombre= '" />
	</td>
</tr>
</table>
</div>
<form:form name="staffForm" method="post" commandName="perfilSt">
	<input type="hidden" name="id" />
</form:form>

<a name="ancla"></a>
<div id="contenedor" style="width: 60%;">

</div>

</div>
</body>
</html>