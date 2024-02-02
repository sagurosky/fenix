<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Espacio de acompañamiento Renovacion ::..</title>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
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
<script type="text/javascript" src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet" href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/validador.js"/>"></script>

<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<link rel="stylesheet" type="text/css"	href="../pages/includes/jquery.tabs.css" />
<script type="text/javascript" src="<c:url  value="/static/js/dFilter.js"/>"></script> 

<script>
function chequearLongitud(obj){
	if (obj.value.length > 10000) {
	obj.value = obj.value.substring(0, 10000);
	}
}

$(function() {
  $("#situacionEscolar").change(function(evt) {
    evt.preventDefault()   
    $.ajax( {
      type: "GET",
      url: "../ajax/obtenerEvaluacionRenovacion.do",
      data: { idSituacionEscolar: $("#situacionEscolar").val() },
      dataType: "json",
      success: function(data) {
    	  var options = '';
            options += '<option value="" selected="selected">Seleccione una opci&oacute;n...</option>'
            $(data.evaluaciones).each(function() {
                options += '<option value="' + this.id + '">' + this.valor + '</option>';
            });
             $("select#evaluacionRenovacion").html(options);
             deshabilitarEvaluacionPendiente();             
      }
    } );
    if($('#situacionEscolar').val().length == 0){
    	deshabilitarEvaluacionPendiente();
    }
  })
})
function deshabilitarEvaluacionPendiente(){
	//document.getElementById("gustosTiempoLibre").readOnly = false;
	//document.getElementById("propositoAnioComienza").readOnly = true;
	document.getElementById("motivoPendiente").value = "";
	document.getElementById("motivoPendiente").readOnly = true;
	document.getElementById("motivoNoRenovacion").value = "";
	document.getElementById("motivoNoRenovacion").readOnly = true;
	habilitarMotivoPendiente(document.getElementById("motivoPendiente"));
	document.getElementById("realizoEntrevista").checked = 0;
	//document.getElementById("realizoEntrevista").readOnly = true;
	document.getElementById("tipoContacto").value = "";
	document.getElementById("tipoContacto").readOnly = true;
	habilitarMotivoTipoContacto(document.getElementById("tipoContacto"));
	//document.getElementById("observacionMateriasExamenes").readOnly = true;
	//document.getElementById("observacionMateriasExamenes").value = "";
	//document.getElementById("realizadoVacaciones").readOnly = true;
	//document.getElementById("realizadoVacaciones").value = "";
	//document.getElementById("propositoAnioComienza").readOnly = true;
	//document.getElementById("propositoAnioComienza").value = "";
	//document.getElementById("propositoAnioComienzaList").readOnly = true;
	//document.getElementById("propositoAnioComienzaList").value = "";
	//document.getElementById("gustosTiempoLibre").readOnly = true;
	//document.getElementById("gustosTiempoLibre").value = "";
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
	if(obj.readOnly || obj.checked){
		document.getElementById("motivoAusencia").readOnly = true;
		document.getElementById("otroMotivoAusencia").readOnly = true;
		//document.getElementById("motivoAusencia").value = "";
		document.getElementById("otroMotivoAusencia").value= "";	
		document.getElementById("realizadoVacaciones").readOnly = false;
	}
	else{
		document.getElementById("motivoAusencia").readOnly = false;
		//document.getElementById("realizadoVacaciones").readOnly = true;
		//document.getElementById("realizadoVacaciones").value= "";
	}
	//habilitarChecks(!(document.getElementById("participoRA").checked || obj.checked));	
}

function habilitarCamposRA(obj){
	/*
	if( obj.checked){
	//if(obj.readOnly || obj.checked){	
		//document.getElementById("motivoAusenciaRA").readOnly = true;
		document.getElementById("otroMotivoAusenciaRA").readOnly = true;
		//document.getElementById("motivoAusenciaRA").value ="";
		document.getElementById("otroMotivoAusenciaRA").value= "";
		document.getElementById("realizadoVacaciones").readOnly = false;
		document.getElementById("raNoConvocado").checked = true;
		document.getElementById("motivoNoConvocatoria").readOnly = true;
	}
	else{
		//document.getElementById("motivoAusenciaRA").readOnly = true;	
		//document.getElementById("realizadoVacaciones").readOnly = true;
		//document.getElementById("realizadoVacaciones").value= "";
	}*/
	//habilitarChecks(!(document.getElementById("participoBecado").checked || obj.checked));	
}

//function habilitarChecks(valor){
//	document.getElementById("fotocipiaBoletin").readOnly = valor;
//	}


