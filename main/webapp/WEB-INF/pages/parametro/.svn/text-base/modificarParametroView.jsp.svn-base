<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Parametros ::..</title>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#modificacionParametros").validate();
  });
 </script>
</head>
<body>
<div id="main-content">
<form id="modificacionParametros" method="post" action="<c:url value="/parametro/modificarParametro.do"/>">
<center><h2>Modificacion del parametro ${parametro.valor}</h2></center>
<br>
<div align="center">
<table align="center">
	<tr>
		<td>
			<label for="valor">Nuevo valor</label>
		</td>
		<td>	
			<input type="text" name="valor" value="${parametro.valor}" id="valor" class="required"  />
		</td>
	</tr>
	<tr>
		<td>
			<input type="hidden" value="${parametro.id}" name="idParametro"/>
			<input class="ui-state-default ui-corner-all " type="submit" value=" Modificar " />
		</td>	
	</tr>
</table>
</div>
</form>
</div>
</body>
</html>