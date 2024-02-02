<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Registrar Usuario ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 
 <script>
 $(function() {
		$("#persona").autocomplete({
			source: function(request, response) {
				$.ajax({
					minLength: 0,
					url: "../ajax/obtenerPersonasSinUsuario.do",
					dataType: "json",
					data: {
						persona: $("#persona").val()
					},
					success: function(data) {
						response($.map(data.personas, function(item) {
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
				$("#idPersona").val(ui.item.id);
				$("#persona").val(ui.item.label);
			},
			open: function() {
				$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
			},
			close: function() {
				$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
			}
		});
	});
 
  $(document).ready(function(){
    $("#altaUsuario").validate();
  });
 </script>

</head>
<body>
<div id="main-content">
<form id="altaUsuario" class="cmxform" action="<c:url value='/usuario/registrar.do' />" method="post">
<h1>Alta de Usuario</h1>
    <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
			<td width="100"><label for="usuario">Usuario:</label></td>
			<td width="600"><input type="text" name="usuario" id="usuario" class="text-input required" /></td>
		</tr>
		<tr>
			<td><label for="password">Password:</label></td>
			<td><input type="password" name="password" id="password" class="text-input required" /></td>
		</tr>
		<tr>
			<td><label for="password">Confirmar Password:</label></td>
			<td><input type="password" name="confirmaPassword" id="password" class="text-input required" /></td>
		</tr>
		<tr>
	    	<td>&nbsp;</td>
	        <td>&nbsp;</td>
	    </tr> 
		<tr>
			<td colspan="2"><label style="font-weight: bold">Persona</label></td>
		</tr>
		<tr>
			<td><label>Nombre</label></td>
			<td><input name="nombre" class="text-input required"></input></td>
		</tr>
		<tr>
			<td><label>Apellido</label></td>
			<td><input name="apellido" class="text-input required"></input></td>
		</tr>
		<tr>
			<td><label>DNI</label></td>
			<td><input name="dni" class="text-input digits required"></input></td>
		</tr>
		<tr>
	    	<td>&nbsp;</td>
	        <td>&nbsp;</td>
	    </tr>
		<tr>
			<td colspan="2"><label style="font-weight: bold">Perfiles</label></td>
		</tr>			
		<tr>
	        <td><label>EA</label></td>
	        <td><input type="checkbox" name="perfilEA"></input></td>
	    </tr>
	    <tr>
	        <td><label>RR</label></td>
	        <td><input type="checkbox" name="perfilRR"></input></td>
	    </tr>
	    <tr>
	        <td><label>TS</label></td>
	        <td><input type="checkbox" name="perfilTS"></input></td>
	    </tr>
	    <tr>
	        <td><label>Selector</label></td>
	        <td><input type="checkbox" name="perfilSelector"></input></td>
	    </tr>
	    <tr>
	        <td><label>DI</label></td>
	        <td><input type="checkbox" name="perfilDI"></input></td>
	    </tr>
	    <tr>
	        <td><label>Visita</label></td>
	        <td><input type="checkbox" name="perfiVisita"></input></td>
	    </tr>
	    <tr>
	        <td><label>Super Usuario</label></td>
	        <td><input type="checkbox" name="perfilSuperUsuario"></input></td>
	    </tr>
	    <tr>
	        <td><label>Administracion</label></td>
	        <td><input type="checkbox" name="perfilAdmin"></input></td>
	    </tr>
	    <tr>
	        <td><label>Coordinador PFE</label></td>
	        <td><input type="checkbox" name="perfilCoordPBE"></input></td>
	    </tr> 
	    <tr>
	        <td><label>Voluntario</label></td>
	        <td><input type="checkbox" name="perfilVoluntario"></input></td>
	    </tr>
	    <tr>
	        <td><label>Corrector</label></td>
	        <td><input type="checkbox" name="perfilCorrector"></input></td>
	    </tr>
	    <tr>
	        <td><label>Admin</label></td>
	        <td><input type="checkbox" name="perfilSysAdmin"></input></td>
	    </tr>
	    <tr>
	    	<td>&nbsp;</td>
	        <td>&nbsp;</td>
	    </tr>
      <tr>
        <td colspan="2">
        <table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
          <tr>
            <td width="50" height="0" align="center" valign="middle"><input type="reset" class="ui-state-default ui-corner-all" value="Limpiar" /></td>
			<td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="submit" value="Registrar" /></td>
			<td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
		       onclick="location.href='../usuario/listaUsuarios.do'; return false;" /></td>
            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
		</tr>
		
	</table> 
	</td>
	</tr>
	</table>
</form>
</div>
</body>
</html>