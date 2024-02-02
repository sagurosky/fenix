<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Zonas del perfil RR</title>
</head>
<body>
<center>
<table>
	<tr>
		<td width="600">
			<label> 
				<c:forEach var="zona" items="${zona}">
					<b>${zona.nombre}</b>
					<br></br>
				</c:forEach> 
			</label>
		</td>
	</tr>
</table>
</center>
</body>
</html>