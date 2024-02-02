<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="mif" uri="/list-operator.tld"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>

<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">

<script type="text/javascript" src="<c:url value="/static/js/ui.dropdownchecklist.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/ui.dropdownchecklist.themeroller.css"/>" type="text/css">
	<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>

<style type="text/css">
	table#exportacion{  
	background-color: #C0C2FF;
	border: 0;
	}
</style>
<script type="text/javascript">

/*********************************/
/* Variables globales de estado para 				   *
 * habilitar/deshabilitar combos multiples especificos */
/*********************************/

var TODOS = '0';

var TIPO_MENSUAL 		= '1';
var TIPO_INCORPORACION 	= '2';
var TIPO_FINAL 			= '3';
var TIPO_RENOVACION 	= '4';

//Estado de renovacion
var ER_NO_RENUEVA		= '1';
var ER_PENDIENTE		= '2';

//Estado de incorporacion
var EI_PENDIENTE		= '3';
var EI_NO_INCORPORA		= '2';

//Estado Pago
var EPAGO_SUSPENDIDO 	= '2'
var EPAGO_CESADO 		= '4';

/*********************************/

function reload() {
	document.forms['form'].submit();
}

function validarFiltros(){
	if($('#escuela').val() == ''){
		$('#idEscuela').removeAttr('value');
	}

	document.forms['form'].action = "../exportacionEntrevistas/verExportarEntrevistas.do";
	document.forms['form'].submit();
	
}

function reloadInputs(){
	if(document.getElementById("zona").value == ""){
		//document.getElementById("rr").disabled = true;
		//document.getElementById("rr").value = "";
		//document.getElementById("idRR").value = "";
		document.getElementById("idZona").value = "";
	}
	if(document.getElementById("rr").value == ""){
		//document.getElementById("ea").disabled = true;
		//document.getElementById("ea").value = "";
		//document.getElementById("idEA").value = "";
		document.getElementById("idRR").value = "";
	}
	if(document.getElementById("ea").value == ""){
		document.getElementById("idEA").value = "";
	}
	if(document.getElementById("padrino").value == ""){
		document.getElementById("idPadrino").value = "";
	}
}

/*
 * Deshabilito todos los combos especificos para usar 
 * en la seleccion de tipo de entrevista
 */
 function deshabilitarCombosEspecificos(){
    $("#idsEstadoRenovacion").dropdownchecklist('disable');
    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
    $("#idsMotivoPendiente").dropdownchecklist('disable');
    
    $("#idsMotivoSuspension").dropdownchecklist('disable');
    $("#idsMotivoCesacion").dropdownchecklist('disable');
    
    $("#idsEstadoIncorporacion").dropdownchecklist('disable');
    $("#idsMotivoIncorporacionPendiente").dropdownchecklist('disable');
    $("#idsMotivoNoIncorporacion").dropdownchecklist('disable');
}

