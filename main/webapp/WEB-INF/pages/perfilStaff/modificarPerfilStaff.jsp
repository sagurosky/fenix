<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Modificar Staff Cimientos</title>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.alerts.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>

<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>

<style type="text/css">
	label { width: 14em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
 	legend { width: 9em; float: left;font-size: 15px;padding-left: .1em}
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
	select { width: 140px }
</style>
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
			$('#nuevoCuil').val(" "); // No se ingresó al menos un numero de dni por lo que no se puede calcular el cuil
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

<script>
  $(document).ready(function(){
	  
    $("#altaPerfilStaff").validate();
    
    $("#fechaIngreso").datepicker({
    	  changeMonth: true,
    	  changeYear: true
    	  });
    
    $("#fechaBaja").datepicker({
  	  changeMonth: true,
  	  changeYear: true
  	  }); 

	$("#nombreLocalidad").keypress(function(){
		
		$("#idLocalidad").val(0);
		$("#idProvincia").val(0);
		$("#nombreProvincia").val("");
		
		$("#nombreLocalidad").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarLocalidadPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						maxRows: 12,
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.localidades, function(item) {
							return {
								label: item.nombre + ", " + item.nombreProvincia, 
								value: item.nombre,
								idProvincia: item.idProvincia,
								nombreProvincia: item.nombreProvincia,
								id: item.id
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#idLocalidad").val(ui.item.id),
				$("#idProvincia").val(ui.item.idProvincia),
				$("#nombreProvincia").val(ui.item.nombreProvincia)
			}
		});
		
	});
	
});
</script>
<script>
$(function() {
	  $("#bancoID").change(function(evt) {
	    evt.preventDefault()   
	    $.ajax( {
	      type: "GET",
	      url: "../ajax/obtenerListaSucursales.do",
	      data: { idBanco: $("#bancoID").val() },
	      dataType: "json",
	      success: function(data) {
	    	  var options = '';
	            options += '<option value="" selected="selected">Seleccione una sucursal</option>';
	            $(data.sucursales).each(function() {
	                options += '<option value="' + this.id + '">' + this.direccion + '</option>';
	            });
	             $("select#sucursalID").html(options);
	        	
	      }
	    } )
	  })
	})

</script>
<script>
$(function() {
	  $("#cuit_cuil").blur(function(evt) {
	    evt.preventDefault()   // make sure the hyperlink doesn't work per se
	    $.ajax( {
	      type: "GET",
	      url: "../ajax/validarCuilPersona.do",
	      data: { cuit_cuil: $("#cuit_cuil").val() },
	      dataType: "json",
	      success: function(data) {
	        if(!(data.existePersona)){
	        	url = "../persona/registrarPersonaView.do?popup=true&cuil="+document.getElementById("cuit_cuil").value;
	    		window.open(url, '_blank','width=600, height=400 ,scrollbars=YES');
	        	return false;
	        }
	      }
	    } )
	  })
	})
</script>
</head>

