<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Registrar Periodo ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
	legend { width: 9em; float: left;font-size: 15px;padding-left: .1em}
</style>
 
<script>
  $(document).ready(function(){
    $("#altaPeriodo").validate();
	$('#fechaInicio').datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange:'2000:2100'
			
		});
	$('#fechaFin').datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange:'2000:2100'
		});
	});
</script>
</head>


<body>
<form id="altaPeriodo" class="cmxform" action="<c:url value='/ciclo/registrarPeriodo.do' />" method="post">
    <h1>Registro de Periodo:</h1>
    <table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
   		<tr>
	        <td width="200">Nombre:</td>
	        <td width="600"><input type="text" name="nombre" id="nombre" value="${nombre}" class="text-input required"></td>
	    </tr>
	     
   		<tr>
	    	<td>Fecha Inicial:</td>
        	<td><input type="text" value="${fechaInicio}" name="fechaInicio" id="fechaInicio" class="text-input" /></td>
      	</tr>
      	
		<tr>
       	 	<td>Fecha de Fin:</td>
        	<td><input type="text" value="${fechaFin}" name="fechaFin" id="fechaFin" class="text-input" /></td>
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
            	<td width="50" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="submit" value="Registrar" /></td>
            	<td width="50" align="center" valign="middle"><input type="button" class="ui-state-default ui-corner-all " value="Volver" onclick="location.href='../ciclo/modificarView.do?idCiclo=${idCiclo}'; return false;"/></td>
            	<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
        	</tr>

		 	</table>      			

			</td>
        </tr>
</table>
<input type="hidden" name="idCiclo" value="${idCiclo}"/>	
</form>
</body>
</html>