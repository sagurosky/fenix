<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<title>..:: Modificar Padrino ::..</title>
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

	$("#form1").validate();
    
	$("#fechaAlta").datepicker({
  		changeMonth: true,
  		changeYear: true
  	});
    
	$("#fechaNacimiento").datepicker({
    	changeMonth: true,
    	changeYear: true
    });
  
  });
  </script>
 <script>
$(function() {
	  $("#cuit_cuil").blur(function(evt) {
	    evt.preventDefault()   // make sure the hyperlink doesn't work per se
	    if($("#tipoP").val() == 1){ //es una empresa
		    $.ajax( {
		      type: "GET",
		      url: "../ajax/validarCuitEmpresa.do",
		      data: { cuit_cuil: $("#cuit_cuil").val() },
		      dataType: "json",
		      success: function(data) {
		        if(!(data.existeEmpresa)){
		        	url = "../empresa/altaEmpresaView.do?popup=true&cuit="+document.getElementById("cuit_cuil").value;
		    		window.showModalDialog(url, '_blank','width=600, height=400 ,scrollbars=YES');
		        	return false;
		        }
		      }
		    } )
	    }else if($("#tipoP").val() == 2){ // es una persona
		    $.ajax( {
			      type: "GET",
			      url: "../ajax/validarCuilPersona.do",
			      data: { cuit_cuil: $("#cuit_cuil").val() },
			      dataType: "json",
			      success: function(data) {
			        if(!(data.existePersona)){
			        	url = "../persona/registrarPersonaView.do?popup=true&cuil="+document.getElementById("cuit_cuil").value;
			    		window.showModalDialog(url, '_blank','width=600, height=400 ,scrollbars=YES, modal=YES');
			        	return false;
			        }
			      }
			    } )
	    }   
	  })
	})

</script>  
<script type="text/javascript">
function verificarCuil(){
	if($("#SexoM").attr("checked")){
		generarCuil("false");
	}
	if($("#SexoF").attr("checked")){
		generarCuil("true");
	}
}

var digito;

function generarCuil(valueRadio){
	var cuil;//Esto se tieenq que cargar con el cuil generado
	var xy;
	value = $('#dni').val();
	if(value.length > 0){ //Se ingresó al menos un digito del dni
		if(valueRadio == "false"){ //Masculino			
			cuil = value;
			xy = 20;
			cuil = calcular( xy, cuil);
		}else{
			if(valueRadio == "true"){							//fememino
				cuil = value;
				xy = 27;
				cuil = calcular( xy, cuil );
			}
		}
	}
	else{
		$('#cuit_cuil').val(" "); // No se ingresó al menos un numero de dni por lo que no se puede calcular el cuil
	}
	
	if(isNaN( digito ) ){
		$('#cuit_cuil').val(" ");
	}
	else{
		$('#cuit_cuil').val(cuil);
	}
				
}

function formatear(xy, cuil, digito) {
	return (xy + "-" + cuil + "-" + digito);		
}
	
</script>
</head>
<body>
<div id="main-content">

<form:form modelAttribute="padrino" commandName="padrino"  id="form1" action="modificar.do" method="post">
<form:hidden path="id"/>

