<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Localidad ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#modificarLocalidad").validate();
  });
 </script>
</head>
<body>
<div id="main-content">
<form class="cmxform" id="modificarLocalidad" action="<c:url value='/localidad/modificar.do' />" method="post">
<fieldset>
	<legend>Modificar Localidad</legend>
	
	<input type="hidden" value="${localidad.id}" name="idLocalidad"/>
	
	<table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
			<tr>
				<td width="150">Nombre *</td>
				<td width="600"><input name="nombre" id="nombre" type="text" value="${localidad.nombre}" class="required"/></td>
			</tr>
			<tr>
				<td>Provincia</td>
				<td><input type="text" value="${localidad.provincia.descripcion}" disabled="disabled"></td>
			</tr>
			<tr>
	  			<td colspan="2">&nbsp;</td>
	  		</tr>
			<tr>
				<td colspan="2">
					<table width="500" border="0" cellpadding="0" cellspacing="2" id="table-botons-small">
			        	<tr>
			            	<td width="50" height="0" valign="middle"><input class="ui-state-default ui-corner-all " type="submit" value="Modificar" /></td>
							<td width="50" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
					       		onclick="location.href='../localidad/listaLocalidades.do'; return false;" /></td>
					       	<td width="150" height="30" align="center" valign="middle">&nbsp;</td>
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