function disableAndDisabledRenovacion(){
    $("#idsEstadoRenovacion").dropdownchecklist('disable');
    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
    $("#idsMotivoPendiente").dropdownchecklist('disable');
	
    $("#idsEstadoRenovacion option:selected").attr('disabled','disabled');
    $("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled');
    $("#idsMotivoPendiente option:selected").attr('disabled','disabled');
}

function disableAndDisabledIncorporacion(){
    $("#idsEstadoIncorporacion").dropdownchecklist('disable');
    $("#idsMotivoIncorporacionPendiente").dropdownchecklist('disable');
    $("#idsMotivoNoIncorporacion").dropdownchecklist('disable');

    $("#idsEstadoIncorporacion option:selected").attr('disabled','disabled');
    $("#idsMotivoIncorporacionPendiente option:selected").attr('disabled','disabled');
    $("#idsMotivoNoIncorporacion option:selected").attr('disabled','disabled');
}

function disableAndDisabledOtros(){
    $("#idsMotivoSuspension").dropdownchecklist('disable');
    $("#idsMotivoCesacion").dropdownchecklist('disable');

	$("#idsMotivoSuspension option:selected").attr('disabled','disabled');
    $("#idsMotivoCesacion option:selected").attr('disabled','disabled');
}
    
//Logica para Estado Pago
$(function(){
	$('#idsEstado').change(function(){
		var misValores = $('#idsEstado').val();
		var tipoEntrevista = $('#idsTipo').val();
		
		if (tipoEntrevista!=null && tipoEntrevista.length == 1){
			if (tipoEntrevista[0]==TIPO_INCORPORACION)
				disableAndDisabledRenovacion();
			else if (tipoEntrevista[0]==TIPO_RENOVACION){
				disableAndDisabledIncorporacion();
			}
		}

		/*
	    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
	    $("#idsMotivoPendiente").dropdownchecklist('disable');
		
	    $("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled');
	    $("#idsMotivoPendiente option:selected").attr('disabled','disabled');
		*/
		
		//Si elijo 1 especifico habilito los necesarios
		if (misValores==null){
		    $("#idsMotivoSuspension").dropdownchecklist('enable');
		    $("#idsMotivoCesacion").dropdownchecklist('enable');
		} else {
			if (misValores.length == 1 && misValores[0] != TODOS){
				//Si estado pago suspendido
				if (misValores[0] == EPAGO_SUSPENDIDO){	 
					$("#idsMotivoSuspension").dropdownchecklist('enable');
	
				//Si estado pago cesado
				} else if (misValores[0] == EPAGO_CESADO){	
				    $("#idsMotivoCesacion").dropdownchecklist('enable');
				}
			}
		}
	});
});

//Logica para tipo de entrevista
$(function(){
	$('#idsTipo').change(function(){
		misValores = $('#idsTipo').val();
		
		//Si elijo 1 especifico
		if (misValores!=null && misValores.length == 1 && misValores[0] != TODOS){
			//Si eligio mensual
			if (misValores[0] == TIPO_MENSUAL){
				//Habilitar M. Cesacion y M. Suspension
			    $("#idsMotivoCesacion").dropdownchecklist('enable');
			    $("#idsMotivoSuspension").dropdownchecklist('enable');
			    disableAndDisabledIncorporacion();
			    disableAndDisabledRenovacion();
			} else if (misValores[0] == TIPO_INCORPORACION){
			//Si eligio Incorporacion
				//Habilitar Estado inc
			    $("#idsEstadoIncorporacion").dropdownchecklist('enable');
			    disableAndDisabledRenovacion();
			    disableAndDisabledOtros();
			} else if (misValores[0]==TIPO_FINAL || misValores[0]==TIPO_RENOVACION){
			//Si eligio Final o Renovacion
				//Habilitar Estado Renovacion y M. Suspension
			    $("#idsEstadoRenovacion").dropdownchecklist('enable');
			    $("#idsMotivoSuspension").dropdownchecklist('enable');

			    $("#idsMotivoCesacion").dropdownchecklist('disable');
			    $("#idsMotivoCesacion option:selected").attr('disabled','disabled');
			}
		} else {
		    disableAndDisabledIncorporacion();
		    disableAndDisabledRenovacion();
		    
		    $("#idsMotivoSuspension").dropdownchecklist('enable');
		    $("#idsMotivoCesacion").dropdownchecklist('enable');
		}
	});
});

//Logica p/Estado Renovacion
$(function(){
	$('#idsEstadoRenovacion').change(function(){
		var misValores = $('#idsEstadoRenovacion').val();
		var tipoEntrevista = $('#idsTipo').val();

		if (misValores!=null){
			if (misValores.length==1){
				if (misValores[0]==ER_NO_RENUEVA){
				    $("#idsMotivoNoRenovacion").dropdownchecklist('enable');
	
				    $("#idsMotivoPendiente").dropdownchecklist('disable');
				    $("#idsMotivoPendiente option:selected").attr('disabled','disabled')
				    
				} else if (misValores[0]==ER_PENDIENTE && tipoEntrevista[0]==TIPO_RENOVACION){
				    $("#idsMotivoPendiente").dropdownchecklist('enable');
				    
				    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
				    $("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled')
				}
			} else {
			    $("#idsMotivoPendiente").dropdownchecklist('disable');
			    $("#idsMotivoPendiente option:selected").attr('disabled','disabled')
				
			    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
			    $("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled')
			}
		} else {
		    $("#idsMotivoPendiente").dropdownchecklist('disable');
		    $("#idsMotivoPendiente option:selected").attr('disabled','disabled')
			
		    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
		    $("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled')
		}
	});
});


//Logica p/Estado Incorporacion
$(function(){
	$('#idsEstadoIncorporacion').change(function(){
		misValores = $('#idsEstadoIncorporacion').val();
		
	    if (misValores!=null){
			if (misValores.length==1){
				if (misValores[0]==EI_PENDIENTE){
				    $("#idsMotivoIncorporacionPendiente").dropdownchecklist('enable');
				    
				    $("#idsMotivoNoIncorporacion").dropdownchecklist('disable');
				    $("#idsMotivoNoIncorporacion option:selected").attr('disabled','disabled');
				    
				} else if (misValores[0]==EI_NO_INCORPORA){
				    $("#idsMotivoNoIncorporacion").dropdownchecklist('enable');
				    
				    $("#idsMotivoIncorporacionPendiente").dropdownchecklist('disable');
				    $("#idsMotivoIncorporacionPendiente option:selected").attr('disabled','disabled');
				}
			} else {
			    $("#idsMotivoNoIncorporacion").dropdownchecklist('disable');
			    $("#idsMotivoNoIncorporacion option:selected").attr('disabled','disabled');
				
			    $("#idsMotivoIncorporacionPendiente").dropdownchecklist('disable');
			    $("#idsMotivoIncorporacionPendiente option:selected").attr('disabled','disabled');
			}
		} else {
		    $("#idsMotivoNoIncorporacion").dropdownchecklist('disable');
		    $("#idsMotivoNoIncorporacion option:selected").attr('disabled','disabled');
			
		    $("#idsMotivoIncorporacionPendiente").dropdownchecklist('disable');
		    $("#idsMotivoIncorporacionPendiente option:selected").attr('disabled','disabled');
		}
	});
});

$(function(){
	$('#idsCiclo').change(function(){
		misValores = $('#idsCiclo').val();

		if (misValores!=null && misValores.length==1){
			//cargar periodos para el ciclo elegido
			$("#idsPeriodo").dropdownchecklist('enable');

			//tomar ciclo elegido
			//llamar a ajax y cargar los periodos
			$.ajax({
				url: "../ajax/obtenerListaPeriodos.do",
				data: "idCiclo="+misValores,
		        success: function(datos){
		        	$('#idsPeriodo').get(0).options.length=0;
		        	$("#idsPeriodo").dropdownchecklist("destroy");

		            $.each(datos, function(val, text) {
	                	$('#idsPeriodo').append( '<option value=0>Todos</option>' );
		            	for (i=0;i<text.length;i++){
		                	$('#idsPeriodo').append( '<option value=' + text[i].id +'>'+ text[i].nombre + '</option>' );
		            	}
		            });

		            $("#idsPeriodo").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 200, firstItemChecksAll: true});
		        }
			});
		} else {
			//deshabilitar combo periodos
			$("#idsPeriodo").dropdownchecklist('disable');
		    $("#idsPeriodo option:selected").attr('disabled','disabled')
		}
	}
);
});

$(function() {
	$("#zona").autocomplete({
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
							id: item.id,
							zona: item.zona
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#rr").removeAttr('disabled');
			$("#idZona").val(ui.item.id);
			$("#zona").text(ui.item.zona);
		}
	});
});


$(function() {
	$("#rr").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarRRPorNombreYZonaOrNombre.do?idZona=" + $("#idZona").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.rrs, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							rr: item.rr
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#ea").removeAttr('disabled');
			$("#idRR").val(ui.item.id);
			$("#rr").text(ui.item.rr);
		}
	});
});


