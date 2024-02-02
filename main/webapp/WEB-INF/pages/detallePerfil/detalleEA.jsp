<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<table  border="0" align="left" cellpadding="0" cellspacing="0" >
<c:if test="${ea.rr != null}">
<tr>
<td>
   <table  border="0">
   <thead>
   <tr>
   <td colspan="2">
   <label id="label">Datos Encargado de Acompañamiento</label>
   </td>
   </tr>
   </thead>
   <tbody>
		
		<tr>
			<td>
			<label id="label">Responsable Regional:</label>
			</td>
			<td>
			<label>${ea.rr.datosPersonales.apellido}, &nbsp; ${ea.rr.datosPersonales.nombre}</label>
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
</c:if>
<tr>
<td>
<jsp:include page="/WEB-INF/pages/detallePerfil/detallePersona.jsp"></jsp:include>
</td>
</tr>

</table>
</html>