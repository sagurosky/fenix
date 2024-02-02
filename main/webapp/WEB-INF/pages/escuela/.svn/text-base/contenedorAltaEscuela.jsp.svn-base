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
	label { width: 12em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>

<script type="text/javascript"
src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>

<script type="text/javascript">

$(document).ready(function(){

 $("#fechaNacimiento").datepicker({
 	  changeMonth: true,
 	  changeYear: true,
 	  yearRange:'1950:'+ new Date()	
 	  });
 
});


//Este metodo es para mostrar los accordiones 
function mostrar(idx){
	var selector;
		switch (idx) {
		case 1:
			selector = "#datosCandidato";
			break;
		
		case 2:
			selector = "#responsable";
			break;
		
		case 3:
			selector = "#fichaFamiliar";
			break;
		}

		$(selector).toggle("blind");
	}
	


function enviarForm(action){
	
	if(action == 'finalizado'){
		document.forms['altaEntrevista'].action ="<c:url value='altaEntrevistaSeleccion.do'/>";
		$('#estadoEntrevista').val('3');
		validarSubmit();
		//Esto es para que jquery valide los campos con los formularios
		//$('#altaEntrevista').submit();
		return
	}	
	
	if(action=='volver'){
		document.forms['altaEntrevista'].action ="<c:url value='/entrevistaSeleccion/reporteEntrevistaSeleccion.do'/>";
		document.forms['altaEntrevista'].submit();
		return
	}
	
	if(action  == 'nuevaEntrevista' ){
		document.forms['formAlumno'].action ="<c:url value='/entrevistaSeleccion/nuevaEntrevistaSeleccionView.do'/>";
		//document.forms['formAlumno'].idAlumno.value= $('#dniAlumno').val();
		document.forms['formAlumno'].submit();
		return
	}
}

</script>
</head>

<body >
<div id="main-content">

<form:form modelAttribute="escuela" id="altaEscuela" commandName="escuela"  method="post" class="cmxform" name="altaEscuela">
 
	<div id="accordion"  style="width:80%"   >
	  	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(1)" >Datos del Candidato</a></h3>
			<div id="datosCandidato"  style=" height:auto; ;overflow:scroll;">  	
			  	<jsp:include page="datosFormalesEscuelaContacto.jsp"></jsp:include>
			</div>
		<h3  class="ui-accordion-header  ui-state-default ui-corner-all" align="left"  ><a href="#" onclick="mostrar(2)">Datos del Resposanble Adulto</a></h3>
			<div id="responsable"    style=" height:auto; ;overflow:scroll;">	
				<jsp:include page="datosGeneralesIntervencion.jsp"></jsp:include>
			</div>
		<h3  class="ui-accordion-header  ui-state-default ui-corner-all" align="left"><a href="#" onclick="mostrar(3)">Ficha Familiar</a></h3>
			<div id="fichaFamiliar"  style=" height:auto; ;overflow:scroll;">
				<jsp:include page="altaEscuela.jsp"></jsp:include>
			</div>		
	</div>
		<c:choose>
			<c:when test="${isDetalleEntrevista}">
				<table align="center">
							<tr>
								<td>
									<input class="ui-state-default ui-corner-all " type="button" id="buttonVolver" value="Volver" onclick="enviarForm('volver')"/>
								</td>
							</tr>
				</table>
			</c:when>
			<c:otherwise>
					<table align="center">
							<tr>
								<td>
									<input class="ui-state-default ui-corner-all " type="button" value="Finalizado" onclick="enviarForm('finalizado')"/>
								</td>
							</tr>
					</table>
			</c:otherwise>
		</c:choose>				
</form:form>
</div>
</body>
</html>