<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Usuario ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#modificarUsuario").validate();
  });
 </script>
</head>
<body>

<div id="main-content">
<form class="cmxform" id="modificarUsuario" action="<c:url value='/usuario/modificar.do' />" method="post">
<h1>Ficha de Usuario</h1>
<table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
			<td width="100"><label for="nombre">Nombre Real:</label></td>
			<td width="800"><label id="nombre" >${persona.apellido},${persona.nombre}</label> </td>
		</tr>
	<tr>
		<td><label for="usuario">Usuario:</label></td>
		<td><input name="usuario" id="usuario" type="text" value="${persona.credenciales.usuario}" class="text-input required"/></td>
	</tr>  
	<tr>
			<td><label for="password">Password:</label></td>
			<td><input type="password" name="password" id="password" class="text-input required"  value="${persona.credenciales.password}"/></td>
		</tr>
		<tr>
			<td><label for="password">Confirmar Password:</label></td>
			<td><input type="password" name="confirmaPassword" id="password" class="text-input required" value="${persona.credenciales.password}"/></td>
		</tr>
	<tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
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
			<td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all "  type="submit" value="Modificar" /></td>
		    <td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
		       onclick="location.href='../usuario/listaUsuarios.do'; return false;" /></td>
            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
		    <td><input type="hidden" value="${persona.credenciales.id}" name="idUsuario"/></td>
	</tr>	
	</table> 
	</td>
	</tr>
	</table>
</form>
</div>
</body>
</html>