<body>
<form:form id="altaPerfilStaff" commandName="perfilStaff" modelAttribute="perfilStaff" cssClass="cmxform" action="modificarStaff.do" method="post">
<form:hidden path="id"/>
<div id="main-content">
	<fieldset>
		<legend>Modificar Staff Cimientos</legend>
	    <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		    <tr>
		    	<td>
		    		<p>
		    		<label>Banco *</label>
					<select id="bancoID" name="bancoID" class="required">
							<option id="selected" value="${bancoSelected.id}">${bancoSelected.nombre}</option>
							<c:forEach var="banco" items="${bancos}">
								<option id="test" value="${banco.id}">${banco.nombre}</option>
							</c:forEach>
					</select>
			
		    		</p>
		    	</td>
		    </tr>
		    <tr>
		    	<td>
		    		<p>
		    		<label>Sucursal *</label>
		    			<select id="sucursalID" name="sucursalID" class="required">
								<option id="selected" value="${sucursalSelected.id}">${sucursalSelected.direccion}</option>
								<c:forEach var="sucursal" items="${sucursales}">
									<option value="${sucursal.id}">${sucursal.direccion}</option>
								</c:forEach>
						</select>
		    		</p>
		    	</td>
		    </tr>
		    <tr>
		        <td>
		        	<p>
		        		<label>Nro Cuenta </label>
	        			<input type="text" name="nroCuenta" id="nroCuenta" class="digits" value="${perfilStaff.nroCuenta}"/>
	        		</p>	
	        	</td>
		    </tr>
		    <tr>
		        <td>
		        	<p>
			        	<label>Modalidad Contrataci&oacute;n *</label>
				          <select name="modalidadContratacionID" id="modalidadContratacion" class="required">
				            <option value="${perfilStaff.modalidadContratacion.id}">${perfilStaff.modalidadContratacion.valor}</option>
				            <c:forEach var="modalidad" items="${modalidadesContratacion}" >
								<option value="${modalidad.id}">${modalidad.valor}</option>
							</c:forEach>
				          </select>
				    </p>      
		        </td>
	      	</tr>
	      	<tr>
	      		<td>
	      			<p>
	      			<label>Dedicación *</label>
	      			<select name="cargaHorariaID" id="cargaHoraria" class="required">
	      			   	<option value="${perfilStaff.cargaHoraria.id}">${perfilStaff.cargaHoraria.valor}</option>
				        <c:forEach var="carga" items="${cargaHoras}" >
							<option value="${carga.id}">${carga.valor}</option>
						</c:forEach>
				     </select>
	      			</p>
	      		</td>
	      	</tr>
		    <tr>
		        <td>
		        	<p>
		        	<label>Legajo</label>
		        	<input type="text" name="legajo" id="legajo" class="digits" value="${perfilStaff.legajo}"/>
		        	</p>
		        </td>
		    </tr>
		    <tr>
		    	<td>&nbsp;</td>
		    </tr>
		</table>
	</fieldset>
	<fieldset>
		<legend>Datos Personales</legend>
			<input type="hidden" name="datosPersonales.id" value="${perfilStaff.datosPersonales.id}">
			<table width="90" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
				<tr>
					<td width="150"><label for="nombre">Nombre *</label></td>
					<td width="600"><input name="datosPersonales.nombre" id="nombre"value="${perfilStaff.datosPersonales.nombre}"/></td>
				</tr>
				<tr>
					<td><label for="apellido">Apellido *</label></td>
					<td><input name="datosPersonales.apellido" id="apellido"  value="${perfilStaff.datosPersonales.apellido}"/></td>
				</tr>
				<tr>
					<td><label for="dni">DNI</label></td>
					<td><input name="datosPersonales.dni" id="dni"  class="digits required" maxlength="8" 
						onblur="verificarCuil()" onkeyup="verificarCuil()" value="${perfilStaff.datosPersonales.dni}"/></td>
				</tr>
				<tr>
					<td><label for="sexo">Sexo</label></td>
					<td>
						<c:if test="${perfilStaff.datosPersonales.sexo}">					
							M<input type="radio" id="SexoM" name="datosPersonales.sexo" value="true" checked="checked" onclick="generarCuil(this.value)" />
							F<input type="radio" id="SexoF" name="datosPersonales.sexo" value="false" onclick="generarCuil(this.value)" />
						</c:if>
						<c:if test="${perfilStaff.datosPersonales.sexo == false}">
							M<input type="radio" id="SexoM" name="datosPersonales.sexo" value="true" onclick="generarCuil(this.value)" />
							F<input type="radio" id="SexoF" name="datosPersonales.sexo" value="false" checked="checked" onclick="generarCuil(this.value)" />
						</c:if>	
					</td>
				</tr>
				<tr>
					<td><label>CUIL</label></td>
					<td><input name="cuit_cuil" id="nuevoCuil" value="${cuilCuit}" readonly="readonly" class="required"/></td>
				</tr>
				<tr>
					<td><label>Nacionalidad</label></td>
					<td><input name="datosPersonales.nacionalidad" id="nacionalidad" value="${perfilStaff.datosPersonales.nacionalidad}"/></td>
				</tr>
				<tr>
					<td><label for="direccion">Direcci&oacute;n</label></td>
					<td><input name="datosPersonales.direccion" id="direccion"  value="${perfilStaff.datosPersonales.direccion}"/></td>
				</tr>
				<tr>
					<td><label>N&uacute;mero</label></td>
					<td><input name="datosPersonales.numeroCalle" id="numeroCalle" value="${perfilStaff.datosPersonales.numeroCalle}" /></td>
				</tr>
				<tr>
					<td><label>Piso</label></td>
					<td><input name="datosPersonales.piso" id="piso" value="${perfilStaff.datosPersonales.piso}"/></td>
				</tr>
				<tr>
					<td><label>Departamento</label></td>
					<td><input name="datosPersonales.departamento" id="departamento" value="${perfilStaff.datosPersonales.departamento}"/></td>
				</tr>
				<tr>
					<td><label>Entre calles</label></td>
					<td><input name="datosPersonales.entreCalles" id="entreCalles" value="${perfilStaff.datosPersonales.entreCalles}"/></td>
				</tr>
				<tr>
					<td><label>Localidad</label></td>
					<td>
						<input type="hidden" name="idLocalidad" id="idLocalidad" value="${perfilStaff.datosPersonales.localidad.id}"></input> 
						<input name="nombreLocalidad" id="nombreLocalidad" value="${perfilStaff.datosPersonales.localidad.nombre}"></input>
					</td>
				</tr>
				<tr>
					<td><label>Provincia</label></td>
					<td>
						<input type="hidden" name="idProvincia" id="idProvincia" value="${perfilStaff.datosPersonales.provincia.id}"></input> 
						<input name="nombreProvincia" id="nombreProvincia" value="${perfilStaff.datosPersonales.provincia.descripcion}" disabled="disabled"></input>
					</td>
				</tr>
				<tr>
					<td><label for="codigoPostal">C&oacute;digo Postal</label></td>
					<td><input name="datosPersonales.codigoPostal" id="codigoPostal" value="${perfilStaff.datosPersonales.codigoPostal}" /></td>
				</tr>
				<tr>
					<td><label for="telefono">Tel&eacute;fono</label></td>
					<td><input name="datosPersonales.telefono" id="telefono" value="${perfilStaff.datosPersonales.telefono}"/></td>
				</tr>
				<tr>
					<td><label for="celular">Celular</label></td>
					<td><input name="datosPersonales.celular" id="celular" value="${perfilStaff.datosPersonales.celular}"/></td>
				</tr>
				<tr>
					<td><label for="mail">Mail</label></td>
					<td><input name="datosPersonales.mail" id="mail" class="email" value="${perfilStaff.datosPersonales.mail}"/></td>
				</tr>
				<tr>
				<td>
					<table  border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
				    	<tr>
				            <td width="50" height="0" align="center" valign="middle">
				            	<input type="reset" class="ui-state-default ui-corner-all" value="Limpiar"/>
				            </td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td width="50" height="0" align="center" valign="middle">
								<input type="submit" value="Guardar" class="ui-state-default ui-corner-all"/>
							</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
							<td width="50" align="center" valign="middle">
								<input type="button" value="Cancelar" class="ui-state-default ui-corner-all" onclick="location.href='../perfilStaff/listaPerfilStaff.do'; return false;"/>
							</td>
				            <td>&nbsp;</td>
				            <td>&nbsp;</td>
				            <td>&nbsp;</td>
				            <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
						</tr>		
					</table> 
				</td>
			</tr>
			</table>
	</fieldset>
</div>
</form:form>	

</body>
</html>