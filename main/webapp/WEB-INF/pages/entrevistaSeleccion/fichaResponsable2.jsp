<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript">

$(function() {

	$("#tablaDatosResponsable2 :text").css("width","90px");
	$("#tablaGeneralesResponsable2 :text").css("width","90px");

});
	
</script>
<script>
	var digito;
	function generarCuil2(valueRadio){
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dniResponsable2').val();
		
		if(valueRadio == "true"){ //Masculino			
			cuil = value;
			xy = 20;
			cuil = calcular( xy, cuil);
		}else{
			if(valueRadio == "false")
			{
											//fememino
				cuil = value;
				xy = 27;
				cuil = calcular( xy, cuil );
			}
		}
		
		if(isNaN( digito ) ){
			$('#cuil2').val(" ");
		}
		else{
			$('#cuil2').val(cuil);
		}
					
	}
	
</script>
</head>
<body>
	<table width="80%;" id="tablaDatosResponsable2">
		<tr>
			<td colspan="3"></td>
		</tr>
		<c:choose>
		<c:when test="${!empty entrevistaSeleccionDTO}">
		<tr>
			<td>
				<p>
					<font color="black"><label for="Nombre">Nombre *</label></font>
					<input type="text"  onchange="this.value=this.value.toUpperCase();" name="perfilAlumno.responsable2.nombre"  id="nombreResponsable2" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nombre}">
				</p>
			</td>
			<td>
				<p>
					<font color="black"><label>Apellido *</label></font>
					<input type="text"  onchange="this.value=this.value.toUpperCase();" name="perfilAlumno.responsable2.apellido" id="apellidoResponsable2"  class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.apellido}">
				</p>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<p>
					<label for="telefono"><b>Teléfono 1</b></label> 
						<input type="text" onchange="this.value=this.value.toUpperCase();"  name="perfilAlumno.responsable2.telefono1" id="responsable2Telefono1" 
						value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.telefono1 }" class="digits"/>
				</p>
			</td>
				
			</td>
			<td>
				<p>
					<label>Contacto 1</label>
						<input type="text" onchange="this.value=this.value.toUpperCase();"  name="perfilAlumno.responsable2.contactoTelefono1" id="responsable2ContactoTelefono1"
						value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.contactoTelefono1 }">
				</p>
				
			<td></td>
		</tr>
		<tr>
			<td>
				<p>
					<font color="black"><label>Vínculo *</label></font>
						<select name="vinculoRA2" id="vinculoRespo2" disabled="disabled" class="required">
							<option value="">Seleccione una opci&oacute;n:</option>
							<c:forEach items="${listVinculo}" var="vinculo">
								<c:choose>
									<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.idVinculo.id == vinculo.id}">
											<option value="${vinculo.id}" selected="selected">${vinculo.valor}</option>
									</c:when>
									<c:otherwise>
											<option value="${vinculo.id}">${vinculo.valor}</option>
									</c:otherwise>	
								</c:choose>
							</c:forEach>
						</select>
				</p>
			</td>
		</tr>
		</c:when>
		<c:otherwise>
		<tr>
			
		</tr>
		<tr>		
			<td><font color="black"><label>Apellido *</label></font></td>
			<td>
				<input type="text" onchange="this.value=this.value.toUpperCase();"  name="responsable2.apellido" id="apellidoResponsable2" class="required" value="${perfilAlumno.responsable2.apellido}">
			</td>
		</tr>
		<tr>
			<td><label for="telefono">Teléfono</label></td>
			<td>
				<input type="text" onchange="this.value=this.value.toUpperCase();"  name="responsable2.telefono1" id="responsable2Telefono1" 
				value="${perfilAlumno.responsable2.telefono1 }" class="digits"/>
			</td>	
		</tr>
		<tr>
			<td><label>Contacto</label></td>
			<td>
				<input type="text" onchange="this.value=this.value.toUpperCase();"  name="responsable2.contactoTelefono1" id="responsable2ContactoTelefono1" 
				value="${perfilAlumno.responsable2.contactoTelefono1 }">
			</td>
			
		</tr>
		<tr>
			<td><font color="black"><label>Vínculo *</label></font></td>
			<td>
				<select name="vinculoRA2" id="vinculoRespo2" disabled="disabled" class="required">
					<option value="">Seleccione una opci&oacute;n:</option>
						<c:forEach items="${listVinculo}" var="vinculo">
							<c:choose>
								<c:when test="${perfilAlumno.responsable2.idVinculo.id == vinculo.id}">
									<option value="${vinculo.id}" selected="selected">${vinculo.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${vinculo.id}">${vinculo.valor}</option>
								</c:otherwise>	
							</c:choose>
						</c:forEach>
					</select>
			</td>
		</tr>
		</c:otherwise>
		</c:choose>
	</table>
	<!-- DOMICILIO RA -->
	
<!--	<input type="hidden" id="idLocalidadRA" name="perfilAlumno.responsable1.idLocalidad"></input> -->

</body>
</html>