<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Entrevista Individual ::..</title>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script>
  $(document).ready(function(){
    $("#registrarInfomeSA").validate();
    $("#fechaAlta").datepicker({
    	  changeMonth: true,
    	  changeYear: true
    	  });
   
  });
 </script>
 

</head>
<body>
<div id="main-content">
<form id="registrarInfomeSA" class="cmxform" action="<c:url value='/informeSA/registrarInfomeSA.do' />" method="post">
    <fieldset> 
		<legend>Registro de Informe S.A.:</legend>
		
		<br>
		<center><h1>${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</h1></center>
		<br>
		
		<table width="620px" border="0">
		
		<tr>
		<td>
		<p>
			<label for="fechaAlta">Fecha de Realizacion:</label>
			<input name="fechaAlta" id="fechaAlta"  value="<fmt:formatDate value="${fechaAlta}" pattern="dd/MM/yyyy"/>" class="date required" /> dd/mm/aaaa<br>
		</p>
		<p>
			<label for="fechaNacimiento">Fecha de Nacimiento:</label>
			<input value="<fmt:formatDate value="${alumno.datosPersonales.fechaNacimiento}" pattern="MM/dd/yyyy"/>" class="date" disabled="disabled" />&nbsp;mm/dd/aaaa<br>
		</p>
				
		<p>
			<label for="escuela">Escuela:</label>
			<input type="text" name="escuela" id="escuela" value="${alumno.escuela}" disabled="disabled"/>
		</p>
		</td>
		</tr>
		<tr>
		<td>
		<hr style="width:80%;margin-left:auto;margin-right:auto;height:5px;"/>
		</td>
		</tr>
		<tr>
		<td>
		<br>
		<center><h1>Responsable Adulto Nro "1"</h1></center>
		<br>
		<p>
			<label for="nombreRa1">Nombre:</label>
			<input type="text" name="nombreRa1" id="nombreRa1" value="${alumno.responsable1.nombre}" disabled="disabled"/>
		</p>
		<p>
			<label for="apellidoRa1">Apellido:</label>
			<input type="text" name="apellidoRa1" id="apellidoRa1" value="${alumno.responsable1.apellido}" disabled="disabled" />
		</p>
		<p>
			<label for="vinculo1">Vinculo con el Becado:</label>
			<input type="text" name="vinculo1" id="vinculo1" value="${alumno.responsable1.idVinculo}"  disabled="disabled" />
		</p>
		<p>
			<label for="dniRa1">DNI:</label>
			<input type="text" name="dniRa1" id="dniRa1" value="${alumno.responsable1.dni}" disabled="disabled"  />
		</p>
		<p>
			<label for="fechaNacimientoRa1">Fecha de Nacimiento:</label>
			<input value="<fmt:formatDate value="${alumno.responsable1.fechaNacimiento}" pattern="MM/dd/yyyy"/>" class="date" disabled="disabled" />&nbsp;mm/dd/aaaa<br>
		</p>
		<p>
			<label for="nacionalidadRa1">Nacionalidad:</label>
			<input type="text" name="nacionalidadRa1" id="nacionalidadRa1" value="${alumno.responsable1.nacionalidad}" disabled="disabled" />
		</p>
		</td>
		<td></td>
		<td valign="top">
		<br>
		<center><h1>Responsable Adulto Nro "2"</h1></center>
		<br>
		
		<p>
			<label for="nombreRa2">Nombre:</label>
			<input type="text" name="nombreRa2" id="nombreRa2" value="${alumno.responsable2.nombre}" disabled="disabled"/>
		</p>
		<p>
			<label for="apellidoRa2">Apellido:</label>
			<input type="text" name="apellidoRa2" id="apellidoRa2" value="${alumno.responsable2.apellido}" disabled="disabled" />
		</p>
		<p>
			<label for="vinculoRa1">Vinculo con el Becado:</label>
			<input type="text" name="vinculoRa1" id="vinculoRa1" value="${alumno.responsable2.idVinculo}"  disabled="disabled" />
		</p>
		</td>
		</tr>
		<tr>
		<td>
		<hr style="width:80%;margin-left:auto;margin-right:auto;height:5px;"/>
		</td>
		</tr>	
		
		<tr>
	
		<td>
		<p>
	    	<label>Zona Cimientos</label>
			<select id="zona" name="zona" class="required">
				<c:forEach var="zona" items="${zonas}">
					<option value="${zona.id}">${zona.nombre}</option>
				</c:forEach>
			</select>
		</p>
		
		
		<p>
			<label for="observIngresoEgreso">Observaciones sobre Ingreso/Egreso</label>
			<textarea name="observIngresoEgreso"></textarea>
		</p>
		<p>
			<label for="observGenerales">Observaciones Generales</label>
			<textarea name="observGenerales"></textarea>
		</p>
		<p>
	    	<label>Recoomendaciones TS</label>
			<select id="recomendaciones" name="recomendaciones" class="required">
				<c:forEach var="recomendacion" items="${recomendacionesTS}">
					<option value="${recomendacion.id}">${recomendacion.valor}</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="observSobreRA">Observaciones sobre RA</label>
			<textarea name="observSobreRA"></textarea>
		</p>
		<p>
			<label for="observGenerales2">Observaciones Generales</label>
			<textarea name="observGenerales2"></textarea>
		</p>
		<p>
	    	<label>Recoomendaciones TS</label>
			<select id="recomendaciones2" name="recomendaciones2" class="required">
				<c:forEach var="recomendacion2" items="${recomendacionesTS}">
					<option value="${recomendacion2.id}">${recomendacion2.valor}</option>
				</c:forEach>
			</select>
		</p>
		<p>
			<label for="observIngresoEgreso2">Observaciones sobre Ingreso/Egreso</label>
			<textarea name="observIngresoEgreso2"></textarea>
		</p>
		<p>
			<label for="observSobreRA2">Observaciones sobre RA</label>
			<textarea name="observSobreRA2"></textarea>
		</p>
		<p>
			<label for="observGenerales3">Observaciones Generales</label>
			<textarea name="observGenerales3"></textarea>
		</p>
		<p>
	    	<label>Recoomendaciones TS</label>
			<select id="recomendaciones3" name="recomendaciones3" class="required">
				<c:forEach var="recomendacion3" items="${recomendacionesTS}">
					<option value="${recomendacion3.id}">${recomendacion3.valor}</option>
				</c:forEach>
			</select>
		</p>
		<p>
	    	<label>Estado del Informe</label>
			<select id="estadoInforme" name="estadoInforme" class="required">
				<c:forEach var="estado" items="${estadosInforme}">
					<option value="${estado.id}">${estado.valor}</option>
				</c:forEach>
			</select>
		</p>
		</td>
		</tr>
	</table>

		<p>
			<input class="ui-state-default ui-corner-all " type="submit" value="Registrar" />
		</p>
		
	</fieldset> 
</form>
</div>
</body>
</html>