<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
src="<c:url value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<link rel="stylesheet"
href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Modificar Datos Bolet&iacute;n ::..</title>
<style type="text/css">
	.deshabilitado{  
	background-color: #C0C0C0;
	}
</style>

<script type="text/javascript">
$(function() {
	$('#tabla1').dataTable( {
		"sDom": '<"H"l>rt<"F"ip>',		
		"bJQueryUI": true,
		"aaSorting": [],
		"iDisplayLength": 50
	});
	});

$(function() {
	$('#laTabla').dataTable( {
		"sDom": '<"H"l>rt<"F"ip>',
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>' +
		'<option value="50">50</option>'+
		'<option value="75">75</option>'+
		'<option value="100">100</option>'+
		'<option value="-1">Todos</option>'+
		'</select> registros por hoja',
		"sZeroRecords": "No se encontraron registros",
		"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		"sInfoEmtpy": "Mostrando 0 registros",
		"sInfoFiltered": "(filtrado de _MAX_ registros totales)",
		"sSearch": "Buscar",
		"oPaginate": {
			"sFirst":    "Primera",
			"sPrevious": "Anterior",
			"sNext":     "Siguiente",
			"sLast":     "Ultima"
		}
		
		},
		"bJQueryUI": true,
		"aaSorting": [],	
		"sPaginationType": "full_numbers",
		"iDisplayLength": 50
	});
	});

	function guardar(idMateria, idAlumno)
	{
		if(window.opener == null)
		{
			document.forms['modificarBoletin'].action = "../entrevistas/altaNotaPeriodo.do";
		}
		else 
		{
			document.forms['modificarBoletin'].action = "../entrevistas/modificarBoletinView.do";
		}
		document.forms['modificarBoletin'].idAlumno.value = idAlumno;
		document.forms['modificarBoletin'].idMateria.value = idMateria;
		document.forms['modificarBoletin'].submit();
	}
</script>
<script type="text/javascript">
function borrarMateriaPrevia(idMateria, cicloPrevia)
{
	jConfirm('Esta seguro de que desea eliminar la materia ?', 'Confirmación', function(result){
	    if (result) {
	    	document.forms['modificarBoletin'].action = "../entrevistas/borrarMateriaPrevia.do";
	    	document.forms['modificarBoletin'].idMateria.value = idMateria;
	    	document.forms['modificarBoletin'].cicloPrevia.value = cicloPrevia;
	    	document.forms['modificarBoletin'].submit();
	    } else {
	      return false;
	    }
	  });

}
</script>

<script type="text/javascript" src="<c:url value="/static/js/table/funcionesTabla.js"/>"></script>
<script type="text/javascript">
var idA;
var idPt;
var idSt;
var idTt;
var idUrl;
var inasist1;
var inasist2;
var inasist3;
var dias1;
var dias2;
var dias3;
var conducta1;
var conducta2;
var conducta3;
var regular;

$.fx.speeds._default = 1000;

function openDialog(idAlumno,idTrimestre){
	
	idA = idAlumno;
	idT = idTrimestre;
	inasist1 = document.forms['modificarBoletin'].inasistenciasPrimer.value;
	inasist2 = document.forms['modificarBoletin'].inasistenciasSegundo.value;
	inasist3 = document.forms['modificarBoletin'].inasistenciasTercer.value;
	dias1 = document.forms['modificarBoletin'].diasHabilesPrimer.value;
	dias2 = document.forms['modificarBoletin'].diasHabilesSegundo.value;
	dias3 = document.forms['modificarBoletin'].diasHabilesTercer.value;
	conducta1 = document.forms['modificarBoletin'].conductaPrimer.value;
	conducta2 = document.forms['modificarBoletin'].conductaSegundo.value;
	conducta3 = document.forms['modificarBoletin'].conductaTercer.value;	
	regular = document.forms['modificarBoletin'].regular.value;	
	
	$.ajax({
		type: "POST",
		url: "../entrevistas/altaNotaPeriodo.do",
		data: {
				'idAlumno' : idA,
			    'idTrimestre' : idT,
			    'inasist1' : inasist1,
			    'inasist2' : inasist2,
			    'inasist3' : inasist3,
			    'dias1' : dias1,
			    'dias2' : dias2,
			    'dias3' : dias3,
			    'conducta1' : conducta1,
			    'conducta2' : conducta2,
			    'conducta3' : conducta3,
			    'regular' : regular			    
			   },
		success: function(msg){
		$("#dialog").html(msg);
		var is_ie6 = (window.external && typeof window.XMLHttpRequest == "undefined");
		if (is_ie6 ) 
		$("#dialog").dialog({
			modal: true,
			width :400,
			resizable: false,
			height:700,
			show: 'slow',
			hide :'slow'
		});
		else
			$("#dialog").dialog({
				modal: true,
				width :400,
				resizable: false,
				height:'auto',
				show: 'slow',
				hide :'slow'
			});
		}
		});
}

