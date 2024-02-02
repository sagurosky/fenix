<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Barrio ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#modificarBarrio").validate();
  });
 </script>
</head>
<body>
<div id="main-content">
<form class="cmxform" id="modificarBarrio" action="<c:url value='/barrio/modificar.do' />" method="post">
<fieldset>
	<p>
		<label for="nombre">Nombre:</label>
		<input name="nombre" id="nombre" type="text" value="${barrio.nombre}" class="required"/>
	</p> 
	<p>
		<label for="codPostal">Codigo Postal:</label>
		<input name="codPostal" id="codPostal" type="text" value="${barrio.codPostal}" class="required"/>
	</p>	
	<p>
		<input type="hidden" value="${barrio.id}" name="idBarrio"/>
		<input class="ui-state-default ui-corner-all "  type="submit" value="Modificar" />
	</p>
</fieldset>
</form>
</div>
</body>
</html>