function habilitarCamposRenovacion(obj){
	//antes PENDIENTE(3,"Pendiente");
	//alert(obj.value);
	//ahora PENDIENTE(2,"Pendiente"),
	//document.getElementById("propositoAnioComienza").readOnly = false;
	//document.getElementById("gustosTiempoLibre").readOnly = false;
	alert(obj.value);
	if(obj.value == 2){		
		document.getElementById("excepcionR2").readOnly = false;
		document.getElementById("motivoExcepcion").readOnly = false;
		document.getElementById("motivoPendiente").readOnly = false;
		document.getElementById("motivoOtro").readOnly = false;
		document.getElementById("motivoNoRenovacion").readOnly = true;
		document.getElementById("motivoNoRenovacion").value= "";
		document.getElementById("evaluacionCobroBeca").readOnly = true;
		document.getElementById("evaluacionCobroBeca").value= "";
		//document.getElementById("realizoEntrevista").readOnly = false;
//		document.getElementById("realizoEntrevista").checked = 0;
		document.getElementById("tipoContacto").readOnly = false;
//		document.getElementById("tipoContacto").value= "";
//		document.getElementById("fechaEntrevista").readOnly = true;
//		document.getElementById("fechaEntrevista").value = "";
//		document.getElementById("lugarEntrevista").readOnly = true;
//		document.getElementById("lugarEntrevista").value = "";
		document.getElementById("certificadoAlumnoRegular").readOnly = true;
		document.getElementById("certificadoAlumnoRegular").value= "";
		document.getElementById("firmaActaCompromiso").readOnly = true;
		document.getElementById("firmaActaCompromiso").value= "";
		document.getElementById("firmaAutorizacionCierreCaja").readOnly = true;
		document.getElementById("firmaAutorizacionCierreCaja").value= "";
		document.getElementById("firmaAutorizacionImagen").readOnly = true;
		document.getElementById("firmaAutorizacionImagen").value= "";
		document.getElementById("fotocipiaBoletin").readOnly = true;
		document.getElementById("fotocipiaBoletin").value= "";
//		document.getElementById("observacionMateriasExamenes").readOnly = true;
//		document.getElementById("observacionMateriasExamenes").value = "";
//		document.getElementById("escolaridadCompromisoAnterior").readOnly = true;
//		document.getElementById("escolaridadCompromisoAnterior").value= "";
//		document.getElementById("realizadoVacaciones").readOnly = true;
//		document.getElementById("realizadoVacaciones").value= "";
		//document.getElementById("propositoAnioComienza").readOnly = true;
		//document.getElementById("propositoAnioComienza").value= "";
//		document.getElementById("propositoAnioComienzaList").readOnly = true;
//		document.getElementById("gustosTiempoLibre").readOnly = true;
//		document.getElementById("gustosTiempoLibre").value = "";
		//document.getElementById("expectativasRA").readOnly = true;
		//document.getElementById("expectativasRA").value= "";
	//	document.getElementById("destinoDinero").readOnly = true;
	//	document.getElementById("destinoDinero").value= "";
		document.getElementById("proximaEntrevista").readOnly = false;
		document.getElementById("horaProxEntrevista").readOnly = false;
		document.getElementById("lugarProximaEntrevista").readOnly = false;
		document.getElementById("entregaMaterial").readOnly = true;
		document.getElementById("entregaMaterial").checked= false;
		document.getElementById("materialCompleto").checked= false;
		document.getElementById("motivoSuspension").value= "";
		document.getElementById("motivoSuspension").readOnly = true;
		habilitarTipocontacto(document.getElementById("realizoEntrevista"));
			
	}
	//antes NORENUEVA(2,"No renueva"),
	//ahora NO_RENUEVA(1,"No renueva"),
	else if(obj.value == 1){
		//alert("entre a 1");
		document.getElementById("excepcionR2").readOnly = false;
		document.getElementById("motivoExcepcion").readOnly = false;
		document.getElementById("motivoPendiente").readOnly = true;
		document.getElementById("motivoPendiente").value= "";
		document.getElementById("motivoOtro").readOnly = false;
		document.getElementById("motivoNoRenovacion").readOnly = false;
		document.getElementById("evaluacionCobroBeca").readOnly = true;
		document.getElementById("motivoPendiente").value= "";
		//document.getElementById("realizoEntrevista").readOnly = false;
//		document.getElementById("realizoEntrevista").checked = 0;
		document.getElementById("tipoContacto").readOnly = false;
//		document.getElementById("tipoContacto").value= "";
//		document.getElementById("fechaEntrevista").readOnly = true;
//		document.getElementById("fechaEntrevista").value = "";
//		document.getElementById("lugarEntrevista").readOnly = true;
//		document.getElementById("lugarEntrevista").value = "";
		////alert("pase 1");
		document.getElementById("certificadoAlumnoRegular").readOnly = true;
		document.getElementById("certificadoAlumnoRegular").value= "";
		document.getElementById("firmaActaCompromiso").readOnly = true;
		document.getElementById("firmaActaCompromiso").value= "";
		document.getElementById("firmaAutorizacionCierreCaja").readOnly = true;
		document.getElementById("firmaAutorizacionCierreCaja").value= "";
		document.getElementById("firmaAutorizacionImagen").readOnly = true;
		document.getElementById("firmaAutorizacionImagen").value= "";
		document.getElementById("fotocipiaBoletin").readOnly = true;
		document.getElementById("fotocipiaBoletin").value= "";
//		document.getElementById("observacionMateriasExamenes").readOnly = true;
//		document.getElementById("observacionMateriasExamenes").value = "";
//		document.getElementById("escolaridadCompromisoAnterior").readOnly = true;
//		document.getElementById("escolaridadCompromisoAnterior").value= "";
//		document.getElementById("realizadoVacaciones").readOnly = true;
//		document.getElementById("realizadoVacaciones").value= "";
		//document.getElementById("propositoAnioComienza").readOnly = true;
		//document.getElementById("propositoAnioComienza").value= "";
//		document.getElementById("propositoAnioComienzaList").readOnly = true;
//		document.getElementById("gustosTiempoLibre").readOnly = true;
//		document.getElementById("gustosTiempoLibre").value = "";
		//document.getElementById("expectativasRA").readOnly = true;
		//document.getElementById("expectativasRA").value= "";
//		document.getElementById("destinoDinero").readOnly = true;
//		document.getElementById("destinoDinero").value= "";
		////alert("pase");
		document.getElementById("evaluacionCobroBeca").readOnly = true;		
		document.getElementById("evaluacionCobroBeca").value= "";
		////alert("pase");
		document.getElementById("proximaEntrevista").readOnly = true;
		document.getElementById("proximaEntrevista").value= "";
		document.getElementById("horaProxEntrevista").readOnly = true;
		document.getElementById("horaProxEntrevista").value= "";
		document.getElementById("lugarProximaEntrevista").readOnly = true;
		document.getElementById("entregaMaterial").readOnly = true;
		document.getElementById("entregaMaterial").checked= false;
		document.getElementById("materialCompleto").checked= false;
		document.getElementById("motivoSuspension").value= "";
		document.getElementById("motivoSuspension").readOnly = true;
		//alert("antes de habilitar tipo contacto");
		habilitarTipocontacto(document.getElementById("realizoEntrevista"));
		//alert("sali");
		
	}
	//antes RENUEVA(1,"Renueva"),
	//ahora RENUEVA(5,"Renueva")
	else if (obj.value == 5){ 
		document.getElementById("motivoExcepcion").readOnly = true;
		document.getElementById("excepcionR2").readOnly = true;
		document.getElementById("motivoNoRenovacion").readOnly = true;
		document.getElementById("motivoNoRenovacion").value= "";
		document.getElementById("motivoPendiente").readOnly = true;
		document.getElementById("motivoPendiente").value= "";
		document.getElementById("motivoOtro").readOnly = false;
		document.getElementById("evaluacionCobroBeca").readOnly = false;
		//document.getElementById("realizoEntrevista").readOnly = true;
		document.getElementById("realizoEntrevista").checked = false;
		document.getElementById("tipoContacto").readOnly = true;
		document.getElementById("tipoContacto").value = "";
		//document.getElementById("fechaEntrevista").readOnly = false;
		//document.getElementById("lugarEntrevista").readOnly = false;
		document.getElementById("certificadoAlumnoRegular").readOnly = false;
		document.getElementById("firmaActaCompromiso").readOnly = false;
		document.getElementById("firmaAutorizacionCierreCaja").readOnly = false;
		document.getElementById("firmaAutorizacionImagen").readOnly = false;
		document.getElementById("fotocipiaBoletin").readOnly = false;
//		document.getElementById("observacionMateriasExamenes").readOnly = false;
//		document.getElementById("escolaridadCompromisoAnterior").readOnly = false;
		document.getElementById("realizadoVacaciones").readOnly = false;
		//document.getElementById("propositoAnioComienza").readOnly = false;
//		document.getElementById("propositoAnioComienzaList").readOnly = false;
//		document.getElementById("gustosTiempoLibre").readOnly = false;
		//document.getElementById("expectativasRA").readOnly = false;
//		document.getElementById("destinoDinero").readOnly = false;
		document.getElementById("proximaEntrevista").readOnly = false;
		document.getElementById("horaProxEntrevista").readOnly = false;
		document.getElementById("lugarProximaEntrevista").readOnly = false;
		document.getElementById("entregaMaterial").readOnly = false;
		//document.getElementById("participoRA").readOnly = false;
		document.getElementById("participoBecado").readOnly = false;
		document.getElementById("motivoAusencia").readOnly = false;
		//document.getElementById("motivoAusenciaRA").readOnly = false;

	}else if (obj.value == 6){
		document.getElementById("excepcionR2").readOnly = false;
		document.getElementById("motivoExcepcion").readOnly = false;
		document.getElementById("motivoNoRenovacion").readOnly = true;
		document.getElementById("motivoNoRenovacion").value= "";
		document.getElementById("motivoPendiente").readOnly = true;
		document.getElementById("motivoPendiente").value= "";
		document.getElementById("motivoOtro").readOnly = false;
		document.getElementById("evaluacionCobroBeca").readOnly = false;
		//document.getElementById("realizoEntrevista").readOnly = true;
		document.getElementById("realizoEntrevista").checked = false;
		document.getElementById("tipoContacto").readOnly = true;
		document.getElementById("tipoContacto").value = "";
		//document.getElementById("fechaEntrevista").readOnly = false;
		//document.getElementById("lugarEntrevista").readOnly = false;
		document.getElementById("certificadoAlumnoRegular").readOnly = false;
		document.getElementById("firmaActaCompromiso").readOnly = false;
		document.getElementById("firmaAutorizacionCierreCaja").readOnly = false;
		document.getElementById("firmaAutorizacionImagen").readOnly = false;
		document.getElementById("fotocipiaBoletin").readOnly = false;
//		document.getElementById("observacionMateriasExamenes").readOnly = false;
//		document.getElementById("escolaridadCompromisoAnterior").readOnly = false;
		document.getElementById("realizadoVacaciones").readOnly = false;
		//document.getElementById("propositoAnioComienza").readOnly = false;
//		document.getElementById("propositoAnioComienzaList").readOnly = false;
//		document.getElementById("gustosTiempoLibre").readOnly = false;
		//document.getElementById("expectativasRA").readOnly = false;
//		document.getElementById("destinoDinero").readOnly = false;
		document.getElementById("proximaEntrevista").readOnly = false;
		document.getElementById("horaProxEntrevista").readOnly = false;
		document.getElementById("lugarProximaEntrevista").readOnly = false;
		document.getElementById("entregaMaterial").readOnly = false;
		//document.getElementById("participoRA").readOnly = false;
		document.getElementById("participoBecado").readOnly = false;
		document.getElementById("motivoAusencia").readOnly = false;
		//document.getElementById("motivoAusenciaRA").readOnly = false;

	}
	else {
		document.getElementById("motivoExcepcion").readOnly = true;
		document.getElementById("excepcionR2").readOnly = true;
		document.getElementById("motivoNoRenovacion").readOnly = true;
		document.getElementById("motivoPendiente").readOnly = true;
		document.getElementById("motivoOtro").readOnly = false;
		document.getElementById("evaluacionCobroBeca").readOnly = true;
		//document.getElementById("realizoEntrevista").readOnly = true;
		document.getElementById("tipoContacto").readOnly = true;
		document.getElementById("certificadoAlumnoRegular").readOnly = true;
		document.getElementById("certificadoAlumnoRegular").value= "";
		document.getElementById("firmaActaCompromiso").readOnly = true;
		document.getElementById("firmaActaCompromiso").value= "";
		document.getElementById("firmaAutorizacionCierreCaja").readOnly = true;
		document.getElementById("firmaAutorizacionCierreCaja").value= "";
		document.getElementById("firmaAutorizacionImagen").readOnly = true;
		document.getElementById("firmaAutorizacionImagen").value= "";
		document.getElementById("fotocipiaBoletin").readOnly = true;
		document.getElementById("fotocipiaBoletin").value= "";
//		document.getElementById("observacionMateriasExamenes").readOnly = true;
//		document.getElementById("observacionMateriasExamenes").value = "";
//		document.getElementById("escolaridadCompromisoAnterior").readOnly = true;
//		document.getElementById("escolaridadCompromisoAnterior").value= "";
//		document.getElementById("realizadoVacaciones").readOnly = true;
//		document.getElementById("realizadoVacaciones").value= "";
		//document.getElementById("propositoAnioComienza").readOnly = true;
		//document.getElementById("propositoAnioComienza").value= "";
//		document.getElementById("propositoAnioComienzaList").readOnly = true;
//		document.getElementById("gustosTiempoLibre").readOnly = true;
//		document.getElementById("gustosTiempoLibre").value = "";
	//	document.getElementById("expectativasRA").readOnly = true;
	//	document.getElementById("expectativasRA").value= "";
	//	document.getElementById("destinoDinero").readOnly = true;
	//	document.getElementById("destinoDinero").value= "";
		document.getElementById("proximaEntrevista").readOnly = true;
		document.getElementById("proximaEntrevista").value= "";
		document.getElementById("horaProxEntrevista").readOnly = true;
		document.getElementById("horaProxEntrevista").value= "";
		document.getElementById("lugarProximaEntrevista").readOnly = true;
		document.getElementById("entregaMaterial").readOnly = true;
		document.getElementById("entregaMaterial").checked= false;
		document.getElementById("materialCompleto").checked= false;
		document.getElementById("motivoSuspension").value= "";
		document.getElementById("motivoSuspension").readOnly = true;
		habilitarTipocontacto(document.getElementById("realizoEntrevista"));
		document.getElementById("tipoContacto").readOnly = true;
		
	}
		
	habilitarMotivoPendiente(document.getElementById("motivoPendiente"));
	habilitarMotivoTipoContacto(document.getElementById("tipoContacto"));
	//habilitarInformacionPadrino(obj);	
}

