<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
<c:if test="${!empty responsable.id}">
	..:: Modificar
</c:if> 
<c:if test="${empty responsable.id}">
	..:: Alta de
</c:if> 
Responsable ::..
</title>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.alerts.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.widget.js"/>"></script>
	
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">

<script type="text/javascript">
	$(function() {

		$("#altaResponsable").validate();
		
		$('#datepicker').datepicker({
			changeMonth: true,
			changeYear: true
		});

		$("#submitear").click(function(){
			$("#altaResponsable").submit();
		});		
	});
</script>
<script type="text/javascript">
$(function() {
	$("#idLocalidad").autocomplete({
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
							label: item.nombre,
							value: item.nombre,
							id: item.id
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idLocalidad").val(ui.item.id);
		
		},
		open: function() {
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function() {
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	});
});

</script>
</head>
<body>
<div id="main-content">
<form:form modelAttribute="responsable" id="altaResponsable" commandName="responsable" class="cmxform"
	method="post" action="guardarResponsable.do">
	<form:hidden path="id"/>
	<c:if test="${!empty responsable.id}">
		<h1>Modificar</h1>
		</c:if> 
		<c:if test="${empty responsable.id}">
		<h1>Alta de</h1>
		</c:if><h1>Responsable</h1>
		
    	<table width="220" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
		<td width="200">Nombre</td>
		<td width="600"><form:input path="nombre" cssClass="required" cssStyle="text-input" cssErrorClass="form-error-field"/></td>
		</tr>
		
		<tr>
		<td>Apellido</td>
		<td ><form:input path="apellido" cssClass="required" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		<c:if test="${empty responsable}">
		<tr>
		<td >Fecha de Nacimiento</td>
		<td >		
			<form:input id="datepicker" path="fechaNacimiento"  cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>		
		</tr>
		</c:if>
		
		
		<tr>
		<td >Telefono 1</td>
		<td >		
		<form:input path="telefono1" cssClass="required" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
	
		<tr>
		<td >Telefono 2</td>
		<td >		
		<form:input path="telefono2" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		<tr>
		<td >Sexo</td>
		<td >		
		<form:radiobutton path="sexo" value="1" cssClass="required" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>F
		<form:radiobutton path="sexo" value="0" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>M
		</td>
		</tr>
		
		<tr>
		<td >DNI</td>
		<td >		
		<form:input path="dni" onkeypress="return soloNumeros(event);" maxlength="8" cssClass="required" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		<tr>
		<td >CUIT/CUIL</td>
		<td >		
		<form:input path="cuilCuit" maxlength="11" cssStyle="text-input"  cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		<tr>
		<td >Direccion</td>
		<td >		
		<form:input path="direccion" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		<tr>
		<td >Localidad</td>
		<td >
			<form:input path="idLocalidad" autocomplete=""/>
			<input name="idLocalidad" id="idLocalidad" value="${responsable.idLocalidad.id}" type="hidden">
			
		</td>
		</tr>
		
		<tr>
		<td >Barrio</td>
		<td >
			<form:select path="idBarrio" > 
				<form:options items="${barrios}" itemLabel="nombre" itemValue="id" />
			</form:select>
			<input id="idBarrio" type="hidden" value="${responsable.idBarrio.id}"/>	
		</td>
		</tr>
		
		
		<tr>
		<td>Banco</td>
		<td >
			<form:select path="banco" > 
				<form:options items="${bancos}" itemLabel="nombre" itemValue="id" />
			</form:select>
			<input id="banco" type="hidden" value="${responsable.banco.id}"/>	
		</td>
		</tr>
		
		<tr>
		<td >Sucursal Banco</td>
		<td >
			<form:select path="sucursal" > 
				<form:options items="${sucursales}" itemLabel="direccion" itemValue="id" />
			</form:select>
			<input id="sucursal" type="hidden" value="${responsable.sucursal.id}"/>	
		</td>
		</tr>
				
		
		<tr>
		<td >Becado</td>				
		<td >
			<form:select path="idAlumno" > 
				<form:options items="${alumnos}" itemLabel="datosPersonales.nombre" itemValue="id" />
			</form:select>
				<input id="idAlumno" type="hidden" value="${responsable.idAlumno.id}"/>				
		</td>
		</tr>
		
		<tr>
		<td >Tipos Afyp</td>
		<td>
			<form:select path="idTipoAfyp" > 
				<form:options items="${afips}" itemLabel="valor" itemValue="id" />
			</form:select>
			<input id="idTipoAfyp" type="hidden" value="${responsable.idTipoAfyp.id}"/>	
		</td>
		</tr>
		
		<tr>
		<td >Tipos DNIs</td>
		<td >
			<form:select path="idTipoDni" > 
				<form:options items="${dnis}" itemLabel="valor" itemValue="id" />
			</form:select>
				<input id="idTipoDni" type="hidden" value="${responsable.idTipoDni.id}"/>		
		</td>
		</tr>
		
		<tr>
		<td>Vinculos</td>
		<td >
			<form:select path="idVinculo" > 
				<form:options items="${vinculos}" itemLabel="valor" itemValue="id" />
			</form:select>
			<input id="idVinculo" type="hidden" value="${responsable.idVinculo.id}"/>	
		</td>
		</tr>
		
		<tr>
		<td >Estado Civil</td>
		<td >
			<form:select path="idEstadoCivil" > 
				<form:options items="${estados}" itemLabel="valor" itemValue="id" />
			</form:select>
			<input id="idEstadoCivil" type="hidden" value="${responsable.idEstadoCivil.id}"/>
		</td>
		</tr>
		
		<tr>
		<td >Nro. Cuenta</td>
		<td >		
		<form:input path="nroCuenta" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		
		<tr>
		<td >Ingresos</td>
		<td >		
		<form:input onkeypress="return soloNumeros(event);" path="ingresos" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		<tr>
		<td >Mail</td>
		<td >		
		<form:input path="mail" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		<tr>
		<td >Celular</td>
		<td >		
		<form:input path="celular" cssStyle="text-input" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		<tr>
		<td >Observaciones</td>
		<td >	
		<form:textarea path="observaciones" cssStyle="text-input"  cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		<tr>
        	<td>&nbsp;</td>
     	 </tr>
    	
       <tr>
        <td colspan="2">
        <table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
          <tr>
            <td width="50" height="0" align="center" valign="middle"><input type="reset" class="ui-state-default ui-corner-all" value="Limpiar" /></td>	
		    <td width="50" height="0" align="center" valign="middle"><input type="button" id="submitear" value="Guardar" class="ui-state-default ui-corner-all" /></td>
		    <td width="50" height="0" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all"	onclick="location.href='../responsable/listaResponsables.do'; return false;"/></td>
		   </tr>	
</table>
</td>
</tr>
</table>
</form:form>
</div>
</body>
</html>