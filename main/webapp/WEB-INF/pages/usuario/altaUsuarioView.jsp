<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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

<script type="text/javascript">
$(document).ready(function(){
	
	jQuery.validator.messages.minlength = "Ingrese al menos 7 digitos";
	
	$("#fechaNacimiento").datepicker({
	 	  changeMonth: true,
	 	  changeYear: true,
	 	  yearRange:'1920:'+ new Date()	
	});
	
	$("#altaUsuario").validate({
		rules: {
			"persona.dni": {
		    required: true,
		    minlength: 7
		    }
		}		
	});
	
	var arrayDisabled = [1,2,3,4];
	$("#tabs").tabs({ disabled: arrayDisabled });
	
	$("#ea").click(function() {
		enableDisableTabs();
	});
	
	$("#rr").click(function() {
		enableDisableTabs();
	});
	
	$("#ts").click(function() {
		enableDisableTabs();
	});
	
	$("#siguiente").click(function() {
		
		if( ($("#usuario").val() != "") && ($("#password").val() != "") ){
			if($("#password").val() == $("#password2").val()){
				
				var array = [2,3,4];
				$("#tabs").tabs({ disabled: array });
				$( "#tabs" ).tabs( "option", "selected", 1 );
				$("#tabs").tabs({ disabled: array });
				
			}else{
				alert("ingrese passwords iguales")
			}
		}else{
			alert("complete todos los datos");
		} 
			
	});
	
	function enableDisableTabs(){
		var array = [];
		
		var element = document.getElementById("rolEA");
		if(!element.checked){
			array.push(2);
		}
		element = document.getElementById("rolRR");
		if(!element.checked){
			array.push(3);
		}
		element = document.getElementById("rolTS");
		if(!element.checked){
			array.push(4);
		}
		
		$("#tabs").tabs({ disabled: array });
		
	}
	
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
	
	$("#nombreZonaTS").keypress(function(){
		
		$("#zonasTS").val(0);
		
		$("#nombreZonaTS").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarZonaPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						maxRows: 12,
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
				$("#zonasTS").val(ui.item.id);
			}
		});
	});
	
});

function guardarUsuario(){
	var stringBuffer = "";
	
	if($("#rolEA").attr("checked")){
		var element = document.getElementById("zonasEA");
		if(element.value == ""){
			stringBuffer += "Debe elegir zonas para el perfil EA\n";
		}
	}
	if($("#rolRR").attr("checked")){
		var element = document.getElementById("zonasRR");
		if(element.value == ""){
			stringBuffer += "Debe elegir zonas para el perfil RR\n";
		}
	}
	if($("#rolTS").attr("checked")){
		var element = document.getElementById("zonasTS");
		if(element.value == "" || element.value == 0){
			stringBuffer += "Debe elegir zona para el perfil TS";
		}
	}
	if(stringBuffer != ""){
		jAlert('warning', stringBuffer, 'Atención!');
	}else{
		$("#altaUsuario").submit();
	}
}

</script>	

</head>
<body>
<div id="main-content">
<c:if test="${vacio == true}">
	<c:set var="action" value="registrar.do"></c:set>
</c:if>
<c:if test="${vacio == false}">
	<c:set var="action" value="modificar.do"></c:set>
</c:if>
<form:form id="altaUsuario" modelAttribute="usuario" commandName="usuario"
			class="cmxform" action="${action}" method="post">
	<form:hidden path="id"/>
	<form:hidden path="persona.id"/>
	<form:hidden path="persona.perfilStaff.id"/>
	<form:hidden path="persona.perfilRR.idPerfilRR"/>
	<form:hidden path="persona.perfilEA.idPerfilEA"/>
	<form:hidden path="persona.perfilTS.idPerfilTS"/>
	<form:hidden path="persona.perfilVoluntario.id"/>
	<div id="tabs">
		<ul>
			<li><a href="#tabs-1" id="us">Usuario</a></li>
			<li><a href="#tabs-2" id="dp">Datos Personales</a></li>
			<li><a href="#tabs-3" id="ea">EA</a></li>
			<li><a href="#tabs-4" id="rr">RR</a></li>
			<li><a href="#tabs-5" id="ts">TS</a></li>
		</ul>
		<div id="tabs-1">
			<jsp:include page="fichaUsuario/datosUsuario.jsp"></jsp:include>
		</div>
		<div id="tabs-2">
			<jsp:include page="fichaUsuario/datosPersona.jsp"></jsp:include>
		</div>
		<div id="tabs-3" style="display: block;">
			<jsp:include page="fichaUsuario/perfilEA.jsp"></jsp:include>
		</div>
		<div id="tabs-4" style="display: block;">
			<jsp:include page="fichaUsuario/perfilRR.jsp"></jsp:include>
		</div>
		<div id="tabs-5" style="display: block;">
			<jsp:include page="fichaUsuario/perfilTS.jsp"></jsp:include>
		</div>
	</div>
</form:form>
</div>
</body>
</html>