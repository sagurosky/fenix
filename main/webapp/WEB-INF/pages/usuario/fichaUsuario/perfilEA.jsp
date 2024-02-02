<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript">

function seleccionarZona(tipo,id){
	var selector = "#" + tipo + id;
	$(selector).attr("selected","selected");
}

</script>

</head>
<body>
<h3>Perfil EA</h3>
<br>
<br>
<table>
	<tr>
		<td valign="top">Zonas&nbsp;</td>
		<td>
			<select name="zonasEA" size="12" multiple="multiple">
				<c:forEach items="${zonas}" var="zona">
					<option id="ea${zona.id}" value="${zona.id}">${zona.nombre}</option>
				</c:forEach>
			</select>
			<c:if test="${usuario.persona.perfilEA != null}">
				<c:forEach items="${usuario.persona.perfilEA.zona}" var="zona">
					<script>
						seleccionarZona("ea","${zona.id}");
					</script>
				</c:forEach>
			</c:if>
		</td>
	</tr>
</table>
<br></br>
<input type="button" onclick="guardarUsuario()" value="Guardar" class="ui-state-default ui-corner-all">
</body>
</html>