<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<script type="text/javascript">
$(function() {
	$("#banco").keypress(function(){
		$("#bancoID").val(0);
		
		$("#banco").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarBancosPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						maxRows: 12,
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.bancos, function(item) {
							return {
								label: item.nombre, 
								value: item.nombre,
								id: item.id
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#bancoID").val(ui.item.id);
			}
		});
		
	});
	
	$("#sucursal").keypress(function(){
		$("#sucursalID").val(0);
		$("#sucursal").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarSucursalPorBancoID.do",
					dataType: "json",
					data: {
						style: "full",
						bancoID: $("#bancoID").val()				
					},
					success: function(data) {
						response($.map(data.sucursales, function(item) {
							return {
								label: item.nombre, 
								value: item.nombre,
								id: item.id
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#sucursalID").val(ui.item.id);
			}
		});
	
	});
	
	habilitarRA2();






});


var digito;
function generarCuil(beca){
	var cuil;//Esto se tiene que cargar con el cuil generado
	var xy;
	value = $('#dniResponsable').val();
	radioValor = $('[name="responsable1.sexo"]:checked').val();//Toma el valor chequeado del input del sexo

	valueRa2 = $('#DNIRa2').val();
	radioValorRa2 = $('[name="responsable2.sexo"]:checked').val();//Toma el valor chequeado del input del sexo

	if(value.length == 8 ) {
		if(radioValor == "true")
		{ //Masculino			
			cuil = value;
			xy = 20;
			cuil = calcular( xy, cuil);
		}
		else
		{
			if(radioValor == "false")
			{ //Fememino
				cuil = value;
				xy = 27;
				cuil = calcular( xy, cuil );
			}		
		}
	}
	else{
		$('#cuil').val(" ");
	}
	
	if(isNaN( digito ) ){
		$('#cuil').val(" ");
	}
	else{
		$('#cuil').val(cuil);
		if(beca != ""){
			$('#reapertura').removeAttr("disabled");
// 			document.getElementById('divReapertura').style.display = "block";     DMS Da error  Cannot read properties of null (reading 'style')
		}
	}
	
	
	//DMS replico para Ra2
	
	if(valueRa2.length == 8 ) {
		if(radioValorRa2 == "true")
		{ //Masculino			
			cuil = valueRa2;
			xy = 20;
			cuil = calcular( xy, cuil);
		}
		else
		{
			if(radioValorRa2 == "false")
			{ //Fememino
				cuil = valueRa2;
				xy = 27;
				cuil = calcular( xy, cuil );
				
			}		
		}
	}
	else{
		$('#cuilRa2').val(" ");
	}
	
	if(isNaN( digito ) ){
		$('#cuilRa2').val(" ");
	}
	else{
		$('#cuilRa2').val(cuil);
		
		//DMS ver despues
// 		if(beca != ""){
// 			$('#reapertura').removeAttr("disabled");
// 			document.getElementById('divReapertura').style.display = "block";
// 		}
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
// 	if($("#noAsisteEntrevista").attr("checked"))
// 	{
// 		//No asiste: Habilita RA2
// 		$("#tablaDatosResponsable2 :text").removeAttr("disabled");
// 		$("#vinculoRespo2").removeAttr("disabled");
// 	}
// 	else
// 	{
// 		//Asiste: Deshabilita y Borra
// 		$("#responsable2Telefono1").val("");
// 		$("#responsable2ContactoTelefono1").val("");
// 		$("#nombreResponsable2").val("");
// 		$("#apellidoResponsable2").val("");
// 		$("#vinculoRespo2").val("");
// 		$("#vinculoRespo2").attr("disabled","disabled");
// 		$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
// 	}
}

function grisarCuenta(){
	if($("#reapertura").attr("checked"))
		$("#nroCuenta").attr("disabled","disabled");
	else
		$("#nroCuenta").removeAttr("disabled");
}

</script>

<script>
function llenarCta(){
	//alert(document.getElementById("cbu").value.length);
	if (document.getElementById("cbu").value.length>18){
		$("#nroCuenta").val($("#cbu").val().substring(3, 18));	
	}
	
	if (document.getElementById("cbuRa2").value.length>18){
		$("#nroCuentaRa2").val($("#cbuRa2").val().substring(3, 18));	
	}
	
}
</script>

<body>
<div id="div02">
<fieldset>
<table width="40%;"  >
	
	<tr>
		<td><font color="green"><label for="Nombre">Nombre *</label></font></td>
		<td><input type="text" class="form-control" onchange="this.value=this.value.toUpperCase();"  id="responsableNombre" name="responsable1.nombre" class="required" value="${perfilAlumno.responsable1.nombre}"></td>
		<td></td>
	</tr>
	
	<tr>
		<td><font color="green"><label>Apellido *</label></font></td>
		<td><input type="text" class="form-control" onchange="this.value=this.value.toUpperCase();" id="reponsableApellido" name="responsable1.apellido" class="required" value="${perfilAlumno.responsable1.apellido}"></td>
	<td></td>
	</tr>
	
	<tr>
		<td><label>Tipo de DNI</label></td>
		<td>
			<select name="tipoDniResponsable" id="responsableDni" class="required form-control"style="width:200px">
				<c:forEach items="${listDni}" var="dni">
					<c:choose>
						<c:when test="${perfilAlumno.responsable1.idTipoDni.id == dni.id}">
							<option value="${dni.id}" selected="selected">${dni.valor}</option>
						</c:when>
						<c:otherwise>
							<option value="${dni.id}">${dni.valor}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</td>
		<td></td>
	</tr>
	
	<tr>
		<td><font color="green"><label>N° de Documento *</label></font></td>
		<td><input type="text" id="dniResponsable" name="responsable1.dni" class="digits required form-control" maxlength="8" 
			onkeypress="validarDNI('dniResponsable')" onkeyup="generarCuil('${perfilAlumno.beca}')" value="${perfilAlumno.responsable1.dni}"></input> 
			<label id="dniResponsableError" style="color: green; display: none;">Ingrese un DNI válido</label></td>
	<td></td>
	</tr>
	
	<tr>
		<td><font color="green"><label>Pais *</label></font></td>
		<td><!-- input type="text" 	id="responsableNacionalidad" name="responsable1.nacionalidad" class="required" value="${perfilAlumno.responsable1.nacionalidad}"></td-->
			<select name="responsableNacionalidad" id="responsableNacionalidad" class="required form-control" style="width:200px" >
					<c:choose>
    					<c:when test="${perfilAlumno.responsable1.nacionalidad == 'Argentina'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Bolivia'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Brasil'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Chile'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Colombia'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Ecuador'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Paraguay'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Perú'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Uruguay'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Venezuela'}">
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
					    <c:when test="${perfilAlumno.responsable1.nacionalidad == 'Cuba'}">
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
	<td></td>
	</tr>
	
	<tr>
		<td><font color="green"><label>Sexo *</label></font></td>
		<td> 
			M&nbsp;<input type="radio" id="responsableSexoM" name="responsable1.sexo"  onclick="generarCuil()" 
			<c:if test="${perfilAlumno.responsable1.sexo}"> checked="checked"</c:if> value="true" class="required"> 
			F&nbsp;<input type="radio" id="responsableSexoF" name="responsable1.sexo" onclick="generarCuil()"
			<c:if test="${perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" class="required">
		</td>
	<td></td>
	</tr>
	
	<tr>
		<td><font color="green"><label for="fechaNacimiento">Fecha de Nacimiento: *</label></font></td>
		<td>	
			<input name="responsable1.fechaNacimiento" id="fechaNacimientoRes"  class="form-control"style="width:200px"value="<fmt:formatDate value="${perfilAlumno.responsable1.fechaNacimiento}" pattern="dd/MM/yyyy"/>" > 	
		</td>
	<td></td>
	</tr>		
	
	
	<tr>
		<td><font color="green"><label>Vínculo *</label></font></td>
		<td>
			<select name="vinculoRA" id="vinculoRespo" class="required form-control" style="width:200px">
				<option></option>
					<c:forEach items="${listVinculo}" var="vinculo">
						<c:choose>
							<c:when test="${perfilAlumno.responsable1.idVinculo.id == vinculo.id}">
								<option value="${vinculo.id}" selected="selected">${vinculo.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${vinculo.id}">${vinculo.valor}</option>
							</c:otherwise>	
						</c:choose>
					</c:forEach>
			</select>
		</td>
	<td></td>
	</tr>
	
	<tr>
		<td>
<!-- 			<label>No asiste a entrevista</label> -->
		</td>
		<td>
			<input type="checkbox" name="responsable1.noAsisteEntrevista"
			<c:if test="${perfilAlumno.responsable1.noAsisteEntrevista}"> checked="checked"</c:if> id="noAsisteEntrevista" onclick="habilitarRA2()" hidden >
		</td>
	<td></td>
	</tr>
<%-- 	<sec:authorize access="not hasRole('CORR')"> --%>
<%-- 		<c:if test="${perfilAlumno.beca != null}"> --%>
<!-- 			<tr> -->
<!-- 				<td> -->
<!-- 					<label>Reapertura de cuenta</label> -->
<!-- 				</td> -->
<!-- 				<td> -->
<!-- 					<input type="checkbox" id="reapertura" name="reapertura" disabled="disabled" onclick="grisarCuenta()"/> -->
<!-- 				</td> -->
<!-- 			<td></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td colspan="2"> -->
<!-- 					<div style="display: none;" id="divReapertura"> -->
<!-- 						<label style="color:green">Recordá que si querés hacer un cambio de cuenta bancaria tenés que tildar el check con el pedido de reapertura</label> -->
<!-- 					</div> -->
<!-- 				</td> -->
<!-- 			<td></td> -->
<!-- 			</tr> -->
<%-- 		</c:if>		 --%>
<%-- 	</sec:authorize> --%>




<tr>
			<td><font color="green">Calle *</font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();"  id="alumnoDireccion"
				name="responsable1.direccion" class="required form-control"
				value="${perfilAlumno.responsable1.direccion}" style="width:200px"></td>
		</tr>
		<tr>
			<td><font color="green">Número *</font></td>
			<td><input type=""text"" onchange="this.value=this.value.toUpperCase();"  id="alumnoNumero"
				name="responsable1.nroCalle" class="required form-control"
				value="${perfilAlumno.responsable1.nroCalle}" style="width:200px"></td>
		</tr>
		<tr>
			<td>Piso/Manzana</td>
			<td><input type=""text"" onchange="this.value=this.value.toUpperCase();"  id="alumnoPiso"
				name="responsable1.piso" class="form-control"
				value="${perfilAlumno.responsable1.piso}" style="width:200px"></td>
		</tr>
		<tr>
			<td><font color="green">Código Postal *</font></td>
			<td><input type=""text"" onchange="this.value=this.value.toUpperCase();"  id="alumnoCodigoPostal"
				name="responsable1.codigoPostal" class="required form-control"
				value="${perfilAlumno.responsable1.codigoPostal}" style="width:200px"></td>
		</tr>
		<tr>
			<td><font color="green">Barrio *</font></td>
			<td><input type=""text"" onchange="this.value=this.value.toUpperCase();"  id="barrio"
				name="datosPersonales.barrio" class="required form-control"
				value="${perfilAlumno.datosPersonales.barrio}" style="width:200px"></td>
		</tr>
		<tr>
			<td>Localidad</td>
			<td><select name="idLocalidad" class="form-control" style="width:200px">
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
		</tr>
		<tr>
			<td>Provincia</td>
			<td><select name="idProvincia" class="form-control" style="width:200px">
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
		</tr>
		<tr>
			<td><font color="green">Teléfono (cargá el código de área) *</font></td>
			<td><input type="text" onchange="this.value=this.value.toUpperCase();"
				name="responsable1.telefono" id="alumnoTelefono" maxlength="19"
				class="form-control required" value="${perfilAlumno.responsable1.telefono}" onkeypress="return justNumbers(event);"  />
			</td>
		</tr>




	<tr><td style="height: 10px" colspan="3"></td></tr>
</table>
</fieldset>
<fieldset>
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all" align="left"  ><legend>Datos Titular Cuenta Bancaria</legend></h3>
	<jsp:include page="titularCuentaBancaria.jsp"></jsp:include>
</fieldset>
</div>						
</body>
</html>