<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar Usuario</title>

</head>
<body>
<h3>Paso 1</h3>
<br></br>
Eliminá tu password actual y creá una nueva que sea alfanumérica. Hacé click en 
<br>
"siguiente" y en la <strong>próxima</strong> pantalla <strong>recordá guardar</strong> para que se grabe <strong>el cambio.</strong>
<br>
La clave que elijas no debe superar los 12 caracteres.
<br><br><br>

<fieldset>
	<legend>Datos de Usuario</legend>
		<br></br>
		<table style="margin-left: 20px;" border="0" align="left" cellpadding="0" cellspacing="0">
			<tr>
				<td width="150"><label for="usuario">Usuario *</label></td>
				<td width="600"><input type="text" name="usuario" id="usuario" 
									   value="${usuario.usuario}" class="required" readonly="readonly"  /></td>
			</tr>
			<tr>
				<td><label for="password">Password *</label></td>
				<td><input type="password" name="password" id="password" 
										   value="${usuario.password}" class="required" maxlength="12"/></td>
			</tr>
			<tr>
				<td><label for="confirmaPassword">Confirmar Password *</label></td>
				<td><input type="password" name="confirmaPassword" id="password2" 
										   value="${usuario.password}" class="required " maxlength="12"/></td>
			</tr>
			<!-- 
			<tr>
				<td><label for="activo">Activo:</label></td>
				<c:choose>
					<c:when test="${usuario.activo}">
						<td><input type="checkbox" name="activo" checked="checked"></td>
					</c:when>
					<c:otherwise>
						<td><input type="checkbox" name="activo"></td>
					</c:otherwise>
				</c:choose>				
			</tr>
			 -->
			<tr>
				<td height="20px"></td>
			</tr>
			<tr>
				<td><input type="button" id="siguiente" value="Siguiente" class="ui-state-default ui-corner-all"></td>
				<td></td>
			</tr>
		</table> 
</fieldset>

</body>
</html>