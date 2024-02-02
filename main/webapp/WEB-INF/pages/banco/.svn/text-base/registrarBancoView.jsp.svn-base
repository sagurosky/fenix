<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar Banco</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#altaBanco").validate();
  });
  function enviarForm(){
	  $("#altaBanco").submit();
  }
 </script>

</head>
<body>

<form id="altaBanco" class="cmxform" action="<c:url value='/banco/registrarBanco.do' />" method="post">
<div id="right-content">
<fieldset>
	<legend>Registro de Banco</legend>
    <table width="500px" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
   		<tr>
	        <td width="100"><label>Nombre *</label></td>
	        <td width="800">
			<input type="text" name="nombre" id="nombre" class="required" /></td>
	    </tr>
	    <tr>
	        <td> <label>Sucursal *</label></td>
	        <td>
	        	<select name="sucursal" id="sucursal" class="required">
			          					<option value="">Seleccione una sucursal...</option>
										<c:forEach var="sucursal" items="${sucursales}">
											<option value="${sucursal.id}">${sucursal.numeroSucursal}, ${sucursal.direccion}</option>
										</c:forEach>
									</select>
			</td>

		</tr>
		<tr>
	        <td></td>
	        <td><input type="button" value="Generar Sucursales" class="ui-state-default ui-corner-all"	
					   			   onclick="location.href='../sucursalBanco/registrarSucursalBancoView.do'; return false;"/></td>
      	</tr>
     	<tr>
	        <td>&nbsp;</td>
	        <td>&nbsp;</td>
      	</tr>
      	<tr>
	        <td colspan="2">
		        <table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
		        	<tr>
			            <td width="50" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="button" onclick="enviarForm()" value="Registrar" /></td>
			            <td width="50" align="center" valign="middle"><input type="button" value="Volver" class="ui-state-default ui-corner-all" 
					       onclick="location.href='../banco/listaBancos.do'; return false;" /></td>
			            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
		          	</tr>
				 </table>      
			</td>
		</tr>
</table>
</fieldset>
</div>		

</form>

</body>
</html>