function openDialogNotaPrevia(idAlumno,idTrimestre){
	idA = idAlumno;
	idT = idTrimestre;
	inasist1 = document.forms['modificarBoletin'].inasistenciasPrimer.value;
	inasist2 = document.forms['modificarBoletin'].inasistenciasSegundo.value;
	inasist3 = document.forms['modificarBoletin'].inasistenciasTercer.value;
	dias1 = document.forms['modificarBoletin'].diasHabilesPrimer.value;
	dias2 = document.forms['modificarBoletin'].diasHabilesSegundo.value;
	dias3 = document.forms['modificarBoletin'].diasHabilesTercer.value;
	conducta1 = document.forms['modificarBoletin'].conductaPrimer.value;
	conducta2 = document.forms['modificarBoletin'].conductaSegundo.value;
	conducta3 = document.forms['modificarBoletin'].conductaTercer.value;	
	regular = document.forms['modificarBoletin'].regular.value;		

	$.ajax({
		type: "POST",
		url: "../entrevistas/altaNotaPrevia.do",
		data: {
				'idAlumno' : idA,
			    'idTrimestre' : idT,
			    'inasist1' : inasist1,
			    'inasist2' : inasist2,
			    'inasist3' : inasist3,
			    'dias1' : dias1,
			    'dias2' : dias2,
			    'dias3' : dias3,
			    'conducta1' : conducta1,
			    'conducta2' : conducta2,
			    'conducta3' : conducta3,
			    'regular' : regular	
			   },
		success: function(msg){
		$("#dialog").html(msg);
		$("#dialog").dialog({
			modal: true,
			width :500,
			resizable: false,
			height: 'auto',
			show: 'slow',
			hide :'slow'
		});
		}
		});
}
</script>

<script type="text/javascript">

