<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
    
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


<link rel="stylesheet" href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@3/dark.css" rel="stylesheet">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script>
$(document).ready(() => {
	$("#excepcionR2").change(function(){
		
	    var excep = $(this).children("option:selected").val();
	    //alert(excep);
	   if(excep==="2"){
		   
		   $('#motivoExcepcion').attr('readOnly','readOnly');
			document.getElementById("motivoExcepcion").value= "0";
			
	   }else{
		   $('#motivoExcepcion').removeAttr('readOnly');
			document.getElementById("motivoExcepcion").value= "0";
	   }
	})
	
	$("#evaluacionCobroBeca").change(function(){
        var tipoCobro = $(this).children("option:selected").val();
       if(tipoCobro==="2"){
    	   $("#motivoSuspension").removeAttr('readOnly');
    	   
       }else{
	       if(tipoCobro==="4"){
	    	   $("#motivoSuspension").attr('readOnly','readOnly'); 
	    	   
	       }else{
	    	   $("#motivoSuspension").attr('readOnly','readOnly');
	    	      
	       }
      }
    })
	
    
	$("#evaluacionRenovacion").change(function(){
		var renovacion=$("#evaluacionRenovacion").val();
		
		if(renovacion==5){
			//alert(renovacion);
			$('#motivoPendiente').attr('readOnly','readOnly');
			//document.getElementById("motivoPendiente").value= "";
			$('#motivoOtro').attr('readOnly','readOnly');
			document.getElementById("motivoOtro").value= "";
			$('#motivoNoRenovacion').attr('readOnly','readOnly');
			document.getElementById("motivoNoRenovacion").value= "";
			$('#excepcionR2').removeAttr('readOnly');
			$('#motivoExcepcion').removeAttr('readOnly');			
			$('#evaluacionCobroBeca').attr('disabled',false);
			$("#ocultarPendiente").show(1000);
			$("#ocultarPendiente1").show(1000);
			$("#ocultarPendiente2").show(1000);
		}
		if(renovacion==2){
			//alert(renovacion);
			$('#motivoPendiente').removeAttr('readOnly');
			document.getElementById("motivoPendiente").value= "";
			$('#motivoOtro').removeAttr('readOnly');
			$('#motivoNoRenovacion').attr('readOnly','readOnly');
			document.getElementById("motivoNoRenovacion").value= "";
			$('#excepcionR2').attr('readOnly','readOnly');
			$('#motivoExcepcion').attr('readOnly','readOnly');
			$('#propositoAnioComienza').attr('readOnly','readOnly');
			//$('#propositoAnual').attr('disabled', true);
			//$('#hsTrabajarAño').attr('disabled',true);
			//$('#otroHSE').attr('readOnly','readOnly');
			//$('#contenidosTrabajarEnElAnio').attr('disabled',true);
			//$('#otroContenidoTrabajado').attr('readOnly','readOnly');
			//$('#realizadoVacaciones').attr('readOnly','readOnly');
			//$('#evaluacionCobroBeca').attr('disabled',true);
			
			$("#ocultarPendiente").hide(1000);
			$("#ocultarPendiente1").hide(1000);
			$("#ocultarPendiente2").hide(1000);
			
		}
		if(renovacion==1){
			//alert(renovacion);
			$('#motivoPendiente').attr('readOnly','readOnly');
			document.getElementById("motivoPendiente").value= "";
			$('#motivoOtro').attr('readOnly','readOnly');
			$('#motivoNoRenovacion').removeAttr('readOnly');
			document.getElementById("motivoNoRenovacion").value= "";
			$('#excepcionR2').attr('readOnly','readOnly');
			$('#motivoExcepcion').attr('readOnly','readOnly');
			$('#propositoAnioComienza').removeAttr('readOnly');			
			$('#evaluacionCobroBeca').attr('disabled',false);
			$("#ocultarPendiente").hide(1000);
			$("#ocultarPendiente1").hide(1000);
			$("#ocultarPendiente2").hide(1000);

		}
		if(renovacion==6){
			//alert(renovacion);
			$('#motivoPendiente').attr('readOnly','readOnly');
			document.getElementById("motivoPendiente").value= "";
			$('#motivoOtro').attr('readOnly','readOnly');
			$('#motivoNoRenovacion').attr('readOnly','readOnly');
			document.getElementById("motivoNoRenovacion").value= "";
			$('#excepcionR2').attr('readOnly','readOnly');
			$('#motivoExcepcion').attr('readOnly','readOnly');			
			$('#evaluacionCobroBeca').attr('disabled',false);
			$("#ocultarPendiente").show(1000);
			$("#ocultarPendiente1").show(1000);
			$("#ocultarPendiente2").show(1000);

		}
	
	})
});	



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
             //$("select#evaluacionRenovacion").html(options);
             //deshabilitarEvaluacionPendiente();             
      }
    } );
    //if($('#situacionEscolar').val().length == 0){
    //	deshabilitarEvaluacionPendiente();
    //}
  })
})
function deshabilitarEvaluacionPendiente(){
	document.getElementById("motivoPendiente").value = "";
	document.getElementById("motivoPendiente").readOnly = true;
	document.getElementById("motivoNoRenovacion").value = "";
	document.getElementById("motivoNoRenovacion").readOnly = true;
	habilitarmotivoPendiente(document.getElementById("motivoPendiente"));
	document.getElementById("tipoContacto").value = "";
	document.getElementById("tipoContacto").readOnly = true;
	
}

function habilitarCamposRenovacion(obj){
	//alert(obj.value);
	if(obj.value == 2){		
		
	}
	else if(obj.value == 1){		
		
	}
	else if (obj.value == 5){ 
		
		
	}else if (obj.value == 6){
		
	}
	else {
		document.getElementById("motivoNoRenovacion").readOnly = true;
		document.getElementById("motivoPendiente").readOnly = true;
		document.getElementById("motivoOtro").readOnly = false;			
	}
		
	habilitarmotivoPendiente(document.getElementById("motivoPendiente"));	
}

function habilitarmotivoPendiente(obj){
	if(obj.value == 3){
		document.getElementById("motivoOtro").readOnly = false;
	}
	else{
		document.getElementById("motivoOtro").readOnly = false;
//		document.getElementById("motivoOtro").value = "";	
	}
}
</script>