$(function() {
	$("#ea").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEAPorNombreYRROrNombre.do?idRR=" + $("#idRR").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.eas, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							ea: item.ea
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idEA").val(ui.item.id);
			$("#ea").text(ui.item.ea);
		}
	});
});


$(function() {
	$("#padrino").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarPadrinosPorNombre.do?",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.padrinos, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							padrino: item.padrino
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idPadrino").val(ui.item.id);
			$("#padrino").text(ui.item.padrino);
		}
	});
});

$(function() {
	$("#escuela").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEscuelasPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.escuelas, function(item) {
						return {
							label: item.nombre , 
							value: item.nombre,
							id:item.id
							
						}
					}))
				}
			})
		},
		select: function(event, ui) {
			$("#idEscuela").val(ui.item.id);
			$("#escuela").val(ui.item.nombre);
		}
	});
});

$(document).ready( function() {
    $("#idsCiclo").dropdownchecklist({icon: {}, width: 150 , firstItemChecksAll: true});
    $("#idsAniosEscolares").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 250, firstItemChecksAll: true});
    $("#idsTipo").dropdownchecklist({icon: {}, width: 150, firstItemChecksAll: true});
    $("#idsEstado").dropdownchecklist({icon: {}, width: 150, firstItemChecksAll: true});
    $("#idsPeriodo").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 200, firstItemChecksAll: true});
    $("#idsSituacion").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsEstadoRenovacion").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsMotivoNoRenovacion").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsMotivoPendiente").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsMotivoSuspension").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsMotivoCesacion").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsEstadoIncorporacion").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsMotivoIncorporacionPendiente").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsMotivoNoIncorporacion").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsEstadoEntrevista").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    $("#idsSituacioneEscolares").dropdownchecklist({icon: {}, width: 150, maxDropHeight: 150, firstItemChecksAll: true});
    
    $('#idsTipo').change();
	$('#idsEstadoRenovacion').change();
	$('#idsEstadoIncorporacion').change();
	$('#idsEstado').change();
});