function habilitarOtroMotivo(obj){
	//alert(obj.value);
	if(obj.value == 3){
		document.getElementById("otroMotivoAusencia").readOnly = false;
	}
	else{
		document.getElementById("otroMotivoAusencia").readOnly = true;
		document.getElementById("otroMotivoAusencia").value = "";
	}
}

function habilitarOtroMotivoRA(obj){
	if(obj.value == 4){
		document.getElementById("otroMotivoAusenciaRA").readOnly = false;
	}
	else{
		document.getElementById("otroMotivoAusenciaRA").readOnly = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";
	}
}

function habilitarTipocontacto(valor){
	//alert(valor);
	if(valor.checked){
		//document.getElementById("realizoEntrevista").readOnly = false;
		document.getElementById("tipoContacto").readOnly = true;
		document.getElementById("tipoContacto").value = "";
		document.getElementById("participoBecado").readOnly = false;
		//document.getElementById("participoRA").readOnly = false;
		document.getElementById("motivoAusencia").readOnly = false;
		//document.getElementById("motivoAusenciaRA").readOnly = false;
		document.getElementById("otroMotivoAusencia").readOnly = true;
		document.getElementById("otroMotivoAusenciaRA").readOnly = false;
		//document.getElementById("fechaEntrevista").readOnly = false;
		//document.getElementById("lugarEntrevista").readOnly = false;
		document.getElementById("motivoTipoContactoOtro").readOnly = true;
		document.getElementById("motivoTipoContactoOtro").value = "";
	}
	else{
		document.getElementById("tipoContacto").readOnly = false;
		//document.getElementById("participoBecado").readOnly = true;
		//document.getElementById("participoBecado").checked = false;
		//document.getElementById("participoRA").readOnly = true;
		//document.getElementById("participoRA").checked = false;
		//document.getElementById("realizadoVacaciones").readOnly = true;
		document.getElementById("motivoAusencia").readOnly = true;
		//document.getElementById("motivoAusencia").value = "";
		//document.getElementById("motivoAusenciaRA").readOnly = true;
		document.getElementById("motivoAusenciaRA").value = "";
		document.getElementById("otroMotivoAusencia").readOnly = true;
		document.getElementById("otroMotivoAusencia").value = "";
		document.getElementById("otroMotivoAusenciaRA").readOnly = true;
		document.getElementById("otroMotivoAusenciaRA").value = "";
		//document.getElementById("fechaEntrevista").readOnly = true;
		//document.getElementById("fechaEntrevista").value = "";
		//document.getElementById("lugarEntrevista").readOnly = true;
//		document.getElementById("motivoTipoContactoOtro").readOnly = true;
//		document.getElementById("motivoTipoContactoOtro").value = "";	
		habilitarMotivoTipoContacto(document.getElementById("tipoContacto"));
	}
}


