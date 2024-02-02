<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript">

$(function() {

	$("#tablaDatosResponsable2 :text").css("width","90px");
	$("#tablaGeneralesResponsable2 :text").css("width","90px");

});
	
	function desplegarRa2()
	{
		$("#nuevoRa2").show(500, function(){$(".datosBancoRa1").hide(500)});
		
		$("#nombreRa2").addClass("required");
		$("#apellidoRa2").addClass("required");
		$("#DNIRa2").addClass("required");
		$("#nacionalidadRa2").addClass("required");
		$("#fechaNacimientoRa2").addClass("required");
		$("#vinculoRespo2").addClass("required");
		$("#cuilRa2").addClass("required");
		$("#bancoRa2").addClass("required");
		$("#sucursalRa2").addClass("required");
		
	}
	function ocultarNuevoRa2()
	{
		$("#nuevoRa2").hide(500, function(){$(".datosBancoRa1").show(500)});
		
		$("#nombreRa2").removeClass("required");
		$("#apellidoRa2").removeClass("required");
		$("#DNIRa2").removeClass("required");
		$("#nacionalidadRa2").removeClass("required");
		$("#fechaNacimientoRa2").removeClass("required");
		$("#vinculoRespo2").removeClass("required");
		$("#cuilRa2").removeClass("required");
		$("#bancoRa2").removeClass("required");
		$("#sucursalRa2").removeClass("required");
	}
</script>
<script>
	var digito;
	function generarCuil2(valueRadio){
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dniResponsable2').val();
		
		if(valueRadio == "true"){ //Masculino			
			cuil = value;
			xy = 20;
			cuil = calcular( xy, cuil);
		}else{
			if(valueRadio == "false")
			{
											//fememino
				cuil = value;
				xy = 27;
				cuil = calcular( xy, cuil );
			}
		}
		
		if(isNaN( digito ) ){
			$('#cuil2').val(" ");
		}
		else{
			$('#cuil2').val(cuil);
		}
					
	}
	
</script>
</head>
<body>

