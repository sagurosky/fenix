<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Sucursal Bancaria ::..</title>

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
    $("#modificarSucursalBanco").validate();

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

    $("#modificar").click(function(){
		if($("#idZona").val() == 0){
			jAlert('warning', 'Ingrese una zona válida', 'Atención!');	
		}else{
			$("#modificarSucursalBanco").submit();
		}
    });
    
});
</script>
</head>
<body>
<div id="main-content">
<form class="cmxform" id="modificarSucursalBanco" action="<c:url value='/sucursalBanco/modificarSucursalBanco.do' />" method="post">
<fieldset>
	<legend>Modificación de Sucursal</legend>
	<table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
	        <td width="130">Nombre *</td>
	        <td width="600"><input type="text" name="nombre" id="nombre" class="required" value="${sucursalBanco.nombre}"/></td>
	    </tr>
		<tr>
	        <td width="130">Numero Sucursal *</td>
	        <td width="600"><input type="text" name="numeroSucursal" id="numeroSucursal" value="${sucursalBanco.numeroSucursal}" class="required" /></td>
	    </tr>
	    <tr>
	    	<td>Direccion *</td>
	    	<td><input name="direccion" id="direccion" type="text" value="${sucursalBanco.direccion}" class="required"/></td>
	    </tr>
	    <tr>
	    	<td>Zona *</td>
	    	<td><input name="zona" id="zona" type="text" value="${sucursalBanco.zona.nombre}" class="required"/>
				<input name="idZona" id="idZona" type="hidden" value="${sucursalBanco.zona.id}" class="required"/></td>
	    </tr>
	    <tr>
	    	<td>Nombre de Contacto *</td>
	    	<td><input name="nombreContacto" id="nombreContacto" type="text" value="${sucursalBanco.nombreContacto}" class="required"/></td>
	    </tr>
	    <tr>
	    	<td>Telefono de Contacto *</td>
	    	<td><input name="telContacto" id="telContacto" type="text" value="${sucursalBanco.telContacto}" class="required"/></td>
	    </tr>
	    <tr>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
     	</tr>
	    <tr>
	    	<td colspan="2"><input type="hidden" value="${sucursalBanco.id}" name="id"/>
			<input class="ui-state-default ui-corner-all "  type="button" value="Modificar" id="modificar"/></td>
	    </tr>
	</table>		
</fieldset>
</form>
</div>
</body>
</html>