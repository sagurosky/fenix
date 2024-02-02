<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificar Registrar Entrevista Supervision escolar</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
	$("#entrevistaSupEscolar").validate(); 
    $("#fecha").datepicker({
  	  changeMonth: true,
  	  changeYear: true
  	  });
  });
 </script>
 
</head>

<body>
<div id="main-content">

	<h1>Modificar Entrevista Supervision escolar</h1>
	<br>
	<label><strong>Supervisor Escolar:</strong></label>
	<br>
<br><br>

<form id="entrevistaSupEscolar" class="cmxform" action="<c:url value='/entrevistaSupervisionEscolar/modificarEntrevistaSE.do' />" method="post">
 <input type="hidden" id="idEnt" value="${entrevistaSE.id}" name="idEnt"/>
	<table align="left">
		<tr>
			<td>
				<label>Fecha Realización</label>	
				<input id="fecha" name="fecha" class="date required" value="<fmt:formatDate value="${entrevistaSE.fecha}" pattern="dd/MM/yyyy"/>" />
			</td>
		</tr>
		<tr>
			<td>
				<label>Zona Entrevista</label>
				<select  id="zonaE" name="zonaE">
		   		   <c:forEach var="zona" items="${zonas}" >
		       	 	 <option value="${zona.id}">${zona.nombre}</option>
		   		   </c:forEach>
			   </select><br>
			</td>
		</tr>
		<tr>
			<td>
				<label>Observaciones Nivel educacional</label>					   
				<textarea rows="4" cols="30" class="required" name="nivelEducativo" id="nivelEducativo">${entrevistaSE.nivelEducativo}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<label>Observaciones sobre equipo directivo</label>					   
				<textarea rows="4" cols="30" class="required" name="equipoDirectivo" id="equipoDirectivo" >${entrevistaSE.equipoDirectivo}</textarea>
			</td>
		</tr>
		<tr>
			<td>
				<label>Nivel socio-económico de matrícula</label>					   
				<textarea rows="4" cols="30" class="required" name="socioEconomicoMatricula" id="socioEconomicoMatricula" >${entrevistaSE.socioEconomicoMatricula}</textarea>
			</td>
		</tr>
		<tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
     	</tr>
        <tr>
		<td colspan="2">
        <table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
          <tr>
            <td width="50" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="submit" value="Modificar" /></td>
            <td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
		       onclick="location.href='../registrarconsultaSE/listaSupervisorEscolar.do'; return false;" /></td>		       
            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
          </tr>
		
		 </table>      
		</td>
		</tr>
		
	</table>

</form>


</div>
</body>
</html>