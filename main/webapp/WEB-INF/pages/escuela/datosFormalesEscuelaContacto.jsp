<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">
	label { width: 12em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<script type="text/javascript" src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
</head>
<body>
	
	<p><label>Id Escuela:</label> 
		<input type="text" name="IdEscuela" id="provinciaId" value="" /></p>
	<br>
	
	<p><label>CUE:</label>
		<input type="text" name="CUE " id="CUE " value="" /></p>
	<br>
	
	
	<p><label>Nombre Escuela:</label>
		<input type="text" name="nombreEscuela" id="nombreEscuela" value="" /></p>
	<br>
	
	
	<p><label>Modalidad:</label>
		<select name="modalidad" id="modalidad"> 
			<option >va con string</option>
		</select>
	</p>
	<br>
	
	
	<p><label>Orientacion:</label>
		<input type="text" name="orientacion" id="orientacion" maxlength="10000"></p>
	<br>
	
	
	<p><label>Nivel Escuela:</label>
		<select name="nivelEscuela" id="nivelEscuela">
			<option>va con string</option>
		</select>
	</p>
	<br>
	
	
	<p><label>Cantidad de Años:</label>
		<select name="cantidadDeAnios" id="cantidadDeAnios">
			<option>va con string</option>
		</select>
	</p>
	<br>
	
	
	<p><label>Dependencia:</label>
		<select name="dependencia" id="dependencia">
			<option>va con string</option>
		</select>
	</p>		
	<br>
	
	
	<p><label>Direccion:</label>
		<input type="text" name="dirección" id="dirección"></p>
	<br>
	
	
	<p><label>Codigo Postal:</label>
		<input type="text" name="codigoPostal" id="codigoPostal"></p>
	<br>
	
	
	<p><label>Barrio:</label>
		<input type="text" name="barrio" id="barrio"></p>
	<br>
	
	
	<p><label>Localidad:</label>
		<input type="text" name="localidad" id="localidad"></p>
	<br>
	
	
	<p><label>Departamento:</label>
		<input type="text" name="departamento" id="departamento"></p>
	<br>
	
	
	<p><label>Provincia:</label>
		<input type="text" name="provincia" id="provincia"></p>
	<br>
	
	
	<p><label>Pais:</label>
		<input type="text" name="pais" id="pais"></p>
	<br>
	
	
	<p><label>Zona Cimientos:</label>
		<input type="text" name="zonaCimientos" id="zonaCimientos"></p>
	<br>
	
	
	<p><label>Contacto Telefono 1:</label>
		<input type="text" name="contactoTelefono1" id="contactoTelefono1"></p>
	<br>
	
	
	<p><label>Contacto Telefono 2:</label>
		<input type="text" name="contactoTelefono2" id="contactoTelefono2"></p>
	<br>
	
	
	<p><label>Mail Escuela:</label>
		<input type="text" name="mailEscuela" id="mailEscuela"></p>
	<br>
	
	
	<p><label>Director:</label>
		<input type="text" name="director" id="director"></p>
	<br>
	
	
	<p><label>Telefono Director:</label>
		<input type="text" name="telefonoDirector" id="telefonoDirector"></p>
	<br>
	
	
	<p><label>Mail Director:</label>
		<input type="text" name="mailDirector" id="mailDirector"></p>
	<br>
	
	
	<p><label>Secretario:</label>
		<input type="text" name="secretario" id="secretario"></p>
	<br>
	
	
	<p><label>Telefono Secretario:</label>
		<input type="text" name="telefonoSecretario" id="telefonoSecretario"></p>
	<br>
	
	
	<p><label>Mail Secretario:</label>
		<input type="text" name="mailSecretario" id="mailSecretario"></p>
	<br>
	
	
	<p><label>Responsable:</label>
		<input type="text" name="responsable" id="responsable"></p>
	<br>
	
	
	<p><label>Telefono Responsable:</label>
		<input type="text" name="telefonoResponsable" id="telefonoResponsable"></p>
	<br>
	
	
	<p><label>Mail Responsable:</label>
		<input type="text" name="mailResponsable" id="mailResponsable"></p>
	<br>
	
	
	<p><label>Rural:</label>
		<select name="rural" id="rural">
			<option>String</option>
		</select>
	</p>
	<br>
	
	
	<p><label>Recibe Subsidio:</label>
		<select name="recibeSubsidio" id="recibeSubsidio">
			<option>String</option>
		</select>
	</p>
	<br>
	
</body>
</html>