function habilitarMotivoPendiente(obj){
	if(obj.value == 3){
		document.getElementById("motivoOtro").readOnly = false;
	}
	else{
		document.getElementById("motivoOtro").readOnly = false;
//		document.getElementById("motivoOtro").value = "";	
	}
}

function habilitarMotivoTipoContacto(obj){
	if(obj.value == 5){	
		document.getElementById("motivoTipoContactoOtro").readOnly = false;
	}
	else{
		document.getElementById("motivoTipoContactoOtro").readOnly = true;
		document.getElementById("motivoTipoContactoOtro").value = "";
	
}
}

function habilitarMotivoSuspension(obj){
	if(obj.value == 2){
		document.getElementById("motivoSuspension").readOnly = false;
		
	}
	else{

			document.getElementById("motivoSuspension").readOnly = true;
			document.getElementById("motivoSuspension").value = "";
		}
}


function guardar(valor, valorPerfil){
	document.forms['altaEntrevistaIndividual'].valorPerfil.value = valorPerfil;
	document.forms['altaEntrevistaIndividual'].valorGuardar.value = valor;
	document.forms['altaEntrevistaIndividual'].submit();
}


function cargarDatos(){
	//alert();
	habilitarCamposRenovacion(document.getElementById("evaluacionRenovacion"));
	habilitarCamposBecado(document.getElementById("participoBecado"));
	habilitarCamposRA(document.getElementById("participoRA"));
	habilitarOtroMotivo(document.getElementById("motivoAusencia"));
	//habilitarOtroMotivoRA(document.getElementById("motivoAusenciaRA"));
	habilitarMotivoSuspension(document.getElementById("evaluacionCobroBeca"));	
}



