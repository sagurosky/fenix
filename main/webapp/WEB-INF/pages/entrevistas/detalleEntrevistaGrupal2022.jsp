<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<br>
	<label><strong>Alumnos:</strong></label>
	<br>
	<br>
	<ol>
		<c:forEach items="${entrevista.entrevistasIndividuales}" var="e">
			<li>-&nbsp;${e.perfilAlumno.datosPersonales.nombre}&nbsp;${e.perfilAlumno.datosPersonales.apellido}</li>
		</c:forEach>
	</ol> 
	<br>
    <table width="300" height="400" border="0">
		<tr>
		    <td>
			<label id="label">Otros Participantes:</label>
			</td>
			<td>
				<c:if test="${entrevista.op1 != null}">
					RA<br>
				</c:if>
				<c:if test="${entrevista.op2 != null}">
					Invitado Externo<br> 
				</c:if>
				<c:if test="${entrevista.op3 != null}">
					Referentes Escolares<br>
				</c:if>
				<c:if test="${entrevista.op5 != null}">
					Padrinos<br>
				</c:if>
				<c:if test="${entrevista.op6 != null}">
					Egresados<br>
				</c:if>
				<c:if test="${entrevista.op4 != null}">
					<strong>Otros:</strong> ${entrevista.op}
				</c:if>
			</td>
		</tr>
		<tr>
		    <td>
			<label id="label">Tipo de Encuentro:</label>
			</td>
			<td>
				${entrevista.tipoEncuentro}
			</td>
		</tr>
		<tr>
		    <td>
			<label id="label">Fecha Realización:</label>
			</td>
			<td>
			<fmt:formatDate value="${entrevista.fechaEntrevista}" pattern="dd/MM/yyyy"/>  
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Lugar Espacio de acompañamiento:</label>
			</td>
			<td>
			<label>${entrevista.lugarEntrevista.nombre}/${entrevista.lugarEntrevista.localidad.zona.nombre}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Objetivo del encuentro y temas desarrollados:</label>
			</td>
			<td>
			<label>${entrevista.objetivoEncuentro}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Evaluación General del Encuentro:</label>
			</td>
			<td>
			<label>${entrevista.temasDesarrollados}</label>
			</td>
		</tr>
		<tr>
			<td nowrap="nowrap">
			<label id="label">Observaciones generales:</label>
			</td>
			<td>
			<label>${entrevista.observacionesGenerales}</label>
			</td>
		</tr>
</table>
<br>
</html>