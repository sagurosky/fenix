<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">

<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
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

<script type="text/javascript"
src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>	

<script type="text/javascript">



//variable para simular un map 
var arrayBanco = new Array();

$(function() {
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
							eae: item.eae,
							idZona: item.idZona
							
						}
					}))
				}
			})
		},
		select: function(event, ui) {
			$("#idEscuela").val(ui.item.id);
			$("#zonaCimientos").val(ui.item.zona);
			$("#eae").val(ui.item.eae);
			$("#idZonaCimientos").val(ui.item.idZona);
			
			if(ui.item.eae=="6/6"){
				
				var mySelect = document.getElementById('anioEscuela');
				mySelect.options.length = 0;
				mySelect.options[0] = new Option ("Seleccione una opci"+"\u00f3"+"n", "Foo");
				mySelect.options[0].selected="true";
				var data = [{"1":"Nivel Inicial"}, {"2": "1"+"\u00b0"+" primaria"}, {"3": "2"+"\u00b0"+" primaria"}, {"4": "3"+"\u00b0"+" primaria"}, {"5": "4"+"\u00b0"+" primaria"}, {"6": "5"+"\u00b0"+" primaria"}, {"7": "6"+"\u00b0"+" primaria"}, {"8": "7"+"\u00b0"+" primaria"}, {"9": "1"+"\u00b0"+" secundaria"}, {"10": "2"+"\u00b0"+" secundaria"}, {"11": "3"+"\u00b0"+" secundaria"}, {"12": "4"+"\u00b0"+" secundaria"}, {"13": "5"+"\u00b0"+" secundaria"}, {"14": "6"+"\u00b0"+" secundaria"}, {"15": "7"+"\u00b0"+" t"+"\u00e9"+"cnica"}, {"16": "-"}];
				var $select = $('#anioEscuela');
				
				$.each(data, function(i, val){
				    $select.append($('<option />', { value: (i+1), text: val[i+1] }));	
				     
				});
				document.getElementById("anioEscuela").options[8].disabled = true
				
			}else{
				
				var mySelect = document.getElementById('anioEscuela');
				mySelect.options.length = 0;
				mySelect.options[0] = new Option ("Seleccione una opci"+"\u00f3"+"n", "Foo");
				mySelect.options[0].selected="true";
				var data = [{"1":"Nivel Inicial"}, {"2": "1"+"\u00b0"+" primaria"}, {"3": "2"+"\u00b0"+" primaria"}, {"4": "3"+"\u00b0"+" primaria"}, {"5": "4"+"\u00b0"+" primaria"}, {"6": "5"+"\u00b0"+" primaria"}, {"7": "6"+"\u00b0"+" primaria"}, {"8": "7"+"\u00b0"+" primaria"}, {"9": "1"+"\u00b0"+" secundaria"}, {"10": "2"+"\u00b0"+" secundaria"}, {"11": "3"+"\u00b0"+" secundaria"}, {"12": "4"+"\u00b0"+" secundaria"}, {"13": "5"+"\u00b0"+" secundaria"}, {"14": "6"+"\u00b0"+" secundaria"}, {"15": "7"+"\u00b0"+" t"+"\u00e9"+"cnica"}, {"16": "-"}];
				var $select = $('#anioEscuela');
				
				$.each(data, function(i, val){
				    $select.append($('<option />', { value: (i+1), text: val[i+1] }));	
				});
				document.getElementById("anioEscuela").options[15].disabled = true
				
			}
			$.ajax( {
			     type: "GET",
			     url: "../ajax/buscarSucursalBancoPorZona.do",
			     data: { idZona: $("#idZonaCimientos").val() },
			     dataType: "json",
			     success: function(data) {
				   	  var options = '';
			           options += '<option value="" selected="selected">Seleccione una opci&oacute;n:</option>'
			           $(data.sucursales).each(function() {
			        	   arrayBanco[this.id] = this.banco; 	
			               options += '<option value="' + this.id + '"> '+ this.banco +', '+ this.nombre +'</option>';
			           });
			            $("select#respoSucursal").html(options);
			     }
			   } )
		}
		
	});
	
 	$("#convocatoria").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarConvocatoriaPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.convocatorias, function(item) {
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
				$("#idConvocatoria").val(ui.item.id);
				$("#idConvocatoria").removeClass("required");
			}
		}); 
});


