<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Periodo ::..</title>

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
	$("#modificarPeriodo").validate();
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
<form class="cmxform" id="modificarPeriodo" action="<c:url value='/ciclo/modificarPeriodo.do' />" method="post">
<h1>Modificacion de Periodo:</h1>
<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
   		<tr>
	        <td width="200">Nombre:</td>
	        <td width="600"><input type="text" name="nombre" id="nombre" value="${periodo.nombre}" class="text-input required"></td>
	    </tr> 
	    
   		<tr>
	    	<td>Fecha Inicial:</td>
        	<td><input type="text" name="fechaInicio" id="fechaInicio" value="<fmt:formatDate value="${periodo.fechaInicio}" pattern="dd/MM/yyyy "/>"  class="text-input"/></td>
      	</tr>
      	
		<tr>
        	<td>Fecha de Fin:</td>
       		<td><input type="text" name="fechaFin" id="fechaFin" value="<fmt:formatDate value="${periodo.fechaFin}" pattern="dd/MM/yyyy "/>" class="text-input"/></td>
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
            		<td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all "  type="submit" value="Modificar" /></td>
            		<td width="50" align="center" valign="middle"><input type="button" class="ui-state-default ui-corner-all " value="Volver" onclick="location.href='../ciclo/modificarView.do?idCiclo=${idCiclo}'; return false;"/></td>
            		<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
        		</tr>
		 	</table>
			</td>
        </tr>
        
        <tr>
        	<td>
				<input type="hidden" value="${idCiclo}" name="idCiclo"/>
				<input type="hidden" value="${periodo.id}" name="idPeriodo"/>
			</td>
        </tr>
</table>

</form>
</body>
</html>