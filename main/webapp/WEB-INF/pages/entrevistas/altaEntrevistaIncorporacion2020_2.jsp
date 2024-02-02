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
function chequearLongitud(obj){
	if (obj.value.length > 10000) {
	obj.value = obj.value.substring(0, 10000);
	}
}


function habilitarMaterialCompletoCertificadoAlumnoRegular(obj){
	
	if(	((document.getElementById("fotocipiaBoletin").value == 1) || (document.getElementById("fotocipiaBoletin").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("firmaAutorizacionImagen").value == 1) || (document.getElementById("firmaAutorizacionImagen").value == 3))&&
		((document.getElementById("firmaActaCompromiso").value == 1) || (document.getElementById("firmaActaCompromiso").value == 3))&&
		((document.getElementById("firmaAutorizacionCierreCaja").value == 1) || (document.getElementById("firmaAutorizacionCierreCaja").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0

	}
}

function habilitarMaterialCompletoFotocipiaBoletin(obj){
	
	if(	((document.getElementById("certificadoAlumnoRegular").value == 1) || (document.getElementById("certificadoAlumnoRegular").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("firmaAutorizacionImagen").value == 1) || (document.getElementById("firmaAutorizacionImagen").value == 3))&&
		((document.getElementById("firmaActaCompromiso").value == 1) || (document.getElementById("firmaActaCompromiso").value == 3))&&
		((document.getElementById("firmaAutorizacionCierreCaja").value == 1) || (document.getElementById("firmaAutorizacionCierreCaja").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0

	}
}

function habilitarMaterialCompletoFirmaActaCompromiso(obj){
	
	if(	((document.getElementById("certificadoAlumnoRegular").value == 1) || (document.getElementById("certificadoAlumnoRegular").value == 3))&&
		((obj.value == 1) || (obj.value == 3))&&
		((document.getElementById("fotocipiaBoletin").value == 1) || (document.getElementById("fotocipiaBoletin").value == 3))&&
		((document.getElementById("firmaAutorizacionImagen").value == 1) || (document.getElementById("firmaAutorizacionImagen").value == 3))&&
		((document.getElementById("firmaAutorizacionCierreCaja").value == 1) || (document.getElementById("firmaAutorizacionCierreCaja").value == 3)))
		
	{
		document.getElementById("materialCompleto").checked = 1
	}else{
		document.getElementById("materialCompleto").checked = 0

	}
}

function habilitarMaterialCompletoFirmaAutorizacionCierreCaja(obj){
		
	if(	((document.getElementById("certificadoAlumnoRegular").value == 1) || (document.getElementById("certificadoAlumnoRegular").value == 3))&&
			((obj.value == 1) || (obj.value == 3))&&
			((document.getElementById("fotocipiaBoletin").value == 1) || (document.getElementById("fotocipiaBoletin").value == 3))&&
			((document.getElementById("firmaActaCompromiso").value == 1) || (document.getElementById("firmaActaCompromiso").value == 3))&&
			((document.getElementById("firmaAutorizacionImagen").value == 1) || (document.getElementById("firmaAutorizacionImagen").value == 3))
			)
			
		{
			document.getElementById("materialCompleto").checked = 1
		}else{
			document.getElementById("materialCompleto").checked = 0

		}
}

function habilitarMaterialCompletoFirmaAutorizacionImagen(obj){
	
	if(	((document.getElementById("certificadoAlumnoRegular").value == 1) || (document.getElementById("certificadoAlumnoRegular").value == 3))&&
			((obj.value == 1) || (obj.value == 3))&&
			((document.getElementById("fotocipiaBoletin").value == 1) || (document.getElementById("fotocipiaBoletin").value == 3))&&
			((document.getElementById("firmaActaCompromiso").value == 1) || (document.getElementById("firmaActaCompromiso").value == 3))&&
			((document.getElementById("firmaAutorizacionCierreCaja").value == 1) || (document.getElementById("firmaAutorizacionCierreCaja").value == 3)))
			
		{
			document.getElementById("materialCompleto").checked = 1
		}else{
			document.getElementById("materialCompleto").checked = 0

		}
}

function habilitarCamposBecado(obj){
	
    if (document.getElementById("incorporacion").value == 1){
    	if(obj.disabled || obj.checked){
			document.getElementById("motivoAusencia").disabled = true;
			document.getElementById("otroMotivoAusencia").disabled = true;
			document.getElementById("motivoAusencia").value = "";
			document.getElementById("otroMotivoAusencia").value= "";
		}
    	else{
			document.getElementById("motivoAusencia").disabled = false;
		}
    }else
    	if (document.getElementById("realizoEntrevista").checked){
    		if(obj.disabled || obj.checked){
				document.getElementById("motivoAusencia").disabled = true;
				document.getElementById("otroMotivoAusencia").disabled = true;
				document.getElementById("motivoAusencia").value = "";
				document.getElementById("otroMotivoAusencia").value= "";
			}
			else{
				document.getElementById("motivoAusencia").disabled = false;
				}
		    }
	    else{
	    	document.getElementById("motivoAusencia").disabled = true;
			document.getElementById("otroMotivoAusencia").disabled = true;
			document.getElementById("motivoAusencia").value = "";
			document.getElementById("otroMotivoAusencia").value= "";
	    }
}

function habilitarCamposRA(obj){
	
	if (document.getElementById("incorporacion").value == 1){ 
		if(obj.checked){
			document.getElementById("motivoAusenciaRA").disabled = true;
			document.getElementById("otroMotivoAusenciaRA").disabled = true;
			document.getElementById("motivoAusenciaRA").value ="";
			document.getElementById("otroMotivoAusenciaRA").value= "";
			document.getElementById("raNoConvocado").checked = true;
			document.getElementById("motivoNoConvocatoria").disabled = true;
		}
		else{
			document.getElementById("motivoAusenciaRA").disabled = true;
		}
	}else
		if (document.getElementById("realizoEntrevista").checked){
			if(obj.checked){
				document.getElementById("motivoAusenciaRA").disabled = true;
				document.getElementById("otroMotivoAusenciaRA").disabled = true;
				document.getElementById("motivoAusenciaRA").value ="";
				document.getElementById("otroMotivoAusenciaRA").value= "";
				document.getElementById("raNoConvocado").checked = true;
				document.getElementById("motivoNoConvocatoria").disabled = true;
			}
			else{
				document.getElementById("motivoAusenciaRA").disabled = true;
				}
			}
		 else{
			document.getElementById("motivoAusenciaRA").disabled = true;
			document.getElementById("otroMotivoAusenciaRA").disabled = true;
			document.getElementById("motivoAusenciaRA").value = "";
			document.getElementById("otroMotivoAusenciaRA").value= "";
			document.getElementById("raNoConvocado").checked = true;
			document.getElementById("motivoNoConvocatoria").disabled = true;
		 }
}

function habilitarCamposIncorporacion(obj){
	alert(obj.value);
	if(obj.value == 3){
		document.getElementById("motivoPendiente").disabled = false;
		document.getElementById("motivoNoIncorporacion").disabled = true;
		document.getElementById("motivoNoIncorporacion").value= "";
		document.getElementById("observacionesNoIncorporacion").disabled = true;
		document.getElementById("observacionesNoIncorporacion").value= "";
		document.getElementById("evaluacionCobroBeca").disabled = true;
		document.getElementById("evaluacionCobroBeca").value= "";
		document.getElementById("realizoEntrevista").disabled = false;
		document.getElementById("tipoContacto").disabled = false;
		document.getElementById("certificadoAlumnoRegular").disabled = true;
		document.getElementById("certificadoAlumnoRegular").value= "";
		document.getElementById("firmaActaCompromiso").disabled = true;
		document.getElementById("firmaActaCompromiso").value= "";
		document.getElementById("firmaAutorizacionCierreCaja").disabled = true;
		document.getElementById("firmaAutorizacionCierreCaja").value= "";
		document.getElementById("firmaAutorizacionImagen").disabled = true;
		document.getElementById("firmaAutorizacionImagen").value= "";
		document.getElementById("fotocipiaBoletin").disabled = true;
		document.getElementById("fotocipiaBoletin").value= "";
		document.getElementById("materialCompleto").checked= false;
		document.getElementById("proposito").disabled = true;
		document.getElementById("proposito").value= "";
		document.getElementById("propositoAnual").disabled = true;
		document.getElementById("propositoAnual").value= "";
		document.getElementById("contenidosTrabajarEnElAnio").disabled = true;
		
		//document.getElementById("expectativasRA").disabled = true;
		//document.getElementById("expectativasRA").value= "";
		//document.getElementById("destinoDinero").disabled = true;
		//document.getElementById("destinoDinero").value= "";
		document.getElementById("observacionesGenerales").disabled = false;
		document.getElementById("proximaEntrevista").disabled = false;
		document.getElementById("horaProxEntrevista").disabled = false;
		document.getElementById("lugarProximaEntrevista").disabled = false;
		document.getElementById("entregaMaterial").disabled = true;
		document.getElementById("entregaMaterial").checked= false;
		document.getElementById("participoBecado").disabled = false;
		document.getElementById("participoRA").disabled = false;
		habilitarTipocontacto(document.getElementById("realizoEntrevista"));
	}
	else if(obj.value == 2){
		document.getElementById("motivoNoIncorporacion").disabled = false;
		document.getElementById("observacionesNoIncorporacion").disabled = false;
		document.getElementById("motivoPendiente").disabled = true;
		document.getElementById("motivoPendiente").value = "";
		document.getElementById("evaluacionCobroBeca").disabled = true;
		document.getElementById("evaluacionCobroBeca").value= "";
		document.getElementById("realizoEntrevista").disabled = false;
		document.getElementById("tipoContacto").disabled = false;
		document.getElementById("certificadoAlumnoRegular").disabled = true;
		document.getElementById("certificadoAlumnoRegular").value= "";
		document.getElementById("firmaActaCompromiso").disabled = true;
		document.getElementById("firmaActaCompromiso").value= "";
		document.getElementById("firmaAutorizacionCierreCaja").disabled = true;
		document.getElementById("firmaAutorizacionCierreCaja").value= "";
		document.getElementById("firmaAutorizacionImagen").disabled = true;
		document.getElementById("firmaAutorizacionImagen").value= "";
		document.getElementById("fotocipiaBoletin").disabled = true;
		document.getElementById("fotocipiaBoletin").value= "";
		document.getElementById("materialCompleto").checked= false;
		document.getElementById("proposito").disabled = true;
		document.getElementById("proposito").value= "";
		//document.getElementById("expectativasRA").disabled = true;
		//document.getElementById("expectativasRA").value= "";
		//document.getElementById("destinoDinero").disabled = true;
		//document.getElementById("destinoDinero").value= "";
		document.getElementById("observacionesGenerales").disabled = true;
		document.getElementById("observacionesGenerales").value= "";
		document.getElementById("proximaEntrevista").disabled = true;
		document.getElementById("proximaEntrevista").value= "";
		document.getElementById("horaProxEntrevista").disabled = true;
		document.getElementById("horaProxEntrevista").value= "";
//		document.getElementById("lugarProximaEntrevista").disabled = true;
//		document.getElementById("lugarProximaEntrevista").value= "";
		document.getElementById("entregaMaterial").disabled = true;
		document.getElementById("entregaMaterial").checked= false;
		document.getElementById("participoBecado").disabled = true;
		document.getElementById("participoRA").disabled = true;
		habilitarTipocontacto(document.getElementById("realizoEntrevista"));

	}
	else if(obj.value==1){
		document.getElementById("motivoNoIncorporacion").disabled = true;
		document.getElementById("motivoNoIncorporacion").value= "";
		document.getElementById("observacionesNoIncorporacion").disabled = true;
		document.getElementById("observacionesNoIncorporacion").value= "";
		document.getElementById("motivoPendiente").disabled = true;
		document.getElementById("motivoPendiente").value = "";
		document.getElementById("evaluacionCobroBeca").disabled = false;
		document.getElementById("realizoEntrevista").disabled = true;
		document.getElementById("realizoEntrevista").checked= false;
		document.getElementById("tipoContacto").disabled = true;
		document.getElementById("tipoContacto").value= "";
		document.getElementById("proposito").disabled = false;
		//document.getElementById("expectativasRA").disabled = false;
		//document.getElementById("destinoDinero").disabled = false;
		document.getElementById("observacionesGenerales").disabled = false;
		document.getElementById("fechaEntrevista").disabled = false;
		document.getElementById("lugarEntrevista").disabled = false;
		document.getElementById("proximaEntrevista").disabled = false;
		document.getElementById("horaProxEntrevista").disabled = false;
		document.getElementById("lugarProximaEntrevista").disabled = false;
		document.getElementById("entregaMaterial").disabled = false;
		document.getElementById("participoBecado").disabled = false;
		document.getElementById("participoRA").disabled = false;
		document.getElementById("motivoAusencia").disabled = false;
		document.getElementById("motivoAusenciaRA").disabled = false;
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").value = "";
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";
		document.getElementById("certificadoAlumnoRegular").disabled = false;
		document.getElementById("firmaActaCompromiso").disabled = false;
		document.getElementById("firmaAutorizacionCierreCaja").disabled = false;
		document.getElementById("firmaAutorizacionImagen").disabled = false;
		document.getElementById("fotocipiaBoletin").disabled = false;
		
	}else{
		document.getElementById("motivoPendiente").disabled = true;
		document.getElementById("motivoPendiente").value = "";
		document.getElementById("motivoNoIncorporacion").disabled = true;
		document.getElementById("motivoNoIncorporacion").value= "";
		document.getElementById("observacionesNoIncorporacion").disabled = true;
		document.getElementById("observacionesNoIncorporacion").value= "";
		document.getElementById("evaluacionCobroBeca").disabled = true;
		document.getElementById("evaluacionCobroBeca").value= "";
		document.getElementById("realizoEntrevista").disabled = true;
		document.getElementById("realizoEntrevista").checked= false;
		document.getElementById("tipoContacto").disabled = true;
		document.getElementById("tipoContacto").value= "";
		document.getElementById("fechaEntrevista").disabled = true;
		document.getElementById("fechaEntrevista").value = "";
		document.getElementById("lugarEntrevista").disabled = true;
//		document.getElementById("lugarEntrevista").value = "";
		document.getElementById("proposito").disabled = true;
		document.getElementById("proposito").value= "";
		//document.getElementById("expectativasRA").disabled = true;
		//document.getElementById("expectativasRA").value= "";
		//document.getElementById("destinoDinero").disabled = true;
		//document.getElementById("destinoDinero").value= "";
		document.getElementById("observacionesGenerales").disabled = true;
		document.getElementById("observacionesGenerales").value= "";
		document.getElementById("proximaEntrevista").disabled = true;
		document.getElementById("proximaEntrevista").value= "";
		document.getElementById("horaProxEntrevista").disabled = true;
		document.getElementById("horaProxEntrevista").value= "";
		document.getElementById("lugarProximaEntrevista").disabled = true;
//		document.getElementById("lugarProximaEntrevista").value= "";
		document.getElementById("entregaMaterial").disabled = true;
		document.getElementById("entregaMaterial").checked= false;
		document.getElementById("participoBecado").disabled = true;
		document.getElementById("participoBecado").checked = false;
		document.getElementById("participoRA").disabled = true;
		document.getElementById("participoRA").checked = false;
		document.getElementById("motivoAusencia").disabled = true;
		document.getElementById("motivoAusencia").value = "";
		document.getElementById("motivoAusenciaRA").disabled = true;
		document.getElementById("motivoAusenciaRA").value = "";
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").value = "";
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";
		document.getElementById("certificadoAlumnoRegular").disabled = true;
		document.getElementById("certificadoAlumnoRegular").value= "";
		document.getElementById("firmaActaCompromiso").disabled = true;
		document.getElementById("firmaActaCompromiso").value= "";
		document.getElementById("firmaAutorizacionCierreCaja").disabled = true;
		document.getElementById("firmaAutorizacionCierreCaja").value= "";
		document.getElementById("firmaAutorizacionImagen").disabled = true;
		document.getElementById("firmaAutorizacionImagen").value= "";
		document.getElementById("fotocipiaBoletin").disabled = true;
		document.getElementById("fotocipiaBoletin").value= "";
		document.getElementById("materialCompleto").checked= false;
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").value = "";
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";
		
		habilitarTipocontacto(document.getElementById("realizoEntrevista"));
		document.getElementById("tipoContacto").disabled = true;
	}
	habilitarMotivoPendiente(document.getElementById("motivoPendiente"));
	habilitarMotivoTipoContacto(document.getElementById("tipoContacto"));
	habilitarOtroMotivoNoIncorporacion(document.getElementById("motivoNoIncorporacion"));
	
}

function habilitarOtroMotivo(obj){
	if(obj.value == 4){
		document.getElementById("otroMotivoAusencia").disabled = false;
	}
	else{
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").value = "";
	}
}

function habilitarOtroMotivoRA(obj){
	if(obj.value == 4){
		document.getElementById("otroMotivoAusenciaRA").disabled = false;
	}
	else{
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";
	}
}


function habilitarTipocontacto(valor){
	if(valor.checked)
		{document.getElementById("tipoContacto").disabled = true;
		document.getElementById("tipoContacto").value = "";
		document.getElementById("participoBecado").disabled = false;
		document.getElementById("participoRA").disabled = false;
		document.getElementById("motivoAusencia").disabled = false;
		document.getElementById("motivoAusenciaRA").disabled = false;
		document.getElementById("otroMotivoAusencia").disabled = treu;
		document.getElementById("otroMotivoAusenciaRA").disabled = false;
		document.getElementById("motivoTipoContactoOtro").disabled = true;
		document.getElementById("motivoTipoContactoOtro").value = "";
		document.getElementById("fechaEntrevista").disabled = false;
		document.getElementById("lugarEntrevista").disabled = false;
		}
	else
		{
		document.getElementById("tipoContacto").disabled = false;
		document.getElementById("motivoTipoContactoOtro").disabled = false;
		document.getElementById("fechaEntrevista").disabled = true;
		document.getElementById("fechaEntrevista").value = "";
		document.getElementById("lugarEntrevista").disabled = true;
//		document.getElementById("lugarEntrevista").value = "";
		document.getElementById("participoBecado").disabled = true;
		document.getElementById("participoBecado").checked = false;
		document.getElementById("participoRA").disabled = true;
		document.getElementById("participoRA").checked = false;
		document.getElementById("motivoAusencia").disabled = true;
		document.getElementById("motivoAusencia").value = "";
		document.getElementById("motivoAusenciaRA").disabled = true;
		document.getElementById("motivoAusenciaRA").value = "";
		document.getElementById("otroMotivoAusencia").disabled = true;
		document.getElementById("otroMotivoAusencia").value = "";
		document.getElementById("otroMotivoAusenciaRA").disabled = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";
		}
}	

function habilitarMotivoTipoContacto(obj){
	if(obj.value == 5){
		document.getElementById("motivoTipoContactoOtro").disabled = false;
	}
	else{
		document.getElementById("motivoTipoContactoOtro").disabled = true;
		document.getElementById("motivoTipoContactoOtro").value = "";
	
}
}

function habilitarMotivoPendiente(obj){
	if(obj.value == 4){	
		document.getElementById("motivoOtroPendiente").disabled = false;
	}
	else{
		document.getElementById("motivoOtroPendiente").disabled = true;
		document.getElementById("motivoOtroPendiente").value = "";	
	}
}

function habilitarOtroMotivoNoIncorporacion(obj){
	if(obj.value == 5){
		document.getElementById("motivoNoIncorporacionOtro").disabled = false;
	}
	else{
		document.getElementById("motivoNoIncorporacionOtro").disabled = true;
		document.getElementById("motivoNoIncorporacionOtro").value = "";	
	}
}

function cargarDatosIncorporacion(){
	habilitarCamposIncorporacion(document.getElementById("incorporacion"));
	habilitarCamposBecado(document.getElementById("participoBecado"));
	habilitarCamposRA(document.getElementById("participoRA"));
	habilitarOtroMotivo(document.getElementById("motivoAusencia"));
	habilitarOtroMotivoRA(document.getElementById("motivoAusenciaRA"));

}



</script>



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
		
		
		if(document.forms['altaEntrevistaIncorporacion'].hsTrabajarAño.value=="0" ){
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
		//if ((document.forms['altaEntrevistaIncorporacion'].incorporacion.value == 1 )&&
 		//  	  ((document.getElementById("participoBecado2").value="2") && (document.getElementById("motivoAusenciaRa2").value="0"))) { 
		//	document.forms['altaEntrevistaIncorporacion'].incorporacion.focus();
		//	jAlert('warning', 'No se puede generar una entrevista en estado "Incorpora" sin la participación del alumno o su Reponsable Adulto', 'Atención!');
		//}
		//else{
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
		//} 
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