</script>











 
	<script type="text/javascript">
	$(function() {
		$("#altaEntrevistaRenovacion").validate({
   		invalidHandler: function(form, validator) {
   			var errors = validator.numberOfInvalids();
   			if (errors) {
   				$.unblockUI();
   			}
   		}
    });
	    
		$('#datepicker').datepicker({
			changeMonth: true,
			changeYear: true,
		 	  yearRange:'-1:+1'
		});
		$("#datepicker1").datepicker({
		  	  changeMonth: true,
			  changeYear: true,
		 	  yearRange:'-1:+1'
			  });
	});
</script>
 <script>
  $(document).ready(function(){

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
				break	
			case 5:
				selector = "#datosEntrevista5";
			}

			$(selector).toggle("blind");
		}

	function guardarAprobar(valor, valorPerfil, boletin){
		
		if(document.forms['altaEntrevistaRenovacion'].situacionEscolarMergeada.value=="" || document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==""){
			jAlert('warning', 'Falta seleccionar Situación Escolar Actual y Situación de Renovación', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaRenovacion'].motivoAusenciaRa2.value=="0" ){
			jAlert('warning', 'Falta seleccionar Participación RA', 'Atención!');  
			return;	
		}

		
		if(document.forms['altaEntrevistaRenovacion'].excepcionR2.value=="1" && document.forms['altaEntrevistaRenovacion'].motivoExcepcion.value=="0"){
			jAlert('warning', 'Falta seleccionar el Motivo de Excepción', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaRenovacion'].participoBecado2.value=="2" && document.forms['altaEntrevistaRenovacion'].motivoAusencia.value=="0"){
			jAlert('warning', 'Falta seleccionar el Motivo de no participación', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.value=="2" && document.forms['altaEntrevistaRenovacion'].motivoSuspension.value==""){
			jAlert('warning', 'Falta seleccionar el Motivo de Suspensión', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==2 && document.forms['altaEntrevistaRenovacion'].motivoPendiente.value==""){
			jAlert('warning', 'Falta seleccionar Motivo Pendiente', 'Atención!');  
			return;	
		}
		if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==1 && document.forms['altaEntrevistaRenovacion'].motivoNoRenovacion.value==""){
			jAlert('warning', 'Falta seleccionar Motivo de No Renovación', 'Atención!');  
			return;	
		}
		alert(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value);
		if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5 && document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.value==""){
			jAlert('warning', 'Falta seleccionar Evaluación Cobro Beca', 'Atención!');  
			return;	
		}

		if(document.forms['altaEntrevistaRenovacion'].propositoAnioComienza.value=="" && document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5  ){
			jAlert('warning', 'Falta Propósito Anual', 'Atención!');  
			return;	
		}

		if(document.forms['altaEntrevistaRenovacion'].realizadoVacaciones.value=="" && document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5  ){
			jAlert('warning', 'Falta Un dato curioso del estudiante', 'Atención!');  
			return;	
		}

		if(document.forms['altaEntrevistaRenovacion'].propositoAnual.value=="0" && document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5  ){
			jAlert('warning', 'Falta Categoría Propósito Anual', 'Atención!');  
			return;	
		}

		if(document.forms['altaEntrevistaRenovacion'].hsTrabajarAño.value=="0" && document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5  ){
			jAlert('warning', 'Falta Seleccionar HSE a trabajar durante el año', 'Atención!');  
			return;	
		}

		
		
		
		if (document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.value == 3 ) { 
			document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.focus();
 	  		jAlert('warning', 'No se puede aprobar una entrevista en estado Dudoso', 'Atención!');         
  		}
 		else{
			document.forms['altaEntrevistaRenovacion'].valorPerfil.value = valorPerfil;
			document.forms['altaEntrevistaRenovacion'].valorGuardar.value = valor;
			
			if (valor == 'f' || valor == 's'){
				//ANTES -> NORENUEVA(2,"No renueva"),
				//AHORA -> NO_RENUEVA(1,"No renueva"),
				//ANTES -> RENUEVA(1,"Renueva"),
				//AHORA -> RENUEVA(5,"Renueva")
				
				if ((boletin == 'false') && (document.forms['altaEntrevistaRenovacion'].evaluacionRenovacion.value == 5)){
					jAlert('warning', 'Sólo puedes guardar en Construcción la entrevista ya que este becado no posee completo el boletin del año anterior', 'Atención!');
					//$.blockUI();
			  	  	//$('#altaEntrevistaRenovacion').submit(); 
				}
				else{
					
					if (document.forms['altaEntrevistaRenovacion'].evaluacionRenovacion.value !=1){
						//if (esMayor(document.forms['altaEntrevistaRenovacion'].fechaEntrevista.value, document.forms['altaEntrevistaRenovacion'].fechaActual.value)){
						//	jAlert('warning', '"Fecha Entrevista1" no puede ser mayor a la fecha actual', 'Atención!')				
						//}
						//else{
					  	  	$.blockUI();
					  	  	$('#altaEntrevistaRenovacion').submit(); 
						//}				
					}
					else{
						//if (document.forms['altaEntrevistaRenovacion'].realizoEntrevista.checked){
						//	if (esMayor(document.forms['altaEntrevistaRenovacion'].fechaEntrevista.value, document.forms['altaEntrevistaRenovacion'].fechaActual.value)){
						//		jAlert('warning', '"Fecha Entrevista2" no puede ser mayor a la fecha actual', 'Atención!')
						//	}
						//	else{
						//		$.blockUI();
						//		$('#altaEntrevistaRenovacion').submit();
						//	}
						//}
						//else{
							$.blockUI();
							$('#altaEntrevistaRenovacion').submit();
						//}
					}
				}
			}
			else{
				$.blockUI();
				document.forms['altaEntrevistaRenovacion'].submit();
			}
		}
	}


  function guardar(valor, valorPerfil, boletin){
		
	  	document.forms['altaEntrevistaRenovacion'].valorPerfil.value = valorPerfil;
		document.forms['altaEntrevistaRenovacion'].valorGuardar.value = valor;
		
		if (valor == 'f'){
			if ((boletin == 'false') && (document.forms['altaEntrevistaRenovacion'].evaluacionRenovacion.value == 5)){
				jAlert('warning', 'Sólo puedes guardar en Construcción la entrevista ya que este becado no posee completo el boletin del año anterior', 'Atención!');
	  	  	}
			else{
				//ANTES -> NORENUEVA(2,"No renueva"),
				//AHORA -> NO_RENUEVA(1,"No renueva"),
				if (document.forms['altaEntrevistaRenovacion'].evaluacionRenovacion.value !=1){	
					if (esMayor(document.forms['altaEntrevistaRenovacion'].fechaEntrevista.value, document.forms['altaEntrevistaRenovacion'].fechaActual.value)){
						jAlert('warning', '"Fecha Entrevista3" no puede ser mayor a la fecha actual', 'Atención!');					
					}
					else{
						if(valorPerfil != 'superUsuario'){
							if (!esMayor(document.forms['altaEntrevistaRenovacion'].proximaEntrevista.value, document.forms['altaEntrevistaRenovacion'].fechaActual.value)){
								jAlert('warning', '"Fecha Proxima Entrevista" debe ser mayor a la fecha actual', 'Atención!');							
							}
							else{
					  	  		$.blockUI();
					  	  		$('#altaEntrevistaRenovacion').submit(); 
							} 
						}
						else{
				  	  		$.blockUI();
				  	  		$('#altaEntrevistaRenovacion').submit(); 
					 	}
					}
				}
				else{	
					if (document.forms['altaEntrevistaRenovacion'].realizoEntrevista.checked){
						if (esMayor(document.forms['altaEntrevistaRenovacion'].fechaEntrevista.value, document.forms['altaEntrevistaRenovacion'].fechaActual.value)){
							jAlert('warning', '"Fecha Entrevista4" no puede ser mayor a la fecha actual', 'Atención!')
						}
						else{
							$.blockUI();
							$('#altaEntrevistaRenovacion').submit();
						}
					}
					else{
						$.blockUI();
						$('#altaEntrevistaRenovacion').submit();
					}
				}
			}
		}
		else{
			$.blockUI();
			document.forms['altaEntrevistaRenovacion'].submit();
		}
	}  
 </script>
 <script type="text/javascript">
 $(function() {
	 
		$("#escuela").autocomplete({
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
<body onload="cargarDatos();">
<div id="main-content">
<form:form id="altaEntrevistaRenovacion" commandName="entrevista" modelAttribute="entrevista" method="post" action="guardarRenovacion.do?alumnoId=${alumno.id}&EA=${ea}">
<form:hidden path="id"/>
<form:hidden path="fechaCarga"/>
<form:hidden path="periodoDePago"/>
<center><h1 id="titulo-informe">Entrevista Renovacion - ${entrevista.estadoEntrevista.valor}</h1>
<table id="table-informe">
	<tr >
		<td><h1 id="titulo-informe">${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</h1></td>
	</tr>
</table>
</center>
<input type="hidden" name="valorGuardar" />
<input type="hidden" name="valorPerfil" />
<input type="hidden" name="boletinFinalizado"/>
<input type="hidden" name="evaluacionRenovacionFinal" value="${entrevista.evaluacionRenovacionFinal.id}"/>
<input type="hidden" name="situacionEscolarDiciembre" value="${entrevista.situacionEscolarDiciembre.id}" />
<br>
<center>
<div id="accordion"  style="width:90%" >
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(1)" >Evaluación Renovación </a></h3>
	<div id="datosEntrevista1"  style=" height:600px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/tabEvaluacionRenovacion.jsp" />		  	
	</div>
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(3)" >Datos Generales</a></h3>
	<div id="datosEntrevista3"  style=" height:400px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/renovacionTab1.jsp" />		  	
	</div>
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(4)" >Datos Escolares</a></h3>
	<div id="datosEntrevista4"  style=" height:350px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/renovacionTab2.jsp" />		  	
	</div>
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(5)" >Acompañamiento</a></h3>
	<div id="datosEntrevista5"  style=" height:650px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/renovacionTab3.jsp" />		  	
	</div>
	
</div>
<br>
<center>
	<table align="center" id="table-botons-small" width="100%">
		<tr>
			<td >
				
					<input type="button" value="En construcción" class="classnameboton"	onclick="guardar('c','${tipoPerfil}');" />
				
			</td>
			<td >
				
					<c:if test="${tipoPerfil == 'rr'}">
						<input type="button" value="Finalizar" class="classnameboton" onclick="guardarAprobar('f','${tipoPerfil}','${boletinFinalizado}');" />
					</c:if>
					<c:if test="${tipoPerfil == 'ea'}">
						<input type="button" value="Finalizar" class="classnameboton" onclick="guardarAprobar('f','${tipoPerfil}','${boletinFinalizado}');" />
					</c:if>
					<c:if test="${tipoPerfil == 'superUsuario'}"> <!-- hay uno mismo con ea  -->
						<input type="button" value="A Supervisión" class="classnameboton" onclick="guardar('f','${tipoPerfil}','${boletinFinalizado}');" />
					</c:if>	
				
			</td>
			<td >
				
					<c:if test="${tipoPerfil == 'superUsuario'}">
						<input type="button" value="Finalizar" class="classnameboton" onclick="guardarAprobar('s','${tipoPerfil}','${boletinFinalizado}');" />
					</c:if>
				
			</td>	
			<td >
				
					<c:if test="${tipoPerfil == 'rr'}">
						<input type="button" value="Volver" class="classnameboton"	onclick="location.href='../entrevistas/listaEntrevistasAprobar.do'; return false;" />
					</c:if>
					<c:if test="${tipoPerfil == 'ea'}">
						<input type="button" value="Volver" class="classnameboton"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
					</c:if>	
					<c:if test="${tipoPerfil == 'superUsuario'}">
							<input type="button" value="Volver" class="classnameboton"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
					</c:if>	
				
			</td>
			
		</tr>
	</table>
</center>
</center>
<input id="idEA" type="hidden" value="${idEA}"/>
<input id="fechaActual" type="hidden" value="${fechaActual}">
</form:form>
</div>
</body>
</html>