<!-- <sec:authentication property="principal.authorities" />  -->




	<table width="100%;" id="tablaDatosResponsable2" >
		<c:choose>
		<c:when test="${perfilAlumno.responsable2!=null}">
		<input type="hidden"   name="ra2.id"id="ra2.id" value="${perfilAlumno.responsable2.id}">
		
		<tr>
			<td>
					<font color="black"><label for="Nombre">Nombre *</label></font>
			
			</td>
			<td>		
					<input type="text" onchange="this.value=this.value.toUpperCase();" name="ra2.nombre"  id="nombreRa2" class="required form-control ocultarEA" value="${perfilAlumno.responsable2.nombre}">
			</td>
			<td></td>
		</tr>
		<tr>	
			<td>
					<font color="black"><label>Apellido *</label></font>
			</td>
			<td>		
					<input type="text"  onchange="this.value=this.value.toUpperCase();" name="ra2.apellido" id="apellidoRa2"  class="required form-control ocultarEA" value="${perfilAlumno.responsable2.apellido}">
			</td>
			<td></td>
		</tr>
		
		<tr>
		<td><label>Tipo de DNI</label></td>
		<td>
			<select name="ra2.tipoDNI" id="ra2.tipoDNI" class="required form-control ocultarEA" style="width:200px">
				<c:forEach items="${listDni}" var="dni">
					<c:choose>
						<c:when test="${perfilAlumno.responsable2.idTipoDni.id == dni.id}">
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
		<td><input type="text" id="DNIRa2" name="ra2.DNI" class="digits required form-control ocultarEA" maxlength="8" 
			onkeypress="validarDNI('dniResponsable')" onkeyup="generarCuil('${perfilAlumno.beca}')" value="${perfilAlumno.responsable2.dni}"></input> 
			<label id="dniResponsableError" style="color: green; display: none;">Ingrese un DNI válido</label></td>
			<td></td>
	</tr>
		<tr>
		<td><font color="green"><label>Pais *</label></font></td>
		<td><!-- input type="text" 	id="ra2.nacionalidad" name="ra2.nacionalidad" class="required" value="${perfilAlumno.responsable2.nacionalidad}"></td-->
			<select name="ra2.nacionalidad" id="nacionalidadRa2" class="required form-control ocultarEA" style="width:200px">
					<c:choose>
    					<c:when test="${perfilAlumno.responsable2.nacionalidad == 'Argentina'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Bolivia'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Brasil'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Chile'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Colombia'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Ecuador'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Paraguay'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Perú'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Uruguay'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Venezuela'}">
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
					    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Cuba'}">
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
			M&nbsp;<input type="radio" id="ra2.sexoM" name="responsable2.sexo"  class="ocultarEA"onclick="generarCuil()" 
			<c:if test="${perfilAlumno.responsable2.sexo}"> checked="checked"</c:if> value="true" class="required"> 
			F&nbsp;<input type="radio" id="ra2.sexoF" name="responsable2.sexo"  class="ocultarEA"onclick="generarCuil()"
			<c:if test="${perfilAlumno.responsable2.sexo == false}"> checked="checked"</c:if> value="false" class="required">
		</td>
		<td></td>
	</tr>
	<tr>
		<td><font color="green"><label for="fechaNacimiento">Fecha de Nacimiento: *</label></font></td>
		<td>	
			<input name="ra2.fechaNacimiento" class="form-control ocultarEA" style="width:200px"id="fechaNacimientoRa2"  value="<fmt:formatDate value="${perfilAlumno.responsable2.fechaNacimiento}" pattern="dd/MM/yyyy"/>" > 	
		</td>
		<td></td>
	</tr>	
		
		<tr>
			<td>
					<font color="black"><label>Vínculo *</label></font>
			</td>
			<td>
						<select name="vinculoRA2" id="vinculoRespo2"  class="required form-control ocultarEA" style="width:200px">
							<option value="">Seleccione una opci&oacute;n:</option>
							<c:forEach items="${listVinculo}" var="vinculo">
								<c:choose>
									<c:when test="${perfilAlumno.responsable2.idVinculo.id == vinculo.id}">
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
					<label>Teléfono</label> 
			</td>
			<td>	
						<input type="text" onchange="this.value=this.value.toUpperCase();"  class="form-control ocultarEA" name="ra2.telefono" id="ra2.telefono" 
						value="${perfilAlumno.responsable2.telefono }" class="digits form-control"/>
			</td>
			<td></td>
				
		</tr>
		
		
	<tr>
		<td><label>CUIL *</label></td>
		<td>
			<input type="text" name="ra2.cuilCuit" id="cuilRa2" class=" form-control ocultarEA"  disabled="disabled" readonly="readonly"
				value="${perfilAlumno.responsable2.cuilCuit}">
		</td>
		<td></td>
	</tr>
	
	<tr>
		<td><font color="green"><label>Banco * </label></font></td>
		<td>
			<input type="hidden" name="ra2.bancoID" id="idBancoRa2" value="${perfilAlumno.responsable2.sucursalBanco.banco.id}">
			<input type="text" class="form-control ocultarEA"id="bancoRa2" name="ra2.banco"disabled="disabled" readonly="readonly" value="${perfilAlumno.responsable2.sucursalBanco.banco.nombre}">
		</td>
		<td></td>
	</tr>
	
	<tr>
		<td><font color="green"><label>Sucursal * </label></font></td>
		<td>
		<input type="hidden" name="ra2.sucursalID" id="idSucursalRa2" value="${perfilAlumno.responsable2.sucursalBanco.id}">
         <select id="sucursalRa2" name="ra2.sucursal" class="required form-control ocultarEA" onchange="seleccionarBanco(this.value)" style="width:600px" >
				<option value=""> Seleccione una opci&oacute;n:</option>
				<c:forEach items="${sucursales}" var="sucursal">
					<c:choose>
						<c:when test="${perfilAlumno.responsable2.sucursalBanco.id == sucursal.id}">
							<option value="${sucursal.id}" selected="selected">${sucursal.id},${sucursal.banco.nombre}, ${sucursal.zona.nombre}, ${sucursal.numeroSucursal}, ${sucursal.direccion}</option>
						</c:when>
						<c:otherwise>
							<option value="${sucursal.id}">${sucursal.id},${sucursal.banco.nombre}, ${sucursal.zona.nombre}, ${sucursal.numeroSucursal}, ${sucursal.direccion}</option>
						</c:otherwise>	
					</c:choose>
				</c:forEach>
		</select>
       </td>
       <td></td>
	</tr>
	<sec:authorize access="hasRole('ADM') or hasRole('SYS')">
		<tr>
			<td><label>Nro. de Cuenta</label></td>
			<td>
				<c:if test="${perfilAlumno.beca != null}">
					<input type="text" id="ra2.nroCuenta" class="form-control ocultarEA"name="ra2.nroCuenta" maxlength="15" value="${perfilAlumno.responsable2.nroCuenta}">
					<input type="hidden" id="ra2.modificarCuenta" name="ra2.modificarCuenta" value="true"></input>
				</c:if>
				
				<c:if test="${perfilAlumno.beca == null}">
					<!-- <input type="text" id="nroCuenta" name="responsable1.nroCuenta"  disabled="disabled" value="${perfilAlumno.responsable1.nroCuenta}">  -->
					<label>${perfilAlumno.responsable2.nroCuenta}</label>
					<input type="hidden" id="ra2.modificarCuenta" class="form-control ocultarEA" name="ra2.modificarCuenta" value="false"></input>
				</c:if>	
			
			</td>
			<td></td>
		</tr>		
	</sec:authorize>
	<tr>
	
		<tr>
			<td><label>CBU (22 dígitos)</label></td>
			<td>				
				<input type="text" name="ra2.cbu" id="cbuRa2" class="form-control ocultarEA" maxlength="22" onchange="llenarCta()" onblur="llenarCta()" onclick="llenarCta()" value="${perfilAlumno.responsable2.celular}">					
			</td>
			<td></td>
		</tr>		
	
	
	
	
		
		
		
		
		
		</c:when>
		
		<c:otherwise >
		<br>
