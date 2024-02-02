<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Provincia ::..</title>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
 
<script>
$(document).ready(function(){
	$("#modificarProvincia").validate();
});

function submitForm()
{
	var select = $('select option');
	var array="";	
	if(select.length == 0 )
	{
		 jAlert('warning', 'No hay localidades seleccionadas. Seleccione al menos una localidad', 'Atención!');					
	}else
	{	
		for (x = 0; x < select.length; x++) 
		{
			array = array + select[x].selected+"-" +select[x].value+ ";";
		}
	}
	$("#ids").val(array);
	$("#modificarProvincia").submit();
}
</script>
</head>

<body>
<div id="main-content">
<form class="cmxform" id="modificarProvincia" action="<c:url value='/provincia/modificar.do' />" method="post">
<input type="hidden" name="ids" id="ids" >	 
<fieldset>
	<legend>Modificación de Provincia</legend>
	<table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
			<tr>
				<td width="100"><label for="descripcion">Nombre</label></td>
				<td width="600"><input name="descripcion" id="descripcion" type="text" value="${provincia.descripcion}" class="required"/></td>
			</tr> 
			<tr>
				<td width="100"><label for="pais">País</label></td>
				<td width="600"><input name="pais" id="pais" type="text" value="${provincia.pais}" class="required"/></td>
			</tr> 
			<tr>
				<td valign="top"><label>Localidades</label></td>
				<td>
					<select name="localidades" id="localidades" multiple="multiple" class="required">
						<c:forEach var="localidad" items="${localidades}">
							<c:if test="${localidad.provincia != null}">
								<option class="opcion" selected="selected"  value="${localidad.id}">${localidad.nombre}</option>
							</c:if>
							<c:if test="${localidad.provincia == null}">
								<option class="opcion"  value="${localidad.id}">${localidad.nombre}</option>
							</c:if>
							
						</c:forEach>
						
					</select>
					
					
				</td>
			</tr>	
			<tr>
		    	<td>&nbsp;</td>
		        <td>&nbsp;</td>
		    </tr>
		    <tr>
		    	<td>&nbsp;</td>
		     	<td>&nbsp;</td>
		 	</tr>
		    <tr>
	        	<td colspan="2">
			    	<table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
			        	<tr>
			        		<c:if test="${empty localidadesSinProvincia}">
								<td width="50" height="0" align="center" valign="middle"><input class="ui-state-default ui-corner-all " type="button" onclick="submitForm()" value="Registrar" /></td>
							</c:if>
							<td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
						       													 onclick="location.href='../provincia/listaProvincias.do'; return false;" /></td>
				            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
						    <td><input type="hidden" value="${provincia.id}" name="idProvincia"/></td>
						</tr>		
					</table> 
				</td>
			</tr>
	</table>
</fieldset>
</form>
</div>
</body>
</html>