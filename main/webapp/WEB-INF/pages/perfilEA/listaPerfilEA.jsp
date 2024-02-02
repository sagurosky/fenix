<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="softek" uri="/softtek-fwk.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Convocatoria</title>

	



<softek:jquery nameTable="laTabla" />

<script type="text/javascript">

function enviarForm1(action, idPerfilEA){
	confirma = true;
	if(action=='modificar'){
		document.forms['perfilEAForm'].action = "..perfilEA/modificarPerfilEA.do";
	}else{ 
		 	if(action=='mostrar'){
			 document.forms['perfilEAForm'].action = "../perfilEA/listaPerfilEA.do";
			}else{	
			document.forms['perfilEAForm'].action = "../perfilEA/eliminarPerfilEA.do";}
		}
		if(confirma){
		document.forms['perfilEAForm'].idPerfilEA.value = idPerfilEA;
		document.forms['perfilEAForm'].submit();
}
}

</script>
</head>

<body>
<div id="main-content">
<center><h2>Lista de Perfiles EA</h2></center>
<br />
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="laTabla" width="100%" border="0" >

	<thead>
		<tr>
			<th></th>
			<th>Nombre</th>
			<th>Becados</th>
			<th>Zonas</th>			
			<th></th>
			<th></th>
			

		</tr>
	</thead>
	<tbody>
		<c:forEach items="${perfilEA}" var="perfilEA">
			<tr>
				<td><img src="<c:url value='/static/images/iconos/green_light.png'></c:url>" width="15px"></td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilEA.datosPersonales.apellido},&nbsp;
				${perfilEA.datosPersonales.nombre}</td>
					<td align="center" valign="top" style="font-size: 14px">&nbsp;
						<c:forEach items="${perfilEA.becados}" var="becado">
							${becado.datosPersonales.nombre}&nbsp; ${becado.datosPersonales.apellido}
						</c:forEach>
					</td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;
						<c:forEach items="${perfilEA.zona}" var="zona" >
							${zona.nombre}&nbsp;
						</c:forEach>
				</td>				
				<td>
				
				<input type="submit" value="Mas Datos"
					   class="ui-state-default ui-corner-all"
					   onclick="enviarForm1('mostrar','${perfilEA.idPerfilEA}')">
				</td>
				<td>
				<input type="submit" value="Eliminar"
					   class="ui-state-default ui-corner-all"
					   onclick="enviarForm1('eliminar','${perfilEA.idPerfilEA}')">
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<table align="center">
	<tr>
		<td><input type="submit" value="Alta"
			class="ui-state-default ui-corner-all"
			onclick="window.location.href='../perfilEA/altaPerfilEA.do'" />
		</td>
		<td>
		<input type="button" value="Volver"
			class="ui-state-default ui-corner-all"
			onclick="location.href='../index.jsp'; return false;" />
		</td>
	</tr>
</table>
<form:form name="perfilEAForm" method="post" commandName="perfilEA">

	<input type="hidden" name="idPerfilEA" />
</form:form>
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>