/**
 * Este metodo es para poder cargar el banco dependiendo de la sucursal
 */	
function seleccionarBanco(id){
	$("#respoBanco").val(arrayBanco[id]);
}

function limpiarComboBanco(){
	
	var select=document.getElementById("respoSucursal");
	for(var i = 0; i < select.length ; i++)
	{
		var option = select[i];
		option.value = null;
		select.remove(option);
	}
	select.options[0] = new Option('Seleccione una opci&oacute;n:', '');

}
	
	function limpiarConvocatoria(){
		$("#convocatoria").val('');
		$("#idConvocatoria").val('');
	}

	function chequearConvocatoria(){
		if(document.getElementById("idConvocatoria").value == ''){
			$("#convocatoria").val('');
			$("#idConvocatoria").val('');	
		}
	}
</script>
<script>

function buscarAlumno(){
	
	
	if(!isNaN($("#dniAlumno").val())){
		var direc = "../ajax/buscarAlumnoEntrevistaSeleccion.do?dni=" + $("#dniAlumno").val();
		$.ajax({
			type: "POST",
			cache: false,
			url: direc,
			dataType: "json", 
			processData: false,
			success: function(data){
				document.forms['formAlumno'].idEntrevista.value= data.id;
				if(data.entrevistaSeleccion == true && data.puedeCargarEntrevista == false)
				{
					$( "#dialog-ver" ).dialog({
						resizable: false,
						height:160,
						width:550,
						modal: true,
						//closeOnEscape: false,
						buttons: {
							"Ver Datos Entrevista Seleccion": function() {
								$( this ).dialog( "close" );
								//Este metodo esta en el jsp entrevistaSeleccionView
								enviarForm('verDetalleEntrevistas');
							},
							"Cancelar": function() {
								$("#dniAlumno").val('');
								$( this ).dialog( "close" );
							}
						},
						close: 
							function(ev, ui) 
							{
								$("#dniAlumno").val('');
								return false;
							}
							
					});
				}
				if (data.entrevistaSeleccion == true && data.puedeCargarEntrevista == true)
				{
					$( "#dialog-cargar" ).dialog({
						resizable: false,
						height:160,
						width:550,
						modal: true,
						//closeOnEscape: false,
						buttons: {
							"Ver Datos Entrevista Seleccion": function() {
								$( this ).dialog( "close" );
								//Este metodo esta en el jsp entrevistaSeleccionView
								enviarForm('verDetalleEntrevistas');
							},
							"Cargar Entrevista Seleccion":function(){
								$( this ).dialog( "close" );
								//Este metodo esta en el jsp entrevistaSeleccionView
								enviarForm('nuevaEntrevista');
							},
							"Cancelar": function() {
								$("#dniAlumno").val('');
								$( this ).dialog( "close" );
							}
						},
						close: 
							function(ev, ui) 
							{
								$("#dniAlumno").val('');
								return false;
							}
					});
				}
				
				if (data.entrevistaSeleccion == false && data.dniExistePersona == true)
				{
					$( "#dialog-DNI" ).dialog({
						resizable: false,
						height:160,
						width:550,
						modal: true,
						//closeOnEscape: false,
						buttons: {
							
							"Cancelar": function() {
								$("#dniAlumno").val('');
								$( this ).dialog( "close" );
							}
						},
						close: 
							function(ev, ui) 
							{
								$("#dniAlumno").val('');
								return false;
							}
					});
				}
				
			}
		});
	}
}