<script>
$(document).ready(() => {
	var renovacion=$("#evaluacionRenovacion").val();
	//alert(renovacion);
	
})


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
	function guardarAprobar(valor, valorPerfil, boletin){
		
		//alert(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value);
		
		if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==1){
			if(document.forms['altaEntrevistaRenovacion'].situacionEscolarMergeada.value==""){
				jAlert('warning', 'Falta seleccionar Situación Escolar Actual', 'Atención!');  
				return;	
			}
			
			if(document.forms['altaEntrevistaRenovacion'].observacionesExcepcion.value==""){
				jAlert('warning', 'Falta Detallar información sobre la situación de renovación del estudiante', 'Atención!');  
				return;	
			}
			if(document.forms['altaEntrevistaRenovacion'].participoBecado2.value=="0" && document.forms['altaEntrevistaRenovacion'].motivoAusencia.value=="0"){
				jAlert('warning', 'Falta seleccionar el Motivo de no participación del Becado', 'Atención!');  
				return;	
			}
		
			if(document.forms['altaEntrevistaRenovacion'].motivoAusenciaRa2.value=="0" ){
				jAlert('warning', 'Falta seleccionar Participación RA', 'Atención!');  
				return;	
			}
			if(document.forms['altaEntrevistaRenovacion'].oeaioe.value==""){
				jAlert('warning', 'Falta Objetivo del encuentro y actividad implementada + Observaciones del estudiante', 'Atención!');  
				return;	
			}			
	
			if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value=="1" & document.forms['altaEntrevistaRenovacion'].motivoNoRenovacion.value=="" ){
				jAlert('warning', 'Falta seleccionar Motivo de No Renovación', 'Atención!');  
				return;	
			}else{
				document.forms['altaEntrevistaRenovacion'].valorPerfil.value = valorPerfil;
				document.forms['altaEntrevistaRenovacion'].valorGuardar.value = valor;
				$.blockUI();
				document.forms['altaEntrevistaRenovacion'].submit();
			}
			

			
			
		}else{
			
			
			
		if(document.forms['altaEntrevistaRenovacion'].situacionEscolarMergeada.value==""){
			jAlert('warning', 'Falta seleccionar Situación Escolar Actual', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==""){
			jAlert('warning', 'Falta seleccionar Situación de Renovación', 'Atención!');  
			return;	
		}
		
		
		if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==2 && document.forms['altaEntrevistaRenovacion'].motivoPendiente.value==""){
			jAlert('warning', 'Falta seleccionar Motivo Pendiente', 'Atención!');  
			return;	
		}
		
		
		
		if(document.forms['altaEntrevistaRenovacion'].excepcionR2.value=="1" && document.forms['altaEntrevistaRenovacion'].motivoExcepcion.value=="0"){
			jAlert('warning', 'Falta seleccionar el Motivo de excepción', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaRenovacion'].observacionesExcepcion.value==""){
			jAlert('warning', 'Falta Detallar información sobre la situación de renovación del estudiante', 'Atención!');  
			return;	
		}
		
		
		
		
		
		if(document.forms['altaEntrevistaRenovacion'].participoBecado2.value=="0" && document.forms['altaEntrevistaRenovacion'].motivoAusencia.value=="0"){
			jAlert('warning', 'Falta seleccionar el Motivo de no participación del Becado', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaRenovacion'].motivoAusenciaRa2.value=="0" ){
			jAlert('warning', 'Falta seleccionar Participación RA', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value!=2){
			if(document.forms['altaEntrevistaRenovacion'].propositoAnioComienza.value=="" ){
				jAlert('warning', 'Falta propósito Anual', 'Atención!');  
				return;	
			}
			
			if(document.forms['altaEntrevistaRenovacion'].propositoAnual.value=="0"){
				jAlert('warning', 'Falta Categoría Propósito Anual', 'Atención!');  
				return;	
			}
			
			if(document.forms['altaEntrevistaRenovacion'].hsTrabajarAño.value=="0"){
				jAlert('warning', 'Falta Seleccionar HSE a trabajar durante el año', 'Atención!');  
				return;	
			}
			if(document.forms['altaEntrevistaRenovacion'].realizadoVacaciones.value==""){
				jAlert('warning', 'Falta Información adicional del estudiante para compartir con su padrino ', 'Atención!');  
				return;	
			}
		
		}
		
		if(document.forms['altaEntrevistaRenovacion'].oeaioe.value==""){
			jAlert('warning', 'Falta Objetivo del encuentro y actividad implementada + Observaciones del estudiante', 'Atención!');  
			return;	
		}
	

		
		
		
		
		if(document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.value=="2" && document.forms['altaEntrevistaRenovacion'].motivoSuspension.value==""){
			jAlert('warning', 'Falta seleccionar el Motivo de Suspensión', 'Atención!');  
			return;	
		}
		
		//if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==1 && document.forms['altaEntrevistaRenovacion'].motivoNoRenovacion.value==""){
		//	jAlert('warning', 'Falta seleccionar Motivo de No Renovación', 'Atención!');  
		//	return;	
		//}
		//alert(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value);
		if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5 && document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.value==""){
			jAlert('warning', 'Falta seleccionar Evaluación Cobro Beca', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==6 && document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.value==""){
			jAlert('warning', 'Falta seleccionar Evaluación Cobro Beca', 'Atención!');  
			return;	
		}
		

		//if(document.forms['altaEntrevistaRenovacion'].propositoAnioComienza.value=="" && document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5  ){
		//	jAlert('warning', 'Falta Propósito Anual', 'Atención!');  
		//	return;	
		//}

		if(document.forms['altaEntrevistaRenovacion'].realizadoVacaciones.value=="" && document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5  ){
			jAlert('warning', 'Falta Información adicional del estudiante para compartir con su padrino', 'Atención!');  
			return;	
		}

		//if(document.forms['altaEntrevistaRenovacion'].propositoAnual.value=="0" && document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5  ){
		//	jAlert('warning', 'Falta Categoría Propósito Anual', 'Atención!');  
		//	return;	
		//}

		//if(document.forms['altaEntrevistaRenovacion'].hsTrabajarAño.value=="0" && document.forms['altaEntrevistaRenovacion'].evaluacionRenovacionMergeada.value==5  ){
		//	jAlert('warning', 'Falta Seleccionar HSE a trabajar durante el año', 'Atención!');  
		//	return;	
		//}

		//alert(document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.value);
		
		
		if (document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.value == 3 ) { 
			document.forms['altaEntrevistaRenovacion'].evaluacionCobroBeca.focus();
 	  		jAlert('warning', 'No se puede aprobar una entrevista en estado Dudoso', 'Atención!');         
  		}
 		else{
			document.forms['altaEntrevistaRenovacion'].valorPerfil.value = valorPerfil;
			document.forms['altaEntrevistaRenovacion'].valorGuardar.value = valor;
			
			if (valor == 'f' || valor == 's'){				
				
				//if ((boletin == 'false') && (document.forms['altaEntrevistaRenovacion'].evaluacionRenovacion.value == 5)){
				//	jAlert('warning', 'Sólo puedes guardar en Construcción la entrevista ya que este becado no posee completo el boletin del año anterior', 'Atención!');
				//	$.blockUI();
			  	  	//$('#altaEntrevistaRenovacion').submit(); 
				//}
				//else{
					//alert();
					if (document.forms['altaEntrevistaRenovacion'].evaluacionRenovacion.value !=1){
						
					  	  	$.blockUI();
					  	  	$('#altaEntrevistaRenovacion').submit(); 
								
					}
					else{
						
							$.blockUI();
							$('#altaEntrevistaRenovacion').submit();
					
					}
				//}
			}
			else{
				$.blockUI();
				document.forms['altaEntrevistaRenovacion'].submit();
			}
 		}
 		}
	}
</script>	
	

<script>
  function guardar(valor, valorPerfil, boletin){
		//alert();
	  	document.forms['altaEntrevistaRenovacion'].valorPerfil.value = valorPerfil;
		document.forms['altaEntrevistaRenovacion'].valorGuardar.value = valor;
		
		if (valor == 'f'){
			//if ((boletin == 'false') && (document.forms['altaEntrevistaRenovacion'].evaluacionRenovacion.value == 5)){
			//	jAlert('warning', 'Sólo puedes guardar en Construcción la entrevista ya que este becado no posee completo el boletin del año anterior', 'Atención!');
	  	  	//}
			//else{
				//ANTES -> NORENUEVA(2,"No renueva"),
				//AHORA -> NO_RENUEVA(1,"No renueva"),
				//alert();
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
					alert();
						//$.blockUI();
						$('#altaEntrevistaRenovacion').submit();
					}
				
			//}
		}
		else{
			//alert(2);
			$.blockUI();
			//alert(3);
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

<script type="text/javascript">
	function raNoFueConvocado(inputSelect){
		//alert(1);
	
		if(document.getElementById("raNoConvocado").checked==true){		
			//alert(2);
			$('#motivoNoConvocatoria').attr('disabled','disabled');
			$('#motivoNoConvocatoria').attr('value', 'Seleccione una opción:');
			$('#participoRA').removeAttr('disabled');
		}else{		
			//alert(3);
			$('#motivoNoConvocatoria').removeAttr('disabled');
			$('#participoRA').removeAttr("checked");
			$('#participoRA').attr('disabled','disabled');	
		}	
	}
</script>

<script type="text/javascript">
	$(document).ready(function(){  
	  
    	$("#participoRA").click(function() {  
        	if($("#participoRA").is(':checked')) {  
    	    }  
            	
        	 else {  
        	}	
    	});  
  
	});  
</script>

<script type="text/javascript">
	$(document).ready(function(){  
	  
		$("#participoBecado2").change(function() {  
		    var valor = $(this).val();
		    //alert(valor);
		    if(valor==1){
		    	//alert("V");		    	
		    	$('#motivoAusencia').attr('disabled', true);
		    }
		    if(valor==0){
		    	//alert("F");		    	
		    	$('#motivoAusencia').removeAttr('disabled');
		    }
		});
  
	});  
</script>

<script>
var inputs = document.getElementsByTagName("input"); 
for (var i = 0; i < inputs.length; i++) { 
    inputs[i].disabled = false;
} 
</script>
<script>
	function entrada(){
		//alert(1);
		var renovacion=$("#evaluacionRenovacion").val();
		//alert(renovacion);
		if(renovacion==5){
			//alert(renovacion);
			$('#motivoPendiente').attr('readOnly','readOnly');
			//document.getElementById("motivoPendiente").value= "";
			$('#motivoOtro').attr('readOnly','readOnly');
			document.getElementById("motivoOtro").value= "";
			$('#motivoNoRenovacion').attr('readOnly','readOnly');
			document.getElementById("motivoNoRenovacion").value= "";
			$('#excepcionR2').removeAttr('readOnly');
			$('#motivoExcepcion').removeAttr('readOnly');			
			$('#evaluacionCobroBeca').attr('disabled',false);
			$("#ocultarPendiente").show(1000);
			$("#ocultarPendiente1").show(1000);
			$("#ocultarPendiente2").show(1000);
		}
		if(renovacion==2){
			//alert(renovacion);
			$('#motivoPendiente').removeAttr('readOnly');
			//document.getElementById("motivoPendiente").value= "";
			$('#motivoOtro').removeAttr('readOnly');
			$('#motivoNoRenovacion').attr('readOnly','readOnly');
			document.getElementById("motivoNoRenovacion").value= "";
			$('#excepcionR2').attr('readOnly','readOnly');
			$('#motivoExcepcion').attr('readOnly','readOnly');
			$('#propositoAnioComienza').attr('readOnly','readOnly');
			//$('#propositoAnual').attr('disabled', true);
			//$('#hsTrabajarAño').attr('disabled',true);
			//$('#otroHSE').attr('readOnly','readOnly');
			//$('#contenidosTrabajarEnElAnio').attr('disabled',true);
			//$('#otroContenidoTrabajado').attr('readOnly','readOnly');
			//$('#realizadoVacaciones').attr('readOnly','readOnly');
			 //$('#evaluacionCobroBeca').attr('disabled',true);
			
			$("#ocultarPendiente").hide(1000);
			$("#ocultarPendiente1").hide(1000);
			$("#ocultarPendiente2").hide(1000);

		}
		if(renovacion==1){
			//alert(renovacion);
			$('#motivoPendiente').attr('readOnly','readOnly');
			document.getElementById("motivoPendiente").value= "";
			$('#motivoOtro').attr('readOnly','readOnly');
			$('#motivoNoRenovacion').removeAttr('readOnly');
			//document.getElementById("motivoNoRenovacion").value= "";
			$('#excepcionR2').attr('readOnly','readOnly');
			$('#motivoExcepcion').attr('readOnly','readOnly');
			$('#propositoAnioComienza').removeAttr('readOnly');			
			$('#evaluacionCobroBeca').attr('disabled',false);
			$("#ocultarPendiente").hide(1000);
			$("#ocultarPendiente1").hide(1000);
			$("#ocultarPendiente2").hide(1000);
		}
		if(renovacion==6){
			//alert(renovacion);
			$('#motivoPendiente').attr('readOnly','readOnly');
			document.getElementById("motivoPendiente").value= "";
			$('#motivoOtro').attr('readOnly','readOnly');
			$('#motivoNoRenovacion').attr('readOnly','readOnly');
			document.getElementById("motivoNoRenovacion").value= "";
			$('#excepcionR2').attr('readOnly','readOnly');
			$('#motivoExcepcion').attr('readOnly','readOnly');			
			$('#evaluacionCobroBeca').attr('disabled',false);
			$("#ocultarPendiente").show(1000);
			$("#ocultarPendiente1").show(1000);
			$("#ocultarPendiente2").show(1000);

		}
	}

</script>




 
</head>
<body onload="entrada()">
<div class="container-fluid">

<div class="row">
	<div class="col-lg-2">
		<br>
		<div class="position-fixed">
			<img src="../fichaAlumno/mostrarImagen.do?dni=${alumno.datosPersonales.dni}" width="100px">	
			<br><br>	
			
			<div class="form-group">				
					<c:if test="${retorno == 'rr'}">
						<input type="button" class="btn btn-secondary " value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listaEntrevistasPorEa.do?idEA=${entrevista.ea.idPerfilEA}'; return false;" />
					</c:if>
					<c:if test="${retorno == 'ea'}">
						<input type="button" class="btn btn-secondary" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
					</c:if>	
					<c:if test="${retorno == 'exportarEntrevista'}">
							<input type="button" class="btn btn-secondary" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
					</c:if>	
				
			</div>
		</div>
	</div>				
<div class="col-lg-10">
<form:form id="altaEntrevistaRenovacion" commandName="entrevista" modelAttribute="entrevista" method="post" action="guardarRenovacion.do?alumnoId=${alumno.id}&EA=${ea}">
<form:hidden path="id"/>
<form:hidden path="fechaCarga"/>
<form:hidden path="periodoDePago"/>
<div class="card-body p-3 my-3 bg-secondary text-white">
<h3 title="IdAlumno=${alumno.id}">Entrevista de Renovación - ${periodo.nombre} ${periodo.ciclo.nombre}  ${entrevista.periodoDePago.nombre} ${entrevista.periodoDePago.ciclo.nombre} - ${entrevista.estadoEntrevista.valor}<br>${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</h3>
			Fecha Incorporación PFE: <fmt:formatDate value="${alumno.fechaPBE}" pattern="dd/MM/yyyy"/>
			<br>Escuela: ${alumno.escuela.nombre}<br>
			Año Escolar: ${alumno.anioEscolar.valor} - 
			Año Egreso:		
			<c:if test="${alumno.escuela.zonaCimientos.eae=='6/6'}">
		    	<c:if test="${alumno.anioAdicional}">
					${alumno.beca.ciclo.nombre+14-alumno.anioEscolar.id+1} 
				</c:if>
				<c:if test="${!alumno.anioAdicional}">
					${alumno.beca.ciclo.nombre+14-alumno.anioEscolar.id} 
				</c:if>
			</c:if>
			<c:if test="${alumno.escuela.zonaCimientos.eae=='7/5'}">
		    	<c:if test="${alumno.anioAdicional}">
					${alumno.beca.ciclo.nombre+13-alumno.anioEscolar.id+1} 
				</c:if>
				<c:if test="${!alumno.anioAdicional}">
					${alumno.beca.ciclo.nombre+13-alumno.anioEscolar.id} 
				</c:if>
			</c:if>	
			<c:if test="${alumno.anioAdicional==true}">
				 - Tiene año adicional
			</c:if>
			<c:if test="${alumno.anioAdicional==false}">
				- No tiene año adicional
			</c:if>			
			<br>
			
			<c:if test="${entrevista.excepcion==true}">
				 Renovado por excepción
			</c:if>
			<c:if test="${entrevista.excepcion==false}">
				
			</c:if>	
			<h4><font color="lightblue">Situación Escolar Diciembre: ${entrevista.situacionEscolarDiciembre.valor}
			<br>
			Situación Renovación Diciembre: ${entrevista.evaluacionRenovacionFinal.valor}</font></h4>	 
				
		</div>




<input type="hidden" name="valorGuardar" />
<input type="hidden" name="valorPerfil" />
<input type="hidden" name="boletinFinalizado"/>
<input type="hidden" name="evaluacionRenovacionFinal" value="${entrevista.evaluacionRenovacionFinal.id}"/>
<input type="hidden" name="situacionEscolarDiciembre" value="${entrevista.situacionEscolarDiciembre.id}" />





<div class="card bg-info text-white">
	<div class="card-body">Evaluación Renovación</div>
</div>

<div class="form-group form-inline">
	<label class="text-danger">Situación escolar actual &nbsp;&nbsp;</label>						
	<form:select path="situacionEscolarMergeada" id="situacionEscolar" style='width:auto' class="form-control">
		<form:option value="">Seleccione una opción...</form:option>
		<form:options items="${situacionEscolar}" itemLabel="valor" itemValue="id"/>				
	</form:select>	
	&nbsp;&nbsp;<img src="../static/images/atencion.gif" width=10>Atención. Este campo aparece en Informe al padrino.						
</div>
<div class="form-group form-inline">
	<label class="text-danger">Situación Renovación &nbsp;&nbsp;</label>						
	<form:select path="evaluacionRenovacionMergeada" id="evaluacionRenovacion" style='width:auto' class="form-control"> <!-- onchange="habilitarCamposRenovacion(this)"-->
		<form:option value="">Seleccione una opción...</form:option>
		<form:options items="${evaluacionRenovacion}" itemLabel="valor" itemValue="id"/>				
	</form:select>	
	&nbsp;&nbsp; <img src="../static/images/atencion.gif" width=10>Atención. Este campo aparece en Informe al padrino.						
</div>

<div class="form-group form-inline">
	<label class="text-danger">Motivo de Renovación Pendiente &nbsp;&nbsp;</label>						
	<form:select path="motivoPendiente" id="motivoPendiente" style='width:auto' class="form-control" onchange="habilitarMotivoPendiente(this)">
		<form:option value="">Seleccione una opción...</form:option>
		<form:options items="${motivoPendiente}" itemLabel="valor" itemValue="id"/>				
	</form:select>							
</div>
<div class="form-group form-inline">
	<label>Otro Motivo &nbsp;&nbsp;</label>	
	<form:textarea path="motivoOtro" class="form-control" name="motivoOtro" id="motivoOtro" rows="4" style="width:500px" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>

</div>

<div class="form-group form-inline">
	<label class="text-danger">Motivo principal de no renovacion &nbsp;&nbsp;</label>							
	<form:select path="motivoNoRenovacion" id="motivoNoRenovacion" style='width:auto' class="form-control">
		<form:option value="">Seleccione una opción...</form:option>
		<form:options items="${motivoNoRenovacion}" itemLabel="valor" itemValue="id"/>				
	</form:select>
	&nbsp;&nbsp;<img src="../static/images/atencion.gif" width=10>Atención. Este campo aparece en Informe al padrino.							
</div>

<input type="hidden" name="excepcionR" id="excepcionR" value="${entrevista.excepcion}">
<div class="form-group form-inline">
	<label class="text-danger">Renueva con excepción &nbsp;&nbsp;&nbsp;</label>			
	<select class="form-control" name="excepcionR2" id="excepcionR2" style='width:auto'>
		<c:choose>		
					<c:when test="${entrevista.excepcion == true}">
	     				
						<option value="1" selected="selected">Sí</option>
						<option Value="2">No</option>
					</c:when>
					<c:when test="${entrevista.excepcion == false}">
	     				
						<option value="1" >Sí</option>
						<option Value="2" selected="selected">No</option>
					</c:when>
					<c:otherwise>
						
						<option value="2" >No</option>
						<option Value="1" >Sí</option>
					</c:otherwise>
				</c:choose>
	</select>
</div>
<div class="form-group form-inline">
	<label>Motivo de Excepción &nbsp;&nbsp;&nbsp;</label>
	<select class="form-control" name="motivoExcepcion" id="motivoExcepcion" style='width:auto'>			
			<c:choose>
  				<c:when test="${entrevista.motivoExcepcion == 'Cambio de escuela'}">
     				<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Cambio de escuela" selected="selected">Cambio de escuela</option>
					<option Value="Repitencia">Repitencia</option>
				</c:when>
				<c:when test="${entrevista.motivoExcepcion == 'Repitencia'}">
     				<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Cambio de escuela">Cambio de escuela</option>
					<option Value="Repitencia"  selected="selected">Repitencia</option>
				</c:when>
				 <c:otherwise>
				 	<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Cambio de escuela">Cambio de escuela</option>
					<option Value="Repitencia">Repitencia</option>
				</c:otherwise>
			</c:choose>
	</select>	
</div>

<div class="form-group form-inline">
	<label class="text-danger">Detallar información sobre la situación de renovación del estudiante &nbsp;&nbsp;&nbsp;</label>
	<textarea rows="7" cols="100" style="width:700px" id="observacionesExcepcion" name="observacionesExcepcion" class="form-control"
	placeholder="Brindar información cualitativa sobre el cierre del ciclo lectivo 2021. En caso de que adeude materias detallar ¿cuáles son? ¿qué dificultades tiene con respecto a la materia? ¿hubo mesas de examen?, ¿cómo le fue en las últimas mesas?. Esta información se envía al padrino">${entrevista.observacionesExcepcion}</textarea>
	<input type="hidden" 	name="tipoContacto" id="tipoContacto" value="1" >
	<input type="hidden" 	name="motivoTipoContactoOtro" id="motivoTipoContactoOtro" value="" >
	<br><br>
	&nbsp;&nbsp;<img src="../static/images/atencion.gif" width=10>Atención. Este campo aparece en Informe al padrino
	
</div>	

<input type="hidden" id="escuela" name="lugarEntrevista" size="39" value="${escuelaZona}" />
<input type="hidden" class="required" id="lugarEntrevistaId" name="lugarEntrevista.id" value="${entrevista.lugarEntrevista.id}"></input>


<div class="card bg-info text-white">
	<div class="card-body">Datos Generales</div>
</div>
<br>

<div class="form-group form-inline">
 		<label>Tipo encuentro<br>acompañamiento &nbsp;&nbsp;</label>
 		<select class="form-control" id="tipoEncuentroAcompanamiento" name="tipoEncuentroAcompanamiento" style='width:auto'>						
		<c:choose>
 			<c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Encuentro Individual'}">
    			<option value="0">Seleccione una opci&oacute;n:</option>
				<option value="Encuentro Individual" selected="selected">Encuentro Individual</option>
				<option Value="Encuentro grupal">Encuentro grupal</option>									
				<option Value="Intercambio virtual" >Intercambio virtual</option>									
		    	<option Value="Otro">Otro</option>							    	
		    </c:when>																		
		    <c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Encuentro grupal'}">
    						<option value="0">Seleccione una opci&oacute;n:</option>
				<option value="Encuentro Individual">Encuentro Individual</option>
				<option Value="Encuentro grupal" selected="selected">Encuentro grupal</option>									
				<option Value="Intercambio virtual" >Intercambio virtual</option>									
		    	<option Value="Otro">Otro</option>								    	
		    </c:when>						
		    <c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Intercambio virtual'}">
    						<option value="0">Seleccione una opci&oacute;n:</option>
				<option value="Encuentro Individual">Encuentro Individual</option>
				<option Value="Encuentro grupal">Encuentro grupal</option>									
				<option Value="Intercambio virtual"  selected="selected">Intercambio virtual</option>									
		    	<option Value="Otro">Otro</option>								    	
		    </c:when>													    
		    <c:when test="${entrevista.tipoEncuentroAcompanamiento == 'Otro'}">
    						<option value="0">Seleccione una opci&oacute;n:</option>
				<option value="Encuentro Individual">Encuentro Individual</option>
				<option Value="Encuentro grupal">Encuentro grupal</option>									
				<option Value="Intercambio virtual" >Intercambio virtual</option>									
		    	<option Value="Otro"  selected="selected">Otro</option>									    	
		    </c:when>	
		    <c:otherwise>
		    	<option value="0">Seleccione una opci&oacute;n:</option>
				<option value="Encuentro Individual" >Encuentro Individual</option>
				<option Value="Encuentro grupal">Encuentro grupal</option>									
				<option Value="Intercambio virtual" >Intercambio virtual</option>									
		    	<option Value="Otro">Otro</option>		
		    </c:otherwise>					
		</c:choose>
	<!--  /form:select-->		
	</select>	
</div>

<div class="form-group form-inline">		
	<label for="sel1">Tuvo más de un Encuentro de acompañamiento en el mes? &nbsp;&nbsp; </label>
	<select class="form-control" id="masDeUnEncuentro" name="masDeUnEncuentro" style='width:auto'>							
		<c:choose>
			<c:when test="${entrevista.masDeUnEncuentro == 'Si'}">
     						<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Si" selected="selected">Si</option>
					<option value="No" >No</option>    	
		    </c:when>													    
		    <c:when test="${entrevista.masDeUnEncuentro == 'No'}">
     						<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Si" >Si</option>
					<option value="No" selected="selected">No</option>    	
		    </c:when>									
		    <c:otherwise>
		    		<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Si" >Si</option>
					<option value="No" >No</option>
		    </c:otherwise>								
		</c:choose>									
	</select>
</div>

<input type="hidden" id="participoBecado" name="participoBecado" value="${entrevista.participoBecado}">

<div class="form-group form-inline">
	<label class="text-danger">Participó el/la estudiante &nbsp; &nbsp;</label>						
	<!-- form:checkbox path="participoBecado" id="participoBecado" onclick="habilitarCamposBecado(this)"/-->										
	<select class="form-control" id="participoBecado2" name="participoBecado2" style='width:auto'>							
		<c:choose>
			<c:when test="${entrevista.participoBecado == 'true'}">
					<option value="1" selected="selected">Si</option>
					<option value="0" >No</option>    	
		    </c:when>													    
		    <c:when test="${entrevista.participoBecado == 'false'}">       						
					<option value="1" >Si</option>
					<option value="0" selected="selected">No</option>    	
		    </c:when>
		    <c:otherwise>
		    		<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="1" >Si</option>
					<option value="2" >No</option>
		    </c:otherwise>														    								
		</c:choose>			
	</select>		
</div>

<div class="form-group form-inline">
<label>Principal motivo no participación: &nbsp;&nbsp;&nbsp;</label>			
<select class="form-control" name="motivoAusencia" id="motivoAusencia" style='width:auto'>	
	<c:choose>
  					<c:when test="${entrevista.motivoAusencia == 'ENFERMEDAD'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option value=1 selected="selected">Problemas de salud</option>
					<option Value=2>Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'EVENTUALIDAD'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=2  selected="selected">Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'INASISTENCIA'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=2 selected="selected">Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'CUIDADO'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=3 selected="selected">Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6  selected="selected">Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'MOTIVOSLABORALES'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=2>Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7  selected="selected">Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'DESCONOCIMIENTO'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=2>Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8 selected="selected">Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'DIFICULTADES'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=2>Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9  selected="selected">Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'TRAMITES'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=2>Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10 selected="selected">Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'FACTORESCLIMATICOS'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=2>Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11 selected="selected">Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'VIAJEAOTRALOCALIDAD'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=2>Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12 selected="selected">Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:when>
			    <c:when test="${entrevista.motivoAusencia == 'NODEMUESTRAINTERES'}">
     						<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1 selected="selected">Problemas de salud</option>
					<option Value=2>Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13 selected="selected">No demuestra interés-compromiso</option>
			    </c:when>
			    <c:otherwise>
     				<option value=0>Seleccione una opci&oacute;n:</option>
					<option Value=1>Problemas de salud</option>
					<option Value=2>Sin justificación-se desconoce el motivo</option>
					<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
					<option Value=4 >Otros motivos</option>
					<option Value=5 disabled="disabled">No corresponde</option>								
			    	<option Value=6>Cuidado-ayuda a terceros</option>
			    	<option Value=7>Motivos laborales</option>
			    	<option Value=8>Desconocimiento, olvido o confusión de fecha de entrevista</option>
			    	<option Value=9>Dificultades en el traslado</option>
			    	<option Value=10>Realización de trámites</option>
			    	<option Value=11>Factores climáticos</option>
			    	<option Value=12>Viaje a otra localidad</option>
			    	<option Value=13>No demuestra interés-compromiso</option>
			    </c:otherwise>
			</c:choose>
		</select>						
</div>

<div class="form-group form-inline">
	<label>Otro Motivo &nbsp;&nbsp;</label>	
	<form:textarea path="otroMotivoAusencia" class="form-control" name="otroMotivoAusencia" id="otroMotivoAusencia" rows="4" style="width:500px" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>

</div>


<input type="hidden" id="motivoNoConvocatoria" name="motivoNoConvocatoria" value="${entrevista.motivoNoConvocatoria}">				
<input type="hidden" id="motivoAusenciaRA" name="motivoAusenciaRA" value="${entrevista.motivoAusenciaRA}">
<input type="hidden" id="otroMotivoAusenciaRA" name="otroMotivoAusenciaRA" value=" ">

<div class="form-group form-inline">
	<label class="text-danger">Participación RA &nbsp;&nbsp;</label>
	<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
		<c:choose>
			<c:when test="${entrevista.motivoAusenciaRa2 == 'Presente'}">
     						<option value='0'>Seleccione una opci&oacute;n:</option>
					<option value='Presente' selected="selected">Presente</option>
					<option value='Ausente' >Ausente</option>
					<option value='No fue convocado' >No fue convocado</option>    	
		    </c:when>													    
		    <c:when test="${entrevista.motivoAusenciaRa2 == 'Ausente'}">
     						<option value='0'>Seleccione una opci&oacute;n:</option>
					<option value='Presente' >Presente</option>
					<option value='Ausente' selected="selected">Ausente</option>
					<option value='No fue convocado' >No fue convocado</option>    	
		    </c:when>								
		    <c:when test="${entrevista.motivoAusenciaRa2 == 'No fue convocado'}">
     						<option value='0'>Seleccione una opci&oacute;n:</option>
					<option value='Presente' >Presente</option>
					<option value='Ausente' >Ausente</option>
					<option value='No fue convocado' selected="selected">No fue convocado</option>    	
		    </c:when>									
		    <c:otherwise>
		    		<option value='0'>Seleccione una opci&oacute;n:</option>
					<option value='Presente' >Presente</option>
					<option value='Ausente' >Ausente</option>
					<option value='No fue convocado'>No fue convocado</option>
		    </c:otherwise>								
		</c:choose>				
	</select>
</div>


<div class="card bg-info text-white">
	<div class="card-body">Datos Escolares</div>
</div>

<input type="hidden" id="certificadoAlumnoRegular" name="certificadoAlumnoRegular">
<input type="hidden" id="fotocipiaBoletin" name="fotocipiaBoletin">
<input type="hidden" id="firmaActaCompromiso" name="firmaActaCompromiso">
<input type="hidden" id="firmaAutorizacionCierreCaja" name="firmaAutorizacionCierreCaja">
<input type="hidden" id="firmaAutorizacionImagen" name="firmaAutorizacionImagen">
<input type="hidden" id="materialCompleto" name="materialCompleto" value="1">

<br>
	
<div class="form-group form-inline"> 
		<label for="uname">Inasistencias del Período &nbsp;&nbsp;</label>
		<!-- form:input path="" class="form-control" name="inasistenciasPeriodo" id="inasistenciasPeriodo" onkeypress="return validarDecimal(event, this);" onchange="habilitarMotivoInasistencias(this)" size="5"/!-->
		<input type="text" class="form-control" id="inasistenciasPeriodo" name="inasistenciasPeriodo"  value="${entrevista.inasistenciasPeriodo}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		
		<label for="uname">Principal motivo de inasistencia &nbsp;&nbsp;</label>	
		
		<select class="form-control" name="motivoInasistenciaR" id="motivoInasistenciaR" style='width:auto'>
			<c:choose>
 				<c:when test="${entrevista.motivoInasistenciaR == 'Llegada tarde'}">
    				<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde" selected="selected">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>							    	
			    </c:when>		
			    <c:when test="${entrevista.motivoInasistenciaR == 'Se quedó dormido/a'}">
	    			<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a" selected="selected">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>							    	
			    </c:when>		
			    <c:when test="${entrevista.motivoInasistenciaR == 'Cuidado-ayuda a terceros'}">
	    			<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" selected="selected" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>							    	
			    </c:when>		
			    <c:when test="${entrevista.motivoInasistenciaR == 'Dificultades en el traslado'}">
	    			<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado" selected="selected">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>							    	
			    </c:when>		
			    <c:when test="${entrevista.motivoInasistenciaR == 'Factores climáticos'}">
	    			<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos" selected="selected">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>							    	
			    </c:when>		
			    <c:when test="${entrevista.motivoInasistenciaR == 'Motivos laborales'}">
	    			<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales" selected="selected">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>							    	
			    </c:when>		
			    <c:when test="${entrevista.motivoInasistenciaR == 'Razones de salud propia'}">
	    			<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia" selected="selected">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>							    	
			    </c:when>		
			    <c:when test="${entrevista.motivoInasistenciaR == 'Viaje a otra localidad'}">
	    			<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad" selected="selected">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>							    	
			    </c:when>		
			    <c:when test="${entrevista.motivoInasistenciaR == 'Realización de trámites personales'}">
	    			<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales" selected="selected">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>							    	
			    </c:when>		
			    <c:when test="${entrevista.motivoInasistenciaR == 'Otro'}">
	    			<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro" selected="selected">Otro</option>							    	
			    </c:when>		
			    <c:otherwise>
				    <option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Llegada tarde">Llegada tarde</option>
					<option Value="Se quedó dormido/a">Se quedó dormido/a</option>									
					<option Value="Cuidado-ayuda a terceros" >Cuidado-ayuda a terceros</option>
					<option Value="Dificultades en el traslado">Dificultades en el traslado</option>								
			    	<option Value="Factores climáticos">Factores climáticos</option>
			    	<option Value="Motivos laborales">Motivos laborales</option>
			    	<option Value="Razones de salud propia">Razones de salud propia</option>
			    	<option Value="Viaje a otra localidad">Viaje a otra localidad</option>
			    	<option Value="Realización de trámites personales">Realización de trámites personales</option>
			    	<option Value="Otro">Otro</option>		
				</c:otherwise>
			</c:choose>
		</select>			
</div>	

<div class="form-group form-inline">
	<label>Observaciones Inasistencias &nbsp;&nbsp;</label>	
	<form:textarea path="observacionMateriasExamenes" class="form-control" name="observacionMateriasExamenes" id="observacionMateriasExamenes" rows="4" style="width:500px" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>

</div>



<!-- RENOVACION TAB3 -->	


<input type="hidden" id="destinoDinero" name="destinoDinero" value="13">		
<input type="hidden" id="proximaEntrevista" name="proximaEntrevista">
<input type="hidden" id="horaProxEntrevista" name="horaProxEntrevista" value="12:00">
<input type="hidden" id="lugarProximaEntrevista" name="lugarProximaEntrevista" size="39" value="${escuelaZona}"  />
<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${entrevista.lugarProximaEntrevista.id}"></input>
<input type="hidden" id="entregaMaterial" name="entregaMaterial" value="1">
<input type="hidden" id="comentariosRevision" name="comentariosRevisionl" value=" ">
<input type="hidden" name="contenidosTrabajarDuranteAnio" id="contenidosTrabajarDuranteAnio" value="0">

<div class="card bg-info text-white">
	<div class="card-body">Acompañamiento</div>
</div>
<br>

<div id="ocultarPendiente">

	<div class="form-group form-inline">
		<label class="text-danger">Propósito Anual &nbsp;&nbsp;</label>	
		<form:textarea path="propositoAnioComienza" class="form-control" name="propositoAnioComienza" id="propositoAnioComienza" rows="4" style="width:500px"
		placeholder="Detallar propósito mencionando el qué, cómo y para qué del mismo" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		&nbsp;&nbsp;<img src="../static/images/atencion.gif" width=10>Atención. Este campo aparece en Informe al padrino.
	</div>
	
	<div class="form-group form-inline">
		<label class="text-danger">Categoría de Propósito Anual &nbsp;&nbsp;</label>	
		<form:select path="propositoAnual" id="propositoAnual" class="form-control" style='width:auto'>
					<c:choose>
	   					<c:when test="${entrevista.propositoAnual == 'Compromiso con la escolaridad'}">
	      					<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Compromiso con la escolaridad" selected="selected">Compromiso con la escolaridad</option>
							<option Value="Rendimiento escolar">Rendimiento escolar</option>									
							<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
							<option Value="Compromiso con el programa">Compromiso con el programa</option>								
					    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
					    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
					    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
					    </c:when>	
					    <c:when test="${entrevista.propositoAnual == 'Rendimiento escolar'}">
	      					<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
							<option Value="Rendimiento escolar" selected="selected">Rendimiento escolar</option>									
							<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
							<option Value="Compromiso con el programa">Compromiso con el programa</option>								
					    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
					    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
					    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
					    </c:when>	
					    <c:when test="${entrevista.propositoAnual == 'Egreso efectivo y proyecto de vida'}">
	      					<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
							<option Value="Rendimiento escolar">Rendimiento escolar</option>									
							<option Value="Egreso efectivo y proyecto de vida"  selected="selected">Egreso efectivo y proyecto de vida</option>
							<option Value="Compromiso con el programa">Compromiso con el programa</option>								
					    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
					    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
					    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
					    </c:when>	
					    <c:when test="${entrevista.propositoAnual == 'Compromiso con el programa'}">
	      					<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
							<option Value="Rendimiento escolar">Rendimiento escolar</option>									
							<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
							<option Value="Compromiso con el programa" selected="selected">Compromiso con el programa</option>								
					    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
					    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
					    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
					    </c:when>	
					    <c:when test="${entrevista.propositoAnual == 'Relaciones interpersonales'}">
	      					<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
							<option Value="Rendimiento escolar">Rendimiento escolar</option>									
							<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
							<option Value="Compromiso con el programa">Compromiso con el programa</option>								
					    	<option Value="Relaciones interpersonales" selected="selected">Relaciones interpersonales</option>
					    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
					    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
					    </c:when>	
					    <c:when test="${entrevista.propositoAnual == 'Dificultades personales o familiares'}">
	      					<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
							<option Value="Rendimiento escolar">Rendimiento escolar</option>									
							<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
							<option Value="Compromiso con el programa">Compromiso con el programa</option>								
					    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
					    	<option Value="Dificultades personales o familiares" selected="selected">Dificultades personales o familiares</option>
					    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>				    						    
					    </c:when>	
					    <c:when test="${entrevista.propositoAnual == 'Actividades extra-escolares'}">
	      					<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
							<option Value="Rendimiento escolar">Rendimiento escolar</option>									
							<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
							<option Value="Compromiso con el programa">Compromiso con el programa</option>								
					    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
					    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
					    	<option Value="Actividades extra-escolares" selected="selected">Actividades extra-escolares</option>				    						    
					    </c:when>
					    <c:otherwise>
					    	<option value="0">Seleccione una opci&oacute;n:</option>
							<option value="Compromiso con la escolaridad">Compromiso con la escolaridad</option>
							<option Value="Rendimiento escolar">Rendimiento escolar</option>									
							<option Value="Egreso efectivo y proyecto de vida" >Egreso efectivo y proyecto de vida</option>
							<option Value="Compromiso con el programa">Compromiso con el programa</option>								
					    	<option Value="Relaciones interpersonales">Relaciones interpersonales</option>
					    	<option Value="Dificultades personales o familiares">Dificultades personales o familiares</option>
					    	<option Value="Actividades extra-escolares">Actividades extra-escolares</option>
					    </c:otherwise>		
					</c:choose>
				</form:select>
	</div>
	
	<div class="form-group form-inline">
		<label class="text-danger">Principal HSE a trabajar durante el año &nbsp;&nbsp;</label>	
		<form:select path="hsTrabajarAño" id="hsTrabajarAño" class="form-control" style='width:auto'>
			<c:choose>
	 					<c:when test="${entrevista.hsTrabajarAño == 'Autoconcepto'}">
	    					<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Autoconcepto" selected="selected">Autoconcepto</option>
					<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
					<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
					<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
			    	<option Value="Toma de decisiones">Toma de decisiones</option>
			    	<option Value="Otra">Otra</option>				    	  						    
			    </c:when>	
			    <c:when test="${entrevista.hsTrabajarAño == 'Planificación y organización del tiempo'}">
	    					<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Autoconcepto" >Autoconcepto</option>
					<option Value="Planificación y organización del tiempo" selected="selected">Planificación y organización del tiempo</option>									
					<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
					<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
			    	<option Value="Toma de decisiones">Toma de decisiones</option>
			    	<option Value="Otra">Otra</option>				    	  						    
			    </c:when>	
			    <c:when test="${entrevista.hsTrabajarAño == 'Relaciones interpersonales'}">
	    					<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Autoconcepto">Autoconcepto</option>
					<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
					<option Value="Relaciones interpersonales"  selected="selected">Relaciones interpersonales</option>
					<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
			    	<option Value="Toma de decisiones">Toma de decisiones</option>	
			    	<option Value="Otra">Otra</option>			    	  						    
			    </c:when>	
			    <c:when test="${entrevista.hsTrabajarAño == 'Responsabilidad y autonomía'}">
	    					<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Autoconcepto">Autoconcepto</option>
					<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
					<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
					<option Value="Responsabilidad y autonomía" selected="selected">Responsabilidad y autonomía</option>								
			    	<option Value="Toma de decisiones">Toma de decisiones</option>	
			    	<option Value="Otra">Otra</option>			    	  						    
			    </c:when>	
			    <c:when test="${entrevista.hsTrabajarAño == 'Toma de decisiones'}">
	    					<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Autoconcepto">Autoconcepto</option>
					<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
					<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
					<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
			    	<option Value="Toma de decisiones" selected="selected">Toma de decisiones</option>	
			    	<option Value="Otra">Otra</option>			    	  						    
			    </c:when>	
			    <c:when test="${entrevista.hsTrabajarAño == 'Otra'}">
	    					<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Autoconcepto">Autoconcepto</option>
					<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
					<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
					<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
			    	<option Value="Toma de decisiones">Toma de decisiones</option>
			    	<option Value="Otra" selected="selected">Otra</option>				    	  						    
			    </c:when>					    
			    <c:otherwise>
			    	<option value="0">Seleccione una opci&oacute;n:</option>
					<option value="Autoconcepto">Autoconcepto</option>
					<option Value="Planificación y organización del tiempo">Planificación y organización del tiempo</option>									
					<option Value="Relaciones interpersonales" >Relaciones interpersonales</option>
					<option Value="Responsabilidad y autonomía">Responsabilidad y autonomía</option>								
			    	<option Value="Toma de decisiones">Toma de decisiones</option>	
			    	<option Value="Otra">Otra</option>		
			    </c:otherwise>		
			</c:choose>
		</form:select>
		&nbsp;&nbsp;<img src="../static/images/atencion.gif" width=10>Atención. Este campo aparece en Informe al padrino.
	</div>
	
	<div class="form-group form-inline">
		<label>Otra HSE &nbsp;&nbsp;</label>	
		<form:textarea path="otroHSE" class="form-control" name="otroHSE" id="otroHSE" rows="4" style="width:500px"
		onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
	</div>
	
	<div class="form-group form-inline">
		<label class="text-danger">Principales Contenidos a trabajar en el año &nbsp;&nbsp;</label>						
		<form:select path="contenidosTrabajarEnElAnio" id="contenidosTrabajarEnElAnio" name="contenidosTrabajarEnElAnio" style='width:auto' class="form-control" onchange="habilitarCamposRenovacion(this)">
			<form:options items="${contenidosTrabajarEnElAnio}" itemLabel="valor" itemValue="id"/>				
		</form:select>	
		&nbsp;&nbsp; <img src="../static/images/atencion.gif" width=10>Atención. Este campo aparece en Informe al padrino.						
	</div>
	
	<div class="form-group form-inline">
		<label>Otro contenido trabajado &nbsp;&nbsp;</label>	
		<form:textarea path="otroContenidoTrabajado" class="form-control" name="otroContenidoTrabajado" id="otroContenidoTrabajado" rows="4" style="width:500px"
		onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
	</div>
</div>
<div class="form-group form-inline">
	<label class="text-danger">Objetivo del encuentro y<br>actividad implementada + <br>Observaciones del estudiante &nbsp;&nbsp;</label>	
	<form:textarea path="oeaioe" class="form-control" name="oeaioe" id="oeaioe" rows="4" style="width:500px"
	onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
</div>


<div class="form-group form-inline">
	<label class="text-danger">Situación de Riesgo extra-escolar &nbsp;&nbsp;</label>						
	<form:select path="situacionCrisis" style='width:auto' class="form-control">
		<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
	</form:select>							
</div>

<div class="form-group form-inline">
	<label class="text-danger">Situación de Riesgo escolar &nbsp;&nbsp;</label>						
	<form:select path="situacionRiesgoEscolar" style='width:auto' class="form-control">
		<form:options items="${situacionRiesgoEscolar}" itemLabel="valor" itemValue="id"/>				
	</form:select>							
</div>

<div class="form-group form-inline">
	<label>Observaciones sobre situación de riesgo &nbsp;&nbsp;</label>												   					
	<form:textarea path="observacionesSR" rows="4" cols="60" style='width:auto' class="form-control" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/> 		
</div>

<div id="ocultarPendiente1">
	<div class="form-group form-inline">
		<label class="text-danger">Información adicional del estudiante para compartir con su padrino &nbsp;&nbsp;</label>												   					
		<form:textarea path="realizadoVacaciones"  id="realizadoVacaciones" name="realizadoVacaciones" rows="4" cols="60" 
		placeholder="Fortalezas, habilidades, intereses, gustos, actividades extraescolares, etc" style='width:auto' class="form-control" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/> 		
		&nbsp;&nbsp;<img src="../static/images/atencion.gif" width=10>Atención. Este campo aparece en Informe al padrino.
	</div>
</div>
<div id="ocultarPendiente2">
	<div class="form-group form-inline">
		<label class="text-danger">Evaluacion Cobro de Beca  &nbsp;&nbsp;</label>		
		<form:select style='width:auto' path="evaluacionCobroBeca" id="evaluacionCobroBeca" class="form-control">
		<form:option value="">Seleccione una opción...</form:option>
		<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
		</form:select>
		
	</div>	
	
	<div class="form-group form-inline">	
		<label class="text-danger">Motivo de Suspensión  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>		
		<form:select style='width:auto' path="motivoSuspension" id="motivoSuspension"  class="form-control">
		<form:option value="">Seleccione una opción...</form:option>
		<form:options items="${motivoSuspension}" itemLabel="valor" itemValue="id"/>				
		</form:select>
	</div>
</div>
<input id="idEA" type="hidden" value="${idEA}"/>
<input id="fechaActual" type="hidden" value="${fechaActual}">
</form:form>
</div>
</div>
</div>

</body>
</html>