function enviarForm(action, idEntervista, idTipoEntrevista, valorPerfil) {
	if(valorPerfil == 'superUsuario')
		document.forms['form'].valorPerfil.value = valorPerfil;
	if(action=='modificar'){
		document.forms['form'].action = "../entrevistas/modificarEntrevistasSuperUsuarioView.do";
	}else if(action=='ver'){
		document.forms['form'].action = "../entrevistas/verEntrevistasView.do";
	}	
	document.forms['form'].entrevistaId.value = idEntervista;
	document.forms['form'].tipoEntrevistaId.value = idTipoEntrevista;	
	//alert(idTipoEntrevista);
	document.forms['form'].submit();
	$.blockUI(); 
}

function crearFP(action, idEntervista, idTipoEntrevista, valorPerfil){
	//alert(idEntervista);
	document.forms['form'].action = "../entrevistas/crearFP.do";
	document.forms['form'].entrevistaId.value = idEntervista;
	document.forms['form'].tipoEntrevistaId.value = idTipoEntrevista;		
	document.forms['form'].submit();		
}


function eliminarGrupal(idEntervista, valorPerfil) {
	if(valorPerfil == 'superUsuario')
		document.forms['form'].valorPerfil.value = valorPerfil;
	jConfirm('¿Está seguro que quiere eliminar del encuentro grupal a este becado/a?', 'Confirmación', function(result){
	    if (result) {
	    	document.forms['form'].action = "../entrevistas/elimiarEntrevistaGrupalSuperUsuarioView.do";
	    	document.forms['form'].entrevistaId.value = idEntervista;
			document.forms['form'].submit();
	    	$.blockUI();							
	    }
	 	else {
	      return false;
		}
	});			
}

function  eliminarEntrevista(idEntervista, valorPerfil) {
	if(valorPerfil == 'superUsuario')
		document.forms['form'].valorPerfil.value = valorPerfil;
	jConfirm('¿Está seguro que quiere eliminar la entrevista seleccionada?', 'Confirmación', function(result){
	    if (result) {
	    	jConfirm('¿Realmente está seguro que quiere eliminar la entrevista seleccionada?', 'Confirmación', function(resultado){
	    	    if (resultado) {
	    	    	document.forms['form'].action = "../entrevistas/elimiarEntrevistaIndividualSuperUsuarioView.do";
	    	    	document.forms['form'].entrevistaId.value = idEntervista;
	    			document.forms['form'].submit();
	    	    	$.blockUI();							
	    	    }
	    	 	else {
	    	      return false;
	    		}
	    	});		
		}
	 	else {
	      return false;
		}
	});			
}

function exportar() {
	 jConfirm('Esta tarea puede tomar varios minutos, desea continuar?', 'Confirmación', function(result){
		    if (result) {
				document.forms['form'].action = "../exportacionEntrevistas/exportarEntrevistas.do";
				document.forms['form'].submit();
		    } else {
		      return false;
		    }
		  });
}
function enviarPadrinoForm(idEntrevista){
	var select = document.getElementById("padrinoSelect");
	var index = select.selectedIndex;
	var valor = select.options[index].value;
	
	document.forms['modificarForm'].becaId.value = valor;
	document.forms['modificarForm'].idEntrevista.value = idEntrevista;
	
	document.forms['modificarForm'].submit();
	$.blockUI();	
}

