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

	$("#tablaDatosResponsable :text").css("width","90px");
	$("#tablaGeneralesResponsable :text").css("width","90px");
	
	$("#barrioResp").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarBarrioPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					name_startsWith: request.term				
				},
				success: function(data) {
					response($.map(data.barrios, function(item) {
						return {
							label: item.nombre + ", " + item.localidad ,
							value: item.nombre,
							id: item.id
						}
					}))
				}
			})
		},
		select: function(event, ui) {

			var direccion = "../ajax/buscarLocalidadZona.do?idBarrio=" + ui.item.id;
			
			$.ajax({

				type: "POST",
				cache: false,
				url: direccion,
				dataType: "json", 
				processData: false,
				success: function(data){
					$("#idBarrioResp").val(data.id);
					$("#idLocalidadResp").val(data.idLocalidad);
					$("#localidadResp").val(data.localidad);
					
				}

			});
		}
	});
	
	habilitarRA2();

});
	
	
</script>
<script>
	function verificarCuil(){
		if($("#responsableSexoM").attr("checked")){
			generarCuil("true");
		}
		if($("#responsableSexoF").attr("checked")){
			generarCuil("false");
		}
	}

	var digito;
	function generarCuil(){
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dniResponsable').val();
		radioValor = $('[name="perfilAlumno.responsable1.sexo"]:checked').val();//Toma el valor chequeado del input del sexo
		if(value.length == 8){ //Se ingresó al menos un digito del dni
			if(radioValor == "true"){ //Masculino	
				cuil = value;
				xy = 20;
				cuil = calcular( xy, cuil);
			}else{
				if(radioValor == "false"){ //Fememino
					cuil = value;
					xy = 27;
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

		if (document.getElementById("dniResponsable").value == ""){
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

	function habilitarRA2(){
		if($("#noAsisteEntrevista").attr("checked"))
		{
			//No asiste: Habilita RA2
			if(${isDetalleEntrevista == false})
			{
				$("#tablaDatosResponsable2 :text").removeAttr("disabled");
				$("#vinculoRespo2").removeAttr("disabled");
			}
			else
			{
				$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
				$("#tablaDatosResponsable2 :checkbox").attr("disabled","disabled");
				$("#tablaDatosResponsable2 :input").attr("disabled","disabled");
			}
		}
		else
		{
			//Asiste: Deshabilita y Borra
			$("#responsable2Telefono1").val("");
			$("#responsable2ContactoTelefono1").val("");
			$("#nombreResponsable2").val("");
			$("#apellidoResponsable2").val("");
			$("#vinculoRespo2").val("");
			$("#vinculoRespo2").attr("disabled","disabled");
			$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
		}
	}
	
	
	function llenarFechaHidden(){
		//alert();
		valor = $("#fechaNacimientoRes").val();
		$("#fechaNacRes").val(valor);
	}
	

</script>



</head>
<body>
<!-- Datos Personales -->
<fieldset>
	<legend>Responsable 1</legend>
	<table id="tablaDatosResponsable">
		<tr>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>
				<p>
					<font color="green"><label for="Nombre">Nombre *</label></font>
					<input type="text"  onchange="this.value=this.value.toUpperCase();" id="responsableNombre" name="perfilAlumno.responsable1.nombre" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nombre}">
				</p>
			</td>
			<td>
				<p>
					<font color="green"><label>Apellido *</label></font>
					<input type="text" onchange="this.value=this.value.toUpperCase();" id="reponsableApellido" name="perfilAlumno.responsable1.apellido" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.apellido}">
				</p>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<p>
					<font color="green"><label>Tipo de DNI *</label></font>
						<select name="dni" id="responsableDni" class="required">
							<option value="">Seleccione una opci&oacute;n:</option>
							<c:forEach items="${listDni}" var="dni">
							<c:choose>
								<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idTipoDni.id == dni.id}">
									<option value="${dni.id}" selected="selected">${dni.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${dni.id}">${dni.valor}</option>
								</c:otherwise>
							</c:choose>	
							</c:forEach>
						</select>
				</p>
			</td>
			<td>
				<p>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td><font color="green"><label>N° de Documento *</label></font></td>
							<td><input type="text" id="dniResponsable" name="perfilAlumno.responsable1.dni" class="digits" maxlength="8" 
								value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.dni}" onblur="verificarCuil()" onkeyup="verificarCuil()"></input> </td>
							<td><label id="dniResponsableError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
						</tr>
					</table>
				</p>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<p>
					<font color="green"><label>Pais *</label></font> 
						<!--  input type="text" 	onchange="this.value=this.value.toUpperCase();" id="responsableNacionalidad" name="perfilAlumno.responsable1.nacionalidad" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad}"-->
				
						<select name="responsableNacionalidad" id="responsableNacionalidad" class="required" onchange="habilitarInputEstadoAlumno(this.value)">
					<c:choose>
    					<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Argentina'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Bolivia'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Brasil'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Chile'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Colombia'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Ecuador'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Paraguay'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Perú'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Uruguay'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Venezuela'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Cuba'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
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
						 	<option value=" ">Seleccione una opci&oacute;n:</option>
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
				
				
				</p>
			</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<c:choose>
			<c:when test="${isNuevaEntrevista && !isOtraEntrevista}">
				<td>
				<p><font color="green"><label>Sexo *</label></font> 
					M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()" 
					value="true" class="required"> 
					F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
					value="false" class="required">
				</p>
			</td>
			</c:when>
			<c:when test="${isDetalleEntrevista}">
				<td>
					<p><font color="green"><label>Sexo *</label></font> 
						M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}"> checked="checked"</c:if>  value="true" class="required"> 
						F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" class="required">
					
					</p>
				</td>
			</c:when>
			<c:when test="${isOtraEntrevista}">
				<td>
					<p><font color="green"><label>Sexo *</label></font> 
						M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}"> checked="checked"</c:if>  value="true" class="required"> 
						F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" class="required">
					
					</p>
				</td>
			</c:when>
			<c:when test="${!isDetalleEntrevista && !isOtraEntrevista}">
				<td>
					<p><font color="green"><label>Sexo *</label></font> 
						M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}"> checked="checked"</c:if>  value="true" class="required"> 
						F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" class="required">
					
					</p>
				</td>
			</c:when>
			</c:choose>
			
			
			
			
			<td>
				<p><font color="green"><label for="fechaNacimiento">Fecha de Nacimiento: *</label></font> 
				<input name="perfilAlumno.responsable1.fechaNacimiento" id="fechaNacimientoRes"  value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.fechaNacimiento}" pattern="dd/MM/yyyy"/>" onchange="llenarFechaHidden()"> 
				</p>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<p>
					<label>CUIL *</label>
					<input type="text" name="perfilAlumno.responsable1.cuilCuit" id="cuil" class="required"   readonly="readonly"
						value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.cuilCuit}" style="background: #E6E6E6;" >
				</p>
			</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>
			<p>
					<label>Teléfono 1 (cargá el código de área)</label>
						<input type="text" onchange="this.value=this.value.toUpperCase();" maxlength="19"  name="perfilAlumno.responsable1.telefono1" id="responsableTelefono1" 
							value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono1 }" onkeypress="return justNumbers(event);">
				</p>
				
			</td>
			<td>
				<p>
					<label>Contacto 1</label>
						<input type="text" onchange="this.value=this.value.toUpperCase();"  name="perfilAlumno.responsable1.contactoTelefono1" id="responsableContactoTelefono1" 
							value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.contactoTelefono1 }">
				</p>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<p>
					<label>Teléfono 2 (cargá el código de área)</label>
						<input type="text" onchange="this.value=this.value.toUpperCase();"  maxlength="19"  name="perfilAlumno.responsable1.telefono2" id="responsableTelefono2"
							value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono2 }" onkeypress="return justNumbers(event);">
				</p>
				
			</td>
			<td>
				<p>
					<label>Contacto 2</label>
						<input type="text" onchange="this.value=this.value.toUpperCase();"  name="perfilAlumno.responsable1.contactoTelefono2" id="responsableContactoTelefono2" 
							value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.contactoTelefono2 }">
				</p>	
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<p>
					<font color="green"><label>Vínculo *</label></font>
						<select name="vinculoRA" id="vinculoRespo" class="required">
							<option value="">Seleccione una opci&oacute;n:</option>
							<c:forEach items="${listVinculo}" var="vinculo">
								<c:choose>
									<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idVinculo.id == vinculo.id}">
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
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td colspan="3">
				<label>NO asiste a entrevista</label>
				<input type="checkbox" name="perfilAlumno.responsable1.noAsisteEntrevista"
					<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.noAsisteEntrevista}"> checked="checked"</c:if> id="noAsisteEntrevista" onclick="habilitarRA2()" >
				<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
				<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
			</td>
		</tr>
	</table>
	<!-- DOMICILIO RA -->
	<input type="hidden" id="direccionRA" name="perfilAlumno.responsable1.calle"></input>
	<input type="hidden" id="codPostalRA" name="perfilAlumno.responsable1.codigoPostal"></input> 
	<input type="hidden" id="entreCallesRA" name="perfilAlumno.responsable1.entreCalles"></input> 
	<input type="hidden" id="nroCalleRA" name="perfilAlumno.responsable1.nroCalle"></input> 
	<input type="hidden" id="idLocalidadRA" name="perfilAlumno.responsable1.idLocalidad"></input>
	<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
	<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