function openDialogMateria(){
	$( "#altaMateria" ).dialog({
		resizable: false,
		width: 550,
		height:200,
		modal: true,
		buttons: {
			"Guardar Materia": function() {
				$( this ).dialog( "close" );
				document.forms['materiaForm'].inasistenciasPrimer.value = document.forms['modificarBoletin'].inasistenciasPrimer.value;
				document.forms['materiaForm'].inasistenciasSegundo.value = document.forms['modificarBoletin'].inasistenciasSegundo.value;
				document.forms['materiaForm'].inasistenciasTercer.value = document.forms['modificarBoletin'].inasistenciasTercer.value;
				document.forms['materiaForm'].diasHabilesPrimer.value = document.forms['modificarBoletin'].diasHabilesPrimer.value;
				document.forms['materiaForm'].diasHabilesSegundo.value = document.forms['modificarBoletin'].diasHabilesSegundo.value;
				document.forms['materiaForm'].diasHabilesTercer.value = document.forms['modificarBoletin'].diasHabilesTercer.value;
				document.forms['materiaForm'].conductaPrimer.value = document.forms['modificarBoletin'].conductaPrimer.value;
				document.forms['materiaForm'].conductaSegundo.value = document.forms['modificarBoletin'].conductaSegundo.value;
				document.forms['materiaForm'].conductaTercer.value = document.forms['modificarBoletin'].conductaTercer.value;	
				document.forms['materiaForm'].regular.value = document.forms['modificarBoletin'].regular.value;				
				document.forms['materiaForm'].submit();
			},
			"Cancelar": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	}	

	

</script>
<script type="text/javascript">
function validarInasistenciasYDias()
{
	var inasPrim = $("#inasistenciasPrimer").val();
	if(inasPrim == "" && !$("#sinDatoInasist1").is(":checked") || noEsNumero(inasPrim))
		$("#inasistenciasPrimer").val("0.0");
	
	var inasSeg = $("#inasistenciasSegundo").val();
	if(inasSeg == "" && !$("#sinDatoInasist2").is(":checked") || noEsNumero(inasSeg))
		$("#inasistenciasSegundo").val("0.0");
	
	var inasTerc = $("#inasistenciasTercer").val();
	if(inasTerc == "" && !$("#sinDatoInasist3").is(":checked") || noEsNumero(inasTerc))
		$("#inasistenciasTercer").val("0.0");
	
	var diasPrimer =  $("#diasHabilesPrimer").val();
	if((diasPrimer == "" && !$("#sinDatoHab1").is(":checked")) || noEsNumero(diasPrimer))
		$("#diasHabilesPrimer").val("0.0");
	var diasSeg = $("#diasHabilesSegundo").val();
	if(diasSeg == "" && !$("#sinDatoHab2").is(":checked") || noEsNumero(diasSeg))
		$("#diasHabilesSegundo").val("0.0");
	var diasTercer = $("#diasHabilesTercer").val();
	if(diasTercer == "" && !$("#sinDatoHab3").is(":checked") || noEsNumero(diasTercer))
		$("#diasHabilesTercer").val("0.0");
}

function noEsNumero(cadena){
	for (var i=0; i<cadena.length; i++){
		if(!noValido(cadena.charAt(i)))
			return true;		
	}
	return false;
}


function noValido(val){
	return (val == "." || val == "0" || val == "1" || val == "2" || val == "3" || val == "4" 
		|| val == "5" || val == "6" || val == "7" || val == "8" || val == "9")
}

function checkRequired( campo, nombre, tip ) {
	if ( campo.val() == "" ) {
		updateErrores("Este campo es requerido", tip);
		return false;
	} else {
		return true;
	}
}

function updateErrores( texto, tip ) {
	tip.text( texto );
}

function openDialogMateriaPrevia(){
	var ciclo = $("#ciclo"),
	errorCiclo = $( "#errorCiclo" );
	$( "#altaMateriaPrevia" ).dialog({
		resizable: false,
		width: 500,
		height:200,
		modal: true,
		buttons: {
			"Guardar Materia": function() {
				var bValid = true;
				bValid = bValid && checkRequired( ciclo, "Ciclo", errorCiclo);
			if ( bValid ) {
				$( this ).dialog( "close" );
				document.forms['materiaPreviaForm'].inasistenciasPrimer.value = document.forms['modificarBoletin'].inasistenciasPrimer.value;
				document.forms['materiaPreviaForm'].inasistenciasSegundo.value = document.forms['modificarBoletin'].inasistenciasSegundo.value;
				document.forms['materiaPreviaForm'].inasistenciasTercer.value = document.forms['modificarBoletin'].inasistenciasTercer.value;
				document.forms['materiaPreviaForm'].diasHabilesPrimer.value = document.forms['modificarBoletin'].diasHabilesPrimer.value;
				document.forms['materiaPreviaForm'].diasHabilesSegundo.value = document.forms['modificarBoletin'].diasHabilesSegundo.value;
				document.forms['materiaPreviaForm'].diasHabilesTercer.value = document.forms['modificarBoletin'].diasHabilesTercer.value;
				document.forms['materiaPreviaForm'].conductaPrimer.value = document.forms['modificarBoletin'].conductaPrimer.value;
				document.forms['materiaPreviaForm'].conductaSegundo.value = document.forms['modificarBoletin'].conductaSegundo.value;
				document.forms['materiaPreviaForm'].conductaTercer.value = document.forms['modificarBoletin'].conductaTercer.value;	
				document.forms['materiaPreviaForm'].regular.value = document.forms['modificarBoletin'].regular.value;
				document.forms['materiaPreviaForm'].submit();
				}
			},
			"Cancelar": function() {
				updateErrores("", errorCiclo);
				$( this ).dialog( "close" );
			}
			
		}
	});
	}	



function openDialogEdicionMateriaPrevia(idAlumno,idPrevia, cicloPrevia){
	inasist1 = document.forms['modificarBoletin'].inasistenciasPrimer.value;
	inasist2 = document.forms['modificarBoletin'].inasistenciasSegundo.value;
	inasist3 = document.forms['modificarBoletin'].inasistenciasTercer.value;
	dias1 = document.forms['modificarBoletin'].diasHabilesPrimer.value;
	dias2 = document.forms['modificarBoletin'].diasHabilesSegundo.value;
	dias3 = document.forms['modificarBoletin'].diasHabilesTercer.value;
	conducta1 = document.forms['modificarBoletin'].conductaPrimer.value;
	conducta2 = document.forms['modificarBoletin'].conductaSegundo.value;
	conducta3 = document.forms['modificarBoletin'].conductaTercer.value;	
	regular = document.forms['modificarBoletin'].regular.value;		

	var inasist1;
	var inasist2;
	var inasist3;
	var dias1;
	var dias2;
	var dias3;
	var conducta1;
	var conducta2;
	var conducta3;
	var regular;
	
	$.ajax({
		type: "POST",
		url: "../entrevistas/editarMateriaPrevia.do",
		data: {
				'idAlumno' : idAlumno,		
				'edicion' : true,
				'ciclo' : cicloPrevia,
				'idPrevia' : idPrevia,
			    'inasistenciasPrimer' : inasist1,
			    'inasistenciasSegundo' : inasist2,
			    'inasistenciasTercer' : inasist3,
			    'diasPrimer' : dias1,
			    'diasSegundo' : dias2,
			    'diasTercer' : dias3,
			    'conductaPrimer' : conducta1,
			    'conductaSegundo' : conducta2,
			    'conductaTercer' : conducta3,
			    'regular' : regular	
			   },
		success: function(msg){
		$("#altaMateriaPrevia").html(msg);
		$("#altaMateriaPrevia").dialog({
			resizable: false,
			width: 500,
			height:200,
			modal: true,
			buttons: {
				"Guardar Materia": function() {
					var bValid = true;
					var ciclo = $("#ciclo");
					var errorCiclo = $( "#errorCiclo" );
					bValid = bValid && checkRequired( ciclo, "Ciclo", errorCiclo);
				if ( bValid ) {
					$( this ).dialog( "close" );
					document.forms['materiaPreviaForm'].inasistenciasPrimer.value = document.forms['modificarBoletin'].inasistenciasPrimer.value;
					document.forms['materiaPreviaForm'].inasistenciasSegundo.value = document.forms['modificarBoletin'].inasistenciasSegundo.value;
					document.forms['materiaPreviaForm'].inasistenciasTercer.value = document.forms['modificarBoletin'].inasistenciasTercer.value;
					document.forms['materiaPreviaForm'].diasHabilesPrimer.value = document.forms['modificarBoletin'].diasHabilesPrimer.value;
					document.forms['materiaPreviaForm'].diasHabilesSegundo.value = document.forms['modificarBoletin'].diasHabilesSegundo.value;
					document.forms['materiaPreviaForm'].diasHabilesTercer.value = document.forms['modificarBoletin'].diasHabilesTercer.value;
					document.forms['materiaPreviaForm'].conductaPrimer.value = document.forms['modificarBoletin'].conductaPrimer.value;
					document.forms['materiaPreviaForm'].conductaSegundo.value = document.forms['modificarBoletin'].conductaSegundo.value;
					document.forms['materiaPreviaForm'].conductaTercer.value = document.forms['modificarBoletin'].conductaTercer.value;	
					document.forms['materiaPreviaForm'].regular.value = document.forms['modificarBoletin'].regular.value;
					document.forms['materiaPreviaForm'].submit();
					}
				},
				"Cancelar": function() {
					var errorCiclo = $( "#errorCiclo" );
					updateErrores("", errorCiclo);
					$( this ).dialog( "close" );
				}
				
			}

				
		});
		}
		});
}
</script>

<script type="text/javascript">
	$(function() {
	  $('input[id^="sinDato"]').click(function(){
		var idchk = $(this).attr('id');
		var input = $(":input:eq(" + ($(":input").index(this) -1) + ")");
		if ( $(this).is ( ":checked" ) ){
			input.attr ( "disabled" , true );
			input.val("");
			input.addClass('deshabilitado');
		}else{
			input.attr ( "disabled" , false );
			input.removeClass('deshabilitado');
			input.val("0.0");
		}
	})
	})
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$('input[id^="sinDato"]').each(function(){
			var input = $(":input:eq(" + ($(":input").index(this) -1) + ")");
			if ( $(this).is ( ":checked" ) ){
				input.attr ( "disabled" , true );
				input.val("");
				input.addClass('deshabilitado');
			}
			});
	  });

</script>

<script type="text/javascript">
	$(function() {
	  $('input[id^="noaprueba"]').click(function(){
			$.ajax({
				type: "POST",
				url: "../entrevistas/modificarNotaNoAprueba.do",
				data: {
						'idAlumno' : document.forms['modificarBoletin'].idAlumno.value,
						'index' : $(this).val(),
						'noAprueba' : $(this).is( ":checked" )
					   }
				});
	})
	})
</script>
</head>
<body>
<div id="main-content">
<br>
<h1 align="left" id="titulo-informe">Bolet&iacute;n de : ${alumno.datosPersonales.apellido}&nbsp;${alumno.datosPersonales.nombre}</h1>
<form id="modificarBoletin" class="cmxform" action="<c:url value='/entrevistas/modificarDatosBoletin.do' />" method="post">
    <table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
    <tr>
      <td>
      	<table>
			<tr>
				<td nowrap="nowrap" align="left">
					<label>Ciclo Lectivo:</label>
				</td>
				<td>
					<input size="13" readonly="readonly" name="ciclo" value="${boletin.ciclo.nombre}" class="text-input"></input>
				</td>
			</tr>
			<tr>
				<td nowrap="nowrap" align="left">
					<label>Año Escolar:</label>
				</td>
				<td>
					<input size="13" readonly="readonly" name="ano" value="${boletin.ano.valor}" class="text-input"></input>
				</td>			
			</tr>
			<tr>
				<td><label>Año Adicional</label></td>
				<td>
					<input type="checkbox" name="anioAdicional" <c:if test="${alumno.anioAdicional}"> checked="checked" </c:if> 
					id="anioAdicional"  disabled="true">
				</td>
			</tr>
		<c:if test="${empty urlInforme}">
				<tr >
					<td nowrap="nowrap">
						<label>Inasistencias Primer Trimestre:</label>
					</td>
					<td>			
						<input size="13"  maxlength="5" type="text" alt="decimal" name="inasistenciasPrimer" id="inasistenciasPrimer" class="text-input required digits" value="${boletin.inasistenciasPrimerTrimestre}" onkeypress="return validarDecimal(event, this);" onblur="validarInasistenciasYDias();" />
					</td>
					<td>
						<label style="width:50px;float: none">Sin dato</label>
						<input id="sinDatoInasist1" type="checkbox" <c:if test='${boletin.inasistenciasPrimerTrimestre == null}'> checked="checked" </c:if> />
					</td>					
					<td nowrap="nowrap">
						<label>D&iacute;as H&aacute;biles Primer Trimestre:&nbsp;&nbsp;&nbsp;&nbsp;</label>
					</td>
					<td>			
						<input size="13" maxlength="5"  type="text" name="diasHabilesPrimer" id="diasHabilesPrimer" class="text-input required digits" value="${boletin.diasHabilesPrimerTrimestre}" onkeypress="return validarDecimal(event, this);" onblur="validarInasistenciasYDias();"/>
					</td>
					<td>
						<label style="width:50px;float: none">Sin dato</label>
						<input id="sinDatoHab1" type="checkbox" <c:if test='${boletin.diasHabilesPrimerTrimestre == null}'> checked="checked" </c:if> />
					</td>					
				</tr>
				<tr>
					<td nowrap="nowrap">
						<label>Inasistencias Segundo Trimestre:</label>
					</td>
					<td>						
						<input size="13" maxlength="5" type="text" name="inasistenciasSegundo" id="inasistenciasSegundo" class="text-input required" value="${boletin.inasistenciasSegundoTrimestre}" onkeypress="return validarDecimal(event, this);"  onblur="validarInasistenciasYDias();" />
					</td>
					<td>
						<label style="width:50px;float: none">Sin dato</label>
						<input id="sinDatoInasist2" type="checkbox" <c:if test='${boletin.inasistenciasSegundoTrimestre == null}'> checked="checked" </c:if> />
					</td>					
					<td nowrap="nowrap">
						<label>D&iacute;as H&aacute;biles Segundo Trimestre:</label>
					</td>
					<td>						
						<input size="13" maxlength="5"  type="text" name="diasHabilesSegundo" id="diasHabilesSegundo" class="text-input required"  value="${boletin.diasHabilesSegundoTrimestre}" onkeypress="return validarDecimal(event, this);" onblur="validarInasistenciasYDias();" />
					</td>
					<td>
						<label style="width:50px;float: none">Sin dato</label>
						<input id="sinDatoHab2" type="checkbox" <c:if test='${boletin.diasHabilesSegundoTrimestre == null}'> checked="checked" </c:if> />
					</td>					
				</tr>
				<tr >
					<td nowrap="nowrap">
						<label>Inasistencias Tercer Trimestre:</label>
					</td>
					<td>						
						<input size="13" maxlength="5" type="text" name="inasistenciasTercer" id="inasistenciasTercer" class="text-input required" value="${boletin.inasistenciasTercerTrimestre}" onkeypress="return validarDecimal(event, this);"  onblur="validarInasistenciasYDias();"/>
					</td>
					<td>
						<label style="width:50px;float: none">Sin dato</label>
						<input id="sinDatoInasist3" type="checkbox" <c:if test='${boletin.inasistenciasTercerTrimestre == null}'> checked="checked" </c:if> />
					</td>					
					<td nowrap="nowrap">
						<label>D&iacute;as H&aacute;biles Tercer Trimestre:</label>
					</td>
					<td>						
						<input size="13" maxlength="5"  type="text" name="diasHabilesTercer" id="diasHabilesTercer" class="text-input required" value="${boletin.diasHabilesTercerTrimestre}"  onkeypress="return validarDecimal(event, this);" onblur="validarInasistenciasYDias();"/>
					</td>
					<td>
						<label style="width:50px;float: none">Sin dato</label>
						<input id="sinDatoHab3" type="checkbox" <c:if test='${boletin.diasHabilesTercerTrimestre == null}'> checked="checked" </c:if> />
					</td>					
				</tr>
		</c:if>
				<tr>
					<td nowrap="nowrap">
						<label>Conducta Primer Trimestre:</label>
					</td>
					<td>					
						<select id="conductaPrimer" name="conductaPrimer">
							<c:forEach items="${conductas}" var="conducta">
								<c:if test="${conducta.id == boletin.conductaPrimerTrimestre.id}">
									<option selected="selected" value="${conducta.id}">${conducta.valor}</option>
								</c:if>
								<c:if test="${conducta.id  != boletin.conductaPrimerTrimestre.id}">
									<option value="${conducta.id}">${conducta.valor}</option>
								</c:if>										
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap">
						<label>Conducta Segundo Trimestre:</label>
					</td>
					<td>							
						<select id="conductaSegundo" name="conductaSegundo">
							<c:forEach items="${conductas}" var="conducta">
								<c:if test="${conducta.id == boletin.conductaSegundoTrimestre.id}">
									<option selected="selected" value="${conducta.id}">${conducta.valor}</option>
								</c:if>
								<c:if test="${conducta.id  != boletin.conductaSegundoTrimestre.id}">
									<option value="${conducta.id}">${conducta.valor}</option>
								</c:if>										
							</c:forEach>
						</select>			
					</td>
				</tr>
				<tr>
					<td nowrap="nowrap">
						<label>Conducta Tercer Trimestre:</label>
					</td>
					<td>					
						<select id="conductaTercer" name="conductaTercer">
							<c:forEach items="${conductas}" var="conducta">
								<c:if test="${conducta.id == boletin.conductaTercerTrimestre.id}">
									<option selected="selected" value="${conducta.id}">${conducta.valor}</option>
								</c:if>
								<c:if test="${conducta.id  != boletin.conductaSegundoTrimestre.id}">
									<option value="${conducta.id}">${conducta.valor}</option>
								</c:if>										
							</c:forEach>
						</select>	
					</td>		
				</tr>
				<tr>
					<td nowrap="nowrap">
						<label>Alumno regular:</label>
					</td>
					<td>					
						<input type="checkbox" checked="${boletin.regular}" id="regular" name="regular"/>
					</td>
				</tr>		
      	
      	
      	
      	</table>
      </td>
    </tr>
		<tr>
		<td><label>Materias:</label></td>
		</tr>
		<tr>
		<td >
		<jsp:include page="/WEB-INF/pages/entrevistas/listaMaterias.jsp"></jsp:include>
		</td>
		</tr>		
	
		
    <tr>
    <td>
		<label >Previas:</label>
		<jsp:include page="/WEB-INF/pages/entrevistas/listaPrevias.jsp"></jsp:include>
	</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	</tr>			

			<tr>
				<td colspan="2">
				<table  border="0" align="left" cellpadding="0"
					cellspacing="0" id="table-botons-small" width="850px">
					<tr>
<!--						<td>-->
<!--							<input type="button" class="ui-state-default ui-corner-all " -->
<!--							align="middle" onclick="location.href='../entrevistas/verPrevias.do?idAlumno=${alumno.id}'; return false;" -->
<!--							value="Cargar Previas"></input> -->
<!--						</td>-->
						
						<td width="50" height="0" align="left" valign="middle"><input
							class="ui-state-default ui-corner-all " align="middle"
							type="submit" value="Guardar" /></td>
						<td width="50" height="0" align="left" valign="middle"><c:if
							test="${empty urlInforme}">
							<input class="ui-state-default ui-corner-all " align="middle"
								type="submit" value="Volver"
								onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
						</c:if> <c:if test="${!empty urlInforme}">
							<input class="ui-state-default ui-corner-all " align="middle"
								type="submit" value="Cancelar"
								onclick="location.href='${urlInforme}'; return false;" />
						</c:if></td>
						<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
						<td><input type="hidden" name="idAlumno" value="${alumno.id}" />
						<input type="hidden" name="urlInforme" value="${urlInforme}"></input>
					</tr>
					
				</table>
				</td>
			</tr>
			</table>
</form>
</div>
<div style="display: none;" id="dialog" title="Boletín">
	<jsp:include page="/WEB-INF/pages/entrevistas/altaNotaPeriodo.jsp"></jsp:include>
</div>
<div style="display: none;" id="altaMateria" title="Agregar Materia">
	<jsp:include page="/WEB-INF/pages/entrevistas/altaMateriaBoletin.jsp"></jsp:include>
</div>
<div style="display: none;" id="altaMateriaPrevia" title="Agregar Materia">
	<jsp:include page="/WEB-INF/pages/entrevistas/altaMateriaPrevia.jsp"></jsp:include>
</div>
</body>
</html>