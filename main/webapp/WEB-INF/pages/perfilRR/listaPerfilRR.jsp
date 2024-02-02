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
<title>...:: Perfil RR ::...</title>

	



<softek:jquery nameTable="laTabla" />

<script type="text/javascript">

function enviarForm1(action, idPerfilRR){
	confirma = true;
	if(action=='modificar'){
		document.forms['perfilRRForm'].action = "..perfilRR/modificarPerfilRR.do";
	}else{ 
		 	if(action=='mostrar'){
			 document.forms['perfilRRForm'].action = "../perfilRR/listaPerfilRR.do";
			}else{	
			document.forms['perfilRRForm'].action = "../perfilRR/eliminarPerfilRR.do";}
		}
		if(confirma){
		document.forms['perfilRRForm'].idPerfilEA.value = idPerfilEA;
		document.forms['perfilRRForm'].submit();
}
}

</script>
</head>

<body>
<div id="main-content">
<center><h2>Lista de Perfiles RR</h2></center>
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
			<th>Zonas</th>			
			<th></th>
			<th></th>
			

		</tr>
	</thead>
	<tbody>
		<c:forEach items="${perfilRR}" var="perfilRR">
			<tr>
				<td><img src="<c:url value='/static/images/iconos/green_light.png'></c:url>" width="15px"></td>
				<td align="center" valign="top" style="font-size: 14px">&nbsp;${perfilRR.datosPersonales.nombre}&nbsp;
				${perfilRR.datosPersonales.apellido}</td>
					
				<td align="center" valign="top" style="font-size: 14px">&nbsp;
						<c:forEach items="${perfilRR.zona}" var="zona" >
							${zona.nombre}&nbsp;
						</c:forEach>
				</td>				
				<td>
				
				<input type="submit" value="Mas Datos"
					   class="ui-state-default ui-corner-all"
					   onclick="enviarForm1('mostrar','${perfilRR.idPerfilRR}')">
				</td>
				<td>
				<input type="submit" value="Eliminar"
					   class="ui-state-default ui-corner-all"
					   onclick="enviarForm1('eliminar','${perfilRR.idPerfilRR}')">
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<table align="center">
	<tr>
		<td><input type="submit" value="Alta"
			class="ui-state-default ui-corner-all"
			onclick="window.location.href='../perfilRR/altaPerfilRR.do'" />
		</td>
		<td>
		<input type="button" value="Volver"
			class="ui-state-default ui-corner-all"
			onclick="location.href='../index.jsp'; return false;" />
		</td>
	</tr>
</table>
<form:form name="perfilRRForm" method="post" commandName="perfilRR">

	<input type="hidden" name="idPerfilRR" />
</form:form>
</td>
</tr>
</table>
</CENTER>	
</div>
</body>
</html>