<div id="right-content">
   <h1>Modificar Padrino</h1>
	<br></br>
	<fieldset style="font-size: 12px; width:980px;">
		
		<legend>Datos de Padrino</legend>
		    <table width="90" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
			    <tr>
				    <td width="150">Tipo</td>
			        <td width="600">			        	
			        	<input type="text" class="text-input" name="tipoPadrino" value="${padrino.tipo.valor}" readonly="readonly"/></td>
			        	<!--  
			        	<label id="tipo"><b>${padrino.tipo.valor}</b></label>
			        	<select name="tipoId" id="tipoP"  class="text-input required">
			         		<option value="">Seleccione un tipo</option>
							<c:forEach var="tipo" items="${tipos}">
							<c:if test="${tipo.id == padrino.tipo.id}">
								<option selected="selected" value="${padrino.tipo.id}">${padrino.tipo.valor}</option>
							</c:if>
							<c:if test="${tipo.id != padrino.tipo.id}">
								<option value="${tipo.id}">${tipo.valor}</option>
							</c:if>
							</c:forEach>
						</select> -->
			        </td>
		      	</tr>
				<tr>
			        <td>CUIT/CUIL</td>
			        <td><input type="text" id="cuit_cuil" class="text-input" name="datosPersonales.cuilCuit" maxlength="13" class="digits required" 
			        		readonly="readonly" value="${CUIL}"/></td>
			    </tr>
				<tr>
			        <td>Fecha Modificación</td>
			        <td><input name="fechaAltaStr" id="fechaAlta" class="text-input" value="<fmt:formatDate value="${padrino.fechaAlta}" pattern="dd/MM/yyyy"/>" /> dd/mm/aaaa</td>
			    </tr>
				<tr>
					<td>Id Plataforma Contable</td>
					<td><input type="text" value="${padrino.nroCtesPlataformaContable}" class="digits text-input" name="nroCtesPlataformaContable"/></td>
				</tr>
				<tr>
					<td>Recibe informes masivos</td>
					<td><form:checkbox path="recibeInformesMasivos"/></td>
				</tr>
			</table>
	</fieldset>
	<fieldset style="font-size: 12px; width:980px;">
		<legend>Datos Personales</legend>
			<input type="hidden" name="datosPersonales.id" value="${padrino.datosPersonales.id}">
			
			<table width="90" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
				<tr>
					<td width="150"><label for="nombre">Nombre *</label></td>
					<td width="600"><input name="datosPersonales.nombre" id="nombre" class="text-input required" value="${padrino.datosPersonales.nombre}"/></td>
				</tr>
				
				<tr>
					<td><label for="apellido">Apellido *</label></td>
					<td><input name="datosPersonales.apellido" id="apellido" class="text-input required" value="${padrino.datosPersonales.apellido}"/></td>
				</tr>
				<tr>
					<td><label for="dni">DNI</label></td>
					<td><input name="datosPersonales.dni" id="dni" class="digit text-input required" class="digits" 
						maxlength="8" onblur="verificarCuil()" onkeyup="verificarCuil()" value="${padrino.datosPersonales.dni}"/></td>
				</tr>
				<tr>
					<td><label for="direccion">Direccion</label></td>
					<td><input name="datosPersonales.direccion" id="direccion" class="text-input" value="${padrino.datosPersonales.direccion}"/></td>
				</tr>
				<tr>
					<td><label for="codigoPostal">Codigo Postal</label></td>
					<td><input name="datosPersonales.codigoPostal" id="codigoPostal" class="text-input" value="${padrino.datosPersonales.codigoPostal}"/></td>
				</tr>
				<tr>
					<td><label for="telefono">Telefono</label></td>
					<td><input name="datosPersonales.telefono" id="telefono" class="text-input" value="${padrino.datosPersonales.telefono}"/></td>
				</tr>
				<tr>
					<td><label for="celular">Celular</label></td>
					<td><input name="datosPersonales.celular" id="celular" class="text-input" value="${padrino.datosPersonales.celular}"/></td>
				</tr>
				<tr>
					<td><label for="fechaNacimiento">Fecha de Nacimiento</label></td>
					<td><input name="fechaNacimientoStr" id="fechaNacimiento" class="text-input" value="<fmt:formatDate value="${padrino.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>"/> dd/mm/aaaa<br></td>
				</tr>
				<tr>
					<td><label for="sexo">Sexo</label></td>
					<td>
						<c:choose>
							<c:when test="${padrino.datosPersonales.sexo}">
								M<input type="radio" id="SexoM" name="datosPersonales.sexo"  onclick="generarCuil(this.value)" value="false" class="required"> 
								F<input type="radio" id="SexoF" name="datosPersonales.sexo"  onclick="generarCuil(this.value)" checked="checked"  value="true" class="required">
							</c:when>
							<c:otherwise>
								M<input type="radio" id="SexoM" name="datosPersonales.sexo"  onclick="generarCuil(this.value)" checked="checked" value="false" class="required"> 
								F<input type="radio" id="SexoF" name="datosPersonales.sexo"  onclick="generarCuil(this.value)" value="true" class="required">
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td><label for="mail">Mail</label></td>
					<td><input name="datosPersonales.mail" id="mail" class="text-input" value="${padrino.datosPersonales.mail}"/></td>
				</tr>
				<tr>
					<td colspan="2">
						<label style="width:980px;font-size:10px;"><b>Recuerda que las direcciones de mail deben separarse con punto y coma (;)</b></label>
					</td>
				</tr>
			</table>
	</fieldset>
			<table>
		      	<tr>
		        	<td>&nbsp;</td>
		     		<td>&nbsp;</td>
		      	</tr>
		      	<tr>
		        	<td colspan="2">
			        	<table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
				          	<tr>
				            	<td width="50" height="0" align="center" valign="middle">
									<input type="hidden" value="${padrino.id}" name="idPadrino"/>
									<c:if test="${padrino.id != null}">
									<input class="ui-state-default ui-corner-all "  type="submit" value="Modificar" />
									</c:if></td>
				            	<td width="50" align="center" valign="middle">
									<c:if test="${padrino.id == null}">
									<input class="ui-state-default ui-corner-all "  type="submit" value="Guardar" />
									</c:if>	</td>
								<td width="50" align="center" valign="middle"><input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../perfilPadrino/listaPadrinosView.do'; return false;" /></td>
				            	<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
			        		</tr>
					 	</table>   
					</td>		 	
				</tr>	
			</table>			 	   	
</div>
</form:form>
</div>
</body>
</html>