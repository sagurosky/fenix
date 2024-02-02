<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Registrar Previa ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

</head>
<body>
<form id="materiaPreviaForm" name="materiaPreviaForm" action="<c:url value='/entrevistas/guardarMateriaPrevia.do' />" method="post">
<input type="hidden" name="idBoletin" id="idBoletin" value="${boletin.id}">
<input type="hidden" name="idAlumno" value="${alumno.id}" />
<input type="hidden" name="urlInforme" value="${urlInforme}"></input>
<input type="hidden" name="inasistenciasPrimer"/>
<input type="hidden" name="inasistenciasSegundo"/>
<input type="hidden" name="inasistenciasTercer"/>
<input type="hidden" name="diasHabilesPrimer"/>
<input type="hidden" name="diasHabilesSegundo"/>
<input type="hidden" name="diasHabilesTercer"/>
<input type="hidden" name="conductaPrimer"/>
<input type="hidden" name="conductaSegundo"/>
<input type="hidden" name="conductaTercer"/>
<input type="hidden" name="regular"/>
<input type="hidden" name="edicion" value="${edicion}"/>
<input type="hidden" name="idPrevia" value="${idPrevia}"/>

<div id="left-content">
    <table border="0" align="left" cellpadding="0" cellspacing="0" width="200px">
		<tr>
			<td width="5%"><label>Materia:</label></td>
			<td width="50%">
			<select style="width: 250px;" name="idMateria" id="materia" class="required">
				<c:forEach var="mat" items="${materiasTodas}">
					<c:if test="${mat.id == idPrevia}">
						<option selected="selected" value="${mat.id}">${mat.nombre}</option>
					</c:if>
					<c:if test="${mat.id != idPrevia}">
						<option value="${mat.id}">${mat.nombre}</option>
					</c:if>	
				</c:forEach>
			</select>
			</td>
	    </tr>
		<tr>
			<td width="5%"><label>Año escolar:</label></td>
			<td width="50%" nowrap="nowrap">
	        	<input value="${cicloPrevia}" name="ciclo" onkeypress="return soloNumeros(event, this);" id="ciclo" type="text" maxlength="4"/>
	        	<label id="errorCiclo" style="float: none; color: red; font-weight:bold; padding-left: .5em; vertical-align: top;"></label>
			</td>
	    </tr>	

 	</table>      
</div>	
<input type="hidden" name="cicloAnteriorPrevia" value="${cicloAnteriorPrevia}"/>
</form>
</body>
