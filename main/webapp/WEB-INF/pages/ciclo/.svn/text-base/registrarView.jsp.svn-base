<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<title>..:: Registrar Ciclo ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
<script>
  $(document).ready(function(){
    $("#altaCiclo").validate();
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
	$('#fecha1IS2').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});
	$('#fecha2IS2').datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange:'2000:2100'
		});	
	$('#fechalimite1').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});
	$('#fechalimite2').datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange:'2000:2100'
		});
	
	$('#fecha1T').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});
	$('#fecha2T').datepicker({
			changeMonth: true,
			changeYear: true,
			yearRange:'2000:2100'
		});
	$('#fecha3T').datepicker({
		changeMonth: true,
		changeYear: true,
		yearRange:'2000:2100'
	});
	});
</script>

</head>
<body>
<form id="altaCiclo" class="cmxform" action="<c:url value='/ciclo/registrar.do' />" method="post">
	<h1>Registro de Ciclo</h1>
    <table width="200" border="0" align="left" cellpadding="0" id="table-informe">
   		<tr>
	        <td width="200">Nombre: *</td>
	        <td width="600"><input type="text" name="nombre" id="nombre" value="${nombre}" class="text-input required"></td>
	    </tr>    
    	
    	<tr>
        	<td>Fecha Inicial: *</td>
        	<td><input type="text" name="fechaInicio" id="fechaInicio" value="${fechaInicio}"  class="text-input required" /></td>
	    </tr>
	    
	    <tr>
       	 	<td>Fecha de Fin: *</td>
        	<td><input type="text" name="fechaFin" id="fechaFin" value="${fechaFin}" class="text-input required" /></td>
	    </tr>
   		
   		<tr>
	        <td>Monto Beca: *</td>
	        <td><input type="text" name="montoBeca" onkeypress="return validarDecimal(event, this);"  id="montoBeca" value="${montoBeca}" class="text-input required"></td>
	    </tr>
		     
	    <tr>
        	<td>Primer Fecha IS2: *</td>
        	<td><input type="text" name="fecha1IS2" id="fecha1IS2" value="${fecha1IS2}" class="text-input required" /></td>
	    </tr>
	    
	    <tr>
       	 	<td>Primer Fecha Límite: *</td>
        	<td><input type="text" name="fechalimite1" id="fechalimite1" value="${fechalimite1}" class="text-input required" /></td>
	    </tr>	    
		
	    <tr>
       		<td>Segunda Fecha IS2*</td>
        	<td><input type="text" name="fecha2IS2" id="fecha2IS2" value="${fecha2IS2}" class="text-input required" /></td>
	    </tr>
	    
	    <tr>
        	<td>Segunda Fecha Límite: *</td>
        	<td><input type="text" name="fechalimite2" id="fechalimite2" value="${fechalimite2}" class="text-input required" /></td>
	    </tr>
	    
      	<tr>
        	<td>Fecha Carga 1º Trimestre: *</td>
        	<td><input type="text" name="fecha1T" id="fecha1T" value="${fecha1T}" class="text-input required" /></td>
	    </tr>
	    	
	    <tr>
        	<td>Fecha Carga 2º Trimestre: *</td>
        	<td><input type="text" name="fecha2T" id="fecha2T" value="${fecha2T}" class="text-input required" /></td>
	    </tr>
	    
	
	    <tr>
        	<td>Fecha Carga 3º Trimestre: *</td>
	    	<td><input type="text" name="fecha3T" id="fecha3T" value="${fecha3T}" class="text-input required" /></td>
	    </tr>
	       	
      	<tr>
        	<td colspan="2">
        	<table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
          	<tr>
            	<td width="50" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="submit" value="Registrar" /></td>
            	<td width="50" align="center" valign="middle"><input type="button" value="Volver" class="ui-state-default ui-corner-all" onclick="location.href='../ciclo/listaCiclos.do'; return false;" /></td>
            	<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
          	</tr>

		 	</table>      
			</td>
		</tr>
</table>
</form>
</body>
</html>