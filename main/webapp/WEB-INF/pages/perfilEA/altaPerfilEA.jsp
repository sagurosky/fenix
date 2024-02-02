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

<title>Encargado de Acompañamiento</title>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>

<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script type="text/javascript"
	src="<c:url  value="/static/js/funcionesCuil.js"/>"></script>
	
<script type="text/javascript">

var counter = 0;

function incrementarCounter(){
	counter++;
}

$(function(){
	
	verificarCuil();
	
	$("#fechaNacimiento").datepicker({
	 	  changeMonth: true,
	 	  changeYear: true,
	 	  yearRange:'1920:'+ new Date()	
	});
										 	  
	$("#altaPerfilEA").validate();

	$("#eliminarLocalidad").click(function () {
		var checks = $(".esCheck");
		for (i = 0; i < checks.length; i++){
			if(checks[i].checked){
				$("#" + checks[i].value).remove();
			}
		}
    });
	
});

var index = 0;

function agregarInput(){
	index++;
	var inputZona = '<tr id="fila'+ counter +'"><td><input type="checkbox" value="fila'+ counter +'" class="esCheck"><input name="zonasCimientos" type="hidden" id="zona'+ index +'" value="0"><input name="nombreZona" id="nombreZona'+ index +'"></td></tr>';
	$("#zonasEA").append(inputZona);
	incrementarCounter();
	autoCompleteZona(index);
}

function agregarZona(nombre,id){
	index++;
	var inputZona = '<tr id="fila'+ counter +'"><td><input type="checkbox" value="fila'+ counter +'" class="esCheck"><input name="zonasCimientos" type="hidden" id="zona'+ index +'" value="'+ id +' "><input name="nombreZona" value="'+ nombre +'" id="nombreZona'+ index +'"></td></tr>';
	$("#zonasEA").append(inputZona);
	incrementarCounter();
	autoCompleteZona(index);
}