<!-- 		DMS cuando el titular de cuenta es el ra1 quito los required del ra2 para que peermita hacer submit, -->
<!-- 		si agrego titular de cuenta se activan los required con otra funcion. Los seteo aca porque cuando la pagina levanta
			con ra2 tiene que tener los required -->
		<script>

		$(document).ready(function(){
		$("#nombreRa2").removeClass("required");
		$("#apellidoRa2").removeClass("required");
		$("#DNIRa2").removeClass("required");
		$("#nacionalidadRa2").removeClass("required");
		$("#fechaNacimientoRa2").removeClass("required");
		$("#vinculoRespo2").removeClass("required");
		$("#cuilRa2").removeClass("required");
		$("#bancoRa2").removeClass("required");
		$("#sucursalRa2").removeClass("required");
		});
		</script>
		<tr class="datosBancoRa1">
			<td><h3>Mismo Ra</h3>	</td>
			<td> <input type="button" value="agregar titular de cuenta" class="ocultarEA" onclick="desplegarRa2()"/></td>
			<td></td>
		</tr>
		
		
		
		<tr class="datosBancoRa1">
		<td><label>CUIL *</label></td>
		<td>
			<input type="text" name="responsable1.cuilCuit" id="cuil" class="required form-control ocultarEA"  disabled="disabled" readonly="readonly"
				value="${perfilAlumno.responsable1.cuilCuit}">
		</td>
		<td></td>
	</tr>
	
	<tr class="datosBancoRa1">
		<td><font color="green"><label>Banco * </label></font></td>
		<td>
			<input type="hidden" name="bancoID" id="bancoID" value="${perfilAlumno.responsable1.sucursalBanco.banco.id}">
			<input type="text" id="banco" class="form-control ocultarEA" disabled="disabled" readonly="readonly" value="${perfilAlumno.responsable1.sucursalBanco.banco.nombre}">
		</td>
	</tr>
	
	<tr class="datosBancoRa1">
		<td><font color="green"><label>Sucursal * </label></font></td>
		<td>
		<input type="hidden" name="sucursalID" id="sucursalID" value="${perfilAlumno.responsable1.sucursalBanco.id}">
         <select id="sucursal" name="sucursal" class="required form-control ocultarEA" onchange="seleccionarBanco(this.value)" style="width:600px">
				<option value=""> Seleccione una opci&oacute;n:</option>
				<c:forEach items="${sucursales}" var="sucursal">
					<c:choose>
						<c:when test="${perfilAlumno.responsable1.sucursalBanco.id == sucursal.id}">
							<option value="${sucursal.id}" selected="selected">${sucursal.id},${sucursal.banco.nombre}, ${sucursal.zona.nombre}, ${sucursal.numeroSucursal}, ${sucursal.direccion}</option>
						</c:when>
						<c:otherwise>
							<option value="${sucursal.id}">${sucursal.id},${sucursal.banco.nombre}, ${sucursal.zona.nombre}, ${sucursal.numeroSucursal}, ${sucursal.direccion}</option>
						</c:otherwise>	
					</c:choose>
				</c:forEach>
		</select>
       </td>
       <td></td>
	</tr>
	<sec:authorize access="hasRole('ADM') or hasRole('SYS')">
		<tr class="datosBancoRa1">
			<td><label>Nro. de Cuenta</label></td>
			<td>
				<c:if test="${perfilAlumno.beca != null}">
					<input type="text" id="nroCuenta" name="responsable1.nroCuenta" class="form-control ocultarEA" maxlength="15" value="${perfilAlumno.responsable1.nroCuenta}">
					<input type="hidden" id="modificarCuenta" name="modificarCuenta" value="true"></input>
				</c:if>
				<c:if test="${perfilAlumno.beca == null}">
					<!-- <input type="text" id="nroCuenta" name="responsable1.nroCuenta"  disabled="disabled" value="${perfilAlumno.responsable1.nroCuenta}">  -->
					<label>${perfilAlumno.responsable1.nroCuenta}</label>
					<input type="hidden" id="modificarCuenta" name="modificarCuenta" class="form-control ocultarEA"value="false"></input>
				</c:if>	
			</td>
		</tr>		
	</sec:authorize>
	<sec:authorize access="not hasRole('ADM') and not hasRole('SYS')">
		<tr class="datosBancoRa1">
			<td><label>Nro. de Cuenta</label></td>
			<td>
				<!-- <input type="text" id="nroCuenta" name="responsable1.nroCuenta"  disabled="disabled" value="${perfilAlumno.responsable1.nroCuenta}">  -->
				<label >${perfilAlumno.responsable1.nroCuenta}</label>
			</td>
		</tr>
		<input type="hidden" id="modificarCuenta" name="modificarCuenta" value="false"></input>
	</sec:authorize>
	
		<tr class="datosBancoRa1">
			<td><label>CBU (22 dígitos)</label></td>
			<td>				
				<input type="text" name="cbu" id="cbu"class="form-control ocultarEA" style="width:200px"  maxlength="22" onchange="llenarCta()" onblur="llenarCta()" onclick="llenarCta()" value="${perfilAlumno.responsable1.celular}">					
			</td>
		</tr>		
	
		
		</c:otherwise>
		</c:choose>
		
		
		
	</table>
	</br>
	</br>
	
	
	
