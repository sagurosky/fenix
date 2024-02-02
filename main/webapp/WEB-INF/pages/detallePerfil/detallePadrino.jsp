<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<table  border="0" align="left" cellpadding="0" cellspacing="0" >
<c:if test="${padrino.empresa != null}">
<tr>
<td>
   <table  border="0">
   <thead>
   <tr>
   <td colspan="2">
   <label id="label">Datos Padrino</label>
   </td>
   </tr>
   </thead>
   <tbody>
   		<tr>
			<td>
			<label id="label">CUIT:</label>
			</td>
			<td>
			<label>${padrino.empresa.CUIT}</label>
			</td>
		</tr>
		<tr>
		    <td  width="160">
			<label id="label">Denominacion:</label>
			</td>
			<td  width="600">
			<label>${padrino.empresa.denominacion}</label>  
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Contacto1:</label>
			</td>
			<td>
			<label>${padrino.empresa.contacto1}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">mailContacto1:</label>
			</td>
			<td>
			<label>${padrino.empresa.mailContacto1}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">Contacto2:</label>
			</td>
			<td>
			<label>${padrino.empresa.contacto1}</label>
			</td>
		</tr>
		<tr>
			<td>
			<label id="label">mailContacto2:</label>
			</td>
			<td>
			<label>${padrino.empresa.mailContacto2}</label>
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
<c:if test="${padrino.datosPersonales != null}">
<tr>
<td>
<jsp:include page="/WEB-INF/pages/detallePerfil/detallePersona.jsp"></jsp:include>
</td>
</tr>
</c:if>

</table>
</html>