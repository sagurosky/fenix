<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Organizaciones</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 85px;
		color: gray;
		font-style: italic; 
	}
	
	table#laTabla{
		 background-color: #C0C2FF;
		 border: 0;
	}
</style>
	
<script type="text/javascript">
function enviarForm(action, id, denominacion){
	if(action=='modificar'){
		document.forms['empresaForm'].action = "../empresa/modificarEmpresaView.do";
		document.forms['empresaForm'].idEmpresa.value = id;
		document.forms['empresaForm'].submit();
	}else if(action=='eliminar'){
		jConfirm('Esta seguro de que desea eliminar la empresa ' + denominacion + ' ?', 'Confirmación', function(result){
		    if (result) {
				document.forms['empresaForm'].action = "../empresa/eliminarEmpresa.do";
				document.forms['empresaForm'].idEmpresa.value = id;
				document.forms['empresaForm'].submit();
		    } else {
		      return false;
		    }
		  });
	}else if(action=='listaBecas'){
		document.forms['empresaForm'].action = "../beca/listaBecasView.do";
		document.forms['empresaForm'].idEmpresa.value = id;
		document.forms['empresaForm'].submit();
	}
	
}


</script>


<script type="text/javascript">
$(function() {
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
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"sDom": '<"H"l>rt<"F"ip>'
	});
	});
</script>


<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>
	
</head>

<body >
<div id="main-content">
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all" >
	<h3 align="center">Listado de Organizaciones</h3>
</div>
<!-- Fin titulo -->
<div class="ui-state-default ui-corner-all" align="center">
	<table align="center">
	<tr>
		<td>
			<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../empresa/altaEmpresaView.do'" />
		</td>
	</tr>
	</table>
</div>
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0">

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
				<c:forEach begin="0" end="5">
					<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
						<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
						</span></a></div>
					</td>
				</c:forEach>
			</tr>
			<!-- Columnas -->
			<tr>
				<th width="105">CUIT</th>
				<th>Denominaci&oacute;n</th>
				<th>Contacto</th>
				<th>Mail de contacto</th>
				<th>Fecha Alta</th>
				<th id="acciones">Acciones</th>
			</tr>
			<tr>
				<c:forEach begin="0" end="4">
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				</c:forEach>	
				<td></td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${empresas}" var="empresa">
				<tr>
					<td align="center" valign="top" style="font-size: 14px" class="col0">${empresa.CUIT}</td>
					<td align="center" valign="top" style="font-size: 14px" class="col1">&nbsp;${empresa.denominacion}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px" class="col2">&nbsp;${empresa.contacto1}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px" class="col3">&nbsp;${empresa.mailContacto1}&nbsp;</td>
					<td align="center" valign="top" style="font-size: 14px" class="col6">&nbsp;<fmt:formatDate value="${empresa.fechaAlta}" pattern="dd/MM/yyyy"/>&nbsp;</td>
					
				<td align="center"  style="border: 0">
			
				<table>
				<tr>
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('modificar','${empresa.id}','${empresa.denominacion}')"> 
						<span class="ui-icon ui-icon-pencil" > 
						</span></a>				
					</div>
				</td>
			
				<td>
					<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a  onclick="enviarForm('eliminar','${empresa.id}','${empresa.denominacion}')" > 
						<span class="ui-icon ui-icon-trash" > 
						</span></a>				
					</div>
				</td>	
				</tr>
				</table>
			</c:forEach>
	</tbody>
</table>
<div class="ui-state-default ui-corner-all" align="center">
	<table align="center">
	<tr>
		<td>
			<input type="submit" value="Alta" class="ui-state-default ui-corner-all" onclick="window.location.href='../empresa/altaEmpresaView.do'" />
		</td>
	</tr>
	</table>
</div>
<form:form name="empresaForm" method="post" commandName="empresa">
<input type="hidden" name="idEmpresa" />
</form:form>
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