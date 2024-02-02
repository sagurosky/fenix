<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<title>Insert title here</title>



<script>
	var digito;
	function generarCuil(valueRadio)
	{
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dni').val();
		if(value.length > 0){ //Se ingresó al menos un digito del dni
			if(valueRadio == "true")
			{ //Masculino			
				cuil = value;
				xy = 20;
				cuil = calcular( xy, cuil);
			}
			else
			{
				if(valueRadio == "false")
				{						//fememino
					cuil = value;
					xy = 27;
					cuil = calcular( xy, cuil );
				}			
			}
		}
		else{
			$('#cuil').val(" "); // No se ingresó al menos un numero de dni por lo que no se puede calcular el cuil
		}		
		if(isNaN(digito))
		{
			$('#cuil').val(" ");
		}
		else
		{
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
	
	function verificarCuil(){
		if($("persona.sexo").attr("checked")){
			generarCuil("true");
		}
		else
		{
			generarCuil("false");
		}
	}
	
	function verificarCuilUsuarioNuevo(){
		if($("#personaSexoM").attr("checked")){
			generarCuil("true");
		}
		if($("#personaSexoF").attr("checked")){
			generarCuil("false");
		}
	}

</script>


</head>
<body>

<h3>Paso 2</h3>
<br></br>
<fieldset>
	<legend>Persona</legend>
	<br></br>
	<table style="margin-left: 20px;" border="0" align="left" cellpadding="0" cellspacing="0">
		<tr>
			<td width="200"><label>Nombre *</label></td>
			<td width="600"><form:input path="persona.nombre" cssClass="required"/></td>
		</tr>
		<tr>
			<td><label>Apellido *</label></td>
			<td><form:input path="persona.apellido" cssClass="required"/></td>
		</tr>
		<tr>
			<td><label>DNI *</label></td>
			<td>
				<c:if test="${vacio == true}">
					<c:set var="verificar" value="verificarCuilUsuarioNuevo()"></c:set>
				</c:if>
				<c:if test="${vacio == false}">
					<c:set var="verificar" value="verificarCuil()"></c:set>
				</c:if>
				<form:input path="persona.dni" id="dni" maxlength="8" cssClass="digits required" onblur="${verificar}" 
						onkeyup="${verificar}" />
			</td>
		</tr>
		<tr>
			<td><label>Sexo *</label></td>
			<c:if test="${vacio == true}">
				<td>
					M<input type="radio" id="personaSexoM" name="usuario.persona.sexo" value="true" onclick="generarCuil(this.value)" class="required"> 
					F<input type="radio" id="personaSexoF" name="usuario.persona.sexo"  value="false" onclick="generarCuil(this.value)" class="required">
				</td>
			</c:if>
			<c:if test="${vacio == false}">	
				<td>
					M<form:radiobutton path="persona.sexo" value="true" onfocus="generarCuil(this.value)"/>
	        		F<form:radiobutton path="persona.sexo" value="false" onfocus="generarCuil(this.value)"/>
	        	</td>
	        </c:if>
		</tr>
		<tr>
			<td><label>CUIL</label></td>
			<td>
			<form:input path="persona.cuilCuit" id="cuil"  /></td>
		</tr>
		<tr>
	    	<td height="10px"></td>
	    	<td></td>
	    </tr>
<!--		<tr>-->
<!--			<td><label>Fecha de Nacimiento</label></td>-->
<!--			<td><form:input path="persona.fechaNacimiento" id="fechaNacimiento"/></td>-->
<!--		</tr>-->
		<tr>
			<td><label>Nacionalidad</label></td>
			<td><form:input path="persona.nacionalidad"/></td>
		</tr>
		<tr>
	    	<td height="10px"></td>
	    	<td></td>
	    </tr>
		<tr>
			<td><label>Direcci&oacute;n</label></td>
			<td><form:input path="persona.direccion"/></td>
		</tr>
		<tr>
			<td><label>N&uacute;mero</label></td>
			<td><form:input path="persona.numeroCalle"/></td>
		</tr>
		<tr>
			<td><label>Piso</label></td>
			<td><form:input path="persona.piso"/></td>
		</tr>
		<tr>
			<td><label>Departamento</label></td>
			<td><form:input path="persona.departamento"/></td>
		</tr>
		
		<tr>
			<td><label>Entre calles</label></td>
			<td><form:input path="persona.entreCalles"/></td>
			
		</tr>
		<tr>
			<td><label>Localidad</label></td>
			<td><input type="hidden" name="idLocalidad" id="idLocalidad" value="${usuario.persona.localidad.id}"></input>
				<input name="nombreLocalidad" id="nombreLocalidad" value="${usuario.persona.localidad.nombre}"></input></td>
		</tr>
		<tr>
			<td><label>Provincia</label></td>
			<td><input type="hidden" name="idProvincia" id="idProvincia" value="${usuario.persona.provincia.id}"></input>
				<input name="nombreProvincia" id="nombreProvincia" value="${usuario.persona.provincia.descripcion}" disabled="disabled"></input></td>
		</tr>
		<tr>
			<td><label>C&oacute;digo Postal</label></td>
			<td><form:input path="persona.codigoPostal"/></td>
		</tr>
		<tr>
	    	<td height="10px"></td>
	    	<td></td>
	    </tr>
		<tr>
			<td><label>Tel&eacute;fono</label></td>
			<td><form:input path="persona.telefono"/></td>
		</tr>
		<tr>
			<td><label>Celular</label></td>
			<td><form:input path="persona.celular"/></td>
		</tr>
		<tr>
			<td><label>Mail</label></td>
			<td><form:input path="persona.mail"/></td>
		</tr>
		<tr>
	    	<td height="20px"></td>
	    	<td></td>
	    </tr>
	    <tr>
	    	<td><input type="button" onclick="guardarUsuario()" value="Guardar" class="ui-state-default ui-corner-all"></td>
	    	<td></td>
	    </tr>
	</table>
</fieldset>
<div id="oculto" Style="visibility:hidden;">
<fieldset>
	<legend>Perfiles</legend>
	<br></br>
	<table style="margin-left: 20px;" border="0" align="left" cellpadding="0" cellspacing="0">
		<tr>
	        <td><label>EA</label></td>
	        <td><input type="checkbox" name="rolEA" id="rolEA" 
		       	<c:if test="${usuario.persona.perfilEA.idPerfilEA != null && usuario.persona.perfilEA.activo}"> checked="checked" checked onclick="javascript: return false;"/</c:if>></input></td>	        
	    </tr>
	    <tr>
	        <td><label>RR</label></td>
	        <td><input type="checkbox" name="rolRR" id="rolRR" 
	        	<c:if test="${usuario.persona.perfilRR.idPerfilRR != null && usuario.persona.perfilRR.activo}"> checked="checked" checked onclick="javascript: return false;"</c:if>></input></td>
	    </tr>
	    <tr>
	        <td><label>TS</label></td>
	        <td><input type="checkbox" name="rolTS" id="rolTS" 
	        	<c:if test="${usuario.persona.perfilTS.idPerfilTS != null && usuario.persona.perfilTS.activo}"> checked="checked" checked onclick="javascript: return false;"</c:if>></input></td>
	    </tr>
	    <!-- 
	    <tr>
	        <td><label>Voluntario</label></td>
	        <td><input type="checkbox" name="rolVoluntario" id="rolVoluntario"
	        	<c:if test="${usuario.persona.perfilVoluntario.id != null}"> checked="checked"</c:if>></input></td>
	    </tr>
	     -->
	    <tr>
	        <td><label>RRHH</label></td>
	        <td><form:checkbox path="persona.perfilRRHH"  /></td>
				        
	    </tr>
	    <tr>
	        <td><label>Administraci&oacute;n</label></td>
	        <td><form:checkbox path="persona.perfilAdmin"/></td>
	    	
	    </tr>
	    <tr>
	        <td><label>DI</label></td>
	        <td><form:checkbox path="persona.perfilDI"/></td>
	    </tr>
	    <tr>
	        <td><label>Selector</label></td>
	        <td><form:checkbox path="persona.perfilSelector"/></td>
	    </tr>
	    <tr>
	        <td><label>Coordinador PFE&nbsp;</label></td>
	        <td><form:checkbox path="persona.perfilCoordPBE"/></td>
	    </tr> 
	    <tr>
	        <td><label>Corrector</label></td>
	        <td><form:checkbox path="persona.perfilCorrector"/></td>
	    </tr>
	    <tr>
	        <td><label>Admin. de Sistema</label></td>
	        <td><form:checkbox path="persona.perfilSysAdmin"/></td>
	    </tr>
	    <tr>
	        <td><label>Visita</label></td>
	        <td><form:checkbox path="persona.perfilVisita"/></td>
	    </tr>
	    <tr>
	        <td><label>Super Usuario</label></td>
	        <td><form:checkbox path="persona.perfilSuperUsuario"/></td>
	    </tr>
	    <tr>
	    	<td height="20px"></td>
	    	<td></td>
	    </tr>
	    
</table>
</fieldset>
</div>
</body>
</html>