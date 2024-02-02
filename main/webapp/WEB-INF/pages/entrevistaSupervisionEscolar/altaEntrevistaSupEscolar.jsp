<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registrar Entrevista Supervision escolar</title>

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

<body onload="">
<div id="main-content">

	

<form:form id="entrevistaSupEscolar" class="cmxform" action="guardarEntrevistaSupEscolar.do" method="post" 
		commandName="entrevistaSupervisorEscolar" modelAttribute="entrevistaSupervisorEscolar">
 
<fieldset>
	<legend>Registrar Entrevista Supervision escolar</legend>
	<br>
	<table align="left">
		<tr>
			<td>
				<label>Supervisor Escolar:</label>
					<select name="supervisorEscolar.id" id="supervisorEscolar">
						<c:forEach items="${listSupervisor }" var="supervisorEscolar">
							<c:choose>
								<c:when test="${entrevistaSupervisorEscolar.supervisorEscolar.id == supervisorEscolar.id}">
									<option value="${supervisorEscolar.id }" selected="selected">${supervisorEscolar.nombre}</option>
								</c:when>
								<c:otherwise>
									<option value="${supervisorEscolar.id }">${supervisorEscolar.nombre}</option>
								</c:otherwise>
		
							</c:choose>
						</c:forEach>	
					</select>
				
			</td>
		</tr>
			<tr>
				<td>
					<label>Fecha Realización</label>	
					<input id="fecha" name="fecha" class="date required" value="<fmt:formatDate value="${entrevistaSupervisorEscolar.fecha}" pattern="dd/MM/yyyy"/>" />
				</td>
			</tr>
			<tr>
				<td>
					<label>Zona Entrevista</label>
					<select  id="zona.id" name="zona.id">
			   		   <c:forEach var="zona" items="${zonas}" >
			       	 	 <c:choose>
			       	 	 	<c:when test="${entrevistaSupervisorEscolar.zona.id == zona.id}">
			       	 	 		<option value="${zona.id}" selected="selected">${zona.nombre}</option>	
			       	 	 	</c:when>
			       	 	 	<c:otherwise>
			       	 	 		<option value="${zona.id}"> ${zona.nombre}</option>	
			       	 	 	</c:otherwise>
			       	 	 </c:choose>
			       	 	 
			   		   </c:forEach>
				   </select><br>
				</td>
			</tr>
			<tr>
				<td>
					<label>Observaciones Nivel educacional</label>					   
					<textarea rows="4" cols="30" class="required" name="nivelEducativo" id="nivelEducativo" style="white-space: normal;" >
						<c:if test="${entrevistaSupervisorEscolar.nivelEducativo != null}">
							${entrevistaSupervisorEscolar.nivelEducativo}
						</c:if>
					</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<label>Observaciones sobre equipo directivo</label>					   
					<textarea rows="4" cols="30" class="required" name="equipoDirectivo" id="equipoDirectivo" style="white-space: normal;" >
						<c:if test="${!empty entrevistaSupervisorEscolar.equipoDirectivo }">
							${entrevistaSupervisorEscolar.equipoDirectivo}
						</c:if>
					</textarea>
				</td>
			</tr>
			<tr>
				<td>
					<label>Nivel socio-económico de matrícula</label>					   
					<textarea rows="4" cols="30" class="required" name="socioEconomicoMatricula" id="socioEconomicoMatricula"  style="white-space: normal;"  >
						<c:if test="${!empty entrevistaSupervisorEscolar.socioEconomicoMatricula }">
							${entrevistaSupervisorEscolar.socioEconomicoMatricula}
						</c:if>
					</textarea>
				</td>
			</tr>
	</table>
</fieldset>
<br>
<table align="center">
	<tr>
		<td>
			<input class="ui-state-default ui-corner-all " type="submit" value="Alta" />
		</td>
		<td>
			<input type="button" value="Cancelar" class="ui-state-default ui-corner-all"  onclick="location.href='<c:url value="/entrevistaSupervisionEscolar/listaEntrevistaSupervisorEscolar.do" />'; return false;" />
		</td>
	</tr>
</table>

 </form:form>

</div>
</body>
</html>