function popupPadrino(idAlumno, idCiclo, idEntrevista){
	//llamar a ajax y cargar los padrinos
	$.ajax({
		url: "../ajax/buscarPadrinosPorAlumno.do",
//		data: "idAlumno="+idAlumno+"&idCiclo="+idCiclo,
		data:{
			style: "full",
			idAlumno: idAlumno,
			idCiclo: idCiclo			
		},
        success: function(datos){
       		var options = '';
            $.each(datos, function(val, text) {
               	for (i=0;i<text.length;i++){
               		options += '<option value=' + text[i].idBeca +'>'+ text[i].nombre + '</option>';                	
            	}
            });
            $('#padrinoSelect').html(options);
        }	     
	});
	$( "#dialog-confirmPadrino" ).dialog({
		resizable: false,
		height:160,
		width:550,
		modal: true,
		buttons: {
			"Guardar ": function() {
				$( this ).dialog( "close" );
				enviarPadrinoForm(idEntrevista);
			},
			"Cancelar": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
}
</script>

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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Exportacion Espacio de acompañamiento</title>

</head>
<body onload="reloadInputs();" >
<div id="main-content">
<br>
<center><h3>Listado de Espacio de acompañamiento</h3></center>
<br>
<form onsubmit="reloadInputs();" method="post" id="form" name="form" action="<c:url value="/exportacionEntrevistas/verExportarEntrevistas.do"/>">
<center>
<fieldset style="font-size: 12px; margin-left: 0px; margin-right: 0px; width:980px;">

	<table id="table-informe" align="center" style="margin-left: 0px; margin-right: 10px; border-style:hidden; width:900px">
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Ciclo:</td>
			<td align="left">
				<select id="idsCiclo" name="idsCiclo" multiple="multiple" style="width:150px;" class="textbox2">
					<c:choose>
					<c:when test="${mif:contieneLong(idsCiclo, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${ciclos}">
						<c:choose>
						<c:when test="${mif:contieneLong(idsCiclo, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.nombre}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.nombre}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">Alumno:</td>
			<td align="left">
				<input id="alumno" size="21" type="text" name="nombreAlumno" value="${nombreAlumno}" class="textbox2"/>
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">Zona:</td>
			<td align="left" >
			<input type="text" value="${zona}" id="zona" name="zona" size="21" onkeyup="reloadInputs();"class="textbox2">
			<input name="idZona" value="${idZona}" id="idZona" type="hidden">
			</td>
		</tr>
		
		<tr align="center">
	 		<td align="left" style="font-size: 13px; font-weight: bold">Año Escolar:</td>
			<td align="left">

				<select id="idsAniosEscolares" name="idsAniosEscolares" multiple="multiple" style="width:150px;" class="textbox2">
					<c:choose>
					<c:when test="${mif:contieneInt(idsAniosEscolares, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${aniosEscolares}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsAniosEscolares, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>

			</td>
			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold">Año Adicional:</td>
			<td align="left">
				<select name="anioAdicional" id="anioAdicional" style="width:150px;" class="textbox2">
					<option value="Todos">Todos</option>
					<c:forEach items="${listAdicional}" var="adicional1">
						<c:choose>
							<c:when test="${adicional == adicional1}">
								<option value="${adicional}" selected="selected">${adicional1}</option>
							</c:when>
							<c:otherwise>
								<option value="${adicional1}" >${adicional1}</option>
							</c:otherwise>
						</c:choose>					
					</c:forEach>
				</select>			
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">EAE:</td>
				<td align="left">
					<select name="eae" id="eae" style="width:150px;" class="textbox2">
					<c:choose>
						<c:when test="${eae == '6/6'}">
							<option value="todos">Todos</option>
							<option value="6/6" selected="selected">6/6</option>
							<option value="7/5">7/5</option>
						</c:when>
						<c:when test="${eae == '7/5'}">
							<option value="todos">Todos</option>
							<option value="6/6">6/6</option>
							<option value="7/5" selected="selected">7/5</option>
						</c:when>
						<c:otherwise>
							<option value="todos" selected="selected">Todos</option>
							<option value="6/6">6/6</option>
							<option value="7/5">7/5</option>
						</c:otherwise>
					</c:choose>
					</select>						
				</td>
		</tr>
		
		
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Periodo:</td>
			<td align="left">
				<select id="idsPeriodo" name="idsPeriodo" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneLong(idsPeriodo, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${periodos}">
						<c:choose>
						<c:when test="${mif:contieneLong(idsPeriodo, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.nombre}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.nombre}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">Forma:</td>
			<td align="left">
				 <select id="formaId" name="formaId" class="required" style="width:150px;" class="textbox2">
				 	<option value="0">Todos</option>
					<c:forEach var="forma" items="${formas}">
						<c:if test="${forma.id == formaId}">
							<option selected="selected" id="forma" value="${forma.id}">${forma.valor}</option>
						</c:if>
						<c:if test="${forma.id != formaId}">
						<option id="forma" value="${forma.id}">${forma.valor}</option>
						</c:if>
					</c:forEach>
					</select>
			</td>
			
			<td align="left" style="font-size: 13px; font-weight: bold">Escuela:</td>
			<td align="left">
				<input type="hidden" name="idEscuela" 	id="idEscuela" value="${idEscuela}"/>
				<input id="escuela" type="text" name="escuela" size="21" value="${escuela}" class="textbox2"/>
			</td>
		</tr>	

		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Padrino:</td>
			<td align="left">
				<input type="text" id="padrino" value="${padrino}" name="padrino" size="21" onkeyup="reloadInputs();" class="textbox2">
				<input name="idPadrino" value="${idPadrino}"  id="idPadrino" type="hidden">
			</td>

			<td align="left" style="font-size: 13px; font-weight: bold">Estado pago:</td>
			<td align="left">
				<select id="idsEstado" name="idsEstado" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsEstado, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${estados}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsEstado, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>
			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold">Situación crisis:</td>
			<td align="left">
				<select id="idsSituacion" name="idsSituacion" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsSituacion, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${situaciones}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsSituacion, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>
		</tr>

		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold;">Estado</td>
			<td align="left">
				<select id="idsEstadoEntrevista" name="idsEstadoEntrevista" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsEstadoEntrevista, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${estadosEntrevista}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsEstadoEntrevista, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">RR:</td>
			<td align="left">
				<input type="text" value="${rr}" id="rr" name="rr" size="21" onkeyup=""class="textbox2">
				<input name="idRR" value="${idRR}"id="idRR" type="hidden">
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">EA:</td>
			<td align="left" >
				<input type="text" value="${ea}" id="ea" name="ea" size="21" onkeyup="" class="textbox2">
				<input name="idEA" value="${idEA}" id="idEA" type="hidden">
			</td>
		</tr>	
		<tr>
			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold;">Situación Escolar:</td>
			<td align="left">
				<select id="idsSituacioneEscolares" name="idsSituacioneEscolares" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsSituacioneEscolares, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${situacionesEscolares}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsSituacioneEscolares, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>
			
			
		</tr>	
		
		<tr align="center">
			<td></td>
		</tr>

		<tr align="center">
			<td></td>
			<td></td>
			<td align="left" style="font-size: 13px; font-weight: bold">Tipo:</td>
			<td align="left">
				<select id="idsTipo" name="idsTipo" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsTipo, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${tipos}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsTipo, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>
			<td></td>
			<td></td>
		</tr>
		<tr align="center">
			<td colspan="6"><hr></td>
		</tr>

		<tr align="center">
			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold; width:150px">Estado Renovación:</td>
			<td align="left">
				<select id="idsEstadoRenovacion" name="idsEstadoRenovacion" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsEstadoRenovacion, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${estadosRenovacion}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsEstadoRenovacion, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>

			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold; width:150px">Estado Incorp.:</td>
			<td align="left">
				<select id="idsEstadoIncorporacion" name="idsEstadoIncorporacion" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsEstadoIncorporacion, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${estadosIncorporacion}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsEstadoIncorporacion, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>

			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold; width:150px">M. Suspensión:</td>
			<td align="left">
				<select id="idsMotivoSuspension" name="idsMotivoSuspension" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsMotivoSuspension, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${motivosSuspension}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsMotivoSuspension, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>
		</tr>

		<tr align="center">
			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold; width:150px">M. No Renovación:</td>
			<td align="left">
				<select id="idsMotivoNoRenovacion" name="idsMotivoNoRenovacion" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsMotivoNoRenovacion, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${motivosNoRenovacion}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsMotivoNoRenovacion, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>

			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold; width:150px">M. Incorp. Pend.:</td>
			<td align="left">
				<select id="idsMotivoIncorporacionPendiente" name="idsMotivoIncorporacionPendiente" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsMotivoIncorporacionPendiente, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${motivosIncorporacionPendiente}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsMotivoIncorporacionPendiente, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>

			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold;">M. Cesación:</td>
			<td align="left">
				<select id="idsMotivoCesacion" name="idsMotivoCesacion" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsMotivoCesacion, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${motivosCesacion}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsMotivoCesacion, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>
		</tr>

		<tr align="center">
			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold; width:150px">M. Renov. Pend.:</td>
			<td align="left">
				<select id="idsMotivoPendiente" name="idsMotivoPendiente" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsMotivoPendiente, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${motivosPendiente}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsMotivoPendiente, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>

			<td nowrap="nowrap" align="left" style="font-size: 13px; font-weight: bold; width:150px">M. No Incorp.:</td>
			<td align="left">
				<select id="idsMotivoNoIncorporacion" name="idsMotivoNoIncorporacion" multiple="multiple" style="width:150px;">
					<c:choose>
					<c:when test="${mif:contieneInt(idsMotivoNoIncorporacion, 0)}">
						<option selected="selected" id="item" value="0">Todos</option>
					</c:when>
					<c:otherwise>
						<option id="item" value="0">Todos</option>
					</c:otherwise>
					</c:choose>

					<c:forEach var="item" items="${motivosNoIncorporacion}">
						<c:choose>
						<c:when test="${mif:contieneInt(idsMotivoNoIncorporacion, item.id)}">
							<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
						</c:when>
						<c:otherwise>
							<option id="item" value="${item.id}">${item.valor}</option>
						</c:otherwise>
						</c:choose>
					</c:forEach>
 				</select>
			</td>

			<td></td>
			<td></td>
		</tr>

		<tr align="center">
			<td colspan="6">				
				<br>
				<input align="middle" id="buscar" type="button" onclick="validarFiltros()" value="Buscar" class="classnameboton" ></input>
			</td>
		</tr>
	</table>
	</fieldset></center>
<br><br>

<CENTER style="width: 1210px;">
<display:table  class="displayTags_wrapper" export="true" style="font-size: 12px; margin-left: 0px; margin-right: 0px;width:1100px; background-color: #C0C2FF;"  id="listaEntrevistas" name="listaEntrevistas" requestURI="" pagesize="50" >  
    <display:column property="id"  style="width: 5%" title="Id"  />
    <display:column property="cicloLectivo"  style="width: 5%" title="Ciclo Lectivo"  />  
    <display:column property="escuela"  style="width: 5%" title="Escuela" maxLength="15" />
    <display:column	media="html" property="apellidoAlumno" title="Apellido alumno" />  
    <display:column media="html" property="nombreAlumno" title="Nombre alumno" />
    <display:column property="anioEscolar.valor" style="width: 9%"  headerClass="sortable" title="Año Escolar" maxLength="20" />
    <display:column style="width: 9%"  headerClass="sortable" title="EAE" maxLength="20" >	  
    	${listaEntrevistas.perfilAlumno.eae}
    </display:column>    
    <display:column property="zonaCimientos"  headerClass="sortable" title="Zona" />
    <display:column property="responsableRegional"   headerClass="sortable" title="RR"/>
    <display:column property="nombreEa"  headerClass="sortable" title="EA" />
    <!-- display:column property="formaEntrevista"  headerClass="sortable" title="Forma" /-->
    <display:column property="tipoEntrevista.valor"  headerClass="sortable" title="Tipo" />
    <display:column media ="html" property="estadoEntrevista.valor"  title="Estado"/>
    <display:column media ="html" property="periodoEntrevista" title="Periodo" />
    <!-- display:column media ="html" property="fechaProximaEntrevista" title="Prox. entrev." maxLength="35" /-->
    <display:column property="valorSituacionCrisis"  style="width: 5%" title="Situacion crisis" />
    <display:column property="valorEvaluacionCobroBeca"  style="width: 5%" title="Evaluac. cobro beca" maxLength="15" />    
    <display:column title="Renueva con excepción" >
		<c:if test="${listaEntrevistas.excepcion==true}">Si</c:if>
		<c:if test="${listaEntrevistas.excepcion!=true}">No</c:if>
		
		
	</display:column>
	<display:column headerClass="sortable" title="Padrino" media="html">	   
    	${listaEntrevistas.padrino}
		<sec:authorize access="hasRole('SuperUsuario') or hasRole('RR')" >
			<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Modificar Padrino">
				<a onclick="popupPadrino('${listaEntrevistas.perfilAlumno.id}','${listaEntrevistas.periodoDePago.ciclo.id}','${listaEntrevistas.id}')"> 
					<span class="ui-icon ui-icon-pencil" ></span>
				</a>		
			</div>
		</sec:authorize>
    </display:column>
    <display:column title="Banco" >
		${listaEntrevistas.perfilAlumno.responsable1.banco.nombre}
	</display:column>
    
	<display:column media="html"  headerClass="sortable" title="Acciones">
		<table>
			<tr>
				<td>
					<div style= width:0.5cm class="ui-state-default ui-corner-all" > 
						<a onclick="enviarForm('ver','${listaEntrevistas.id}','${listaEntrevistas.idTipoEntrevista}','${tipoPerfil}')"> 
							<span class="ui-icon ui-icon-zoomin" title="Ver Entrevista"></span>
						</a>				
					</div>					
				</td>
				<sec:authorize access="hasRole('SuperUsuario') or hasRole('CPBE') or hasRole('SEL') or hasRole('DI') or hasRole('RR') " >
					<c:if test="${listaEntrevistas.tipo=='incorporacion'}">
						<c:if test="${listaEntrevistas.estadoEntrevista.valor=='En construccion'}">
							<td>
								<div style= width:0.5cm class="ui-state-default ui-corner-all" > 
									<a onclick="crearFP('fp','${listaEntrevistas.id}','${listaEntrevistas.idTipoEntrevista}','${tipoPerfil}')"> 
										<img src="../static/images/fp.png" width=15 alt="Crear FP" border=0 title="Crear FP">
									</a>				
								</div>
							</td>
						</c:if>	
	      			</c:if>
      			</sec:authorize>
      			<sec:authorize access="hasRole('SuperUsuario') or hasRole('RR')">
					
						<td>
							<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
								<a onclick="enviarForm('modificar','${listaEntrevistas.id}','${listaEntrevistas.idTipoEntrevista}','${tipoPerfil}')"> 
									<span class="ui-icon ui-icon-pencil" title="Editar Entrevista"></span>
								</a>				
							</div>
						</td>
					
					<c:if test="${listaEntrevistas.formaEntrevista == formaEntrevista && listaEntrevistas.estadoEntrevista.valor != estadoEntrevistaFin}">
						<td>
							<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
								<a onclick="eliminarGrupal('${listaEntrevistas.id}','${tipoPerfil}')"> 
									<span class="ui-icon ui-icon-person" title="Eliminar alumno de Ent. Grupal"></span>
								</a>				
							</div>
						</td>
					</c:if>	
					<td>
						&nbsp;&nbsp;
					</td>				
					<td>
						<div  style= width:0.75cm class="ui-state-error ui-corner-all" > 
							<a onclick="eliminarEntrevista('${listaEntrevistas.id}','${tipoPerfil}')"> 
								<span class="ui-icon ui-icon-trash" title="Eliminar Entrevista"></span>
							</a>				
						</div>
					</td>				
				</sec:authorize>
			</tr>
		</table>
	</display:column> 
	
	<!-- para el html -->
	<display:column headerClass="sortable" title="idAlumno" media="excel">${listaEntrevistas.perfilAlumno.id}</display:column>
	<display:column headerClass="sortable" title="Periodo" media="excel">${listaEntrevistas.periodoDePago.nombre}</display:column>
	<display:column headerClass="sortable" title="idEscuela" media="excel">${listaEntrevistas.perfilAlumno.escuela.id}</display:column>
	<display:column headerClass="sortable" title="Escuela" media="excel">${listaEntrevistas.perfilAlumno.escuela.nombre}</display:column>
	<display:column headerClass="sortable" title="Año Escolar" media="excel">${listaEntrevistas.perfilAlumno.anioEscolar.valor}</display:column>
	<display:column headerClass="sortable" title="Año Adicional" media="excel">${listaEntrevistas.perfilAlumno.anioAdicional}</display:column>
	<display:column	media="excel" property="apellidoAlumno" title="Apellido alumno" />  
    <display:column media="excel" property="nombreAlumno" title="Nombre alumno" />
    <display:column media="excel" property="zonaCimientos"  headerClass="sortable" title="Zona" />
    <display:column media="excel" property="responsableRegional"   headerClass="sortable" title="RR"/>
    <display:column media="excel" property="nombreEa"  headerClass="sortable" title="EA" />
    <display:column media="excel" property="formaEntrevista"  headerClass="sortable" title="Forma" />
    <display:column media="excel" property="tipoEntrevista.valor"  headerClass="sortable" title="Tipo" />
    <display:column headerClass="sortable" title="Fecha Carga" media="excel">${listaEntrevistas.fechaCarga}</display:column>
    <display:column headerClass="sortable" title="DNI" media="excel">${listaEntrevistas.perfilAlumno.dni}</display:column>
    <display:column headerClass="sortable" title="Edad" media="excel">${listaEntrevistas.perfilAlumno.edad}</display:column>
    <display:column headerClass="sortable" title="Sexo" media="excel">${listaEntrevistas.perfilAlumno.sexo}</display:column>
    <display:column headerClass="sortable" title="Incorporación" media="excel">FALTA</display:column>
    <display:column headerClass="sortable" title="Motivo Incorp. pendiente/no incorporación" media="excel">FALTA</display:column>
    <display:column headerClass="sortable" title="Situación Escolar Año Anterior" media="excel">FALTA</display:column>
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
    <display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.item_name" value="entrevista" />  
    <display:setProperty name="paging.banner.items_names" value="entrevistas" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
    <display:setProperty name="export.excel.filename" value="entrevistas.xls" />	

</display:table>
<table align="center">
<tr>
<td>
<input align="middle" id="buscar" type="button" onclick="validarFiltros()" value="Buscar" class="classnameboton" ></input>
<input align="middle" id="buscar" type="button" onclick="exportar()" value="Exportar" class="classnameboton" ></input>
</td>
</tr>
</table>
</CENTER>
<input type="hidden" name="entrevistaId" />
<input type="hidden" name="tipoEntrevistaId" />
<input type="hidden" name="retorno" value="exportarEntrevistas"/>
<input type="hidden" name="valorPerfil"/>
</form>
</div>

<div id="dialog-confirmPadrino" title="Modificar Padrino" style="display: none">
	<form id="modificarForm" name="modificarForm" action="<c:url value="/exportacionEntrevistas/modificarPadrino.do"/>" method="post">
		<input type="hidden" name="idEntrevista" id="idEntrevista" >
		<input type="hidden" name="becaId" id="becaId" >
		<div id="left-content">
		    <table border="0" align="left" cellpadding="0" cellspacing="0">
				<tr>
				<td>
					<span>Selecci&oacute;n Padrino </span>
				</td>
				</tr>
				<tr>
					<td width="300">
						<select id="padrinoSelect" >
						</select>
					</td>
				</tr>
		 	</table>      
		</div>	
	</form>
</div>
<center>
</center>
</body>
</html>