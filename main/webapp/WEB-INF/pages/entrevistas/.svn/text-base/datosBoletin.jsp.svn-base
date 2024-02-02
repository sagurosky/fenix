.<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Registrar Datos Boletin ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
 <script>
  $(document).ready(function(){
    $("#altaBoletin").validate();
  });
 </script>

</head>
<body>
<div id="main-content">
<h1 id="titulo-informe">Alta de Boletín</h1>
<form id="altaBoletin" class="cmxform" action="<c:url value='/entrevistas/registrarDatosBoletin.do' />" method="post">

<table  border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		<c:if test="${!empty boletin}">	
		<tr>
			<td ><label >Ciclo Lectivo:</label>
			<input readonly="readonly" name="ciclo" value="${boletin.ciclo.nombre}"></input></td>
		</tr>
		</c:if>
		<tr>
			<td ><label >Año Escolar:</label>
			<select name="ano" class="select" >
				<c:forEach var="anio" items="${anios}">
					<option selected="selected" value="${anio.id}">${anio.valor}</option>
				</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td><label>Materias</label>
			
			<select name="materias" multiple="multiple">
				<c:forEach var="materia" items="${materias}">
					<option selected="selected" value="${materia.id}">${materia.nombre}</option>
				</c:forEach>
			</select>
			</td>
			
			<c:if test="${!empty previasAnioAnterior}">
			<td><label>Previas Año Anterior</label>
			
			<select name="previasAnioAnterior" multiple="multiple">
				<c:forEach var="previa" items="${previasAnioAnterior}">
					<option selected="selected" value="${previa.id}">${previa.materia.nombre}</option>
				</c:forEach>
			</select>
			</td>
			</c:if>
			
			<c:if test="${!empty previasAnioAnterior}">
			<td>
			<c:if test="${cantidadPrevias == 1}">
			<label>Elección de Previas</label>
			<select name="materiasAnioAnterior" >
				<c:forEach var="materiaAnterior" items="${materiasAnioAnterior}">
					<option selected="selected" value="${materiaAnterior.id}">${materiaAnterior.nombre}</option>
				</c:forEach>
			</select>
			</c:if>
			</td>
			</c:if>
			
			<c:if test="${empty previasAnioAnterior}">
			<td>
			<c:if test="${cantidadPrevias == 0}">
			<label>Elección de Previas</label>
			<select name="materiasAnioAnterior" multiple="multiple">
				<c:forEach var="materiaAnterior" items="${materiasAnioAnterior}">
					<option  value="${materiaAnterior.id}">${materiaAnterior.nombre}</option>
				</c:forEach>
			</select>
			</c:if>
			</td>
			</c:if>
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
        <table width="800" border="0" align="left" cellpadding="0" cellspacing="0" id="table-botons-small">
          <tr>
			<td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="submit" value="Registrar" /></td>
			<td width="50" height="0" align="left" valign="middle">
			    <c:if test="${empty urlInforme}">
					<input class="ui-state-default ui-corner-all " align="middle" type="submit" value="Volver"  onclick="location.href='../entrevistas/listarBecados.do'; return false;"/>
				</c:if>
				<c:if test="${!empty urlInforme}">
					<input class="ui-state-default ui-corner-all " align="middle" type="submit" value="Volver"  onclick="location.href='${urlInforme}'; return false;"/>
				</c:if>
			</td>
            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
			<td><input type="hidden" name="idAlumno" value="${alumno.id}" /></td>
			<td><input type="hidden" name="urlInforme" value="${urlInforme}"></input></td>
			<td><input type="hidden" name="idInformeCesacion" value="${idInformeCesacion}"></input></td>
			
		  </tr>
		</table>      	
		</td>
	  </tr>
</table> 
</form>
</div>
</body>
</html>