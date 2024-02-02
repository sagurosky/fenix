<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<title>Registrar Datos Personales</title>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>

<style type="text/css">
	label { width: 12em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script>
$(document).ready(function(){
	jQuery.validator.messages.minlength = "Ingrese al menos 7 dígitos";
	
	$("#registraPersona").validate({
		  rules: {
			  	"dni": {
		      	required: true,
		      	minlength: 7
		    }
		  }
	});
    
	$("#fechaNac").datepicker({
  		changeMonth: true,
  		changeYear: true
	});
	
	var cuil = $('#cuil').val();
	var dni;
	var xy;
	var digito;
	if(cuil.length == 11){
		dni = cuil.substring(2,10);			
	}
	else{
		dni = cuil.substring(0,8);
	}	
	$('#dni').val(dni);	
});
</script>
<script type="text/javascript">

function verificarCuil(){
	if($("#sexoM").attr("checked")){
		generarCuil("true");
	}
	if($("#sexoF").attr("checked")){
		generarCuil("false");
	}
	
}

	var digito;
	function generarCuil(valueRadio){
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dni').val();
		if(value.length > 0){ //Se ingresó al menos un digito del dni
			if(valueRadio == "true"){ //Masculino			
				cuil = value;
				xy = 27;
				cuil = calcular( xy, cuil);
			}else{
				if(valueRadio == "false"){							//fememino
					cuil = value;
					xy = 20;
					cuil = calcular( xy, cuil );
				}
			}
		}
		else{
			$('#cuil').val(" "); // No se ingresó al menos un numero de dni por lo que no se puede calcular el cuil
		}
			
		if(isNaN( digito ) ){
			$('#cuil').val(" ");
		}
		else{
			$('#cuil').val(cuil);
		}
					
	}
	
	function formatear(xy, cuil, digito) {
		return (xy + "-" + cuil + "-" + digito);				
	}

	
	function validar () {
		var error = false; /* No se detecto error hasta el momento, no se vio que falten datos */
		var faltantes = "Faltan: ";

		if (document.getElementById("dni").value == ""){
			error = true;
			faltantes += " N° de Documento \n";
			}
		
		if (error == true) {			/* Si hay error es porque entre en algun if, entonces muestro con alert lo que falta y devuelvo false para que no funcione el submit del formulario */
				alert (faltantes);
				return false;			/* El submit del formulario no funciona porque tiene un return validar() <-- y return false hace que no submitee que es lo que pasa en este caso */
			} else {
					return true;
				}
	}
</script>	
<script type="text/javascript">	
function cerrar(cerrar,cuil){
	if(window.opener != null){
		if(cerrar != null && cerrar){
			window.opener.document.getElementById("cuit_cuil").value = cuil;
			window.close();
		}
	}
}	
</script>

<!-- script type="text/javascript"
	src="<c:url  value="/static/js/funcionesCuil.js"/>"></script-->

</head>
<body onload="cerrar(${cerrarPopup},${cuil});">

<form:form id="registraPersona" commandName="persona" modelAttribute="persona" cssClass="cmxform" action="registrarPersona.do" method="post">

<div id="main-content">
<fieldset>
	<legend>Carga de Datos Personales</legend>
    <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
			<td><label for="nombre">Nombre *</label></td>
			<td><input type="text" name="nombre" id="nombre" class="required" /></td>
		</tr>
		<tr>
			<td><label for="apellido">Apellido *</label></td>
			<td><input type="text" name="apellido" id="apellido" class="required" /></td>
		</tr>
		<tr>
			<td><label>Tipo de DNI *</label></td>
			<td>
				<select name="tipoDniID" id="tipoDni" class="required">
					<option value="">Seleccione una opci&oacute;n:</option>
					<c:forEach items="${listDni}" var="dni">
						<option value="${dni.id}">${dni.valor}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td><label for="dni">DNI *</label></td>
			<td><input type="text" name="dni" id="dni" class="digits required" class="digits" maxlength="8" 
					 onblur="verificarCuil()" onkeyup="verificarCuil()"/></td>
		</tr>
		<tr>
			<td><label for="sexo">Sexo *</label></td>
			<td>
				M<input type="radio" id="sexoM" name="sexo"  onclick="generarCuil(this.value)" value="true" class="required"> 
				F<input type="radio" id="sexoF" name="sexo"  onclick="generarCuil(this.value)" value="false" class="required">
			</td>
		</tr>
		<tr>
			<td width="100"><label>Cuil*</label></td>
			<td width="600">
				<input type="text" name="cuilCuit" id="cuil" class="required" value="${cuil}" readonly="readonly">
			</td>
		</tr>
		<tr>
			<td><label for="fechaNacimiento">Fecha de Nacimiento *</label></td>
			<td><input name="fechaNac" id="fechaNac" class="date required"/> dd/mm/aaaa<br></td>
		</tr>
		<tr>
			<td><label for="nacionalidad">Nacionalidad *</label></td> 
			<td><input type="text"	id="nacionalidad" name="nacionalidad" class="required"></td>		
		</tr>
		<tr>
			<td><label for="direccion">Dirección *</label></td>
			<td><input type="text" name="direccion" id="direccion" class="required"/></td>
		</tr>
		<tr>
			<td><label for="numeroCalle">Número</label></td>
			<td><input type="text" id="numeroCalle" name="numeroCalle" class=""></td>
		</tr>
		<tr>
			<td><label for="piso">Piso</label></td>
			<td><input type="text" id="piso" name="piso" class=""></td>
		</tr>
		<tr>
			<td><label>Departamento</label></td>
			<td><input type="text" 	id="departamento" name="departamento"></td>
		</tr>
		<tr>
			<td><label>Barrio</label></td>
			<td><input type="text" id="barrio" name="barrio"></td>
		</tr>
		<tr>
			<td><label>Localidad *</label></td>
			<td>
				<select name="localidadID" id="localidad.id" style="width: 145px;" class="required">
					<option value="">Seleccione una opci&oacute;n:</option>
					<c:forEach items="${localidades}" var="localidad">
						<option value="${localidad.id}" title="${localidad.nombre}" style="width: 150px;">${localidad.nombre}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td><label>Provincia *</label></td>
			<td>
				<select name="provinciaID" id="provincia.id" style="width: 145px;" class="required">
					<option value="">Seleccione una opci&oacute;n:</option>
					<c:forEach items="${listProvincias}" var="provincia">
						<option value="${provincia.id}" title="${provincia.descripcion}">${provincia.descripcion}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td><label for="codigoPostal">Código Postal *</label></td>
			<td><input type="text" name="codigoPostal" id="codigoPostal" class="required"/></td>
		</tr>
		<tr>
			<td><label for="telefono">Teléfono *</label></td>
			<td><input type="text" name="telefono" id="telefono" class="required"/></td>
		</tr>
		<tr>
			<td><label for="celular">Celular</label></td>
			<td><input type="text" name="celular" id="celular"/></td>
		</tr>
		<tr>
			<td><label for="mail">E-mail</label></td>
			<td><input type="text" name="mail" id="mail" class="text-input" /></td>
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
			<td colspan="2"><input class="ui-state-default ui-corner-all " type="submit" value="Registrar" /></td>		
		</tr>
	</table>
</fieldset>
</div>
<input type="hidden" name="popup" value="${popup}"/>

</form:form>

</body>
</html>