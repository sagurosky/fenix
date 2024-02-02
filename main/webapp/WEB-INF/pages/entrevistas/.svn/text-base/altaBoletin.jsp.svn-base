<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Boletin ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#boletin").validate();
  });
 </script>
<script type="text/javascript">
function enviarForm(action, id){
	if(action=='alta'){
		document.forms['entrevistaForm'].action = "../entrevistas/registrarBoletin.do";
	}else if(action=='modificar'){
		document.forms['entrevistaForm'].action = "../entrevistas/modificarBoletinView.do";
	}
	document.forms['entrevistaForm'].idAlumno.value = id;
	document.forms['entrevistaForm'].submit();
}

</script>

</head>
<body>
<div id="main-content">
<br></br>
<h1 align="center">Alumno:&nbsp;${alumno.datosPersonales.apellido},&nbsp;${alumno.datosPersonales.nombre}</h1>
<table width="120" border="0" align="center" cellpadding="0" cellspacing="0" id="table-forms">	
		<tr>
		<td>
		</td>
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
			        <table width="800" border="0" align="center" cellpadding="0" cellspacing="0" id="table-botons-small">
      				    <tr>
							<td>
								<input class="ui-state-default ui-corner-all " onclick="enviarForm('alta','${alumno.id}')" type="button" value="Registrar Boletin" />
							</td>
							<td>
								<input class="ui-state-default ui-corner-all " onclick="enviarForm('modificar','${alumno.id}')" type="button" value="Modificar Boletin" />
							</td>	
						 </tr>
		 			</table>      	
				</td>
		    </tr>
</table>

<form:form name="entrevistaForm" method="post" commandName="entrevista">
<input type="hidden" name="idAlumno" />
</form:form>
</div>
</body>
</html>