function enableDisableInput(value){
	if(value == "true"){
		//$('#anioAbandonos').removeAttr('disabled');
		//$('#motivoAbandono').removeAttr('disabled');
		$('#anioRepitios').removeAttr('disabled');
		$('#motivoRepitencia').removeAttr('disabled');
		//$('#abandonoAnio').removeAttr('disabled');
		//$('#abandonoAnio1').removeAttr('disabled');
		
	}else{

		$('#anioRepitios').attr('disabled','disabled');
		$('#motivoRepitencia').attr('disabled','disabled');
		$('#motivoRepitencia').val('');
		//$('#abandonoAnio').attr('disabled','disabled');
		//$('#abandonoAnio1').attr('disabled','disabled');
		//$('#anioAbandonos').attr('disabled','disabled');
		//$('#motivoAbandono').attr('disabled','disabled');
	}
}

function validateDni(value){
	if(value.length < 7 ){
		$('#dniError').css('display','block');
	}else{
		$('#dniError').css('display','none');
	}
}
function habilitarInputEstadoAlumno(inputSelect){
	//alert(inputSelect);
	switch(inputSelect){
		
		case '12': 
			//Rechazado Seleccion			
			
			document.getElementById("motivoEnvioTS0").selected=true;
			$('#motivoRechazo').removeAttr('disabled');
			$('#motivoEnvioTS').attr('disabled','disabled');
			$('#motivoEnvioTS').removeClass("required");
			$('#perfilTsId').attr('disabled','disabled');
			$('#excepcion').attr('disabled','disabled');
			$('#excepcion > option[value="SUO"]').attr('selected', 'selected');
			break;
		case '18':
			//Preseleccionado 0 Envio a TS
			$('#observacionesParaTS').removeAttr('disabled');
			$('#motivoEnvioTS').removeAttr('disabled');
			$('#perfilTsId').removeAttr('disabled');
			$('#motivoRechazo').attr('disabled','disabled');
			$('#motivoEnvioTS').addClass("required");
			document.getElementById("idMotivoRechazo0").selected=true;
			$('#excepcion').attr('disabled','disabled');
			$('#excepcion > option[value="SUO"]').attr('selected', 'selected');
			break;
		
		default:
			$('#observacionesParaTS').attr('disabled','disabled');
			$('#motivoRechazo').attr('disabled','disabled');
			$('#motivoEnvioTS').attr('disabled','disabled');
			$('#perfilTsId').attr('disabled','disabled');
			$('#motivoEnvioTS').removeClass("required");
			if (inputSelect==2){
				$('#excepcion').removeAttr('disabled');
			}
			var valor="Repitente";
			if (inputSelect==12 || inputSelect==4 || inputSelect==13 || inputSelect==18 ){
				$('#excepcion').attr('disabled','disabled');
				$('#excepcion > option[value="SUO"]').attr('selected', 'selected');
				
			}
			
			//idMotivoRechazo0
			document.getElementById("idMotivoRechazo0").selected=true;
			document.getElementById("motivoEnvioTS0").selected=true;
			break;
	}
}

</script>

<!-- Datos Personales -->
<fieldset>
	<legend> Datos Personales: </legend>
		<br></br>
		<jsp:include page="datosPersonalesAlumno.jsp"></jsp:include>
</fieldset>
<!-- Datos Escolares -->
<fieldset>
	<legend> Datos Escolares </legend>
		<jsp:include page="datosEscolaresAlumno.jsp"></jsp:include>
</fieldset>
<!-- Evaluación -->
<fieldset>
	<legend> Evaluaci&oacute;n Candidato </legend>
		<jsp:include page="evaluacion.jsp"></jsp:include>
</fieldset>
<!-- Boletin -->
<fieldset>	
	<jsp:include page="materiasInteres.jsp"></jsp:include>
</fieldset>

<!-- Boletin -->
<fieldset>
	<legend> Bolet&iacute;n </legend>
	<jsp:include page="boletinSeleccion.jsp"></jsp:include>	
</fieldset>
<!-- Asistencia a clase -->
<fieldset>
	<legend> Asistencia a Clase </legend>
		<jsp:include page="asistenciaClase.jsp"></jsp:include>
</fieldset>
