<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<title>..:: Modificar Persona ::..</title>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
	
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script>
  $(document).ready(function(){
    $("#modificarForm").validate();
    $("#fechaNacimiento").datepicker({
  	  changeMonth: true,
  	  changeYear: true
  	  });
    
  });
  
</script>
<script>
	function verificarCuil(){
		if($("#SexoM").attr("checked")){
			generarCuil("true");
		}
		if($("#SexoF").attr("checked")){
			generarCuil("false");
		}
	}

	var digito;
	function generarCuil(valueRadio){
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dni').val();
		
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
		
		if(isNaN( digito ) ){
			$('#nuevoCuil').val(" ");
		}
		else{
			$('#nuevoCuil').val(cuil);
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

</head>
<body>
<div id="main-content">
<form class="cmxform" id="modificarForm" action="<c:url value='/persona/modificar.do' />" method="post">
<input type="hidden" value="${persona.id}" name="id"/>
<table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		
		<tr>
			<td><strong><label for="nombre">Nombre(*):</label></strong></td>
			<td><input type="text" name="nombre" id="nombre" class="text-input required" value="${persona.nombre}" /></td>
		</tr>
		
		<tr>
			<td><strong><label for="apellido">Apellido(*):</label></strong></td>
			<td><input type="text" name="apellido" id="apellido" class="text-input required" value="${persona.apellido}" /></td>
		</tr>
		<tr>
			<td><label for="dni">DNI:</label></td>
			<td><input type="text" name="dni" id="dni" class="digit text-input " value="${persona.dni}" maxlength="8" onblur="verificarCuil()"/></td>
		</tr>
		<tr>
			<td><label for="direccion">Direccion:</label></td>
			<td><input type="text" name="direccion" id="direccion" class="text-input" value="${persona.direccion}" /></td>
		</tr>
		<tr>
			<td><label for="codigoPostal">Codigo Postal:</label></td>
			<td><input type="text" name="codigoPostal" id="codigoPostal" class="text-input" value="${persona.codigoPostal}" /></td>
		</tr>
		<tr>
			<td><label for="telefono">Telefono:</label></td>
			<td><input type="text" name="telefono" id="telefono" class="text-input" value="${persona.telefono}" /></td>
		</tr>
		<tr>
			<td><label for="celular">Celular:</label></td>
			<td><input type="text" name="celular" id="celular" class="text-input" value="${persona.celular}" /></td>
		</tr>
		<tr>
			<td><label for="fechaNacimiento">Fecha de Nacimiento:</label></td>
			<td><input name="fechaNacimiento" id="fechaNacimiento" class="text-input date" value="<fmt:formatDate value="${persona.fechaNacimiento}" pattern="dd/MM/yyyy"/>" /> dd/mm/aaaa<br></td>
		</tr>
		<tr>
			<td><label for="sexo">Sexo:</label></td>
			<td>
				M<input type="radio" id="SexoM" name="sexo"  onclick="generarCuil(this.value)" checked="checked" value="false" class="required"> 
				F<input type="radio" id="SexoF" name="sexo"  onclick="generarCuil(this.value)" checked="checked"  value="true" class="required">
			</td>
		</tr>
		<tr>
		<td width="100"><strong><label>Cuil-Cuit(*):</label></strong></td>
		<td width="600"><input type="text" id="nuevoCuil" name="cuil" class="text-input required" value="${persona.cuilCuit}"> Automático: Ingrese DNI + Sexo</td>
		</tr>
		<tr>
			<td><label>Estado Civil</label></td>
			<td>
			<select name="estadoCivil">
				<c:forEach var="estado" items="${estadosCiviles}">
					<option selected="selected" value="${estado.id}">${estado.valor}</option>
				</c:forEach>
			</select>
			</td>
		</tr>
		<tr>
			<td><label for="mail">e-mail:</label></td>
			<td><input type="text" name="mail" id="mail" class="text-input email" value="${persona.mail}"/></td>
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
        <table width="550" border="0" align="left" cellpadding="0" cellspacing="0" id="table-botons-small">
          <tr>
            <td width="80" height="0" align="center" valign="middle"><input type="reset" class="ui-state-default ui-corner-all" value="Limpiar" /></td>
			<td width="330" height="0" align="left" valign="middle"><input class="ui-state-default ui-corner-all " type="submit" value="Guardar" /></td>		
		  </tr>		
	</table> 
	</td>
	</tr>
	</table>				
	
</form>
</div>
</body>
</html>