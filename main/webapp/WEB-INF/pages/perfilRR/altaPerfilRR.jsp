<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="<c:url value="/static/css/demos.css"/>" media="all" />
<title>..:: Alta Perfil RR ::..</title>

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
	
<script><!--

var counter = 1;

function incrementarCounter(){
	counter++;
}

$(function(){
	
	$("#fechaNacimiento").datepicker({
	 	  changeMonth: true,
	 	  changeYear: true,
	 	  yearRange:'1920:'+ new Date()	
	});
										 	  
	$("#altaPerfilRR").validate();

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
	var inputZona = '<tr id="fila'+ counter +'"><td><input type="checkbox" value="fila'+ counter +'" class="esCheck"><input name="zonas" type="hidden" id="zona'+ index +'" value="0"><input name="nombreZona" class="required" id="nombreZona'+ index +'"></td></tr>';
	$("#zonasRR").append(inputZona);
	incrementarCounter();
	autoCompleteZona(index);
}
function agregarZona(nombre,id){
	index++;
	var inputZona = '<tr id="fila'+ counter +'"><td><input type="checkbox" value="fila'+ counter +'" class="esCheck"><input name="zonas" type="hidden" id="zona'+ index +'" value="'+ id +' "><input name="nombreZona" class="required"  value="'+ nombre +'" id="nombreZona'+ index +'"></td></tr>';
	$("#zonasRR").append(inputZona);
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
		document.forms['altaPerfilRR'].action = "../perfilRR/guardarCambiosPerfilRR.do";
	}else{
		document.forms['altaPerfilRR'].action = "../perfilRR/guardarPerfilRR.do"
	}
	$("#altaPerfilRR").submit();
}
</script>

</head>
<body>

<form:form id="altaPerfilRR" name="altaPerfilRR" class="cmxform" commandName="perfilRR" modelAttribute="perfilRR" action="guardarPerfilRR.do" method="post">
	<input id="redirigir" type="hidden" value="${redirigir}"/>
	<form:hidden path="idPerfilRR"/>
	<form:hidden path="datosPersonales.id"/>
<div id="right-content">
<fieldset>
	<legend>Modificar Responsable Acompañamiento</legend>
    <table width="120" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
   
		<tr>
			<td><label for="nombre">Nombre *</label></td>
			<td><form:input path="datosPersonales.nombre" cssClass=" required"/></td>
		</tr>
		
		<tr>
			<td><label for="apellido">Apellido *</label></td>
			<td><form:input path="datosPersonales.apellido" cssClass=" required"/></td>
		</tr>
		
		<tr>
			<td><label for="dni">DNI *</label></td>
			<td><form:input path="datosPersonales.dni" maxlength="8" id="dni" cssClass="digit  required"/></td>
		</tr>
		
		<tr>
	        <td width="150">CUIT/CUIL *</td>
	        <td width="670"><label>
	        <form:input path="datosPersonales.cuilCuit"  id="cuil" cssClass=" required"/></label></td>
	    </tr>
		
		<tr>
			<td><label for="direccion">Dirección *</label></td>
			<td><form:input path="datosPersonales.direccion" cssClass=" required"/></td>
		</tr>
		<tr>
			<td><label for="codigoPostal">Código Postal *</label></td>
			<td><form:input path="datosPersonales.codigoPostal" cssClass=" required"/></td>
		</tr>
		<tr>
			<td><label for="telefono">Teléfono *</label></td>
			<td><form:input path="datosPersonales.telefono" cssClass=" required"/></td>
		</tr>
		<tr>
			<td><label for="celular">Celular</label></td>
			<td><form:input path="datosPersonales.celular" cssClass=""/></td>
		</tr>
		<tr>
			<td><label for="fechaNacimiento">Fecha de Nac. *</label></td>
			<td><input name="fechaNac" id="fechaNacimiento" class=" date required" value="<fmt:formatDate value="${perfilRR.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>" /> dd/mm/aaaa<br></td>
		</tr>
		<tr>
			<td><label for="sexo">Sexo *</label></td>
			<td>
				<c:choose>
					<c:when test="${perfilRR.datosPersonales.sexo == false}">
						M<input name="datosPersonales.sexo" type="radio" value="false" 
								id="sexoM" onfocus="generarCuil(this.value)" checked="checked" class="required"/>
						F<input name="datosPersonales.sexo" type="radio" value="true" 
								id="sexoF" onfocus="generarCuil(this.value)" />
					</c:when>
					<c:otherwise>
						M<input name="datosPersonales.sexo" type="radio" value="false" 
								id="sexoM" onfocus="generarCuil(this.value)" class="required"/>
						F<input name="datosPersonales.sexo" type="radio" checked="checked" value="true" 
								id="sexoF" onfocus="generarCuil(this.value)" />
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		
		<tr>
			<td><label for="mail">E-mail *</label></td>
			<td><input type="text" name="datosPersonales.mail" id="mail" class=" required email" value="${perfilRR.datosPersonales.mail}"/></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
	   	</tr>
	    <tr>
	        <td valign="top">Zonas Cimientos*</td>
	        <td>
		       	<table id="zonasRR">
		       		<c:if test="${empty perfilRR.zona}">
		       			<tr id="fila0">
		       				<td>
		       					<input type="checkbox" value="fila0" class="esCheck">
		       					<input name="zonas" type="hidden" id="zona0">
		       					<input name="nombreZona"  id="nombreZona0" class="required"></td>
		       			</tr>
		       			<script>
		       			autoCompleteZona(0);
		       			</script>
		       		</c:if>
			       	<c:forEach items="${perfilRR.zona}" var="zona">
			       		<script>
			       			agregarZona('${zona.nombre}','${zona.id}');
			       		</script>
			       	</c:forEach>
		       	</table>
		    </td>
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
					       onclick="location.href='../perfilRR/listaPerfilRR.do'; return false;" /></td>
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