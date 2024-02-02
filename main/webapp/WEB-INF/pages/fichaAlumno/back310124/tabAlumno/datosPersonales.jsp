<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Datos Personales</title>
</head>
<body>
<div id="div01">
<!-- Datos Personales -->
<fieldset>
	<table width="100%" align="left" cellspacing="3">

		<tr>
			<td><font color="green">Nombre *</font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();" id="alumnoNombre"
				name="datosPersonales.nombre" class="required"
				value="${perfilAlumno.datosPersonales.nombre}"></td>
			<td colspan="2">
		</tr>
		<tr>
			<td><font color="green">Apellido *</font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();" id="alumnoApellido"
				name="datosPersonales.apellido" class="required"
				value="${perfilAlumno.datosPersonales.apellido}"></td>
			<td colspan="2">
		</tr>
		<tr>
			<td>Tipo de DNI</td>
			<td><select name="tipoDNI" id="dni" class="required" >
				<c:forEach items="${listDni}" var="dni">
					<c:choose>
						<c:when test="${dni.id == perfilAlumno.datosPersonales.tipoDni.id}">
							<option value="${dni.id}" selected="selected">${dni.valor}</option>
						</c:when>
						<c:otherwise>
							<option value="${dni.id}">${dni.valor}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select></td>
			<td colspan="2">
		</tr>
		<tr>
			<td><font color="green">DNI *</font></td>
			<sec:authorize access="not hasRole('SuperUsuario')">
				<td>
					<input type="text" id="dniAlumno"
						onkeypress="validarDNI('dniAlumno')" disabled="disabled" readonly="readonly" onblur="buscarAlumno()"
						name="datosPersonales.dni" class="digits required "
						maxlength="8" value="${perfilAlumno.datosPersonales.dni}">
				</td>
			</sec:authorize>
			<sec:authorize access="hasRole('SuperUsuario')">
				<td>
					<input type="text" id="dniAlumno"
						onkeypress="validarDNI('dniAlumno')" name="datosPersonales.dni" class="digits required"
						maxlength="8" value="${perfilAlumno.datosPersonales.dni}">
				</td>
			</sec:authorize>
			<td colspan="2">
		</tr>
		<tr>
			<td><font color="green">Pais *</font></td>
			<td><!-- input type="text"  onchange="this.value=this.value.toUpperCase();" id="alumnoNacionalidad"
				name="datosPersonales.nacionalidad" class="required"
				value="${perfilAlumno.datosPersonales.nacionalidad}"></td-->
				
				<select name="alumnoNacionalidad" id="alumnoNacionalidad" class="required" >
					<c:choose>
    					<c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Argentina'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" selected="selected">Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Bolivia'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina">Argentina</option>
							<option value="Bolivia"  selected="selected">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Brasil'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil" selected="selected">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Chile'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile" selected="selected">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Colombia'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia" selected="selected">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Ecuador'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador" selected="selected">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Paraguay'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay" selected="selected">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Perú'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú" selected="selected">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Uruguay'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay" selected="selected">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Venezuela'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela" selected="selected">Venezuela</option>	
					    </c:when>
					    <c:when test="${perfilAlumno.datosPersonales.nacionalidad == 'Cuba'}">
       						<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba" selected="selected">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>	
					    </c:when>
					    <c:otherwise>
						 	<option value="SUO">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba">Cuba</option>
							<option value="Ecuador">Ecuador</option>
							<option value="Paraguay">Paraguay</option>
							<option value="Perú">Perú</option>
							<option value="Uruguay">Uruguay</option>
							<option value="Venezuela">Venezuela</option>
					    </c:otherwise>
					</c:choose>
					
					
				</select>
			
			
			</td>
			<td colspan="2">
		</tr>
		<tr>
			<td>Sexo</td>
			<td>
				<c:if test="${perfilAlumno.datosPersonales.sexo == false}">
					M<input type="radio" id="alumnoSexoM" name="datosPersonales.sexo" value="true"> 
					F<input type="radio" id="alumnoSexoF" name="datosPersonales.sexo" checked="checked" value="false">
				</c:if>
				<c:if test="${perfilAlumno.datosPersonales.sexo}">
					M<input type="radio" id="alumnoSexoM" name="datosPersonales.sexo" checked="checked" value="true"> 
					F<input type="radio" id="alumnoSexoF" name="datosPersonales.sexo" value="false">
				</c:if>
			</td>
			<td colspan="2">
		</tr>
		<tr>
			<td><font color="green">Fecha de Nacimiento *</font></td>
			<td><input name="fechaNac" id="fechaDeNacimiento"
					
					value="<fmt:formatDate value="${perfilAlumno.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>"></td>
			<td colspan="2">
		</tr>
		
		<c:if test="${tieneFoto == true}">
			<tr>
				<td>Foto cargada actualmente si querés podes cargar una nueva</td>
				<td colspan="2">
					<img src="../fichaAlumno/mostrarImagen.do?dni=${perfilAlumno.datosPersonales.dni}" width="100px">
				</td>
				
			</tr>
		</c:if>
		<tr>
			<td>Foto</td>
			<td><input name="foto" id="foto" type="file" onchange="validarExtension()"></td>
			<td colspan="2">
		</tr>		
		<tr>
			<td colspan="2">El tamaño de la foto no debe superar los 100kb y la extension debe ser "jpg"</td>
		</tr>
		<tr>
			<td style="height: 15px;" colspan="4"></td>
		</tr>
		<tr>
			<td><font color="green">Calle *<!-- Direccion --></font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();"  id="alumnoDireccion"
				name="datosPersonales.direccion" class="required"
				value="${perfilAlumno.datosPersonales.direccion}"></td>
			<td colspan="2">
		</tr>
		<tr>
			<td><font color="green">Número *</font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();"  id="alumnoNumero"
				name="datosPersonales.numeroCalle" class="required"
				value="${perfilAlumno.datosPersonales.numeroCalle}"></td>
			<td colspan="2">
		</tr>
		<tr>
			<td>Piso/Manzana</td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();"  id="alumnoPiso"
				name="datosPersonales.piso"
				value="${perfilAlumno.datosPersonales.piso}"></td>
			<td colspan="2">
		</tr>
		<tr>
			<td><font color="green">Código Postal *</font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();"  id="alumnoCodigoPostal"
				name="datosPersonales.codigoPostal" class="required"
				value="${perfilAlumno.datosPersonales.codigoPostal}"></td>
			<td colspan="2">
		</tr>
		<tr>
			<td><font color="green">Entre Calles *</font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();"  id="alumnoEntreCalles"
				name="datosPersonales.entreCalles" class="required"
				value="${perfilAlumno.datosPersonales.entreCalles}"></td>
			<td colspan="2">
		</tr>
		<tr>
			<td><font color="green">Barrio *</font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();"  id="barrio"
				name="datosPersonales.barrio" class="required"
				value="${perfilAlumno.datosPersonales.barrio}"></td>
			<td colspan="2">
		</tr>
		<tr>
			<td>Localidad</td>
			<td><select name="idLocalidad">
				<c:forEach items="${localidades}" var="localidad">
					<c:choose>
						<c:when test="${perfilAlumno.datosPersonales.localidad.id == localidad.id}">
							<option value="${localidad.id}" selected="selected">${localidad.nombre}</option>
						</c:when>
						<c:otherwise>
							<option value="${localidad.id}">${localidad.nombre}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select></td>
			<td colspan="2">
		</tr>
		<tr>
			<td>Provincia</td>
			<td><select name="idProvincia">
				<c:forEach items="${listProvincias}" var="provincia">
					<c:choose>
						<c:when test="${perfilAlumno.datosPersonales.provincia.id == provincia.id}">
							<option value="${provincia.id}" selected="selected">${provincia.descripcion}</option>
						</c:when>
						<c:otherwise>
							<option value="${provincia.id}">${provincia.descripcion}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select></td>
			<td colspan="2">
		</tr>
		<tr>
			<td><font color="green">Teléfono (cargá el código de área) *</font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();"
				name="datosPersonales.telefono" id="alumnoTelefono" maxlength="19"
				value="${perfilAlumno.datosPersonales.telefono}" onkeypress="return justNumbers(event);" class="required" />
			</td>
			<td colspan="2">
		</tr>
		<tr>
			<td>Contacto 1</td>
			<td><input type="text" name="contactoTelefono1" onchange="this.value=this.value.toUpperCase();" id="alumnoContactoTelefono1" value="${perfilAlumno.contactoTelefono1}" /></td>
			<td colspan="2">
		</td>	
		<tr>
			<td width="100">Teléfono 1 (cargá el código de área)</td>
			<td width="200"><input type="text" name="telefono1" maxlength="19"
					id="telefono1" value="${perfilAlumno.telefono1}"  onkeypress="return justNumbers(event);" /></td>
			<td colspan="2">
		</td>	
		</tr>
		<tr>
			<td>Contacto 2</td>
			<td><input type="text" name="contactoTelefono2" onchange="this.value=this.value.toUpperCase();"
					id="alumnoContactoTelefono2" value="${perfilAlumno.contactoTelefono2}" />
			Teléfono 2 (cargá el código de área)
			<input type="text" name="telefono2" maxlength="19"
					id="alumnoContactoTelefono2" value="${perfilAlumno.telefono2}" onkeypress="return justNumbers(event);" /></td>
		</tr>
		<tr>
			<td>Mail</td>
			<td><input type="text" name="datosPersonales.mail" onchange="this.value=this.value.toUpperCase();"
					id="alumnoMail" value="${perfilAlumno.datosPersonales.mail}" /></td>
			<td colspan="2">
		</tr>
		<tr><td style="height: 10px" colspan="4"></td></tr>
	</table>
</fieldset>
</div>	
</body>
</html>