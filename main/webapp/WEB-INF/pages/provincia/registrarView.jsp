<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Registrar Provincia ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#altaProvincia").validate();
  });
 </script>

</head>
<body>
<div id="main-content">
<form id="altaProvincia" class="cmxform" action="<c:url value='/provincia/registrar.do' />" method="post">
<fieldset>
	<legend>Alta de Provincia</legend>
    <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
			<td width="100"><label for="nombre">Nombre</label></td>
			<td width="600"><input type="text" name="descripcion" id="descripcion" value="${descripcion}" class="required" /></td>
		</tr>
		<tr>
			<td width="100"><label for="pais">País</label></td>
			<td width="600"><input type="text" name="pais" id="pais" value="${pais}" class="required" /></td>
		</tr>
		<tr>
			<td valign="top"><label>Localidades</label></td>
			<td>
			<select name="localidades" multiple="multiple">
				<c:forEach var="localidad" items="${localidades}">
					<option value="${localidad.id}">${localidad.nombre}</option>
				</c:forEach>
			</select>
			</td>
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
	        		<c:if test="${empty localidadesSinProvincia}">
						<td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="submit" value="Registrar" /></td>
					</c:if>
					<td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
				       onclick="location.href='../provincia/listaProvincias.do'; return false;" /></td>
		            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
				</tr>		
			</table> 
			</td>
		</tr>
	</table>
</fieldset>
</form>
</div>
</body>
</html>