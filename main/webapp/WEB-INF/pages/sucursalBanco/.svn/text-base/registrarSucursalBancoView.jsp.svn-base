<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar Sucursal Bancaria</title>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
	
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
<script>
$(document).ready(function(){
    $("#altaSucursal").validate();

    $("#zona").keypress(function(){
	    $("#idZona").val(0);

	    $("#zona").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarZonaPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						maxRows: 12,
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.zonas, function(item) {
							return {
								label: item.nombre, 
								value: item.nombre,
								id: item.id
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#idZona").val(ui.item.id);
			}
		});
    });

    $("#registrar").click(function(){
		if($("#idZona").val() == 0){
			jAlert('warning', 'Ingrese una zona válida', 'Atención!');	
		}else{
			$("#altaSucursal").submit();
		}
    });
    
});
</script>

</head>
<body>
<form id="altaSucursal" class="cmxform" action="<c:url value='/sucursalBanco/registrarSucursalBanco.do' />" method="post">
<div id="right-content">
<fieldset>
	<legend>Registro de Sucursal Bancaria</legend>
    <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
    	<tr>
	        <td width="130">Nombre *</td>
	        <td width="600"><input type="text" name="nombre" id="nombre" class="required" value="${sucursal.nombre}"/></td>
	    </tr>
    	<tr>
	        <td width="130">N&uacute;mero Sucursal *</td>
	        <td width="600"><input type="text" name="numeroSucursal" id="numeroSucursal" class="required" value="${sucursal.numeroSucursal}"/></td>
	    </tr>
		<tr>
	        <td>Dirección *</td>
	        <td><input type="text" name="direccion" id="direccion" class="required" value="${sucursal.direccion}"/></td>
	    </tr>
	    <tr>
			<td>Zona *</td>
			<td><input type="text" name="zona" id="zona" class="required" />
				<input type="hidden" name="idZona" id="idZona" value="0"/></td>
	    </tr>
		<tr>
			<td>Nombre de Contacto *</td>
	        <td><input type="text" name="nombreContacto" id="nombreContacto" class="required" value="${sucursal.nombreContacto}"/></td>
	    </tr>
		<tr>
			<td>Teléfono de Contacto *</td>
	        <td><input type="text" name="telContacto" id="telContacto" class="required" value="${sucursal.telContacto}"/></td>
	    </tr>
		<tr>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
     	</tr>
        <tr>
			<td colspan="2">
		    	<table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
					<tr>
			            <td width="50" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="button" value="Registrar" id="registrar"/></td>
			            <td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
					       			   onclick="location.href='../sucursalBanco/listaSucursalBanco.do'; return false;" /></td>
			            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
					</tr>
				</table>      
			</td>
		</tr>
	</table>
</fieldset>
</div> 
</form>

</body>
</html>