<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">

<script type="text/javascript">
$(function() {
	$("#tablaDatosPersonales :text").css("width","95px");
	
});

function habilitarBeca(estado){
	if(estado == 'si'){
		$("#cualBeca").removeAttr("disabled");
	}else{
		$("#cualBeca").attr("disabled","disabled");
	}
	
}

function habilitarMotivo(select){
	//funciona si la opcion "Otro" es la ultima del combo
	if(select.selectedIndex == select.length -1){
		$("#otroMotivoRechazo").removeAttr("disabled");
	}else{
		$("#otroMotivoRechazo").val("");
		$("#otroMotivoRechazo").attr("disabled","disabled");
	}
	
}

</script>



<fieldset style="width: 450px; height: auto; margin-left: 15px; background-color: #D6D6D6">
	<table align="left" width="550px">
		<tr>
			<td>
			<p><font color="green"><label for="fechaEntrevista">Fecha Entrevista:</label> </font>
				<input name="fechaEntrevista" id="fechaEntrevista"   value="<fmt:formatDate value="${entrevistaSeleccionDTO.entrevistaSeleccion.fechaEntrevista}" pattern="dd/MM/yyyy"/>" onChange="calcular_fecha(this.value)"  > 				
				<input type="hidden" name="excepcion" id="excepcion" value="No">
			</p>
		</td>
		</tr>
		
		
		
		
		<tr align="left">	
			<td align="left">
				<br>
				<br>
				<p>	<font color="green"><label style="font-size: 10px;">
						<b>Convocatoria *</b>
					</label></font> 
						<input id="convocatoria" type="text" name="entrevistaSeleccion.convocatoria.nombre" class="required" value="${entrevistaSeleccionDTO.entrevistaSeleccion.convocatoria.nombre}" onclick="limpiarConvocatoria()" onblur="chequearConvocatoria()" />
						<input type="hidden" name="idConvocatoria" 	id="idConvocatoria" value="${entrevistaSeleccionDTO.entrevistaSeleccion.convocatoria.idConvocatoria}"/>
				</p>
			</td>
		</tr>
		<tr>
			<td align="left">
			<br>
			<br>
			<p><font color="green"><label style="font-size: 10px"><b>Estado Alumno *</b></label></font> 
				<select 	name="estados" id="estados" class="required" onchange="habilitarInputEstadoAlumno(this.value)">
					<option value="">Seleccione una opci&oacute;n:</option>
					<c:forEach items="${listEstadoAlumnos}" var="estado">
						<c:choose>
							<c:when
								test="${entrevistaSeleccionDTO.perfilAlumno.estadoAlumno.id == estado.id}">
								<option value="${estado.id}" selected="selected">${estado.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${estado.id}" >${estado.valor}</option>
							</c:otherwise>
						</c:choose>
		
					</c:forEach>
				</select>
			</p>
			</td>
		</tr>
		<tr>
			<td ></td>
		</tr>
		<tr>
			<td align="left">
			<br>
			<br>
			<p><label style="font-size: 10px"><b>Motivo Rechazo</b></label>		
				<select name="idMotivoRechazo" disabled="disabled" id="motivoRechazo" onchange="habilitarMotivo(this)">
					<option id="idMotivoRechazo0" value="">Seleccione una opci&oacute;n:</option>
					<c:forEach items="${listMotivoRechazo}" var="motivoRech">
					<c:choose>
							<c:when
								test="${entrevistaSeleccionDTO.entrevistaSeleccion.motivoRechazo.id == motivoRech.id}">
								<option value="${motivoRech.id}"selected="selected">${motivoRech.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${motivoRech.id}">${motivoRech.valor}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</select> 
			</p>
			</td>
		</tr>
		<tr>
			<td align="left">
				<p><label style="font-size: 10px">Otro motivo rechazo</label>
					<form:textarea path="entrevistaSeleccion.otroMotivoRechazo" rows="4" cols="30" id="otroMotivoRechazo" disabled="true" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
				</p>
			</td>
		</tr>
		<tr>
			<td align="left">
			<br>
			<br>
			<p><label style="font-size: 10px"><b>Motivo Env&iacute;o TS</b></label>
				<select name="idMotivoTS" class="required" disabled="disabled" id="motivoEnvioTS" >
					<option id="motivoEnvioTS0" value="">Seleccione una opci&oacute;n:</option>
					<c:forEach items="${listMotivoEnvioTS}" var="motivoEnvioTS">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.motivoEnvioTS.id == motivoEnvioTS.id}">
								<option value="${motivoEnvioTS.id}" selected="selected">${motivoEnvioTS.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${motivoEnvioTS.id}">${motivoEnvioTS.valor}</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>				
				</select>
			</p>
			</td>
		</tr>
		<tr>
			<td align="left">
			<br>
			<br>
			<p><label style="font-size: 10px">Observaciones para TS</label>
				<form:textarea disabled="true" path="perfilAlumno.responsable1.observacionesParaTS" rows="4" cols="30" id="observacionesParaTS" onblur="chequearLongitudRA(this);" onkeypress="chequearLongitudRA(this);"/>
			</p>
			</td>
		</tr>
			
	</table>
</fieldset>

    
<!-- Datos Personales -->
<table id="tablaDatosPersonales" align="left" cellspacing="8">
	<tr>
		<td colspan="3">
	</tr>
	<tr>
		<td></td>
		<td>
			
		</td>
		
		<td></td>
	</tr>
	
	<tr>
		<td colspan="3">		
			<font color="blue" size="2">
			Si tenés duda con algún dato del Candidato/a y/o Responsable hacé click en el siguiente link</font>
			<br><br>			
			<a href="http://www.buscardatos.com" target="_blank"><font size="2">Padrón electoral</font></a> (Buscás por apellido o DNI)						 				
		</td>
	</tr>
	<tr>
		<td>
			<p>
				<label for="Nombre" ><font color="green">Nombre *</font></label> 
				<input type="text" 	onchange="this.value=this.value.toUpperCase();"    id="alumnoNombre" name="perfilAlumno.datosPersonales.nombre"  class="required" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nombre}" >
			</p>
					
		</td>
		<td>	
			<p>			
				<font color="green"><label for="Apellido">Apellido *</label></font> 
				<input type="text" 	onchange="this.value=this.value.toUpperCase();"  id="alumnoApellido" name="perfilAlumno.datosPersonales.apellido" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.apellido}">
			</p>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>
			<p>
				<font color="green"><label>Tipo  de DNI *</label> </font>
					<select name="tipo" id="dni" class="required">
						<option value="">Seleccione una opci&oacute;n:</option>
						<c:forEach items="${listDni}" var="dni">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.tipoDni.id == dni.id}">
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
		<td >
			<p><c:choose>
				<c:when test="${accion == 'modificar'}">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td><font color="green"><label for="dniAlumno">DNI *</label></font></td>
							<td><input type="text" id="dniAlumno"
									   name="perfilAlumno.datosPersonales.dni" class="digits"  maxlength="8" 
									   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  ></td>
							<td><label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
						</tr>
					</table>
				</c:when>
				<c:when test="${accion == 'carga'}">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td><font color="green"><label for="dniAlumno">DNI *</label></font></td>
							<td><input type="text" id="dniAlumno" disabled="disabled"
									   name="perfilAlumno.datosPersonales.dni" class="digits"  maxlength="8" 
									   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  ></td>
							<td><label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
						</tr>
					</table>
				</c:when>
				<c:when test="${accion == 'alta'}">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td><font color="green"><label for="dniAlumno">DNI *</label></font></td>
							<td><input type="text" id="dniAlumno" onblur="buscarAlumno()" 
									   name="perfilAlumno.datosPersonales.dni" class="digits"  maxlength="8" 
									   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  ></td>
							<td><label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
						</tr>
					</table>
				</c:when>
				<c:when test="${accion == 'ver'}">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td><font color="green"><label for="dniAlumno">DNI *</label></font></td>
							<td><input type="text" id="dniAlumno" disabled="disabled"
									   name="perfilAlumno.datosPersonales.dni" class="digits"  maxlength="8" 
									   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  ></td>
							<td><label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
						</tr>
					</table>
				</c:when>
			</c:choose>
		</td>
		<td></td>
	</tr>
	<tr>
		<td >
			<p>
				<font color="green"><label>Pais</label></font> 
				<!-- input type="text"  onchange="this.value=this.value.toUpperCase();"	id="alumnoNacionalidad" name="perfilAlumno.datosPersonales.nacionalidad" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad}"-->
				<select name="alumnoNacionalidad" id="alumnoNacionalidad" class="required" onchange="habilitarInputEstadoAlumno(this.value)">
					<c:choose>
    					<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Argentina'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Bolivia'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Brasil'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Chile'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Colombia'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Ecuador'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Paraguay'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Perú'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Uruguay'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Venezuela'}">
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
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Cuba'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Argentina" >Argentina</option>
							<option value="Bolivia">Bolivia</option>
							<option value="Brasil">Brasil</option>							
							<option value="Chile">Chile</option>
							<option value="Colombia">Colombia</option>
							<option value="Cuba" selected="selected" >Cuba</option>
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
		<td>
			<p>
				<font color="green"><label>Sexo *</label></font>
					M<input type="radio" id="alumnoSexoM" name="perfilAlumno.datosPersonales.sexo" 
					<c:if test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo}"> checked="checked"</c:if> value="true"> 
					F<input type="radio" id="alumnoSexoF" name="perfilAlumno.datosPersonales.sexo"
					<c:if test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo == false}"> checked="checked"</c:if> value="false">
			</p>
		</td>
		<td>
			<p><font color="green"><label for="fechaNacimiento">Fecha de Nacimiento *</label> </font>
				<input name="fechaNacimientoCandidato" id="fechaNacimiento"  onChange="calcular_edad(this.value)"  class="date required" value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>"  > 
				<input name="input_id_2" id="input_id_2" type="hidden">
			</p>
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="height: 15px;"></td><td></td><td></td>
	</tr>
	<tr >
		<td >
			<p>
				<font color="green"><label>Escuela *</label></font>
				<input type="hidden" name="idEscuela" 	id="idEscuela" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.id}"/>
				<input id="escuela" type="text" name="perfilAlumno.escuelaSeleccion.nombre" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.nombre}" onchange="limpiarComboBanco(this);" />
				
			</p>
		</td>
		<td>
			<p>
				<font color="green"><label>Zona Cimientos *</label> </font>
					<input type="hidden" name="perfilAlumno.escuelaSeleccion.zona.id" id="idZonaCimientos" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.id}" />
					<input id="zonaCimientos" name="perfilAlumno.escuelaSeleccion.zona.nombre" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.nombre}"  disabled="disabled"/>
					EAE:<input id="eae" name="eae" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae}"  disabled="disabled"/>
			</p>
		</td>
		<td></td>
	</tr>
	<tr>
		
		<c:choose>			
			<c:when test="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae=='6/6'}">
				<td>
					<p>
					<font color="green"><label>Año Escolar 6/6*</label></font>				
						<select name="anioEscuela" id="anioEscuela" class="required" >
							<option value="">Seleccione una opci&oacute;n:</option>
							<c:forEach items="${listAnioEscolar}" var="anioEscolar">							
								<c:choose>										
									<c:when test="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.id == anioEscolar.id}">
										<option  value="${anioEscolar.id}" selected="selected">${anioEscolar.valor}</option>
									</c:when>													
									<c:otherwise>																																			
										<c:choose>
											<c:when test="${anioEscolar.id == 8 }">
												<option value="${anioEscolar.id}" disabled="disabled">${anioEscolar.valor} </option>
											</c:when>
											<c:otherwise>											
												<option value="${anioEscolar.id}">${anioEscolar.valor} </option>																				
											</c:otherwise>	
										</c:choose>								
									</c:otherwise>
								</c:choose>	
							</c:forEach>
						</select>					
					<!-- font color="green"><label>Año Escolar PFE</label></font--> 
					<input type="hidden" id="ae" name="ae" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.valor}">
					<input type="hidden" id="idAe" name="idAe" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar}">
				
					<!-- font color="green"><label>Año Escolar real</label></font--> 
					
				</td>				
			</c:when>
			<c:when test="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae=='7/5'}">
				<td>
					<p>
						<font color="green"><label>Año Escolar 7/5*</label></font> 
							<select name="anioEscuela" id="anioEscuela" class="required" >
								<option value="">Seleccione una opci&oacute;n:</option>
								<c:forEach items="${listAnioEscolar}" var="anioEscolar">							
									<c:choose>										
										<c:when test="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.id == anioEscolar.id}">
											<option  value="${anioEscolar.id}" selected="selected">${anioEscolar.valor}</option>
										</c:when>													
										<c:otherwise>																																			
											<c:choose>
												<c:when test="${anioEscolar.id == 15}">
													<option value="${anioEscolar.id}" disabled="disabled">${anioEscolar.valor} </option>
												</c:when>
												<c:otherwise>											
													<option value="${anioEscolar.id}">${anioEscolar.valor} </option>																				
												</c:otherwise>	
											</c:choose>								
										</c:otherwise>
									</c:choose>	
								</c:forEach>
							</select>
					</p>
					<!-- font color="green"><label>Año Escolar PFE</label></font--> 
					<input type="hidden" id="ae" name="ae" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.valor}">
					<input type="hidden" id="idAe" name="idAe" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar}">
				</td>				
			</c:when>
			<c:otherwise>
				<td>
					<font color="green"><label>Año Escolar*</label></font>
					<select name="anioEscuela" id="anioEscuela" class="required" >
						<option value="">Seleccione una opci&oacute;n:</option>
					</select>
				</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>
		
	</tr>
	
	
	<tr>	
		<td>
			<p>
				<label>División</label> 
					<input 	name="perfilAlumno.division" id="alumnoDivision" value="${entrevistaSeleccionDTO.perfilAlumno.division }"	 >
			</p>
				 	
		</td>
	</tr>
	<tr>
		<td>
			<p>
				<font color="green"><label>Turno *</label></font>
		 			<select name="turno" id="turno" class="required">
		 				<option value="">Seleccione una opci&oacute;n:</option>
						<c:forEach items="${listTurno}" var="turno">
							<c:choose>
								<c:when test="${entrevistaSeleccionDTO.perfilAlumno.turno.id == turno.id}">
									<option value="${turno.id}" selected="selected">${turno.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${turno.id}">${turno.valor}</option>
								</c:otherwise>	
							</c:choose>
					</c:forEach>
				</select>
			</p>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<p>
				<label>Orientación</label>
					<form:textarea path="entrevistaSeleccion.orientacion" rows="4" cols="40"  id="orientacion" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</p>
		</td>
	</tr>
	
	
	<tr>
		<td>
			<p>
				<label>¿Recibe otra Beca?</label>
					Si<input type="radio" id="alumnoRecibeOtraBeca" name="entrevistaSeleccion.recibeOtraBeca" onfocus="habilitarBeca('si')"
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca}"> checked="checked"</c:if> value="true"> 
					No<input type="radio" id="alumnoRecibeOtraBeca" name="entrevistaSeleccion.recibeOtraBeca" onfocus="habilitarBeca('no')"
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca == false}"> checked="checked"</c:if> value="false">
			</p>
		</td>
		<td><p>
				<label>Cuál</label>
					<input type="text" name="entrevistaSeleccion.cualBeca" id="cualBeca" value="${entrevistaSeleccionDTO.entrevistaSeleccion.cualBeca}" disabled="disabled">
			</p> 
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="height: 10px;"></td><td></td><td></td>
	</tr>
	<tr>
		<td>
			<p>
				<font color="green"><label>Calle *</label></font> 
					<input type="text" onchange="this.value=this.value.toUpperCase();" id="alumnoDireccion" name="perfilAlumno.datosPersonales.direccion" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.direccion }">
			</p>
		</td>
		<td></td>
		<td>
		</td>
	</tr>
	
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0">
					<tr>
						<td><font color="green"><label>Número *</label></font></td>
						<td><input type="text"  onchange="this.value=this.value.toUpperCase();"  id="alumnoNumero" name="perfilAlumno.datosPersonales.numeroCalle" class="required" 
							value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.numeroCalle }">
						</td>
						<td><label id="numeroAlumnoError" style="color: red; display: none;">Solo puede ingresar Numero </label></td>
					</tr>
			</table>
			
		</td>
		<td>
			<table cellpadding="0" cellspacing="0">
					<tr>
						<td><label>Piso/Manzana</label></td>
						<td><input type="text"  onchange="this.value=this.value.toUpperCase();"   id="alumnoPiso" name="perfilAlumno.datosPersonales.piso" class="" 
							value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.piso }">
						</td>
						<td><label id="pisoAlumnoError" style="color: red; display: none;">Solo puede ingresar Numero </label></td>
					</tr>
			</table>
		<p>
				
					
			</p>
		</td>
	</tr>
	<tr>		
		<td>
			<p>
				<label>Casa/Departamento </label> 
					<input type="text" onchange="this.value=this.value.toUpperCase();"	  id="alumnoEntreCalles" name="perfilAlumno.datosPersonales.departamento" 
				 	value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.departamento}" >
			</p>
			
		</td>
	
	
	
		<td>
			<p>
				<label><font color="green">Entre Calles *</font></label> 
					<input type="text"  onchange="this.value=this.value.toUpperCase();" 	id="alumnoEntreCalles" name="perfilAlumno.datosPersonales.entreCalles" 
					 	value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.entreCalles}" class="required">
			</p>
		</td>
	</tr>
	<tr>
		<td>
			<p>
				<font color="green"><label>Barrio *</label></font>
					<input type="text" onchange="this.value=this.value.toUpperCase();"  id="barrio" name="perfilAlumno.datosPersonales.barrio"
						value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.barrio}" class="required">
			</p>
		</td>
		<td>
			<p>
				<font color="green"><label>Código Postal *</label></font> 
					<input type="text" onchange="this.value=this.value.toUpperCase();"  id="alumnoCodigoPostal" name="perfilAlumno.datosPersonales.codigoPostal" class="required"  value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.codigoPostal}"> 
			</p>
		</td>
	</tr>
		
	<tr>
		<td>
			<p>
				<font color="green"><label>Localidad *</label></font>
					<select name="perfilAlumno.datosPersonales.localidad.id" id="localidadAlumno" style="width: 208px;" class="required">
						<option value="">Seleccione una opci&oacute;n:</option>
						<c:forEach items="${localidades}" var="localidad">
							<c:choose>
								<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.localidad.id == localidad.id}">
									<option value="${localidad.id}" selected="selected">${localidad.nombre}</option>
								</c:when>
								<c:otherwise>
									<option value="${localidad.id}" title="${localidad.nombre}" style="width: 150px;"> ${localidad.nombre}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>			
					</select>
		   </p>
		</td>
		<td>
			<p>
				<font color="green"><label>Provincia * </label></font>
					<select name="perfilAlumno.datosPersonales.provincia.id" id="provinciaAlumno" class="required">
						<option value="">Seleccione una opci&oacute;n:</option>
						<c:forEach items="${listProvincias}" var="provincia">
							<c:choose>
								<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.provincia.id == provincia.id}">
									<option value="${provincia.id}" selected="selected">${provincia.descripcion}, ${provincia.pais}</option>
								</c:when>
								<c:otherwise>
									<option value="${provincia.id}">${provincia.descripcion}, ${provincia.pais}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>			
					</select>
		   </p></td>
		<td></td>
	</tr>
		
	<tr>
		<td>
			<p><font color="green"><label for="telefono">Teléfono (cargá el código de área) *</label></font> 
				<input type="text" 	name="perfilAlumno.datosPersonales.telefono" id="alumnoTelefono" maxlength="19"
				class="required" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.telefono}" onkeypress="return justNumbers(event);"/>
			</p>
		</td>
		<td></td>
		<td></td>
	</tr>
	
	<tr>
		<td>
			<p>
				<label for="contacto1">Teléfono 1 (cargá el código de área)</label> 
					<input type="text"  onchange="this.value=this.value.toUpperCase();"  maxlength="19"  name="perfilAlumno.telefono1" id="telefono1"
					value="${entrevistaSeleccionDTO.perfilAlumno.telefono1}" onkeypress="return justNumbers(event);" />
			</p>
			
		</td>
		
		<td>
			<p>
				<label for="contacto1">Contacto 1</label> 
					<input type="text"   onchange="this.value=this.value.toUpperCase();" name="perfilAlumno.contactoTelefono1" id="alumnoContactoTelefono1"
					value="${entrevistaSeleccionDTO.perfilAlumno.contactoTelefono1}"/>
			</p>
		</td>
	   	<td></td>
	</tr>
	
	<tr>
		<td>
			<p>
				<label for="contacto2">Teléfono 2 (cargá el código de área)</label> 
					<input type="text"  onchange="this.value=this.value.toUpperCase();" 	maxlength="19" name="perfilAlumno.telefono2" id="telefono2"
					value="${entrevistaSeleccionDTO.perfilAlumno.telefono2}" onkeypress="return justNumbers(event);"/>
			</p>
			
	   	</td>
	   	<td>
			<p>
				<label for="contacto2">Contacto 2</label> 
					<input type="text"  onchange="this.value=this.value.toUpperCase();" 	name="perfilAlumno.contactoTelefono2" id="alumnoContactoTelefono2"
					value="${entrevistaSeleccionDTO.perfilAlumno.contactoTelefono2}"/>
			</p>
	   	</td>
	   	<td></td>
	</tr>
		
	<tr>
		<td>
			<p>
				<label for="telefono">Mail / Facebook</label> 
					<input type="text" onchange="this.value=this.value.toUpperCase();"  	name="perfilAlumno.datosPersonales.mail" id="alumnoMail"
					value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.mail}"/>
			</p>
		</td>
		<td>
			<p>
				<label>¿Tuvo algún hermano/a beca de Cimientos?</label>
					Si<input type="radio" id="otroBecado" name="otroBecado" 
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroBecado}"> checked="checked"</c:if> value="true"> 
					No<input type="radio" id="otroBecado" name="otroBecado" 
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroBecado == false}"> checked="checked"</c:if> value="false">
			
					
			
			</p>
		</td>
		
		<td></td>
	</tr>
	<div id="dialog-ver" title="Estado alumno incorrecto" style="display: none">
		<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 10px 45px 0;"></span> 
		NO se puede dar de alta una entrevista de seleccion para el alumno debido a que el mismo no se encuentra en proceso de selección, seleccione 
		"Ver Datos Entrevista Selección" para obtener los datos del mismo.
		</p>
	</div>
	<div id="dialog-cargar" title="Carga de Entrevista de Selección" style="display: none">
		<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 10px 45px 0;"></span> 
		El alumno que quiere ingresar ya tiene una entrevista de Selección, seleccione 
		"Ver Datos Entrevista Selección" para visualizarla.
		</p>
	</div>
	<div id="dialog-DNI" title="Ya existe DNI" style="display: none">
		<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 10px 45px 0;"></span> 
		NO se puede dar de alta una entrevista de seleccion con este DNI, ya que el mismo se encuentra en la base de datos como usuario 
		</p>
	</div>
</table>
