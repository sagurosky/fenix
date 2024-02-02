<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Banco ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#modificarBanco").validate();
  });
 </script>
</head>
<body>
<div id="main-content">
<form class="cmxform" id="modificarBanco" action="<c:url value='/banco/modificarBanco.do' />" method="post">
<fieldset>
	<legend>Modificación de Banco</legend>
	<br></br>
	<p>
		<label for="nombre">Nombre</label>
		<input name="nombre" id="nombre" type="text" value="${banco.nombre}" class="required"/>
	</p> 
	<p><!--
		<label>Sucursales</label>
		
		<select name="sucursales" multiple="multiple">
		<c:forEach var="sucursal" items="${sucursales}">
		<option selected="selected" value="${sucursal.id}">${sucursal.nombre}</option>
		</c:forEach>
		</select>
	</p>
	-->
	<br></br>	
	<p>
		<input type="hidden" value="${banco.id}" name="id"/>
		<input class="ui-state-default ui-corner-all "  type="submit" value="Modificar" />
	</p>
</fieldset>
</form>
</div>
</body>
</html>