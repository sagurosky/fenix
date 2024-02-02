<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Registrar Barrio ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#altaBarrio").validate();
  });
 </script>

</head>
<body>
<div id="main-content">
<form id="altaBarrio" class="cmxform" action="<c:url value='/barrio/registrar.do' />" method="post">
    <fieldset> 
		<legend>Registro de Barrio:</legend>
		<p>
			<label for="nombre">Nombre:</label>
			<input type="text" name="nombre" id="nombre" class="required" />
		</p>
		<p>
			<label for="codPostal">Codigo Postal:</label>
			<input type="text" name="codPostal" id="codPostal" class="required" />
		</p>
		<p>
			<input class="ui-state-default ui-corner-all " type="submit" value="Registrar" />
		</p>
		
	</fieldset> 
</form>
</div>
</body>
</html>