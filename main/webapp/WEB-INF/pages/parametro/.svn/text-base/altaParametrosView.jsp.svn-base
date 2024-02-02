<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Parametros ::..</title>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#altaParametros").validate();
  });
 </script>
</head>
<body>
<div id="main-content">
<form id="altaParametros" method="post" action="<c:url value="/parametro/altaParametro.do"/>">
<center><h2>Alta de Parametros </h2></center>
<br>
<div align="center">
<table align="center">
	<tr>
		<td>
			<label for="valor">Valor</label>
		</td>
		<td>
			<input id="valor" class="required" type="text" name="valor" />
		</td>
	</tr>
	
	<tr>
		<td>
			<input type="hidden" value="${tipoParametro}" name="tipoParametro"/>
			<center>
				<input class="ui-state-default ui-corner-all " align="middle" type="submit" value=" Guardar" />
			</center>
		</td>
	</tr>
</table>
</div>
</form>
</div>
</body>
</html>