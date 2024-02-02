<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#formSupervisorEscolar").validate();
	
	$('#localidad').autocomplete({
		source: function(request, response) {
			$.ajax({
				url: '<c:url value="/ajax/buscarLocalidadPorNombre.do"/>',
				dataType: "json",
				data: {
					style: "full",
					name_startsWith: request.term,
					maxRows:10
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
		select: function(event, ui) {
			$('#idLocalidad').val(ui.item.id); 

		},
		open: function() {
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function() {
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	});
	
	$("#escuela").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEscuelaZona.do",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term				
				},
				success: function(data) {
					response($.map(data.escuelas, function(item) {
						return {
							label: item.nombre + ", " + item.localidad + ", " + item.zona, 
							value: item.nombre,
							id: item.id,
							zona: item.zona,
							idZona: item.idZona
						}
					}))
				}
			})
		},
		select: function(event, ui) {
			$("#idEscuela").val(ui.item.id);
		//	$("#zonaCimientos").val(ui.item.zona);
		//	$("#idZonaCimientos").val(ui.item.idZona);
		},
		open: function() {
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function() {
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	});

});

/**
* Metodo para enviar el formulario
*/
function enviarForm(action){
	
	if(action == 'alta'){
		document.forms['formSupervisorEscolar'].action ='<c:url value="/supervisorEscolar/guardarRegistrarDatosConsultaSE.do" />';
		//document.forms['formAlumno'].idAlumno.value= $('#dniAlumno').val();
		$('#formSupervisorEscolar').submit();
		return
	}
	if(action  == 'volver' ){
		document.forms['formSupervisorEscolar'].action ='<c:url value="/supervisorEscolar/listaSupervisorEscolar.do" />';
		//document.forms['formAlumno'].idAlumno.value= $('#dniAlumno').val();
		document.forms['formSupervisorEscolar'].submit();
		return
	}
}

</script>
<title>Alta Supervisor Escolar</title>
</head>
<body>

<div id="main-content">
	           
	<form:form 	modelAttribute="supervisorEscolar" id="formSupervisorEscolar" commandName="supervisorEscolar" 
				action="guardarRegistrarDatosConsultaSE.do"	method="post" class="cmxform">
	<form:hidden path="id"/>    	
	<fieldset>
	   		<legend>Alta de Supervisor Escolar</legend><br>
		    
			<p>
				<label>Nombre Contacto:</label>
				<input name="nombre" id="nombreDeContacto" class="required" value="${supervisorEscolar.nombre }"> 
			</p>
			<p>
				<label>Cargo:</label>
				<input name="cargo"  type="text" id="cargo" class="required" value="${supervisorEscolar.cargo }"> 
			</p>			
			<p>
				<label>Nivel:</label>
				<input name="nivel"  type="text" id="nivel" class="required" value="${supervisorEscolar.nivel}"> 		  
			</p>
			<p>
				<label>Escuela:</label>
				<input type="hidden" name="idEscuela" id="idEscuela" value="${supervisorEscolar.escuela.id}"/>
				<input id="escuela" class="required" value="${supervisorEscolar.escuela.nombre}"/>  
			</p>
			<p>
				<label>Direccion:</label>
				<input name="direccion" type="text" id="direccion" class="required " value="${supervisorEscolar.direccion }"> 	  
			<p>
				<label>Localidad:</label>
			    <input type="hidden" name="idLocalidad" id="idLocalidad" value="${supervisorEscolar.localidad.id }"/>	   	    
				<input id="localidad" class="required" value="${supervisorEscolar.localidad.nombre }"> 	  			
			</p>
			<p>
				<label>Telefono:</label>
				<input name="telefono" id="telefono" class="required digits " value="${supervisorEscolar.telefono }">       
			</p>
			<p>
				<label>Celular:</label>
				<input name="celular" id="celular" class="required digits" value="${supervisorEscolar.celular }">   
			</p>
			<p>
				<label>Mail:</label>
				<input name="mail" id="mail" class="required mail" value="${supervisorEscolar.mail }">    
			</p>
	</fieldset>
	<table align="center">
		<tr>
			<td>
				<input class="ui-state-default ui-corner-all" type="button" id="buttonVolver" value="Alta" onclick="enviarForm('alta')"/>
			</td>
			<td>
				<input class="ui-state-default ui-corner-all" type="button" id="buttonVolver" value="Volver" onclick="enviarForm('volver')"/>
			</td>
		</tr>
	</table>
</form:form>

</div>
</body>
</html>