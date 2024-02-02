<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>  
<%@taglib prefix="softek" uri="/softtek-fwk.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte Becas Alumnos Disponibles - Bug 800</title>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">

<softek:jquery nameTable="laTabla"/>
</head>

<body>
<div id="main-content">
<center><h2>Lista Reporte Becas Alumnos Disponibles</h2></center>
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" >

		<thead align="center">
			<tr>				
				<th>Becas Cantidad</th>
				<th>Padrino</th>
				<th>Alumno</th>										
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${reporteBecasAlumnosDisponibles}" var="reporteBecasAlumnosDisponibles">
				<tr>
<!--					<td><img src="<c:url value='/static/images/iconos/green_light.png'></c:url>" width="15px"></td>-->
					
					<td align="left" valign="middle" style="font-size: 14px">
					&nbsp;${reporteBecasAlumnosDisponibles.cantidad}&nbsp;</td>					
					
					<td align="left" valign="middle" style="font-size: 14px">&nbsp; 
					&nbsp;${reporteBecasAlumnosDisponibles.padrino.empresa.denominacion}&nbsp;</td>
										
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;
					<c:forEach items="${reporteBecasAlumnosDisponibles.becados}" var="becado">
						&nbsp;${becado.datosPersonales.nombre}&nbsp;
					</c:forEach>
					</td>	
																																				
				</tr>
			</c:forEach>
	</tbody>
</table>

</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>