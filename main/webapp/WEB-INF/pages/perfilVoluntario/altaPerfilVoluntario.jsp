<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">
	label { width: 14em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
	
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>

<script type="text/javascript">
	var digito;
	function generarCuil(value)
	{
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		
		if($("#sexo").val() == "true")
		{ //Masculino			
			cuil = value;
			xy = 20;
			cuil = calcular( xy, cuil);	
		}
		else
		{							//fememino
			cuil = value;
			xy = 27;
			cuil = calcular( xy, cuil );
		}
		
		if(isNaN(digito))
		{
			$('#cuil').val(" ");
		}
		else
		{
			$('#cuil').val(cuil);
			$('#cuilHidden').val(cuil);
		}
					
	}
	
	
	function formatear(xy, cuil, digito) {
		return (xy + "-" + cuil + "-" + digito);		
		
		}
	
	function validar () {
		var error = false; /* No se detecto error hasta el momento, no se vio que falten datos */
		var faltantes = "Faltan: ";

		if (document.getElementById("perfilAlumno.responsable1.dni").value == ""){
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

$(document).ready(function(){
 
 	$("#form1").validate();
 	
 	$('#fechaContacto').datepicker({
 		changeMonth: true,
 		changeYear: true
 	});
 	$('#fechaDesde').datepicker({
 		changeMonth: true,
 		changeYear: true
 	});
 	$('#fechaHasta').datepicker({
 		changeMonth: true,
 		changeYear: true
 	});
 });
</script>
<script>
$(function() {
	 
	 
	  $('#barrioUser').autocomplete({
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
								label: item.nombre + ", " + item.localidad  + ", " + item.provincia,
								value: item.nombre,
								id: item.id,
								idLocalidad:item.idLocalidad,
								localidad:item.localidad,
								idProvincia:item.idProvincia,
								provincia:item.provincia
								
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#barrioId").val(ui.item.id);
				$("#localidad").val(ui.item.localidad);
				$("#idLocalidad").val(ui.item.idLocalidad);
				$("#provincia").val(ui.item.provincia);
				$("#idProvincia").val(ui.item.idProvincia);
				
			}
		});
	  
	});
	
function enviarForm(action){
		if(action=='alta'){
			document.getElementById('form1').action ="<c:url value='agregarVoluntario.do'/>";
			$('#form1').submit();
			return 
		}
		if(action=='volver'){
			document.getElementById('form1').action ="<c:url value='listaVoluntariosView.do'/>";
			$('#form1').submit();
			return
		}
			
	} 
</script>

	<title>...Alta Perfil Voluntario..</title>
</head>
<body>
<div id="main-content">

<form:form id="form1" name="form1"  action="agregarVoluntario.do"  commandName="voluntario" modelAttribute="voluntario" method="post" class="cmxform" >
<form:hidden path="id"/>
	<fieldset> 
		<legend>Alta de Voluntario</legend>
		<br>
		<p>
		<label>Nombre</label>
			<input type="text" id="datosPersonales.nombre" name="datosPersonales.nombre" value="${voluntario.datosPersonales.nombre}" class="required">
		</p>
		<p>
		<label>Apellido</label>
			<input type="text" id="datosPersonales.apellido" name="datosPersonales.apellido"  value="${voluntario.datosPersonales.apellido}" class="required">
		</p>
		<p>
		<label>Sexo</label>
			M<input type="radio" id="sexo" name="datosPersonales.sexo" 
				<c:if test="${voluntario.datosPersonales.sexo}"> checked="checked"</c:if> value="true"> 
			F<input type="radio" id="sexo" name="datosPersonales.sexo"
			<c:if test="${voluntario.datosPersonales.sexo == false}"> checked="checked"</c:if> class="required" value="false">
		</p>
		<p>
		<label>DNI</label>
			<input type="text" id="datosPersonales.dni" name="datosPersonales.dni"  value="${voluntario.datosPersonales.dni}" class="required" onchange="generarCuil(this.value)" maxlength="8">
		</p>
		<p>
		<label>CUIL</label>
		<input type="hidden" id="cuilHidden" name="datosPersonales.cuilCuit" >
		<input type="text" id="cuil"  class=" required" value="${voluntario.datosPersonales.cuilCuit}" disabled="disabled">
		</p>
		<p>
			<label>Direccion</label>
			<input type="text" id="datosPersonales.direccion" name="datosPersonales.direccion" class="required" value="${voluntario.datosPersonales.direccion}">
		</p>
		<p>
			<label>Codigo Postal</label>
			<input type="text" id="datosPersonales.codigoPostal" name="datosPersonales.codigoPostal" class="required" value="${voluntario.datosPersonales.codigoPostal}">
		</p>
		<p>
			<label>Barrio</label>
				<c:choose>
					<c:when test="${voluntario.datosPersonales.barrio.id != null}">
						<input type="text" id="barrioUser" value="${voluntario.datosPersonales.barrio.nombre}" class="required"/>
						<input type="hidden" name="datosPersonales.barrio.id" 
							id="barrioId" value="${voluntario.datosPersonales.barrio.id}"/>
					</c:when>
					<c:otherwise>
						<input id="barrioUser" value="" class="required" />
						<input type="hidden" name="datosPersonales.barrio.id" id="barrioId" value=""/>
					</c:otherwise>	
			   </c:choose>
		</p>
		<p>
			<label>Localidad</label>
			<c:choose>
					<c:when test="${voluntario.datosPersonales.localidad.id != null}">
						<input type="hidden" name="datosPersonales.localidad.id" 
							id="idLocalidad"  value="${voluntario.datosPersonales.localidad.id}"/>
						<input id="localidad" value="${voluntario.datosPersonales.localidad.nombre}" disabled="disabled" />
					</c:when>
					<c:otherwise>
						<input type="hidden" name="datosPersonales.localidad.id" 
						id="idLocalidad"  value=""/>
						<input id="localidad" disabled="disabled" value="" />
					</c:otherwise>	
			 </c:choose>
			
		</p>
		<p>
			<label>Provincia</label>
			<c:choose>
			
					<c:when test="${voluntario.datosPersonales.localidad.id != null}">
						<input type="hidden" name="datosPersonales.provincia.id" 
						id="idProvincia"  value="${voluntario.datosPersonales.provincia.id}"/>
						<input id="provincia" value="${voluntario.datosPersonales.provincia.descripcion}" disabled="disabled" class="required" />
					</c:when>
					<c:otherwise>
						<input type="hidden" name="datosPersonales.provincia.id" 
						id="idProvincia"  value=""/>
						<input id="provincia" value="" disabled="disabled" class="required" />
					</c:otherwise>	
			 </c:choose>
			
		</p>
		<p>
			<label>Telefono</label>
			<input type="text" id="datosPersonales.telefono" name="datosPersonales.telefono" class="digits required" value="${voluntario.datosPersonales.telefono}">
		</p>
		<p>
			<label>Profesion</label>
			<input type="text" id="profesion" name="profesion" class="required" value="${voluntario.profesion}">
		</p>
		<p>
			<label>Contacto Cimientos</label>
			<input type="text" id="contactoCimientos" name="contactoCimientos" class="required" value="${voluntario.contactoCimientos}">
		</p>
		<p>
			<label>Fecha de Contacto</label>
			<input 	name="fechaContacto" id="fechaContacto"
			class="date required" value="<fmt:formatDate value="${voluntario.fechaContacto}" pattern="dd/MM/yyyy"/>"  > 
		</p>
		<p>
			<label>Fecha Desde</label>
			<input 	name="fechaDesde" id="fechaDesde"
			class="date required" value="<fmt:formatDate value="${voluntario.fechaDesde}" pattern="dd/MM/yyyy"/>"  >
		</p>
		<p>
			<label>Fecha Hasta</label>
			<input 	name="fechaHasta" id="fechaHasta"
			class="date required" value="<fmt:formatDate value="${voluntario.fechaHasta}" pattern="dd/MM/yyyy"/>"  >
		</p>
		<p>
			<label >Detalle de Dedicacion</label> 
			<textarea rows="2" cols="50"id="conducta" name="detalleDedicacion" >
					${voluntario.detalleDedicacion}
			</textarea>
		</p>
		<p>
			<label >Proyecto</label> 
			<input type="text" id="proyecto" name="proyecto" class=" required" value="${voluntario.proyecto}">
		</p>
		<p>
			<label >TareaRealizada</label> 
			<input type="text" id="tareaRealizada" name="tareaRealizada" class="digits required" value="${voluntario.tareaRealizada}">
		</p>
		<p>
		
			<label >Capacitado  Seleccion</label> 
			
			<c:choose>
					<c:when test="${voluntario.capacitadoSeleccion == null}">
						Si<input type="radio" id="capacitadoSeleccion" name="capacitadoSeleccion" > 
						No<input type="radio" id="capacitadoSeleccion" name="capacitadoSeleccion" class="required" >
					</c:when>
					<c:otherwise>
						Si<input type="radio" id="capacitadoSeleccion" name="capacitadoSeleccion" 
							<c:if test="${voluntario.capacitadoSeleccion}"> checked="checked"</c:if> > 
						No<input type="radio" id="capacitadoSeleccion" name="capacitadoSeleccion"
							<c:if test="${voluntario.capacitadoSeleccion == false}"> checked="checked"</c:if> class="required">
					</c:otherwise>	
			   </c:choose>
			
			
			
		</p>
		<p>
			<label>Interes Seleccion</label>
			Si<input type="radio" id="interesSeleccion" name="interesSeleccion" 
				<c:if test="${voluntario.interesSeleccion}"> checked="checked"</c:if> > 
			No<input type="radio" id="interesSeleccion" name="interesSeleccion"
			<c:if test="${voluntario.interesSeleccion == false}"> checked="checked"</c:if> class="required">
	   </p>
	   <p>
			<label>Capacitado Jornadas</label>
			Si<input type="radio" id="capacitadoJornadas" name="capacitadoJornadas" 
				<c:if test="${voluntario.capacitadoJornadas}"> checked="checked"</c:if>  > 
			No<input type="radio" id="capacitadoJornadas" name="capacitadoJornadas"
			<c:if test="${voluntario.capacitadoJornadas == false}"> checked="checked"</c:if> class="required">
	   </p>
	   <p>
			<label>Interes Jornadas</label>
			Si<input type="radio" id="interesJornadas" name="interesJornadas" 
				<c:if test="${voluntario.interesJornadas}"> checked="checked"</c:if> > 
			No<input type="radio" id="interesJornadas" name="interesJornadas"
			<c:if test="${voluntario.interesJornadas == false}"> checked="checked"</c:if> class="required">
	   </p>
	   <p>
			<label>Interes Presente</label>
			Si<input type="radio" id="interesPresente" name="interesPresente" 
				<c:if test="${voluntario.interesPresente}"> checked="checked"</c:if>  > 
			No<input type="radio" id="interesPresente" name="interesPresente"
			<c:if test="${voluntario.interesPresente == false}"> checked="checked"</c:if> class="required">
	   </p>
	   <p>
			<label>Interes Tareas Operativas</label>
			Si<input type="radio" id="interesTareasOperativas" name="interesTareasOperativas" 
				<c:if test="${voluntario.interesTareasOperativas}"> checked="checked"</c:if> > 
			No<input type="radio" id="interesTareasOperativas" name="interesTareasOperativas"
			<c:if test="${voluntario.interesTareasOperativas == false}"> checked="checked"</c:if> class="required">
	   </p>
	   <p>
			<label>Interes Tareas Profesionales</label>
			Si<input type="radio" id="interesTareasProfesionales" name="interesTareasProfesionales" 
				<c:if test="${voluntario.interesTareasProfesionales}"> checked="checked"</c:if>  > 
			No<input type="radio" id="interesTareasProfesionales" name="interesTareasProfesionales"
			<c:if test="${voluntario.interesTareasProfesionales == false}"> checked="checked"</c:if> class="required">
	   </p>
	   <p>
			<label>Evaluacion</label>
			Si<input type="radio" id="evaluacion" name="evaluacion" 
				<c:if test="${voluntario.evaluacion}"> checked="checked"</c:if>  > 
			No<input type="radio" id="evaluacion" name="evaluacion"
			<c:if test="${voluntario.evaluacion == false}"> checked="checked"</c:if> class="required">
	   </p>
	   <p>
			<label>Termino Actividad</label>
			Si<input type="radio" id="terminoActividad" name="terminoActividad" 
				<c:if test="${voluntario.terminoActividad}"> checked="checked"</c:if> > 
			No<input type="radio" id="terminoActividad" name="terminoActividad"
			<c:if test="${voluntario.terminoActividad == false}"> checked="checked"</c:if> class="required">
	   </p>
	   <p>
		   <label >Observaciones</label> 
			<textarea rows="2" cols="50"id="observaciones" name="observaciones" >
					${voluntario.observaciones}
			</textarea>
	   </p>
	   <p>
		   <label >Induccion</label> 
			Si<input type="radio" id="induccion" name="induccion" 
				<c:if test="${voluntario.induccion}"> checked="checked"</c:if> > 
			No<input type="radio" id="induccion" name="induccion"
			<c:if test="${voluntario.induccion == false}"> checked="checked"</c:if> class="required">
	   </p>
	   <p>
		   <label >Relacion</label> 
			Si<input type="radio" id="relacion" name="relacion" 
				<c:if test="${voluntario.relacion}"> checked="checked"</c:if>  > 
			No<input type="radio" id="relacion" name="relacion"
			<c:if test="${voluntario.relacion == false}"> checked="checked"</c:if> class="required">
	   </p>
	 

	   
		
	   
		
		
		
		
		
			
	</fieldset>
		<table align="center">
			<tr>
				<td>
					<input class="ui-state-default ui-corner-all " type="button" value="Alta"  onclick="enviarForm('alta')" />
				</td>
				<td>
					<input class="ui-state-default ui-corner-all " type="button" value="Volver"  onclick="enviarForm('volver')" />
				</td>
			</tr>
		</table>
	
</form:form>

</form>

</div>
</body>
</html>