</fieldset>
<!-- Fin de datosPErsonales -->
<fieldset>
	<legend>Responsable 2</legend>
	<jsp:include page="fichaResponsable2.jsp"></jsp:include>
</fieldset>

<!-- Datos generales -->
<fieldset>
	
						<input type="hidden" name="perfilAlumno.responsable1.informacionComplementaria" id="informacionComplementaria"/>
				
						<input type="hidden" name="perfilAlumno.responsable1.percepcionesSobreRA" id="percepcionesSobreRA" />
				
							<input type="hidden" name="compromisoEscolaridad" id="compromisoEscolaridad" value="3">
								
							<input type="hidden"t name="posibilidadCompromisoPBE" id="posibilidadCompromisoPBE" value="3">
								
							<input type="hidden" name="aptoComoRA" id="aptoComoRA" value="3">
								
							<input type="hidden" name="identrevistador" id="identrevistador" value=" ">
							
					
</fieldset>
<!-- fIN dATOS GENERALES -->
<!-- Datos Bancarios -->
<fieldset>
	<legend> Datos Bancarios</legend>
	<table>
		<tr>
			<td colspan="3">
		</tr>
		<tr>
			<td>
				<p>
					<font color="green"><label>Sucursal *</label></font>
					<!-- Esta combo se popula cuando  se selecciona una Escuela. el metodo javascript que maneja esto esta en  fichaCandidato.jsp se llama 
						populateComboSucursal, y el metodo que trae los datos por ajax buscarSucursalBancoPorZona que se llama cuando se activa el autocompletar de Escuela
							  -->
						<select id="respoSucursal" style="width: 208px;" name="perfilAlumno.responsable1.sucursalBanco.id" class="required" onchange="seleccionarBanco(this.value);"  >
							<option value="">Seleccione una opci&oacute;n:</option>
							<c:choose>
							
								<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.id != null}">
										<option id="removerOption" selected="selected" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.id}" >
										${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.banco.nombre}, ${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.nombre}</option>
									
								</c:when>
								<c:otherwise>
										<option id="removerOption"></option>
								</c:otherwise>
							</c:choose>
						</select>
					
				</p>
			</td>
			<td align="center">
				<p>
					<label>Banco</label>
					<input name="respoBanco" id="respoBanco" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.banco.nombre}" >
				</p>
			
			</td>
		</tr>
		<tr>			
			<td >
				<p>
					<label>N&uacute;mero de Cuenta</label>
					<input  type="text" id="numeroCuentaRespo" disabled="disabled"  value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nroCuenta}" >					
				</p>
			</td>
		</tr>	
	</table>
</fieldset>

</body>
</html>