<div id="nuevoRa2">	
<!-- dms si no hay ra2 permite visualizar los datos de carga al desocultarlos con el boton.
si hay ra2 desaparece este codigo para que no traiga conflictos con la otra parte-->
<c:choose>
<c:when test="${perfilAlumno.responsable2==null}">	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all" align="left"  ><legend>Datos Nuevo Titular Cuenta Bancaria</legend></h3>
	
		<table width="100%" align="left" cellspacing="3">
		
	<%-- 		<input type="hidden"   name="ra2.id"id="ra2.id" value="${perfilAlumno.responsable2.id}"> --%>
			
			<tr>
				<td>
						<font color="black"><label for="Nombre">Nombre *</label></font>
				
				</td>
				<td>		
						<input type="text" onchange="this.value=this.value.toUpperCase();" name="ra2.nombre"  id="nombreRa2" class=" required form-control ocultarEA" value="${perfilAlumno.responsable2.nombre}">
				</td>
				<td></td>
			</tr>
			<tr>	
				<td>
						<font color="black"><label>Apellido *</label></font>
				</td>
				<td>		
						<input type="text"  onchange="this.value=this.value.toUpperCase();" name="ra2.apellido" id="apellidoRa2"  class="required form-control ocultarEA" value="${perfilAlumno.responsable2.apellido}">
				</td>
				<td></td>
			</tr>
			
			<tr>
			<td><label>Tipo de DNI</label></td>
			<td>
				<select name="ra2.tipoDNI" id="ra2.tipoDNI" class=" form-control ocultarEA" style="width:200px">
					<c:forEach items="${listDni}" var="dni">
						<c:choose>
							<c:when test="${perfilAlumno.responsable2.idTipoDni.id == dni.id}">
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
			<td><input type="text" id="DNIRa2" name="ra2.DNI" class=" required digits  form-control ocultarEA" maxlength="8" 
				onkeypress="validarDNI('dniResponsable')" onkeyup="generarCuil('${perfilAlumno.beca}')" value="${perfilAlumno.responsable2.dni}"></input> 
				<label id="dniResponsableError" style="color: green; display: none;">Ingrese un DNI válido</label></td>
				<td></td>
		</tr>
			<tr>
			<td><font color="green"><label>Pais *</label></font></td>
			<td><!-- input type="text" 	id="ra2.nacionalidad" name="ra2.nacionalidad" class="required" value="${perfilAlumno.responsable2.nacionalidad}"></td-->
				<select name="ra2.nacionalidad" id="nacionalidadRa2" class="required form-control ocultarEA" style="width:200px">
						<c:choose>
	    					<c:when test="${perfilAlumno.responsable2.nacionalidad == 'Argentina'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Bolivia'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Brasil'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Chile'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Colombia'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Ecuador'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Paraguay'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Perú'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Uruguay'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Venezuela'}">
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
						    <c:when test="${perfilAlumno.responsable2.nacionalidad == 'Cuba'}">
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
				M&nbsp;<input type="radio" id="ra2.sexoM" name="responsable2.sexo"  class="ocultarEA"onclick="generarCuil()" 
				<c:if test="${perfilAlumno.responsable2.sexo}"> checked="checked"</c:if> value="true" class=""> 
				F&nbsp;<input type="radio" id="ra2.sexoF" name="responsable2.sexo"  class="ocultarEA"onclick="generarCuil()"
				<c:if test="${perfilAlumno.responsable2.sexo == false}"> checked="checked"</c:if> value="false" class="">
			</td>
			<td></td>
		</tr>
		<tr>
			<td><font color="green"><label for="fechaNacimiento">Fecha de Nacimiento: *</label></font></td>
			<td>	
				<input name="ra2.fechaNacimiento" class="required form-control ocultarEA" style="width:200px"id="fechaNacimientoRa2"  value="<fmt:formatDate value="${perfilAlumno.responsable2.fechaNacimiento}" pattern="dd/MM/yyyy"/>" > 	
			</td>
			<td></td>
		</tr>	
			
			<tr>
				<td>
						<font color="black"><label>Vínculo *</label></font>
				</td>
				<td>
							<select name="vinculoRA2" id="vinculoRespo2"  class="required form-control ocultarEA" style="width:200px">
								<option value="">Seleccione una opci&oacute;n:</option>
								<c:forEach items="${listVinculo}" var="vinculo">
									<c:choose>
										<c:when test="${perfilAlumno.responsable2.idVinculo.id == vinculo.id}">
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
						<label>Teléfono</label> 
				</td>
				<td>	
							<input type="text" onchange="this.value=this.value.toUpperCase();"  class="form-control ocultarEA" name="ra2.telefono" id="ra2.telefono" 
							value="${perfilAlumno.responsable2.telefono }" class="digits form-control"/>
				</td>
				<td></td>
					
			</tr>
			
			
		<tr>
			<td><label>CUIL *</label></td>
			<td>
				<input type="text" name="ra2.cuilCuit" id="cuilRa2" class="required form-control ocultarEA"  disabled="disabled" readonly="readonly"
					value="${perfilAlumno.responsable2.cuilCuit}">
			</td>
			<td></td>
		</tr>
		
		<tr>
			<td><font color="green"><label>Banco * </label></font></td>
			<td>
	<%--  DMS cuando agrego Ra2 no tiene banco 		
		<input type="hidden" name="ra2.bancoID" id="idBancoRa2" value="${perfilAlumno.responsable2.sucursalBanco.banco.id}"> --%>
				<input type="text" class="required form-control ocultarEA"id="bancoRa2" name="ra2.banco" disabled="disabled" readonly="readonly"value="${perfilAlumno.responsable2.sucursalBanco.banco.nombre}">
			</td>
			<td></td>
		</tr>
		
		<tr>
			<td><font color="green"><label>Sucursal * </label></font></td>
			<td>
			<input type="hidden" name="ra2.sucursalID" id="idSucursalRa2" value="${perfilAlumno.responsable2.sucursalBanco.id}">
	         <select id="sucursalRa2" name="ra2.sucursal" class="required form-control ocultarEA" onchange="seleccionarBanco(this.value)" style="width:600px" >
					<option value=""> Seleccione una opci&oacute;n:</option>
					<c:forEach items="${sucursales}" var="sucursal">
						<c:choose>
							<c:when test="${perfilAlumno.responsable2.sucursalBanco.id == sucursal.id}">
								<option value="${sucursal.id}" selected="selected">${sucursal.id},${sucursal.banco.nombre}, ${sucursal.zona.nombre}, ${sucursal.numeroSucursal}, ${sucursal.direccion}</option>
							</c:when>
							<c:otherwise>
								<option value="${sucursal.id}">${sucursal.id},${sucursal.banco.nombre}, ${sucursal.zona.nombre}, ${sucursal.numeroSucursal}, ${sucursal.direccion}</option>
							</c:otherwise>	
						</c:choose>
					</c:forEach>
			</select>
	       </td>
	       <td></td>
		</tr>
		<sec:authorize access="hasRole('ADM') or hasRole('SYS')">
			<tr>
				<td><label>Nro. de Cuenta</label></td>
				<td>
					<c:if test="${perfilAlumno.beca != null}">
						<input type="text" id="nroCuentaRa2" class="form-control ocultarEA"name="ra2.nroCuenta" maxlength="15" value="${perfilAlumno.responsable2.nroCuenta}">
						<input type="hidden" id="ra2.modificarCuenta" name="ra2.modificarCuenta" value="true"></input>
					</c:if>
					
					<c:if test="${perfilAlumno.beca == null}">
						<!-- <input type="text" id="nroCuenta" name="responsable1.nroCuenta"  disabled="disabled" value="${perfilAlumno.responsable1.nroCuenta}">  -->
						<label>${perfilAlumno.responsable2.nroCuenta}</label>
						<input type="hidden" id="modificarCuentaRa2" class="form-control ocultarEA" name="ra2.modificarCuenta" value="false"></input>
					</c:if>	
				
				</td>
				<td></td>
			</tr>		
		</sec:authorize>
		<tr>
		
			<tr>
				<td><label>CBU (22 dígitos)</label></td>
				<td>				
					<input type="text" name="ra2.cbu" id="ra2.cbu" class="form-control ocultarEA" maxlength="22" onchange="llenarCta()" onblur="llenarCta()" onclick="llenarCta()" value="${perfilAlumno.responsable2.celular}">					
				</td>
				<td></td>
			</tr>		
		
		
		
		
			
			
			
			
			
		
		
		
			<sec:authorize access="not hasRole('CORR')">
			<c:if test="${perfilAlumno.beca != null}">
				<tr>
					<td>
						<label>Reapertura de cuenta</label>
					</td>
					<td>
						<input type="checkbox" id="reapertura" name="reapertura" disabled="disabled" onclick="grisarCuenta()"/>
					</td>
				<td></td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="display: none;" id="divReapertura">
							<label style="color:green">Recordá que si querés hacer un cambio de cuenta bancaria tenés que tildar el check con el pedido de reapertura</label>
						</div>
					</td>
				<td></td>
				</tr>
			</c:if>		
		</sec:authorize>
		
		<tr>
			<td>
				<input type="button" value="volver" onclick="ocultarNuevoRa2()"/>
			</td>
		</tr>
		
		</table>
		
	</c:when>	
</c:choose>		
</div>
		
	<!-- DOMICILIO RA -->
	
<!--	<input type="hidden" id="idLocalidadRA" name="perfilAlumno.responsable1.idLocalidad"></input> -->

</body>
</html>