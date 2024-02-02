<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Registrar Materia ::..</title>
<script type="text/javascript">
$("#materia").change(function(evt) {
	var mater = $("#materia").val();
	if(mater == ""){
		$("#otra").show();
	}else{
		$("#otra").hide();
	}
  })
</script>
</head>
<body>
<form id="materiaForm" name="materiaForm" action="<c:url value='/entrevistas/guardarMateriaBoletin.do' />" method="post">
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
<div id="left-content">
    <table border="0" align="left" cellpadding="0" cellspacing="1" width="150px" >
		<tr>
			<td><label id="label">Materia:</label></td>
			<td align="left">
			<select style="width: 250px;"  name="idMateria" id="materia">
				<c:forEach var="mat" items="${materiasDisponibles}">
					<option value="${mat.id}">${mat.nombre}</option>
				</c:forEach>
				<!-- 	<option value="">Otra</option>-->
			</select>
			</td>
			<!-- <td align="left"><input id="otra" name="otraMateria" type="text"></td>-->
	    </tr>
 	</table>      
</div>	
</form>
</body>
