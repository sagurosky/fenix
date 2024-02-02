<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cambio Contraseña</title>

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
function enviarForm(){
	
	if(document.forms['usuarioForm1'].contraseniaNueva.value !=document.forms['usuarioForm1'].contraseniaNueva2.value ){
		
			alert("No concuerdan las contraseñas nuevas. Probá nuevamente");
			return false;
		
	}else{
		document.forms['usuarioForm1'].Action="../usuario/cambioContrasenia2.do";
		document.forms['usuarioForm1'].submit();
	}
	
	
	//if(action=='modificar'){
	//	document.forms['usuarioForm'].action = "../usuario/registrarView.do";
	//	document.forms['usuarioForm'].idUsuario.value = id;
		
	//}else{
	//	if(action=='eliminar'){
	//		jConfirm('¿ Está seguro de que desea poner en estado inactivo al usuario "' + usuario + '" ? Tenga en cuanta que se desactivaran todos los perfiles', 'Confirmación', function(result){
	//		    if (result) {
	//				document.forms['usuarioForm'].action = "../usuario/eliminarUsuario.do";
	//				document.forms['usuarioForm'].idUsuario.value = id;
	//				document.forms['usuarioForm'].submit();
	//		    } else {
	//		      return false;
	//		    }
	//		  });
	//		}  
	//		else{
	//			if(action=='activar'){
	//				jConfirm('¿ Está seguro de que desea poner en estado activo al usuario "' + usuario + '" ?', 'Confirmación', function(result){
	//				    if (result) {
	//						document.forms['usuarioForm'].action = "../usuario/activarUsuario.do";
	//						document.forms['usuarioForm'].idUsuario.value = id;
	//						document.forms['usuarioForm'].submit();
	//				    } else {
	//				      return false;
	//				    }
	//				  });
	//			}
	//			}	
	//		} 
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
<h3 align="center">Cambiá tu contraseña</h3>
	<!-- Botones -->
</div>
<!-- Fin titulo -->
<div class="ui-state-default ui-corner-all">
	
</div>

<div class="ui-state-default ui-corner-all">
	<form name="usuarioForm1" method="post" Action="../usuario/cambioContrasenia2.do">
		<table align="center">
		<tr>
			<td align="left">
				Ingresá tu usuario:
			</td>
			<td align="left">	
				<input type="text" id="usuario" name="usuario"/><br><br>
			</td>		
		</tr>	
		<tr>
			<td align="left">
				Ingresá contraseña actual:
			</td>
			<td align="left">	
				<input type="password" id="contraseniaAnterior" name="contraseniaAnterior" class="text-input required"/><br><br>
			</td>
		</tr>
		<tr>
			<td align="left">		
				Ingresá nueva contraseña :
			</td>
			<td align="left">	
				<input type="password" id="contraseniaNueva" name="contraseniaNueva" class="text-input required"/><br><br>
			</td>
		</tr>
		<tr>	
			<td align="left">		
				Repetí nueva contraseña:
			</td>
			<td align="left">	
				<input type="password" id="contraseniaNueva2" name="contraseniaNueva2" class="text-input required"/><br><br>
			</td>
		<tr>
			<td align="center" colspan="2">	
				<!--input type="submit" value="Cambiar" class="ui-state-default ui-corner-all" onclick="window.location.href='../usuario/cambioContrasenia2.do'" /-->
				<input type="button" value="Cambiar" class="ui-state-default ui-corner-all" onclick="enviarForm()"/>
			</td>
		</tr>
		</table>
	</form>
</div>

</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>