function autoCompleteZona(index){
	$("#nombreZona"+index).keypress(function(){
		$('#zona'+index).val(0);
		$('#nombreZona'+index).autocomplete({
			source: function(request, response) {
						$.ajax({
							url: "../ajax/buscarZonaPorNombre.do",
							dataType: "json",
							data: {
								style: "full",
								maxRows: 15,
								name_startsWith: request.term
							},
							success: function(data) {
								response($.map(data.zonas, function(item) {
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
				$('#zona'+index).val(ui.item.id);
			},
			open: function() {
				$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
			},
			close: function() {
				$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
			}
		});
	});
}	

function enviarForm(){
	if( $("#redirigir").val() == 'modificar' ){
		document.forms['altaPerfilEA'].action = "../perfilEA/guardarCambiosPerfilEA.do";
	}else{
		document.forms['altaPerfilEA'].action = "../perfilEA/guardarPerfilEA.do"
	}
	$("#altaPerfilEA").submit();
}
</script>

</head>
<body>

<form:form id="altaPerfilEA" name="altaPerfilEA" class="cmxform" commandName="perfilEA" modelAttribute="perfilEA" action="guardarPerfilEA.do" method="post">
	<input id="redirigir" type="hidden" value="${redirigir}"/>
	<form:hidden path="idPerfilEA"/>
	<form:hidden path="datosPersonales.id"/>
<div id="right-content">
	<fieldset>
		<legend>Modificar Encargado de Acompañamiento</legend>
	    <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
			<tr>
				<td><label for="nombre">Nombre *</label></td>
				<td><form:input path="datosPersonales.nombre" cssClass="required"/></td>
			</tr>
			<tr>
				<td><label for="apellido">Apellido *</label></td>
				<td><form:input path="datosPersonales.apellido" cssClass="required"/></td>
			</tr>
			<tr>
				<td><label for="dni">DNI *</label></td>
				<td><form:input path="datosPersonales.dni" maxlength="8" cssClass="digits required" id="dni" onblur="verificarCuil()"/></td>
			</tr>
			<tr>
		        <td width="150">CUIT/CUIL *</td>
		        <td width="670"><label><form:input path="datosPersonales.cuilCuit" cssClass="required" id="cuil" maxlength="13"/></label></td>
		    </tr>
			<tr>
				<td><label for="direccion">Dirección *</label></td>
				<td><form:input path="datosPersonales.direccion" cssClass="required"/></td>
			</tr>
			<tr>
				<td><label for="codigoPostal">Código Postal *</label></td>
				<td><form:input path="datosPersonales.codigoPostal" cssClass="required"/></td>
			</tr>
			<tr>
				<td><label for="telefono">Teléfono *</label></td>
				<td><form:input path="datosPersonales.telefono" cssClass="required"/></td>
			</tr>
			<tr>
				<td><label for="celular">Celular</label></td>
				<td><form:input path="datosPersonales.celular"/></td>
			</tr>
			<tr>
				<td><label for="fechaNacimiento">Fecha de Nac. *</label></td>
				<td><input name="fechaNac" id="fechaNacimiento" class="date required" value="<fmt:formatDate value="${perfilEA.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>" /> dd/mm/aaaa<br></td>
			</tr>
			<tr>
				<td><label for="sexo">Sexo *</label></td>
				<td>
					<c:choose>
						<c:when test="${perfilEA.datosPersonales.sexo == false}">
							M<input name="datosPersonales.sexo" type="radio" value="false" checked="checked" class="required" 
									id="sexoM" onfocus="generarCuil(this.value)"/>
							F<input name="datosPersonales.sexo" type="radio" value="true" 
									id="sexoF" onfocus="generarCuil(this.value)"/>
						</c:when>
						<c:otherwise>
							M<input name="datosPersonales.sexo" type="radio" value="false" class="required" 
									id="sexoM" onfocus="generarCuil(this.value)"/>
							F<input name="datosPersonales.sexo" type="radio" checked="checked" value="true" 
									id="sexoF" onfocus="generarCuil(this.value)"/>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td><label>Estado Civil</label></td>
				<td>
					<select name="estado" id="estadoCivil" style="width: 145px;">
						<c:forEach items="${estadosCiviles}" var="estado">
							<c:choose>
								<c:when test="${perfilEA.datosPersonales.estadoCivil.id == estado.id}">
									<option value="${estado.id}" selected="selected">${estado.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${estado.id}">${estado.valor}</option>
								</c:otherwise>	
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td><label for="mail">E-mail</label></td>
				<td><input type="text" name="datosPersonales.mail" id="mail" class="email" value="${perfilEA.datosPersonales.mail}"/></td>
			</tr>
			<tr>
	      		<td colspan="2">&nbsp;</td>
	      	</tr>
		  	<tr>
		        <td valign="top">Zonas Cimientos</td>
		        <td>
		        	<table id="zonasEA">
		        		<c:if test="${empty perfilEA.zona}">
		       			<tr id="fila0">
		       				<td>
		       					<input type="checkbox" value="fila0" class="esCheck">
		       					<input name="zonasCimientos" type="hidden" id="zona0">
		       					<input name="nombreZona"  id="nombreZona0" class="required"></td>
		       			</tr>
		       			<script>
		       			autoCompleteZona(0);
		       			</script>
		       			</c:if>
			        	<c:forEach items="${perfilEA.zona}" var="zona">
			        		<script>
			        			agregarZona('${zona.nombre}','${zona.id}');
			        		</script>
			        	</c:forEach>
		        	</table>
		        </td>
	      	</tr>
	      	<tr>
	      		<td colspan="2">&nbsp;</td>
	      	</tr>
	      	<tr>
	      		<td colspan="2"><input type="button" value="Agregar" onclick="agregarInput()" class="ui-state-default ui-corner-all">
	      						<input type="button" value="Eliminar" id="eliminarLocalidad" class="ui-state-default ui-corner-all"></td>
	      	</tr>
	      	<tr>
	      		<td colspan="2">&nbsp;</td>
	      	</tr>
	      	<tr>
	        	<td colspan="2">
		        	<table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
		         		<tr>
			            	<td width="50" align="center" valign="middle"><input type="button" onclick="enviarForm()" value="Guardar" class="ui-state-default ui-corner-all" /></td>
			            	<td width="50" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all" 
					       		onclick="location.href='../perfilEA/listaPerfilEA.do'; return false;" /></td>
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