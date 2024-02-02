<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Espacio de acompañamiento De Incorporacion ::..</title>
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
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
	<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/funcionesIncorporacion.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<link rel="stylesheet" type="text/css"	href="../pages/includes/jquery.tabs.css" />
<script type="text/javascript" src="<c:url  value="/static/js/dFilter.js"/>"></script> 
<style>
.textbox2
	 { 
	  border: 1px solid #DBE1EB; 
	  font-size: 14px; 
	  font-family: Arial, Verdana; 
	  padding-left: 2px; 
	  padding-right: 2px; 
	  padding-top: 2px; 
	  padding-bottom: 2px; 
	  border-radius: 4px; 
	  -moz-border-radius: 4px; 
	  -webkit-border-radius: 4px; 
	  -o-border-radius: 4px; 
	  background: #FFFFFF; 
	  background: linear-gradient(left, #FFFFFF, #f5ebf2); 
	  background: -moz-linear-gradient(left, #FFFFFF, #f5ebf2); 
	  background: -webkit-linear-gradient(left, #FFFFFF, #f5ebf2); 
	  background: -o-linear-gradient(left, #FFFFFF, #f5ebf2); 
	  color: #2E3133; 	 
	 } 
	 .textbox2:focus 
	  { 
	  color: #2E3133; 
	  border-color: #FBFFAD; 
	  }	  
</style>

<style type="text/css">
.classnameboton {
	-moz-box-shadow:inset 0px 1px 22px 0px #dcecfb;
	-webkit-box-shadow:inset 0px 1px 22px 0px #dcecfb;
	box-shadow:inset 0px 1px 22px 0px #dcecfb;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f5ebf2), color-stop(1, #f5ebf2) );
	background:-moz-linear-gradient( center top, #f5ebf2 5%, #f5ebf2 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5ebf2', endColorstr='#f5ebf2');
	background-color:#f5ebf2;
	-webkit-border-top-left-radius:15px;
	-moz-border-radius-topleft:15px;
	border-top-left-radius:15px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:15px;
	-moz-border-radius-bottomright:15px;
	border-bottom-right-radius:15px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #84bbf3;
	display:inline-block;
	color:#000000;
	font-family:Arial;
	font-size:13px;
	font-weight:bold;
	font-style:normal;
	height:25px;
	line-height:25px;
	width:145px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #528ecc;
}
.classnameboton:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f5ebf2), color-stop(1, #f5ebf2) );
	background:-moz-linear-gradient( center top, #f5ebf2 5%, #f5ebf2 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f5ebf2', endColorstr='#f5ebf2');
	background-color:#f5ebf2;
	text-decoration: none;
}.classnameboton:active {
	position:relative;
	top:1px;
}	
</style>
 <script>
  $(document).ready(function(){
    $("#altaEntrevistaIncorporacion").validate({
   		invalidHandler: function(form, validator) {
			var errors = validator.numberOfInvalids();
			if (errors) {
				$.unblockUI();
			}
		}
	});
	$("#datepicker").datepicker({
	  	  changeMonth: true,
		  changeYear: true,
	 	  yearRange:'-1:+1'
		  });
	$("#datepicker1").datepicker({
	  	  changeMonth: true,
		  changeYear: true,
	 	  yearRange:'-1:+1'
		  });
	$("#container-1").tabs();
  });

  function mostrar(idx){
		var selector;
			switch (idx) {
			case 1:
				selector = "#datosEntrevista1";
				break
			case 2:
				selector = "#datosEntrevista2";
				break
			case 3:
				selector = "#datosEntrevista3";
				break
			case 4:
				selector = "#datosEntrevista4";
			}

			$(selector).toggle("blind");
		}


	function guardarAprobar(valor, valorPerfil){
		//alert(document.forms['altaEntrevistaIncorporacion'].incorporacion.value);
		//return;
		if(document.forms['altaEntrevistaIncorporacion'].incorporacion.value==""){
			jAlert('warning', 'Falta seleccionar el Estado del Candidato', 'Atención!');  
			return;	
		}
		
		
		if(document.forms['altaEntrevistaIncorporacion'].incorporacion.value==2 && document.forms['altaEntrevistaIncorporacion'].motivoNoIncorporacion.value==""){
			jAlert('warning', 'Falta seleccionar el Motivo de No Incorporación', 'Atención!');  
			return;	
		}
		if(document.forms['altaEntrevistaIncorporacion'].incorporacion.value==3 && document.forms['altaEntrevistaIncorporacion'].motivoPendiente.value==""){
			jAlert('warning', 'Falta seleccionar el Motivo Pendiente', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaIncorporacion'].incorporacion.value==1 && document.forms['altaEntrevistaIncorporacion'].evaluacionCobroBeca.value==""){
			jAlert('warning', 'Falta seleccionar Evaluación Cobro Beca', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaIncorporacion'].tipoEncuentroAcompanamiento.value=="0" ){
			jAlert('warning', 'Falta seleccionar Principal tipo encuentro acompañamiento', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaIncorporacion'].participoBecado2.value=="2" && document.forms['altaEntrevistaIncorporacion'].motivoAusencia.value=="0"){
			jAlert('warning', 'Falta seleccionar el Motivo de no participación Becado', 'Atención!');  
			return;	
		}
		
		
		if(document.forms['altaEntrevistaIncorporacion'].motivoAusenciaRa2.value=="0" ){
			jAlert('warning', 'Falta seleccionar Participación RA', 'Atención!');  
			return;	
		}

		if(document.forms['altaEntrevistaIncorporacion'].proposito.value=="" ){
			jAlert('warning', 'Falta completar Propósito Anual', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaIncorporacion'].propositoAnual.value=="0" ){
			jAlert('warning', 'Falta seleccionar Categoría de Propósito anual', 'Atención!');  
			return;	
		}
		
		
		if(document.forms['altaEntrevistaIncorporacion'].hsTrabajarAño.value=="0" && document.forms['altaEntrevistaIncorporacion'].evaluacionRenovacionMergeada.value==5  ){
			jAlert('warning', 'Falta Seleccionar HSE a trabajar durante el año', 'Atención!');  
			return;	
		}
		
		
		
		
		if (document.forms['altaEntrevistaIncorporacion'].evaluacionCobroBeca.value == 3 ) { 
			document.forms['altaEntrevistaIncorporacion'].evaluacionCobroBeca.focus();
       	  	jAlert('warning', 'No se puede aprobar una entrevista en estado Dudoso', 'Atención!');
      	}
  	  	else{
  			document.forms['altaEntrevistaIncorporacion'].valorPerfil.value = valorPerfil;
  			document.forms['altaEntrevistaIncorporacion'].valorGuardar.value = valor;
  			if (valor == 'f' || valor == 's'){
  				if (document.forms['altaEntrevistaIncorporacion'].incorporacion.value !=2){
					if (esMayor(document.forms['altaEntrevistaIncorporacion'].fechaEntrevista.value, document.forms['altaEntrevistaIncorporacion'].fechaActual.value)){
						jAlert('warning', '"Fecha Entrevista" no puede ser mayor a la fecha actual', 'Atención!');				
					}
					else{
						$.blockUI();
				  		$('#altaEntrevistaIncorporacion').submit(); 
					}				
				}
  				else{
					if (document.forms['altaEntrevistaIncorporacion'].realizoEntrevista.checked){
						if (esMayor(document.forms['altaEntrevistaIncorporacion'].fechaEntrevista.value, document.forms['altaEntrevistaIncorporacion'].fechaActual.value)){
							jAlert('warning', '"Fecha Entrevista" no puede ser mayor a la fecha actual', 'Atención!');
						}
						else{
							$.blockUI();
							$('#altaEntrevistaIncorporacion').submit();
						}
					}
					else{
						$.blockUI();
						$('#altaEntrevistaIncorporacion').submit();
					}
				}
			}
  			else{
				$.blockUI();
				document.forms['altaEntrevistaIncorporacion'].submit();
			}
		}
	}

	function guardar(valor, valorPerfil){
		if ((document.forms['altaEntrevistaIncorporacion'].incorporacion.value == 1 )&&
 		  	  (!(document.getElementById("participoBecado").checked) && !(document.getElementById("participoRA").checked))) { 
			document.forms['altaEntrevistaIncorporacion'].incorporacion.focus();
			jAlert('warning', 'No se puede generar una entrevista en estado "Incorpora" sin la participación del alumno o su Reponsable Adulto', 'Atención!');
		}
		else{
			document.forms['altaEntrevistaIncorporacion'].valorPerfil.value = valorPerfil;
 		  	document.forms['altaEntrevistaIncorporacion'].valorGuardar.value = valor;
 			if (valor == 'f'){
				if (document.forms['altaEntrevistaIncorporacion'].incorporacion.value !=2){
					if (esMayor(document.forms['altaEntrevistaIncorporacion'].fechaEntrevista.value, document.forms['altaEntrevistaIncorporacion'].fechaActual.value)){
 						jAlert('warning', '"Fecha Entrevista" no puede ser mayor a la fecha actual', 'Atención!');  					
					}	
					else{
						if(valorPerfil != 'superUsuario'){
							if (!esMayor(document.forms['altaEntrevistaIncorporacion'].proximaEntrevista.value, document.forms['altaEntrevistaIncorporacion'].fechaActual.value)){
								jAlert('warning', '"Fecha Proxima Entrevista" debe ser mayor a la fecha actual', 'Atención!')
							}
							else{
								$.blockUI();
			  					$('#altaEntrevistaIncorporacion').submit(); 
							} 
						}
						else{
							$.blockUI();
	 	  					$('#altaEntrevistaIncorporacion').submit(); 
			  			} 
					}  					
				}
				else{
					if (document.forms['altaEntrevistaIncorporacion'].realizoEntrevista.checked){
						if (esMayor(document.forms['altaEntrevistaIncorporacion'].fechaEntrevista.value, document.forms['altaEntrevistaIncorporacion'].fechaActual.value)){
							jAlert('warning', '"Fecha Entrevista" no puede ser mayor a la fecha actual', 'Atención!');
						}
						else{
							$.blockUI();
							$('#altaEntrevistaIncorporacion').submit();
						}
					}
					else{
						$.blockUI();
						$('#altaEntrevistaIncorporacion').submit();
					}
				}
			}
			else{
				$.blockUI();
				document.forms['altaEntrevistaIncorporacion'].submit();
			}
		} 
	} 
 </script>
  <script type="text/javascript">
$(function() {
	 
	$("#escuela").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEscuelaPorEA.do?idEA="+ $("#idEA").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.escuelas, function(item) {
						return {
							label: item.labelEscuelaZona,
							value: item.labelEscuelaZona,
							id: item.id
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#lugarEntrevistaId").val(ui.item.id);
			$("#idProxima").val(ui.item.id);
		}
	});



});

$(function() {
	 
	$("#lugarProximaEntrevista").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEscuelaPorEA.do?idEA=" + $("#idEA").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.escuelas, function(item) {
						return {
							label: item.labelEscuelaZona,
							value: item.labelEscuelaZona,
							id: item.id
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idProxima").val(ui.item.id);
		}
	});
}); 

</script>
  
 
</head>
<body onload="cargarDatosIncorporacion();">
<center>
<div id="main-content">

<form:form id="altaEntrevistaIncorporacion" commandName="entrevista" modelAttribute="entrevista" method="post" action="guardarIncorporacion.do?alumnoId=${alumno.id}&EA=${ea}">
<form:hidden path="id"/>
<form:hidden path="fechaCarga"/>
<form:hidden path="periodoDePago"/>
<center><h1 id="titulo-informe">Espacio de acompañamiento De Incorporacion - ${entrevista.estadoEntrevista.valor}</h1>
<table id="table-informe">
	
	<tr >
		<td ><h1 id="titulo-informe"><center>${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</center></h1></td>		
	</tr>
</table>
</center>
<input type="hidden" name="valorGuardar" />
<input type="hidden" name="valorPerfil" />
<br>

<center>
<div id="accordion"  style="width:90%" >
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(1)" >Datos de Incorporación </a></h3>
	<div id="datosEntrevista1"  style=" height:580px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/tabReincorporacion.jsp" />		  	
	</div>

	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(2)" >Datos Generales</a></h3>
	<div id="datosEntrevista2"  style=" height:500px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/incorporacionTab1.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(3)" >Datos Escolares</a></h3>
	<div id="datosEntrevista3"  style=" height:500px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/incorporacionTab2.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(4)" >Acompañamiento</a></h3>
	<div id="datosEntrevista4"  style=" height:600px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/incorporacionTab3.jsp" />		  	
	</div>

</div>
</center>
<center>
<br>
	<table align="center" id="table-botons-small" width="100%">
		<tr>
			<td  width="50">
				<center>
					<input type="button" value="En construcción" class="classnameboton"	onclick="guardar('c','${tipoPerfil}');" />
				</center>
			</td>
			<td  width="50">
				<center>
					<c:if test="${tipoPerfil == 'rr'}">
						<input type="button" value="Aprobar" class="classnameboton" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>
					<c:if test="${tipoPerfil == 'ea'}">
						<input type="button" value="Finalizar" class="classnameboton" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>	
					<c:if test="${tipoPerfil == 'superUsuario'}">
						<input type="button" value="A Supervisión" class="classnameboton" onclick="guardar('f','${tipoPerfil}');" />
					</c:if>								
				</center>
			</td>
			<td  width="50">
				<center>
					<c:if test="${tipoPerfil == 'superUsuario'}">
						<input type="button" value="Aprobar" class="classnameboton" onclick="guardarAprobar('s','${tipoPerfil}');" />
					</c:if>
				</center>
			</td>	
			<td  width="50">
				<center>
					<c:if test="${tipoPerfil == 'rr'}">
						<input type="button" value="Volver" class="classnameboton"	onclick="location.href='../entrevistas/listaEntrevistasAprobar.do'; return false;" />
					</c:if>
					<c:if test="${tipoPerfil == 'ea'}">
						<input type="button" value="Volver" class="classnameboton"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
					</c:if>	
					<c:if test="${tipoPerfil == 'superUsuario'}">
							<input type="button" value="Volver" class="classnameboton"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
					</c:if>	
				</center>
			</td>
			<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
		</tr>
	</table>
</center>
<input id="idEA" type="hidden" value="${idEA}"/>
<input id="fechaActual" type="hidden" value="${fechaActual}">
</form:form>
</div>
</center>
</body>
</html>