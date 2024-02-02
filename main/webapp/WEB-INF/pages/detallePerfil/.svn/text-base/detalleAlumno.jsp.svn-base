<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<table  border="0" align="left" cellpadding="0" cellspacing="0" >
<tr>
<td>
   <table  border="0">
   <thead>
   <tr>
   <td colspan="2">
   <label id="label">Datos Alumno</label>
   </td>
   </tr>
   </thead>
   <tbody>
		<tr>
		    <td  width="160">
			<label id="label" >Zona Cimientos:</label>
			</td>
			<td  width="600">
			<label>${alumno.escuela.localidad.zona.nombre}</label>  
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Desempeño Escolar:</label>
			</td>
			<td>
			<label>${alumno.desempenioEscolar}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Turno:</label>
			</td>
			<td>
			<label>${alumno.turno.valor}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Estado Alumno:</label>
			</td>
			<td>
			<label>${alumno.estadoAlumno.valor}</label>
			</td>
		</tr>
		<c:if test="${alumno.responsable1 != null}">
		<tr>
			<td>
			<label id="label">Responsable Adulto:</label>
			</td>
			<td>
			<label>${alumno.responsable1.apellido},${alumno.responsable1.nombre}</label>
			</td>
		</tr>
		</c:if>
		<tr>
			<td>
			<label id="label">Motivo de Rechazo:</label>
			</td>
			<td>
			<label>${alumno.motivoRechazo}</label>
			</td>
		</tr>
		</tbody>
	</table>
</td>
</tr>
<tr>
<td>
&nbsp;
</td>
</tr>
<tr>
<td>
<jsp:include page="/WEB-INF/pages/detallePerfil/detallePersona.jsp"></jsp:include>
</td>
</tr>

</table>
</html>