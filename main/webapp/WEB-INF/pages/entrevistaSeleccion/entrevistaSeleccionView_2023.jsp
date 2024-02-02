
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<!-- DMS 11/11/22  unificado de taglibs -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="mif" uri="/list-operator.tld" %>


<html>
<head>

<!-- head del cuestionario de carlos -->
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<title>Cuestionario EP</title>

<!-- fin head -->









<!-- DMS 11/11/22 unificado de metas -->

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">





<!-- DMS uificado de links -->

<!-- DSM agrego bootstrap -->
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
 

<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"
	media="all">
 
<link rel="stylesheet" type="text/css"
	href="../pages/includes/jquery.tabs.css" />
	
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
 

<!-- DMS 11/11/22 unificado de scripts -->
<!-- scripts originales -->

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>

<script type="text/javascript"
	src="<c:url  value="/static/js/dFilter.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>

<!-- scripts de ficha candidato -->


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


<script type="text/javascript"
src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>	


<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
	
<!-- 	
<script type="text/javascript"
	src="<c:url  value="/static/js/entrevistaSeleccion.js"/>"></script>
	
 -->

<script type="text/javascript">

//DMS no puedo extraer estos script porque no reonoce el EL

function habilitarRA2(){
	if($("#noAsisteEntrevista").attr("checked"))
	{
		//No asiste: Habilita RA2
		if(${isDetalleEntrevista == false})
		{
			$("#tablaDatosResponsable2 :text").removeAttr("disabled");
			$("#vinculoRespo2").removeAttr("disabled");
		}
		else
		{
			$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
			$("#tablaDatosResponsable2 :checkbox").attr("disabled","disabled");
			$("#tablaDatosResponsable2 :input").attr("disabled","disabled");
		}
	}
	else
	{
		//Asiste: Deshabilita y Borra
		$("#responsable2Telefono1").val("");
		$("#responsable2ContactoTelefono1").val("");
		$("#nombreResponsable2").val("");
		$("#apellidoResponsable2").val("");
		$("#vinculoRespo2").val("");
		$("#vinculoRespo2").attr("disabled","disabled");
		$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
	}
}


function disabledInput(){
	
	if(${isDetalleEntrevista} == true){
		$("input").attr("disabled","disabled");
		$("select").attr("disabled","disabled");
		$("textarea").attr("disabled","disabled");
		$("checkbox").attr("disabled","disabled");
		
		$("#excepcion").attr("disabled","disabled");
		$("#buttonVolver").removeAttr("disabled");
		$("#alumnoNombre").attr("disabled","disabled");
		$("#alumnoApellido").attr("disabled","disabled");
		$("#dniAlumno").attr("disabled","disabled");
		$("#fechaNacimiento").attr("disabled","disabled");
		$("#dni").attr("disabled","disabled");
		$("#alumnoNacionalidad").attr("disabled","disabled");
		$("#zonaCimientos").attr("disabled","disabled");
		$("#escuela").attr("disabled","disabled");
		$("#anioEscuela").attr("disabled","disabled");
		$("#alumnoDivision").attr("disabled","disabled");
		$("#turno").attr("disabled","disabled");
		$("#alumnoDireccion").attr("disabled","disabled");
		$("#alumnoEntreCalles").attr("disabled","disabled");
		$("#alumnoCodigoPostal").attr("disabled","disabled");
		$("#barrioUser").attr("disabled","disabled");
		$("#localidad").attr("disabled","disabled");
		$("#alumnoTelefono").attr("disabled","disabled");
		$("#alumnoContactoTelefono1").attr("disabled","disabled");
		$("#alumnoContactoTelefono2").attr("disabled","disabled");
		$("#alumnoContactoTelefono3").attr("disabled","disabled");
		$("#alumnoMail").attr("disabled","disabled");
		$("#alumnoMail").attr("disabled","disabled");
		$("#localidadAlumno").attr("disabled","disabled");
		$("#provinciaAlumno").attr("disabled","disabled");
		$("#telefono2").attr("disabled","disabled");
		$("#telefono1").attr("disabled","disabled");
		$("#alumnoNumero").attr("disabled","disabled");
		$("#alumnoPiso").attr("disabled","disabled");
		
		$("#idAnioRepitio").attr("disabled","disabled");
		$("#motivoRepitencia").attr("disabled","disabled");
		$("#idAnioAbandono").attr("disabled","disabled");
		$("#motivoAbandono").attr("disabled","disabled");
		
		//Responsable Adulto 1
		$("#tablaDatosResponsable :text").attr("disabled","disabled");
		$("#tablaDatosResponsable :checkbox").attr("disabled","disabled");
		$("#tablaDatosResponsable :input").attr("disabled","disabled");
		$("#respoSucursal").attr("disabled","disabled");
		
		//Responsable Adulto 2
		$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
		$("#tablaDatosResponsable2 :checkbox").attr("disabled","disabled");
		$("#tablaDatosResponsable2 :input").attr("disabled","disabled");
		//Ficha Familiar
		$("#tablaFicha :text").attr("disabled","disabled");
		$("#tablaFicha :checkbox").attr("disabled","disabled");
		$("#tablaFicha :input").attr("disabled","disabled");
		
		$("#botonAgregarFicha").attr("disabled","disabled");
		$("#botonBorrarFicha").attr("disabled","disabled");
		$("#relacionViviendaFicha").attr("disabled","disabled");
		$("#egresosTotalesFicha").attr("disabled","disabled");				
	}
	else{
		var repitio = $('[name="entrevistaSeleccion.repitio"]:checked').val();
		var abandono = $('[name="entrevistaSeleccion.abandono"]:checked').val();
	
		if(repitio == 'false'){
			$("#idAnioRepitio").attr("disabled","disabled");
			$("#motivoRepitencia").attr("disabled","true");	
			$('#idAnioRepitio').removeClass('required');
		}
		else{
			$("#idAnioRepitios").removeAttr("disabled");
			$("#motivoRepitencia").removeAttr("disabled");
			$('#idAnioRepitio').addClass('required');
		}
		if(abandono == 'false'){
			$("#idAnioAbandono").attr("disabled","disabled");
			$("#motivoAbandono").attr("disabled","true");		
			$('#idAnioAbandono').removeClass('required');
		}
		else{
			$("#idAnioAbandono").removeAttr("disabled");
			$('#idAnioAbandono').addClass('required');
			$("#motivoAbandono").removeAttr("disabled");		
		}
	}
}

/**
 * Metodo para enviar el formulario
 */
function enviarForm(action){
	
	if(action == 'finalizado'){		
		llenarFechaHidden();
		if(${isOtraEntrevista}){
			
			
			document.forms['altaEntrevista'].action ="<c:url value='altaNuevaEntrevistaSeleccion.do'/>";
		}
		else{
			
			document.forms['altaEntrevista'].action ="<c:url value='altaEntrevistaSeleccion.do'/>";
		}
		
		
		$('#estadoEntrevista').val('3');
		
		document.forms['altaEntrevista'].dni.value = $('#dniAlumno').val();	
		if(validarSubmit()){
			
			return;
		};
		
		ap_showWaitMessage('waitDiv', 1);
		//disabledInput();
		//Esto es para que jquery valide los campos con los formularios
		
		$('#altaEntrevista').submit();
		
		return
		
	}
	if(action == 'construccion'){
		document.forms['altaEntrevista'].action ="<c:url value='altaEntrevistaSeleccion.do'/>";
		$('#estadoEntrevista').val('1');
		//validarSubmit();
		document.forms['altaEntrevista'].submit();
		return
	}
	if(action=='volver'){
		document.forms['altaEntrevista'].action ="<c:url value='/entrevistaSeleccion/reporteEntrevistaSeleccion.do'/>";
		document.forms['altaEntrevista'].submit();
		return
	}
	if(action == 'obtenerAlumno'){
		
		document.forms['formAlumno'].action ="<c:url value='/entrevistaSeleccion/detalleEntrevistaSeleccion.do?isDetalleEntrevista=true'/>";
		document.forms['formAlumno'].idAlumno.value= $('#dniAlumno').val();
		document.forms['formAlumno'].submit();
		return
	}
	
	if(action  == 'nuevaEntrevista' ){
		document.forms['formAlumno'].accion.value = "carga";
		document.forms['formAlumno'].action ="<c:url value='/entrevistaSeleccion/detalleEntrevistaSeleccion.do?isDetalleEntrevista=false'/>";
		//document.forms['formAlumno'].idAlumno.value= $('#dniAlumno').val();
		document.forms['formAlumno'].submit();
		return
	}

	if(action == 'verDetalleEntrevistas'){
		document.forms['formAlumno'].action ="<c:url value='/entrevistaSeleccion/detalleEntrevistaSeleccion.do?isDetalleEntrevista=true'/>";
		//document.forms['formAlumno'].idAlumno.value= $('#dniAlumno').val();
		document.forms['formAlumno'].submit();
		return
	}
}














</script>



<script>






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
	
	//DMS agrego script que estaba en otro tag para unificarlos
	
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
							height:260,
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
							height:260,
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
						console.log("entro el script");
						$( "#dialog-DNI" ).dialog({
							
							resizable: false,
							height:260,
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

	//DMS agrego scripts para agruparlos
	
	

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

<!-- DMS agrego scripts del include ficha responsable -->

$(function() {

	$("#tablaDatosResponsable :text").css("width","90px");
	$("#tablaGeneralesResponsable :text").css("width","90px");
	
	$("#barrioResp").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarBarrioPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					name_startsWith: request.term				
				},
				success: function(data) {
					response($.map(data.barrios, function(item) {
						return {
							label: item.nombre + ", " + item.localidad ,
							value: item.nombre,
							id: item.id
						}
					}))
				}
			})
		},
		select: function(event, ui) {

			var direccion = "../ajax/buscarLocalidadZona.do?idBarrio=" + ui.item.id;
			
			$.ajax({

				type: "POST",
				cache: false,
				url: direccion,
				dataType: "json", 
				processData: false,
				success: function(data){
					$("#idBarrioResp").val(data.id);
					$("#idLocalidadResp").val(data.idLocalidad);
					$("#localidadResp").val(data.localidad);
					
				}

			});
		}
	});
	
	habilitarRA2();

});
	
	//DMS agrego scripst para agruparlos en una misma etiqueta
	
	
	function verificarCuil(){
		if($("#responsableSexoM").attr("checked")){
			generarCuil("true");
		}
		if($("#responsableSexoF").attr("checked")){
			generarCuil("false");
		}
	}

	var digito;
	function generarCuil(){
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dniResponsable').val();
		radioValor = $('[name="perfilAlumno.responsable1.sexo"]:checked').val();//Toma el valor chequeado del input del sexo
		if(value.length == 8){ //Se ingresó al menos un digito del dni
			if(radioValor == "true"){ //Masculino	
				cuil = value;
				xy = 20;
				cuil = calcular( xy, cuil);
			}else{
				if(radioValor == "false"){ //Fememino
					cuil = value;
					xy = 27;
					cuil = calcular( xy, cuil );
				}
			}
		}
		else{
			$('#cuil').val(" "); // No se ingresó al menos un numero de dni por lo que no se puede calcular el cuil
		}
		if(isNaN( digito ) ){
			$('#cuil').val(" ");
		}
		else{
			$('#cuil').val(cuil);
		}					
	}
	
	
	
	function formatear(xy, cuil, digito) {
		return (xy + "-" + cuil + "-" + digito);		
		
		}
	
	function validar () {
		var error = false; /* No se detecto error hasta el momento, no se vio que falten datos */
		var faltantes = "Faltan: ";

		if (document.getElementById("dniResponsable").value == ""){
			error = true;
			faltantes += " N° de Documento \n";
			}
		
		if (error == true) {			/* Si hay error es porque entre en algun if, entonces muestro con alert lo que falta y devuelvo false para que no funcione el submit del formulario */
				alert (faltantes);
				return false;			/* El submit del formulario no funciona porque tiene un return validar() <-- y return false hace que no submitee que es lo que pasa en este caso */
			} else {
					return true;
				}
	}

	
	
	
	function llenarFechaHidden(){
		//alert();
		valor = $("#fechaNacimientoRes").val();
		$("#fechaNacRes").val(valor);
	}
	
	//DMS agrego script del include ficha familiar
	
	var counter = 0;
var contadorff=0;

function incrementarCounter(){
	
	counter++;
	//alert();
	
	
}



function sumarIngreso(){
	var ingresoTotal = 0;
	
	var arrayValores = $(".ingreso");
	var i = 0;
	for(i; i < arrayValores.length; i++){
		var monto = parseInt(arrayValores[i].value);
		if(isNaN(monto)){
			
		}else{
			ingresoTotal += monto;
		}
	}
	$('#ingresosTotales').val(ingresoTotal);
}

function chequearLongitudFF(obj){
	if (obj.value.length > 255) {
	obj.value = obj.value.substring(0, 255);
	}
}




$(document).ready(function(){
	
	
	//$("#color2").change(function(){
	//	$("#deConviveSN").val($(this).val());
	//	$("#valor2").val($(this).val());
	//});
	//alert(counter);
	//alert(contadorff);
	$("#contadorFicha").val(counter);
	if(counter!=0 || contadorff!=0){
		document.getElementById("deNombreFF").value = document.getElementById("nombreFichas").value;	
	}
	
	
	
	//$("#deNombreFF").val("#nombreFichas");
	
	//document.getElementById("deConviveSN").value = document.getElementById("nombreFichas").value;
	
	
	$("#tablaFicha :text").css("width", "80px");
	
	$("#botonAgregarFicha").click(function () {
		var selectVinculo ='<select name="vinculoFFs" id="vinculo"><option ></option>'+
						   	'<c:forEach items="${listVinculo}" var="vinculo"><option value="${vinculo.id}" >${vinculo.valor}</option></c:forEach></select>';
		var selectConviveFichas ='<select name="conviveFichas" id="conviveFichas" ><option ></option>'+
								 '<c:forEach items="${listConvive}" var="convive"><option value="${convive.id}">${convive.valor}</option></c:forEach></select>';
		var selectNivelEducativo ='<select name="nivelEducativoFichas" id="nivelEducativoFichas" ><option></option>'+
								  '<c:forEach items="${listNivelEducativo}" var="nivelEducativo"><option value="${nivelEducativo.id}">${nivelEducativo.valor}</option></c:forEach></select>';						 
		
									  
		counter++;
		//contadorff++;
		contadorff=counter;
		$('#tbody').append('<tr id="fila' + counter + '">'+
				'<td><input type="checkbox" value="fila' + counter + '"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px">' + selectVinculo + '</td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" id="nombreFichas" name="nombreFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" size="2" class="digits"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;">' + selectConviveFichas + '</td>'+
				'<td align="left" valign="middle" style="font-size: 12px;">' + selectNivelEducativo + '</td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="abandonoRepitenciaFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
			'</tr>');
		
		$("#tablaFicha :text").css("width", "80px");
		$("#contadorFicha").val(contadorff);
		
		$("#nombreFichas").change(function(){
			//alert(2);
			$("#deNombreFF").val($(this).val());
			});
		
		//document.getElementById("deNombreFF").value = document.getElementById("nombreFichas").value;
		
		
	});

	$("#botonBorrarFicha").click(function () {
		
		
		
		
		
		var checks = $("#tablaFicha :checked");
		var i=0;
		for (i=0;i<checks.length;i++){
			$("#" + checks[i].value).remove();
		
			if(contadorff<=0){
				$("#contadorFicha").val(contadorff);		
			}else{
				contadorff--;
				$("#contadorFicha").val(contadorff);
			}
			
		}
  	
	});
	
});


//DMS agrego scripts de include boletinSeleccion.jsp


function chequearDigitos(obj){
	if (obj.value != '1' && obj.value != '2' && obj.value != '3' && obj.value != '4' && obj.value != '5' && obj.value != '6'
		&& obj.value != '7' && obj.value != '8' && obj.value != '9' && obj.value != '10') {
		obj.value = '';
	}
}
//DMS agrego script para aruparlos en un mismo tag
function calcular_edad(fecha){
  var today = new Date();
  var birthDate = new Date($("#fechaNacimiento").datepicker("getDate"));
  var age = today.getFullYear() - birthDate.getFullYear();
  var m = today.getMonth() - birthDate.getMonth();
  if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
      age--;
  }
  $("#input_id_2").val(age);
}
//DMS agrego script para aruparlos en un mismo tag

function calcular_fecha(fecha){
  var today = new Date();
  var fe = new Date($("#fechaEntrevista").datepicker("getDate"));    
  if (fe>today){
  	alert("La fecha de la entrevista tiene que ser menor o igual a la fecha actual");
  }
  
}

//DMS agrego script para aruparlos en un mismo tag

$(document).ready(function(){
$("#alumnoDireccion").change(function () {
	var selectVinculo ='<select name="vinculoFFs" id="vinculo">'+
						'<option value=1>Abuela</option>'+
						'<option value=2>Abuelo</option>'+
						'<option value=3>Candidata</option>'+
						'<option value=4 selected="selected">Candidato</option>'+
						'<option value=5>Cuñada</option>'+
						'<option value=6>Cuñado</option>'+
						'<option value=7>Hermana</option>'+
						'<option value=8>Hermano</option>'+
						'<option value=9>Hermanastra</option>'+
						'<option value=10>Hermanastro</option>'+
						'<option value=11>Hija</option>'+
						'<option value=12>Hijo</option>'+
						'<option value=13>Madrastra</option>'+
						'<option value=14>Madre</option>'+
						'<option value=15>Padrastro</option>'+
						'<option value=16>Padre</option>'+
						'<option value=17>Prima</option>'+
						'<option value=18>Primo</option>'+
						'<option value=19>Sobrina</option>'+
						'<option value=20>Sobrino</option>'+
						'<option value=21>Tía</option>'+
						'<option value=22>Tía Abuela</option>'+
						'<option value=23>Tío</option>'+
						'<option value=24>Tío Abuelo</option>'+
						'<option value=25>Tutor</option>'+
						'<option value=26>Otro</option>'+						
						'</select>';
	var selectConviveFichas ='<select name="conviveFichas" id="conviveFichas">'+ 
								'<option value=0 selected="selected">SI</option>'+
								'<option value=1>NO</option></select>';
	var selectNivelEducativo ='<select name="nivelEducativoFichas" id="nivelEducativoFichas">'+
							  	'<option value=1>Sin escolaridad formal</option>'+
							  	'<option value=2 >Primaria incompleta</option>'+
							  	'<option value=3>Primaria en curso</option>'+
							  	'<option value=4 >Primaria completa</option>'+
							  	'<option value=5 >Secundaria incompleta</option>'+
							  	'<option value=6 selected="selected">Secundaria en curso</option>'+
							  	'<option value=7 >Secundaria completa</option>'+
							  	'<option value=8 >Terciario incompleto</option>'+
							  	'<option value=9 >Terciario en curso</option>'+
							  	'<option value=10 >Terciario completo</option>'+
							  	'<option value=11 >Universitario incompleto</option>'+
							  	'<option value=12 >Universitario en curso</option>'+
							  	'<option value=13 >Universitario completo</option>'+
							  	'<option value=14 >Nivel inicial en curso</option>'+
							  	'<option value=15 >Escuela especial en curso</option>'+
							  	'<option value=16 >Escuela especial completa</option>'+
							  	'</select>';	
						
	
	
	var nombreCandidato1 = document.getElementById("alumnoNombre").value
	var apellidoCandidato1 = document.getElementById("alumnoApellido").value
	var edadCandidato = document.getElementById("input_id_2").value
	
	var nombreCandidato ='<input type="text" name="nombreFichas" id="nombreFichas" value="'+ nombreCandidato1 +'">';
	var apellidoCandidato ='<input type="text" name="apellidoFichas" id="apellidoFichas" value="'+ apellidoCandidato1 +'">';
	//alert(nombreCandidato);							  
	counter++;
	//alert(counter);
	//contadorff++;
	contadorff=counter;
	
	if (counter==1){
		
	
	$('#tbody').append('<tr id="fila' + counter + '">'+
			'<td><input type="checkbox" value="fila' + counter + '"></td>'+
			'<td align="left" valign="middle" style="font-size: 12px">' + selectVinculo + '</td>'+
			'<td align="left" valign="middle" style="font-size: 12px;">'+ nombreCandidato + ' </td>'+
			'<td align="left" valign="middle" style="font-size: 12px;">'+ apellidoCandidato + ' </td>'+
			'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" size="2" class="digits" value=' + edadCandidato +' ></td>'+
			'<td align="left" valign="middle" style="font-size: 12px;">' + selectConviveFichas + '</td>'+
			'<td align="left" valign="middle" style="font-size: 12px;">' + selectNivelEducativo + '</td>'+
			'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="abandonoRepitenciaFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
			'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
			'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
			'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
			'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
		'</tr>');
	
	$("#tablaFicha :text").css("width", "80px");
	$("#contadorFicha").val(contadorff);
	
	$("#nombreFichas").change(function(){
		//alert(2);
		$("#deNombreFF").val($(this).val());
		});
	
	}
	//document.getElementById("deNombreFF").value = document.getElementById("nombreFichas").value;
	
	
});
});

//DMS agrego script para aruparlos en un mismo tag


//Funciones pantalla "Espere por Favor..."
var DHTML = (document.getElementById || document.all || document.layers);
function ap_getObj(name) {
if (document.getElementById) {
  return document.getElementById(name).style;
} else if (document.all) {
  return document.all[name].style;
} else if (document.layers) {
  return document.layers[name];
}
}
function ap_showWaitMessage(div,flag)  {
if (!DHTML)
  return;
var x = ap_getObj(div);
x.visibility = (flag) ? 'visible':'hidden'
if(! document.getElementById)
  if(document.layers)
    x.left=280/2;
}
//Fin Funciones pantalla "Espere por Favor..."


$(document).ready(function(){

	$("#body").css("height","4000");
	//Habilita o deshabilita los campos
	enableDisableInasistencia()
	jQuery.validator.messages.required = "(*)";
	jQuery.validator.messages.minlength = "Ingrese al menos 7 digitos";
	var estado1 = document.getElementById("estados").value;
	var convocatoria = document.getElementById("convocatoria").value;
	habilitarInputEstadoAlumno(estado1);
	$("#altaEntrevista").validate({
		  rules: {
			  	"perfilAlumno.datosPersonales.dni": {
		      	required: true,
		      	minlength: 7
		    },
		    	"perfilAlumno.responsable1.dni": {
			    required: true,
			    minlength: 7
			},
				"entrevistaSeleccion.convocatoria.idConvocatoria":{
				required:true
			},
				"estados":{
				required:true
			},
				"Tipo":{
				required:true
			},
				"anioEscuela":{
				required:true
			},
				"turno":{
				required:true
			},
				"perfilAlumno.datosPersonales.localidad.id":{
				required:true
			},
				"perfilAlumno.datosPersonales.provincia.id":{
				required:true
			},
				"idCompromiso":{
				required:true
			},
				"idCompromisoPBE":{
				required:true
			},
				"dni":{
				required:true
			},
				"vinculoRA":{
				required:true
			},
				"compromisoEscolaridad":{
				required:true
			},
				"posibilidadCompromisoPBE":{
				required:true
			},
				"aptoComoRA":{
				required:true
			},
				"relacionVivienda":{
				required:true
			}
		  },
	 invalidHandler: function(form, validator) {
	      var errors = validator.numberOfInvalids();
	      if (errors) {
	    	  var estado = document.getElementById("estados").value;
	    	  var motivo = document.getElementById("motivoRechazo").value;
	    	  habilitarInputEstadoAlumno(estado);
	    	  habilitarMotivo(motivo);
	    	  habilitarRA2();
	    	$("#zonaCimientos").attr("disabled","disabled");
	    	$("#respoBanco").attr("disabled","disabled");
	    	$("#numeroCuentaRespo").attr("disabled","disabled");
	    	if(document.forms['formAlumno'].accion.value == "carga"){
	    		$("#dniAlumno").attr("disabled","disabled");
	    	}
	    	ap_showWaitMessage('waitDiv', 0);
	    	
	    	disabledInput();
	      }
	    }
	});
	//Este metodo pone todo los input en disabled, esto pasa cuando se viene de la pantalla de reportes de entrevistas
		disabledInput();	
	
	// jQuery.validator.addMethod("accept", function(value, element, param) { return value.match(new RegExp("^" + param + "$")); });

$("#fechaEntrevista").datepicker({
	  changeMonth: true,
	  changeYear: true,
	  yearRange:'2013:'+ new Date()	
	  }); 
$("#fechaNacimiento").datepicker({
	  changeMonth: true,
	  changeYear: true,
	  yearRange:'1994:'+ new Date()	
	  });
$("#fechaNacimientoRes").datepicker({
	  changeMonth: true,
	  changeYear: true,
	  yearRange:'1920:'+ new Date()	
	  });
$("#fechaNacimientoRes2").datepicker({
	  changeMonth: true,
	  changeYear: true,
	  yearRange:'1920:'+ new Date()	
	  });
	//$(":text").css("width", "100px");
	//$("#celdaBody").css("width","900px");
	
});

function validarDNI(id){
	var selector = "#" + id;
	var error = "#" + id + "Error";
	var dni = $(selector).val();
	if(dni.length > 5){
		$(error).css("display","none");
	}else{
		$(error).css("display","block");
	}
}
function habilitarRA2(){
	if($("#noAsisteEntrevista").attr("checked")){
		//No asiste: Habilita RA2
		$("#tablaDatosResponsable2 :text").removeAttr("disabled");
		$("#vinculoRespo2").removeAttr("disabled");
	}else{
		//Asiste: Deshabilita y Borra
		$("#responsable2Telefono1").val("");
		$("#responsable2ContactoTelefono1").val("");
		$("#nombreResponsable2").val("");
		$("#apellidoResponsable2").val("");
		$("#vinculoRespo2").val("");
		$("#vinculoRespo2").attr("disabled","disabled");
		$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
	}
}

function validarSubmit(){	
	$("#direccionRA").val($("#alumnoDireccion").val());
	$("#codPostalRA").val($("#alumnoCodigoPostal").val());
	$("#entreCallesRA").val($("#alumnoEntreCalles").val());
	$("#nroCalleRA").val($("#alumnoNumero").val());
	$("input").removeAttr("disabled");
	$("select").removeAttr("disabled");
	$("textarea").removeAttr("disabled");
	
	
	
	habilitarRA2();
	if($("#fechaNacimientoRes2").val() == ""){
		$("#fechaNacimientoRes2").attr("disabled","disabled");
	}
	var fechaAlum = $("#fechaNacimiento").val();
	var fechaResp = $("#fechaNacimientoRes").val();
	var mens="";
	var flag=false;
	
	var diaA =fechaAlum.substring(0,2);
	var mesA =fechaAlum.substring(3,5);
	var anioA =fechaAlum.substring(6,10);
	var diaR =fechaResp.substring(0,2);
	var mesR =fechaResp.substring(3,5);
	var anioR =fechaResp.substring(6,10);
	
	
	
	var flag=false;
	
	
	//calcular la edad
	
	var fechaActualA = new Date()	
	var diaActualA = fechaActualA.getDate();	
	var mmActualA = fechaActualA.getMonth() + 1;	
	var yyyyActualA = fechaActualA.getFullYear();	
	var diaCumpleA = diaA;
	var mmCumpleA = mesA;
	var yyyyCumpleA = anioA;
	var fechaNacA=diaA+"/"+mesA+"/"+anioA
	
	//retiramos el primer cero de la izquierda
	if (mmCumpleA.substr(0,1) == 0) {
	mmCumpleA= mmCumpleA.substring(1, 2);
	}
	//retiramos el primer cero de la izquierda
	if (diaCumpleA.substr(0, 1) == 0) {
	diaCumpleA = diaCumpleA.substring(1, 2);
	}
	var edadA = yyyyActualA - yyyyCumpleA;
	
	//validamos si el mes de cumpleaños es menor al actual
	//o si el mes de cumpleaños es igual al actual
	//y el dia actual es menor al del nacimiento
	//De ser asi, se resta un año
	if ((mmActualA < mmCumpleA) || (mmActualA == mmCumpleA && diaActualA < diaCumpleA)) {
		edadA--;
	}
	
	//alert(edad);
	flag=false;	
	if(fechaAlum.length != 10){
		mens = 'La fecha de nacimiento del alumno es invalida\n';
		$("#zonaCimientos").attr("disabled","disabled");
		$("#cualBeca").attr("disabled","disabled");
		$("#cuil").attr("disabled","disabled");
		$("#respoBanco").attr("disabled","disabled");
		$("#nroCuentaRespo").attr("disabled","disabled");
		flag = true;
	}else{	
		if ((parseInt(edadA))<10 ){
			mens = 'El candidato no puede tenes menos de 10 años\n';
			$("#zonaCimientos").attr("disabled","disabled");
			$("#cualBeca").attr("disabled","disabled");
			$("#cuil").attr("disabled","disabled");
			$("#respoBanco").attr("disabled","disabled");
			$("#nroCuentaRespo").attr("disabled","disabled");
			flag= true;
		}		
		//if (parseInt(diaA)<1 || parseInt(diaA)>31){		
		if (diaA!="01" &&  diaA!="02" &&  diaA!="03" &&  diaA!="04" &&  diaA!="05" &&  diaA!="06" &&  diaA!="07" &&  diaA!="08" &&  diaA!="09" &&  diaA!="10" &&  diaA!="11" &&  diaA!="12" &&  diaA!="13" &&  diaA!="14" &&  diaA!="15" &&  diaA!="16" &&  diaA!="17" &&  diaA!="18" &&  diaA!="19" &&  diaA!="20" &&  diaA!="21" &&  diaA!="22" &&  diaA!="23" &&  diaA!="24" &&  diaA!="25" &&  diaA!="26" &&  diaA!="27" &&  diaA!="28" &&  diaA!="29" &&  diaA!="30" &&  diaA!="31"){
			mens = 'Chequear el día de nacimiento del candidato\n';
			$("#zonaCimientos").attr("disabled","disabled");
			$("#cualBeca").attr("disabled","disabled");
			$("#cuil").attr("disabled","disabled");
			$("#respoBanco").attr("disabled","disabled");
			$("#nroCuentaRespo").attr("disabled","disabled");
			flag = true;
		}	
		//if (parseInt(mesA)<1 || parseInt(mesA)>12){			
		if (mesA!="01" && mesA!="02" &&  mesA!="03" && mesA!="04" && mesA!="05" && mesA!="06" && mesA!="07" && mesA!="08" && mesA!="09" && mesA!="10" && mesA!="11" && mesA!="12" ){		
			mens = 'Chequear el mes de nacimiento del candidato\n';
			$("#zonaCimientos").attr("disabled","disabled");
			$("#cualBeca").attr("disabled","disabled");
			$("#cuil").attr("disabled","disabled");
			$("#respoBanco").attr("disabled","disabled");
			$("#nroCuentaRespo").attr("disabled","disabled");
			flag = true;
		}
		//if (parseInt(anioA)<1994 || parseInt(anioA)>2014){			
		//	mens = 'Chequear el año de nacimiento del candidato\n';
		//	$("#zonaCimientos").attr("disabled","disabled");
		//	$("#cualBeca").attr("disabled","disabled");
		//	$("#cuil").attr("disabled","disabled");
		//	$("#respoBanco").attr("disabled","disabled");
		//	$("#nroCuentaRespo").attr("disabled","disabled");
		//	flag = true;
		//}						
		}
	
	
	
	var fechaActualR = new Date()	
	var diaActualR = fechaActualR.getDate();	
	var mmActualR = fechaActualR.getMonth() + 1;	
	var yyyyActualR = fechaActualR.getFullYear();	
	var diaCumpleR = diaR;
	var mmCumpleR = mesR;
	var yyyyCumpleR = anioR;
	var fechaNacR=diaR+"/"+mesR+"/"+anioR
	
	//retiramos el primer cero de la izquierda
	if (mmCumpleR.substr(0,1) == 0) {
	mmCumpleR= mmCumpleR.substring(1, 2);
	}
	//retiramos el primer cero de la izquierda
	if (diaCumpleR.substr(0, 1) == 0) {
	diaCumpleR = diaCumpleR.substring(1, 2);
	}
	var edadR = yyyyActualR - yyyyCumpleR;
	
	//validamos si el mes de cumpleaños es menor al actual
	//o si el mes de cumpleaños es igual al actual
	//y el dia actual es menor al del nacimiento
	//De ser asi, se resta un año
	if ((mmActualR < mmCumpleR) || (mmActualR == mmCumpleR && diaActualR < diaCumpleR)) {
	edadR--;
	}
	
	//alert(edad);
	//alert(diaR);
	
	if(fechaResp.length != 10){
		mens += 'La fecha de nacimiento del RA es invalida\n';
		$("#zonaCimientos").attr("disabled","disabled");
		$("#cualBeca").attr("disabled","disabled");
		$("#cuil").attr("disabled","disabled");
		$("#respoBanco").attr("disabled","disabled");
		$("#nroCuentaRespo").attr("disabled","disabled");
		flag=true;
		
	}else{
		//if ((edadR)<18 ){
		//	mens += 'El RA no puede tenes menos de 18 años\n';
		//	$("#zonaCimientos").attr("disabled","disabled");
		//	$("#cualBeca").attr("disabled","disabled");
		//	$("#cuil").attr("disabled","disabled");
		//	$("#respoBanco").attr("disabled","disabled");
		//	$("#nroCuentaRespo").attr("disabled","disabled");
		//	flag= true;
		//}		
		//if (parseInt(diaR)<1 || parseInt(diaR)>31){		
		if (diaR!="01" &&  diaR!="02" &&  diaR!="03" &&  diaR!="04" &&  diaR!="05" &&  diaR!="06" &&  diaR!="07" &&  diaR!="08" &&  diaR!="09" &&  diaR!="10" &&  diaR!="11" &&  diaR!="12" &&  diaR!="13" &&  diaR!="14" &&  diaR!="15" &&  diaR!="16" &&  diaR!="17" &&  diaR!="18" &&  diaR!="19" &&  diaR!="20" &&  diaR!="21" &&  diaR!="22" &&  diaR!="23" &&  diaR!="24" &&  diaR!="25" &&  diaR!="26" &&  diaR!="27" &&  diaR!="28" &&  diaR!="29" &&  diaR!="30" &&  diaR!="31"){
			mens += 'Chequear el día de nacimiento del RA\n';
			$("#zonaCimientos").attr("disabled","disabled");
			$("#cualBeca").attr("disabled","disabled");
			$("#cuil").attr("disabled","disabled");
			$("#respoBanco").attr("disabled","disabled");
			$("#nroCuentaRespo").attr("disabled","disabled");
			flag = true;
		}	
		//if (parseInt(mesR)<1 || parseInt(mesR)>12){		
		if (mesR!="01" && mesR!="02" &&  mesR!="03" && mesR!="04" && mesR!="05" && mesR!="06" && mesR!="07" && mesR!="08" && mesR!="09" && mesR!="10" && mesR!="11" && mesR!="12" ){
			mens += 'Chequear el mes de nacimiento del RA\n';
			$("#zonaCimientos").attr("disabled","disabled");
			$("#cualBeca").attr("disabled","disabled");
			$("#cuil").attr("disabled","disabled");
			$("#respoBanco").attr("disabled","disabled");
			$("#nroCuentaRespo").attr("disabled","disabled");
			flag = true;
		}
		
	}
	// verifica que tiene que haber un familiar para finalizar	
	var ficha=$("#contadorFicha").val();
	
	if ( document.getElementById( "nombreFichas" ) ) {
		
		//alert("existe");
		
		document.getElementById("deNombreFF").value=document.getElementById("nombreFichas").value;
	
	}else{
	
		//alert("No existe");
		//mens += 'El cuadro familiar es obligatorio, al menos debe existir 1 familiar cargado como conviviente. \n';
		$("#zonaCimientos").attr("disabled","disabled");
		$("#cualBeca").attr("disabled","disabled");
		$("#cuil").attr("disabled","disabled");
		$("#respoBanco").attr("disabled","disabled");
		$("#nroCuentaRespo").attr("disabled","disabled");
		flag = true;
	}
	
	
	
	
	if (ficha==0 || document.getElementById("deNombreFF").value==""){
		mens += 'El cuadro familiar es obligatorio, al menos debe existir un familiar cargado con nombre como conviviente. \n';
		$("#zonaCimientos").attr("disabled","disabled");
		$("#cualBeca").attr("disabled","disabled");
		$("#cuil").attr("disabled","disabled");
		$("#respoBanco").attr("disabled","disabled");
		$("#nroCuentaRespo").attr("disabled","disabled");
		flag = true;	
	}	
	
	if (document.getElementById("alumnoTelefono").value.length<10) {
		mens += 'El campo teléfono del becado no puede tener menos de 10 caracteres (recordá anteponer el código de área). \n';
		flag = true;
  }
	
	if (document.getElementById("telefono1").value.length<10) {
		if (document.getElementById("telefono1").value.length==0) {
		}else{
			mens += 'El campo teléfono 1 del becado no puede tener menos de 10 caracteres (recordá anteponer el código de área). \n';
			flag = true;		
		}
		
  }
	if (document.getElementById("telefono2").value.length<10) {
		if (document.getElementById("telefono2").value.length==0) {
		}else{
			mens += 'El campo teléfono 2 del becado no puede tener menos de 10 caracteres (recordá anteponer el código de área). \n';
			flag = true;		
		}
		
  }
	
	if (document.getElementById("responsableTelefono1").value.length<10) {
		if (document.getElementById("responsableTelefono2").value.length==0) {
		}else{
			mens += 'El campo teléfono 1 del RA no puede tener menos de 10 caracteres (recordá anteponer el código de área). \n';
			flag = true;
		}
	}
	
	
	if (document.getElementById("responsableTelefono2").value.length<10) {
		if (document.getElementById("responsableTelefono2").value.length==0) {
		}else{
			mens += 'El campo teléfono 2 del RA no puede tener menos de 10 caracteres (recordá anteponer el código de área). \n';
			flag = true;		
		}
		
  }
	
	if (document.getElementById("responsableNacionalidad").value.length==1) {		
		mens += 'El campo País del RA es obligatorio. \n';
		flag = true;		
  }
	
	
	if (document.getElementById("alumnoSexoM").checked==false && document.getElementById("alumnoSexoF").checked==false) {		
		mens += 'El campo sexo del alumno es obligatorio. \n';
		flag = true;		
  }
	
	 var today = new Date();
	    var fe = new Date($("#fechaEntrevista").datepicker("getDate"));    
	    if (fe>today || document.getElementById("fechaEntrevista").value.length!=10){
	    	mens +="La fecha de la entrevista es obligatoria y debe ser menor o igual a la fecha actual.";
	    	flag = true;
	    }
	
	
		
	if(flag){
		$("#zonaCimientos").attr("disabled","disabled");
		$("#cualBeca").attr("disabled","disabled");
		$("#cuil").attr("disabled","disabled");
		$("#respoBanco").attr("disabled","disabled");
		$("#nroCuentaRespo").attr("disabled","disabled");
		jAlert('warning', mens, 'Advertencia');
	}
	return flag;
	
	 
	
}

function chequearLongitudRA(obj){
	if (obj.value.length > 1000) {
	obj.value = obj.value.substring(0, 1000);
	}
}

function chequearLongitud(obj){
	if (obj.value.length > 10000) {
	obj.value = obj.value.substring(0, 10000);
	}
}	

function chequearLongitudTel(obj){
	if (obj.value.length < 10) {
	//obj.value = obj.value.substring(0, 1000);
	alert("El campo teléfono tiene que tener mínimo 10 caracteres");
	}
}

function justNumbers(e) {
	var keynum = window.event ? window.event.keyCode : e.which;
	if ( keynum == 8 ) return true;
	return /\d/.test(String.fromCharCode(keynum));
}
	
//DMS agrego scripts de include datosEscolaresAlumno 

function enableDisableAbondono(value){
	if(value == "true"){
		$('#idAnioAbandono').removeAttr('disabled');
		$('#idAnioAbandono').addClass('required');
		$('#motivoAbandono').removeAttr('disabled');
	}else{
		$('#idAnioAbandono').attr('disabled','disabled');
		$('#idAnioAbandono').removeClass('required');
		$('#motivoAbandono').attr('disabled','disabled');
		$('#motivoAbandono').val('');
	}
}

function enableDisableInput(value){
	if(value == "true"){
		$('#idAnioRepitio').removeAttr('disabled');
		$('#idAnioRepitio').addClass('required');
		$('#motivoRepitencia').removeAttr('disabled');
		
	}else{
		$('#idAnioRepitio').attr('disabled','disabled');
		$('#idAnioRepitio').removeClass('required');
		$('#motivoRepitencia').attr('disabled','disabled');
		$('#motivoRepitencia').val('');
	}
}

//DMS afreo script de include  datosPersonalesAlumno


$(function() {
	$("#tablaDatosPersonales :text").css("width","95px");
	
});

function habilitarBeca(estado){
	if(estado == 'si'){
		$("#cualBeca").removeAttr("disabled");
	}else{
		$("#cualBeca").attr("disabled","disabled");
	}
	
}

function habilitarMotivo(select){
	//funciona si la opcion "Otro" es la ultima del combo
	if(select.selectedIndex == select.length -1){
		$("#otroMotivoRechazo").removeAttr("disabled");
	}else{
		$("#otroMotivoRechazo").val("");
		$("#otroMotivoRechazo").attr("disabled","disabled");
	}
	
}


//DMS scripts del include asistenciaClase


function enableDisableInasistencia() {
		if ($("#cantidadInasistenciaAnioPasado").val() != 0) {
			$("#motivosInasistenciaAnioPasado").removeAttr("disabled");
		} else {
			$("#motivosInasistenciaAnioPasado").attr("disabled", "disabled");
			$("#motivosInasistenciaAnioPasado").val("")
		}
		if ($("#cantidadInasistenciaAnioCurso").val() != 0) {
			$("#motivosInasistenciaAnioCurso").removeAttr("disabled");
		} else {
			$("#motivosInasistenciaAnioCurso").attr("disabled", "disabled");
			$("#motivosInasistenciaAnioCurso").val("")
		}
	}


$(function() {

	$("#tablaDatosResponsable2 :text").css("width","90px");
	$("#tablaGeneralesResponsable2 :text").css("width","90px");

});
	

	var digito;
	function generarCuil2(valueRadio){
		var cuil;//Esto se tieenq que cargar con el cuil generado
		var xy;
		value = $('#dniResponsable2').val();
		
		if(valueRadio == "true"){ //Masculino			
			cuil = value;
			xy = 20;
			cuil = calcular( xy, cuil);
		}else{
			if(valueRadio == "false")
			{
											//fememino
				cuil = value;
				xy = 27;
				cuil = calcular( xy, cuil );
			}
		}
		
		if(isNaN( digito ) ){
			$('#cuil2').val(" ");
		}
		else{
			$('#cuil2').val(cuil);
		}
					
	}
	













</script>

 

 




</head>


<body>
	<div class="container mt-3">  
  		<div class="mt-4 p-5 bg-primary text-white rounded">
    		<h1>Cuestionario EP</h1>     		     	
  		</div>		
	</div>
<br>


<div class="container">
	
	
		<div class="row align-items-start">
    		<div class="col">
      			
      			<div class="form-floating">
				  <input type="text" class="form-control" >
				  <label for="fechaEntrevista">Entrevistador</label>
			</div>	
    		</div>
    		<br>
      		
    		
    	
    	</div>	
    	<br>
    	
    	<div class="row align-items-start">    		
    			<div class="col">
    			<div class="form-floating">
    				<input type="text" class="form-select"  aria-label="Floating label select example" id="convocatoria" name="convocatoria">
					    
  					<label for="floatingSelect">Convocatoria</label>
				</div>	
    		</div>		
  		</div>
  		
  		<br>
  		<div class="row align-items-start">    		
    			<div class="col">
    			<div class="form-floating">
    				<input type="text" name="fechaEntrevista" id="fechaEntrevista" class="form-control" value="<fmt:formatDate value="${entrevistaSeleccionDTO.entrevistaSeleccion.fechaEntrevista}" pattern="dd/MM/yyyy"/>" >
  					<label >Fecha entrevista</label>
				</div>	
    		</div>		
  		</div>
  		<br>
  		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Datos Personales</h3></div>
  		</div>
  		<br>
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.apellido}" >
				  <label >Apellido</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nombre}"  >
				  <label >Nombre</label>
				</div>
    		</div>
    	</div>
		<br>
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="number" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}" >
				  <label>DNI</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
      			
				  <input type="text" name="fechaNacimientoCandidato" id="fechaNacimiento"  onChange="calcular_edad(this.value)" class="form-control" value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>" >
				  <label for="fechaNacimientoEP">Fecha de Nacimiento</label>
				</div>
    		</div>
    	</div>
		
		<br>
  		
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				
				<select class="required form-control">
					<c:choose>
						<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo == true}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value=true selected="selected">Masculino</option>
							<option value=false>Femenino</option>
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo == false}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value=false selected="selected">Femenino</option>
							<option value=true>Masculino</option>
					    </c:when>
					</c:choose>
				</select>
				<label >Género</label>
				
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
								 <select name="alumnoNacionalidad" id="alumnoNacionalidad" class="required form-control"  onchange="habilitarInputEstadoAlumno(this.value)">
												<c:choose>
							    					<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Argentina'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" selected="selected">Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Bolivia'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina">Argentina</option>
														<option value="Bolivia"  selected="selected">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Brasil'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil" selected="selected">Brasil</option>							
														<option value="Chile">Chile</option>							
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Chile'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile" selected="selected">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Colombia'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia" selected="selected">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Ecuador'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador" selected="selected">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Paraguay'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay" selected="selected">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Perú'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú" selected="selected">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Uruguay'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay" selected="selected">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Venezuela'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela" selected="selected">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Cuba'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba" selected="selected" >Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:otherwise>
													 	<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>
												    </c:otherwise>
												</c:choose>
											</select>
											<label >País</label>
				</div>
    		</div> 
    	</div>
		
		<br>
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Datos Escolares</h3></div>
  		</div>

		<br>
		
	
		<br>
		
		
	
		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					<select  class="required form-control" >
						<option value="">Seleccione una opci&oacute;n:</option>
							<c:forEach items="${listAnioEscolar}" var="anioEscolar">							
								<c:choose>										
									<c:when test="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.id == anioEscolar.id}">
										<option  value="${anioEscolar.id}" selected="selected">${anioEscolar.valor}</option>
									</c:when>													
									<c:otherwise>																																			
										<c:choose>
											<c:when test="${anioEscolar.id == 15}">
												<option value="${anioEscolar.id}" disabled="disabled">${anioEscolar.valor} </option>
											</c:when>
												<c:otherwise>											
													<option value="${anioEscolar.id}">${anioEscolar.valor} </option>																				
												</c:otherwise>	
										</c:choose>								
										</c:otherwise>
									</c:choose>	
							</c:forEach>
						</select>
				
				<label for="floatingSelect">Año Escolar</label>
				</div>
    		</div>
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.division }">				  
				  <label >División</label>
				</div>
    		</div>
    		 
    		
    	</div>
	
		<br>
		
		
		
		
	
		
		
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				
				<select name="turno" id="turno" class="form-select" >
					<option value="">Seleccione una opci&oacute;n:</option>
						<c:forEach items="${listTurno}" var="turno">
							<c:choose>
								<c:when test="${entrevistaSeleccionDTO.perfilAlumno.turno.id == turno.id}">
									<option value="${turno.id}" selected="selected">${turno.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${turno.id}">${turno.valor}</option>
								</c:otherwise>	
							</c:choose>
						</c:forEach>
					</select>
				
				<label >Turno</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
	      			<select  class="required form-control"  >
						<c:choose>
							<c:when test="${true}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value=true selected="selected">Sí</option>
								<option value=false>No</option>
						    </c:when>
						    <c:when test="${false}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value=false selected="selected">No</option>
								<option value=true>Sí</option>
						    </c:when>
						    <c:otherwise>
								<option value=false>No</option>
								<option value=true>Sí</option>
						    </c:otherwise>
						</c:choose>
					</select>
					<label >Es escuela técnica?</label>
				</div>
    		</div>
    		 
    		
    	</div>
		 
		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
      			
      			<select  class="required form-control"  >
					<c:choose>
						<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Sí" selected="selected">Sí</option>
							<option value="No">No</option>
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca== false}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="No" selected="selected">No</option>
							<option value="Sí">Sí</option>
					    </c:when>
					    <c:otherwise>
							<option value="No">No</option>
							<option value="Sí">Sí</option>
					    </c:otherwise>
					</c:choose>
				</select>
				<label >Recibe otra beca</label>
      			
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.cualBeca}">				  
				  <label >Cual?</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>
    	
    	<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Recursos tecnológicos. Acceso a la información.</h3></div>
  		</div>
  		
  		<br>
  		
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
      			
      			
	      			<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.accesoCelular=='Si, tiene celular de uso propio'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="Si, tiene celular de uso propio" selected="selected">Si, tiene celular de uso propio</option>
								<option value="Si, comparte celular con otros integrantes del hogar">Si, comparte celular con otros integrantes del hogar</option>
						   		<option value="No, no tiene acceso a un celular en el hogar">No, no tiene acceso a un celular en el hogar</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.accesoCelular=='Si, comparte celular con otros integrantes del hogar'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="Si, tiene celular de uso propio" >Si, tiene celular de uso propio</option>
								<option value="Si, comparte celular con otros integrantes del hogar"selected="selected">Si, comparte celular con otros integrantes del hogar</option>
						   		<option value="No, no tiene acceso a un celular en el hogar">No, no tiene acceso a un celular en el hogar</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.accesoCelular=='No, no tiene acceso a un celular en el hogar'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="Si, tiene celular de uso propio" >Si, tiene celular de uso propio</option>
								<option value="Si, comparte celular con otros integrantes del hogar">Si, comparte celular con otros integrantes del hogar</option>
						   		<option value="No, no tiene acceso a un celular en el hogar"selected="selected">No, no tiene acceso a un celular en el hogar</option>
						    </c:when>
						    <c:otherwise>
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="Si, tiene celular de uso propio" >Si, tiene celular de uso propio</option>
								<option value="Si, comparte celular con otros integrantes del hogar">Si, comparte celular con otros integrantes del hogar</option>
						   		<option value="No, no tiene acceso a un celular en el hogar">No, no tiene acceso a un celular en el hogar</option>
						    </c:otherwise>
						</c:choose>
					</select>
				<label >¿Tenés acceso a un celular en tu hogar?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="number" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.celularEp}">				  
				 <label >Número de celular EP (Característica + número)</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>
	
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
      			<select  class="required form-control"  >
					<c:choose>
						<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.computadora=='Sí'}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Sí" selected="selected">Sí</option>
							<option value="No">No</option>
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.computadora=='No'}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="No" selected="selected">No</option>
							<option value="Sí">Sí</option>
					    </c:when>
					    <c:otherwise>
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="No" >No</option>
							<option value="Sí">Sí</option>
						</c:otherwise>
					</c:choose>
				</select>
				<label >¿Tenés computadora en tu hogar?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 	<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.conexion=='No'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="No" selected="selected">No</option>
								<option value="Si, conexión WiFi">Si, conexión WiFi</option>
								<option value="Si, celular con plan (Gigas)">Si, celular con plan (Gigas)</option>	
								<option value="Si, celular prepago (recarga con tarjeta)">Si, celular prepago (recarga con tarjeta)</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.conexion=='Si, conexión WiFi'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="No" >No</option>
								<option value="Si, conexión WiFi"selected="selected">Si, conexión WiFi</option>
								<option value="Si, celular con plan (Gigas)">Si, celular con plan (Gigas)</option>	
								<option value="Si, celular prepago (recarga con tarjeta)">Si, celular prepago (recarga con tarjeta)</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.conexion=='Si, celular con plan (Gigas)'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="No" >No</option>
								<option value="Si, conexión WiFi">Si, conexión WiFi</option>
								<option value="Si, celular con plan (Gigas)"selected="selected">Si, celular con plan (Gigas)</option>	
								<option value="Si, celular prepago (recarga con tarjeta)">Si, celular prepago (recarga con tarjeta)</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.conexion=='Si, celular prepago (recarga con tarjeta)'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="No" >No</option>
								<option value="Si, conexión WiFi">Si, conexión WiFi</option>
								<option value="Si, celular con plan (Gigas)">Si, celular con plan (Gigas)</option>	
								<option value="Si, celular prepago (recarga con tarjeta)"selected="selected">Si, celular prepago (recarga con tarjeta)</option>
						    </c:when>
						    <c:otherwise>
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="No" >No</option>
								<option value="Si, conexión WiFi">Si, conexión WiFi</option>
								<option value="Si, celular con plan (Gigas)">Si, celular con plan (Gigas)</option>	
								<option value="Si, celular prepago (recarga con tarjeta)">Si, celular prepago (recarga con tarjeta)</option>
							</c:otherwise>
						</c:choose>
					</select>
				 
					<label >¿Tenés conexión a internet en tu hogar? ¿qué tipo de conexión?</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.usoCelular}">				  
				 <label for="celularEP">En caso de que tenga celular propio y/o computadora, ¿qué uso le das?</label>
				</div>
    		</div>
    	</div>
	
		<br>
    	
    	<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Hábitos de estudio. Contexto familiar y social.</h3></div>
  		</div>
  		
  		<br>
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.conQuienVivis}">				  
				  <label >¿Con quién vivís? ¿Cómo está compuesta tu familia?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <textarea value="${entrevistaSeleccionDTO.entrevistaSeleccion.rutinaDiaria }" class="form-control"  style="height: 100px"></textarea>
 				  <label >¿Cómo es tu rutina diaria?</label>
				</div>
    		</div>
    	</div>
   
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">      						  
				  <label for="celularEP">¿Le mostrás a alguien las carpetas, pruebas, notas?</label>
				  <br>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaMama}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Mamá</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaPapa}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Papá</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaHno}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Hermano/a</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaNadie}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Nadie</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaOtros}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Otros</label>
				</div>
			</div>
    	</div>
    	 	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.comoTeLlevas}">				  
				  <label for="celularEP">¿Cómo te llevas con tus compañeros/as? ¿Tenés amigos/as en el curso?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	  	
    	<div class="row align-items-start">
    		<div class="col">      						  
				  <label for="celularEP">¿Tenés alguna de estas responsabilidades en tu familia?</label>
				  <br>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.ayudaTareas}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Ayudas en las tareas generales de la casa</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.cuidaHnos}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Cuidas hermanos/as, hijos/as, sobrinos/as menores</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.cuidaOtros}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Cuidas otros familiares adultos</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.noCuida}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1"> No, ninguna</label>
				</div>
			</div>
    	</div>
    	
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 	<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.faltasCuidado=='Sí'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="Sí" selected="selected">Sí</option>
								<option value="No">No</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.faltasCuidado=='No'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="No" selected="selected">No</option>
								<option value="Sí">Sí</option>
						    </c:when>
						    <c:otherwise>
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="No" >No</option>
								<option value="Sí">Sí</option>
							</c:otherwise>
						</c:choose>
					</select>
				 
				<label >En caso afirmativo, ¿Tenés faltas a la escuela o dificultades para cumplir con las actividades escolares por trabajar o por las responsabilidades dentro de tu familia?</label>
				</div>
    		</div>
		</div>

		
    	<br>
    	
 		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.trabajas=='Sí'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="Sí" selected="selected">Sí</option>
								<option value="No">No</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.trabajas=='No'}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="No" selected="selected">No</option>
								<option value="Sí">Sí</option>
						    </c:when>
						    <c:otherwise>
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value="No" >No</option>
								<option value="Sí">Sí</option>
							</c:otherwise>
						</c:choose>
					</select>
				<label >¿Trabajás?</label>
				</div>
    		</div>
		</div>
		
		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.deQueTrabajas}">				  
				  <label>¿En caso afirmativo, ¿De qué trabajás?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
		
		

		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Trayectoria escolar.</h3></div>
  		</div>
  		
  		<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.comoTerminaste=='Promovido con materias a rendir'}">
								<option value="Promovido con materias a rendir" selected="selected">Promovido con materias a rendir</option>
								  <option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
								  <option value="Repitió">Repitió</option>				  			  				  
								  <option value="Promoción pendiente">Promoción pendiente</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.trabajas=='Promovido sin adeudar materias'}">
								<option value="Promovido con materias a rendir" >Promovido con materias a rendir</option>
								  <option value="Promovido sin adeudar materias"selected="selected">Promovido sin adeudar materias</option>
								  <option value="Repitió">Repitió</option>				  			  				  
								  <option value="Promoción pendiente">Promoción pendiente</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.trabajas=='Repitió'}">
								<option value="Promovido con materias a rendir" >Promovido con materias a rendir</option>
								  <option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
								  <option value="Repitió"selected="selected">Repitió</option>				  			  				  
								  <option value="Promoción pendiente">Promoción pendiente</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.trabajas=='Promoción pendiente'}">
								<option value="Promovido con materias a rendir" >Promovido con materias a rendir</option>
								  <option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
								  <option value="Repitió">Repitió</option>				  			  				  
								  <option value="Promoción pendiente"selected="selected">Promoción pendiente</option>
						    </c:when>
						    <c:otherwise>
								<option value="Selecione una opción"selected="selected" >Selecione una opción</option>
								<option value="Promovido con materias a rendir" >Promovido con materias a rendir</option>
								  <option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
								  <option value="Repitió">Repitió</option>				  			  				  
								  <option value="Promoción pendiente">Promoción pendiente</option>
							</c:otherwise>
						</c:choose>
					</select>					
					<label >¿Cómo terminaste la escuela el año pasado?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating"  value="${entrevistaSeleccionDTO.entrevistaSeleccion.materiasAdeuda}">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.materiasAdeuda}">				  
				  <label >En caso de adeudar materias, ¿Cuáles son?</label>
				</div>
				
    		</div>
    		     		
    	</div>
    	
    	<br>

		<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.desempenioEscolar=='Excelente'}">
								<option value="0">Seleccioná una opción</option>
								<option value="Excelente" selected="selected">Excelente</option>
					 		    <option value="Muy bueno">Muy bueno</option>
							    <option value="Bueno">Bueno</option>				  			  				  
							    <option value="Regular">Regular</option>
							    <option value="Malo">Malo</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.desempenioEscolar=='Muy bueno'}">
								<option value="0">Seleccioná una opción</option>
								<option value="Excelente" >Excelente</option>
					 		    <option value="Muy bueno"selected="selected">Muy bueno</option>
							    <option value="Bueno">Bueno</option>				  			  				  
							    <option value="Regular">Regular</option>
							    <option value="Malo">Malo</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.desempenioEscolar=='Bueno'}">
								<option value="0">Seleccioná una opción</option>
								<option value="Excelente" >Excelente</option>
					 		    <option value="Muy bueno">Muy bueno</option>
							    <option value="Bueno"selected="selected">Bueno</option>				  			  				  
							    <option value="Regular">Regular</option>
							    <option value="Malo">Malo</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.desempenioEscolar=='Regular'}">
								<option value="0">Seleccioná una opción</option>
								<option value="Excelente" >Excelente</option>
					 		    <option value="Muy bueno">Muy bueno</option>
							    <option value="Bueno">Bueno</option>				  			  				  
							    <option value="Regular"selected="selected">Regular</option>
							    <option value="Malo">Malo</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.desempenioEscolar=='Malo'}">
								<option value="0">Seleccioná una opción</option>
								<option value="Excelente" >Excelente</option>
					 		    <option value="Muy bueno">Muy bueno</option>
							    <option value="Bueno">Bueno</option>				  			  				  
							    <option value="Regular">Regular</option>
							    <option value="Malo"selected="selected">Malo</option>
						    </c:when>
						    
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
								<option value="Excelente" >Excelente</option>
					 		    <option value="Muy bueno">Muy bueno</option>
							    <option value="Bueno">Bueno</option>				  			  				  
							    <option value="Regular">Regular</option>
							    <option value="Malo">Malo</option>
							</c:otherwise>
						</c:choose>
					</select>	
				 
				 
				<label for="floatingSelect">¿Cómo crees que fue tu desempeño escolar el año pasado?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.desempenioPorque }">				  
				  <label for="celularEP">¿Por qué?</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="number" class="form-control"  value="${entrevistaSeleccionDTO.entrevistaSeleccion.inasistenciasPasado }">				  
				  <label for="celularEP">¿Cuántas inasistencias tuviste el año pasado?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control"  value="${entrevistaSeleccionDTO.entrevistaSeleccion.motivoInasistenciasPasado }">				  
				  <label>Motivo de las inasistencias</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control"  value="${entrevistaSeleccionDTO.entrevistaSeleccion.inasistenciasActual }">				  
				  <label >¿Cuántas inasistencias tenés este año en curso?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control"  value="${entrevistaSeleccionDTO.entrevistaSeleccion.motivoInasistenciasActual }">				  
				  <label >Motivo de las inasistencias</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
      				<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste2=='1'}">
								<option value="0">Seleccioná una opción</option>
			 				    <option value="1"selected="selected">Si, en primaria</option>
							    <option value="2">Si, en secundaria</option>
							    <option value="3">Si, en primaria y secundaria</option>				  			  				  
							    <option value="4">Nunca</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste2=='2'}">
								<option value="0">Seleccioná una opción</option>
			 				    <option value="1">Si, en primaria</option>
							    <option value="2"selected="selected">Si, en secundaria</option>
							    <option value="3">Si, en primaria y secundaria</option>				  			  				  
							    <option value="4">Nunca</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste2=='3'}">
								<option value="0">Seleccioná una opción</option>
			 				    <option value="1">Si, en primaria</option>
							    <option value="2">Si, en secundaria</option>
							    <option value="3"selected="selected">Si, en primaria y secundaria</option>				  			  				  
							    <option value="4">Nunca</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste2=='4'}">
								<option value="0">Seleccioná una opción</option>
			 				    <option value="1">Si, en primaria</option>
							    <option value="2">Si, en secundaria</option>
							    <option value="3">Si, en primaria y secundaria</option>				  			  				  
							    <option value="4"selected="selected">Nunca</option>
						    </c:when>
						    
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
			 				    <option value="1">Si, en primaria</option>
							    <option value="2">Si, en secundaria</option>
							    <option value="3">Si, en primaria y secundaria</option>				  			  				  
							    <option value="4">Nunca</option>
							</c:otherwise>
						</c:choose>
					</select>
				
					<label for="floatingSelect">¿Repetiste alguna vez?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueRepatiste}">				  
				  <label >En caso afirmativo, ¿Por qué crees que repetiste?</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>
		

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 			 
				 	<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono2=='Si, en primaria'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Si, en primaria"selected="selected">Si, en primaria</option>
							    <option value="Si, en secundaria">Si, en secundaria</option>
							    <option value="Si, en primaria y secundaria">Si, en primaria y secundaria</option>				  			  				  
							    <option value="Nunca">Nunca</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono2=='Si, en secundaria'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Si, en primaria">Si, en primaria</option>
							    <option value="Si, en secundaria"selected="selected">Si, en secundaria</option>
							    <option value="Si, en primaria y secundaria">Si, en primaria y secundaria</option>				  			  				  
							    <option value="Nunca">Nunca</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono2=='Si, en primaria y secundaria'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Si, en primaria">Si, en primaria</option>
							    <option value="Si, en secundaria">Si, en secundaria</option>
							    <option value="Si, en primaria y secundaria"selected="selected">Si, en primaria y secundaria</option>				  			  				  
							    <option value="Nunca">Nunca</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono2=='Nunca'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Si, en primaria">Si, en primaria</option>
							    <option value="Si, en secundaria">Si, en secundaria</option>
							    <option value="Si, en primaria y secundaria">Si, en primaria y secundaria</option>				  			  				  
							    <option value="Nunca"selected="selected">Nunca</option>
						    </c:when>
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
			 				    <option value="Si, en primaria">Si, en primaria</option>
							    <option value="Si, en secundaria">Si, en secundaria</option>
							    <option value="Si, en primaria y secundaria">Si, en primaria y secundaria</option>				  			  				  
							    <option value="Nunca">Nunca</option>
							</c:otherwise>
						</c:choose>
					</select>
				 			  
				<label for="floatingSelect">¿Abandonaste la escuela alguna vez?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueAbandono}" >				  
				  <label >En caso afirmativo, ¿Cuál fue el motivo?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				<select  class="required form-control"  >
					<c:choose>
						<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.sanciones=='Sí'}">
							<option value="0">Seleccioná una opción</option>
						    <option value="Sí"selected="selected">Sí</option>
						    <option value="No">No</option>
					    </c:when>
						<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.sanciones=='No'}">
							<option value="0">Seleccioná una opción</option>
						    <option value="Sí">Sí</option>
						    <option value="No"selected="selected">No</option>
					    </c:when>
					    <c:otherwise>
							<option value="0"selected="selected">Seleccioná una opción</option>
						    <option value="Sí">Sí</option>
						    <option value="No">No</option>
						</c:otherwise>
					</c:choose>
				</select>
				<label for="floatingSelect">¿Tuviste alguna vez problemas de conducta, llamadas de atención o sancniones?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueSanciones}">				  
				  <label for="celularEP">En caso afirmativo, ¿Cuál fue el motivo?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		
		<div class="row align-items-start">
			<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control"value="${entrevistaSeleccionDTO.entrevistaSeleccion.elegiste}" >				  
				  <label>¿Por qué elegiste este colegio secundario?</label>
				</div>
    		</div>
		</div>
		
		<br>
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Proyección a futuro</h3></div>
  		</div>

		<br>
		

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.importanteTerminar=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.importanteTerminar=='No'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No"selected="selected">No</option>
						    </c:when>
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No">No</option>
							</c:otherwise>
						</c:choose>
					</select>
				<label for="floatingSelect">¿Te parece importante terminar el secundario?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueImportante}">				  
				  <label >¿Por qué?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		
		<div class="row align-items-start">
			<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.gustaria}">				  
				  <label >¿Qué te gustaría hacer cuando termines la secundaria?</label>
				</div>
    		</div>
		</div>
		
		<br>
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Interés y participación en el programa</h3></div>
  		</div>

		<br>
		
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 	<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.participarReuniones=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.participarReuniones=='No'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No"selected="selected">No</option>
						    </c:when>
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No">No</option>
							</c:otherwise>
						</c:choose>
					</select>
				 
				<label for="floatingSelect">¿Estás dispuesto/a a participar de las reuniones con la tutora o tutor de Cimientos todos los meses?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueReuniones}">				  
				  <label >¿Por qué?En caso de respuesta negativa ¿por qué?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.participarPrograma=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.participarPrograma=='No'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No"selected="selected">No</option>
						    </c:when>
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No">No</option>
							</c:otherwise>
						</c:choose>
					</select>
				<label for="floatingSelect">¿Crees que te puede servir participar del programa y obtener la beca?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porquePrograma}">				  
				  <label for="celularEP">En caso de respuesta afirmativa ¿para qué crees que te puede servir?</label>
				</div>
    		</div>
    		     		
    	</div>
		
		<br>
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Evaluación del entrevistador/a</h3></div>
  		</div>

		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.informacionComplemetariaEp}">				  
				  <label for="celularEP">Información complementaria y percepciones</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
		
		<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.aportePfe}">				  
				  <label >¿Qué le puede aportar PFE al EP?</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					 <select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.cognitivaEp=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.cognitivaEp=='No'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No"selected="selected">No</option>
						    </c:when>
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No">No</option>
							</c:otherwise>
						</c:choose>
					</select>
				<label for="floatingSelect">¿Se detectó alguna dificultad cognitiva o problema de aprendizaje?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>	

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  	<select  class="required form-control"  >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.riesgoEscolarEp=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.riesgoEscolarEp=='No'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No"selected="selected">No</option>
						    </c:when>
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No">No</option>
							</c:otherwise>
						</c:choose>
					</select>
				<label for="floatingSelect">¿Se detectó alguna situación de riesgo extra-escolar?</label>
				</div>
    		</div>
    	</div>


		<br>
		
		<div class="row align-items-start">
			<div class="col">      						  
				  <label for="celularEP">En caso de respuesta positiva marcar aquellas situaciones de riesgo que se detectaron</label>
				  <br>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.fallecimientoEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Fallecimiento de una persona significativa</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.enfermedadEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" > Enfermedad propia o de una persona significativa</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.maternidadEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Maternidad/Paternidad del EP</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.mudanzaEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Mudanza</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.cambioEstructuraEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Cambio de estructura familiar/convivientes</label>
				</div>
				<div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.economicaEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Situación de crisis económica en la familia</label>
				</div><div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.violenciaEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Situación de violencia familiar</label>
				</div><div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.consumoEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Consumo problemático</label>
				</div><div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.violenciaEscolarEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Situación de violencia escolar</label>
				</div><div class="form-check">
					<input type="checkbox" 	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otraSituacionEp}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Otra</label>
				</div>
			</div>
		</div>

		<br>
		
		<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.cualOtraSituacionEp}">				  
				  <label >¿Cuál?</label>
				</div>
    		</div>
    		     		
    	</div>


		
	
</div>

























<!-- ####################################################################################################### -->

<!-- ####################################################################################################### -->

<!-- ####################################################################################################### -->















 
	<div class="container mt-3">  
  	<div class="mt-4 p-5 bg-warning text-white rounded">
    	<h1>Cuestionario RA</h1>  
    	
  </div>
</div>
<br>



<div class="container">
	
	
	
    	<br>
  		
  		
  		
  		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Datos Personales</h3></div>
  		</div>
  		<br>
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.apellido}">
				  <label >Apellido</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nombre}">
				  <label >Nombre</label>
				</div>
    		</div>
    	</div>
		<br>
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="number" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.dni}">
				  <label >DNI</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
      			
				  <input type="text" name="perfilAlumno.responsable1.fechaNacimiento" id="fechaNacimientoRes"class="form-control" value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.fechaNacimiento}" pattern="dd/MM/yyyy"/>">
				  <label >Fecha de Nacimiento</label>
				</div>
    		</div>
    	</div>
		
		<br>
  		
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input  type="text"   class="form-control" 
					<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}" >value="Masculino" </c:if>
					<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo== false}" >value="Femenino" </c:if> > 
					<label >Género</label>
				</div>
			
				
				
				<br>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad}" >
				  <label for="floatingSelect">País</label>
				</div>
			</div>
		
			
    		 
    	</div>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.cuilCuit}">
				  <label >Ingresá el nro de CUIL</label>
				</div>
			</div>
			<div class="col"></div>
		</div>
		
		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono1 }">
				  <label >Número celular RA (Característica + número)</label>
				</div>
			</div>
    		
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono2 }" >
				  <label >Teléfono alternativo</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
					<input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idVinculo.valor }" >
				 	<label for="floatingSelect">Vínculo con el/la estudiante</label>
				
				</div>
    		</div> 
    	</div>
    	
    	<br>
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Domicilio</h3></div>
  		</div>

		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.calle }">				  
				  <label >Calle</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nroCalle }">				  
				  <label >Número</label>
				</div>
    		</div>
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.piso }" >				  
				  <label >Piso</label>
				</div>
    		</div> 
    	</div>
    		
    	<br>
		
		<div class="row align-items-start">
    		
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" >				  
				  <label >Barrio</label>
				</div>
    		</div>
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control"value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idLocalidad.nombre }">				  
				  <label >Localidad</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.codigoPostal }">				  
				  <label>Código Postal</label>
				</div>
    		</div>
    	</div>
	
		<br>


		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Datos personales RA titular de la cuenta bancaria</h3></div>
  		</div>
  		<br>
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.apellido}" >
				  <label >Apellido</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nombre}">
				  <label >Nombre</label>
				</div>
    		</div>
    	</div>
		<br>
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="number" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.dni}" >
				  <label >DNI</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
      			
				  <input type="text" name="perfilAlumno.responsable2.fechaNacimiento" id="fechaNacimientoRes2" class="form-control"value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.fechaNacimiento}" pattern="dd/MM/yyyy"/>">
				  <label >Fecha de Nacimiento</label>
				</div>
    		</div>
    	</div>
		
		<br>
  		
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input  type="text"   class="form-control" 
					<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.sexo}" >value="Masculino" </c:if>
					<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.sexo== false}" >value="Femenino" </c:if> > 
					<label >Género</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				 	 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad}">
				  <label >País</label>
				
				</div>
    		</div> 
    	</div>
		
		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.telefono1 }">
				  <label >Número celular RA2 (Característica + número)</label>
				</div>
				</div>
    		    		
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.idVinculo.valor }">
				  <label >Vínculo con el/la estudiante</label>
				
				</div>
    		</div> 
    	</div>
		
		<br>
		<div class="row align-items-start">
    		<div class="col">
      			
					
			</div>
			<div class="col">
			<div class="form-floating">
				<input type="text" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.cuilCuit }">
				<label > CUIL</label>		
			</div>
		</div>
		</div>	
		
	    	
    	<br>
    	
    	<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Participación del RA en la escolaridad del candidato. Proyección a futuro</h3></div>
  		</div>
  		
  		<br>
  		
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control">				  
				  <label >¿Qué dirías de tu hijo/a o familiar como estudiante? ¿Cómo le va en la escuela?</label>
				</div>
				Descripción: indagar si el RA conoce el rendimiento escolar del candidato/a
    		</div>
    	</div>	
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">      						  
				  <label >¿De qué manera te enterás cómo le va en la escuela?</label>
				  <br>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" >
  					<label class="form-check-label" >Voy regularmente a la escuela y charlo con el personal</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" >
  					<label class="form-check-label">Le pregunto a mi hijo/a</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" >
  					<label class="form-check-label" >A través del cuaderno de comunicaciones</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="">
  					<label class="form-check-label" >Asisto a las reuniones de padres</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" >
  					<label class="form-check-label">Miro sus carpetas</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" >
  					<label class="form-check-label" >Él/ella me cuenta</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" >
  					<label class="form-check-label" >No sabe cómo le va en la escuela</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" >
  					<label class="form-check-label" >Grupo de WhatsApp</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" >
  					<label class="form-check-label" >Otro</label>
				</div>
			</div>
    	</div>
    	
    	<br>
	
		
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" >				  
				  <label >¿Presentó alguna complicación en su trayectoria escolar en primaria o secundaria, como repitencia, abandono, u otras? ¿Cuál?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" >				  
				  <label >¿Cómo te lo imaginás cuando termine la secundaria?</label>
				</div>
    		</div>
    	</div>
	
		<br>
    	

    	
    	
    	<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Interés y participación en el programa</h3></div>
  		</div>
  		
  		<br>
  		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select class="form-select"  aria-label="Floating label select example" >				  
				  <option value="0"></option>
				  				  			  				  
				</select>
				<label >¿Tenés disponibilidad para participar de las reuniones mensuales en las que seas convocado/a y estar en contacto con el/la tutor/a de Cimientos?</label>
				</div>
    		</div>
		</div>
    	
    	<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <textarea class="form-control"  style="height: 100px"></textarea>				  
				  <label >¿Qué pensás que le puede aportar el programa de Cimientos a tu hijo/a o familiar? ¿En qué crees que lo/a puede ayudar?</label>
				</div>    			
    		</div>
    	</div>
    	
    	<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select class="form-select"  aria-label="Floating label select example" >				  
				  <option value="0"></option>
				 			  			  				  
				</select>
				<label >¿Tuviste o tenés otro hijo/a o familiar a cargo becado por Cimientos?</label>
				</div>
    		</div>
		</div>
		
		<br>
		

		
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Composición familiar</h3></div>
  		</div>
  		
  		<br>

		
		
		<table style="font-size: small"  >	
                            <thead align="center" class="card-header " >
                                <tr >
                                    <th style="min-width: 100px; ">V&iacute;nculo</th>
                                    <th style="min-width: 50px;">Apellido</th>
                                    <th style="min-width: 50px;">Nombre</th>
                                    <th style="min-width: 20px;">Edad</th>
                                    <th style=" min-width: 150px; ">M&aacute;x. nivel educativo alcanzado</th>
                                    <th style="min-width: 120px;">Condici&oacute;n laboral</th>
                                    <th>Ocupaci&oacute;n</th>
                                    <th style="min-width: 210px;">Tipo de trabajo</th>
                                    <th style="width:100px;">Remuneraci&oacute;n mensual</th>
                                </tr>
                            </thead>
							<tbody id="tbody"class="card-body " >
								<c:if test="${!empty entrevistaSeleccionDTO.perfilAlumno.fichaFamiliar}">
									<c:forEach items="${entrevistaSeleccionDTO.fichasFamiliares}" var="fichaFamiliar" varStatus="loop">
											<script>
												incrementarCounter();
												
											</script>
											<tr <c:out value="${loop.count}"/>">
												<td  >
													<select  class=" form-control p-0"style="font-size: 12px;">
														<c:forEach items="${listVinculo}" var="vinculoFicha">
															<c:choose>
																<c:when test="${fichaFamiliar.vinculo.id == vinculoFicha.id}">
																		<option value="${vinculoFicha.id}" selected="selected">${vinculoFicha.valor}</option>
																</c:when>
																<c:otherwise>
																		<option value="${vinculoFicha.id}">${vinculoFicha.valor}</option>
																</c:otherwise>	
															</c:choose>
														
														</c:forEach>
													</select>
												</td>
												<td  ><input type="text"  value="${fichaFamiliar.apellido}" class=" form-control p-0" style="font-size: 12px;"size="30"></td>
												<td  ><input type="text"  value="${fichaFamiliar.nombre}" class=" form-control p-0" style="font-size: 12px;"size="25"></td>
												<td  ><input type="text"  value="${fichaFamiliar.edad}" class=" form-control p-0" style="font-size: 12px;"size="2"></td>
												
												<td >
												<select  class=" form-control p-0" style="font-size: 12px;">
													<c:forEach items="${listNivelEducativo}" var="nivelEducativo">
														<c:choose>
															<c:when test="${fichaFamiliar.nivelEducativo.id == nivelEducativo.id}">
																<option value="${nivelEducativo.id}" selected="selected">${nivelEducativo.valor}</option>
															</c:when>
															<c:otherwise>
																	<option value="${nivelEducativo.id}">${nivelEducativo.valor}</option>
															</c:otherwise>	
														</c:choose>
													</c:forEach>
												</select>
												</td>
												<td ><input type="text"  class=" form-control p-0" style="font-size: 12px;"></td>
												<td ><input type="text" value="${fichaFamiliar.ocupacionLaboral}" class=" form-control p-0" style="font-size: 12px;"></td>
												<td ><input type="text"   class=" form-control p-0" style="font-size: 12px;"></td>
												<td ><input type="text"  value="${fichaFamiliar.renumeracion}"class=" form-control p-0" style="font-size: 12px;"></td>
											</tr>
									</c:forEach>
								</c:if>
						</tbody>
				</table>
		
		
		
		<br>
		
		
		
		

		<div class="row align-items-start">
    	
    	<br><br><br>
    	
    		<div class="col">
      			<div class="form-floating">
				  <input type="number" class="form-control" >
				  <label >Cantidad AUH</label>
					
				</div>
				
    		</div>
    		
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control">				  
				  <label >Total AUH</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

		<div class="row align-items-start">
    		    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control">				  
				  <label >¿Cuenta con algún otro ingreso familiar además de los mencionados? ¿De dónde proviene?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="number" class="form-control" >				  
				  <label >Monto mensual de otros ingresos</label>
				</div>
    		</div>
 		<br><br><br>
 		<button type="button" class="btn btn-primary" >Cálculo Ingresos totales y Ingreso por Conviviente</button>	
 	   	</div>
    	
    	<br>	
    	<div class="row align-items-start">	
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" >				  
				  <label >Ingresos Totales</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="number" class="form-control" >				  
				  <label >Ingreso por persona conviviente</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

		<div class="row align-items-start">	
    		<div class="col">      			
				<table class="table">
					<tr class="table-success">
				    	<td align="center" colspan="2"><b>Cuadro aclaratorio de canasta básica por región</b></td>
				    </tr>				    				    	
				      <tr class="table-primary">
				        <td align="center"><b>Zona</b></td>
				        <td align="center"><b>Importe</b></td>				        
				      </tr>				    
				    <tbody>				          
				      <tr class="table-info">
				        <td align="center">Local</td>
				        <td align="center">$ 36.895</td>				        
				      </tr>
				      <tr class="table-warning">
				        <td align="center">Interior</td>
				        <td align="center">$ 34.095</td>				        
				      </tr>
				      <tr class="table-danger">
				        <td align="center">Sur</td>
				        <td align="center">$ 43.330</td>				        
				      </tr>
				     </tbody> 
				</table>
    		</div>    		     		
    	</div>
    	
    	<br>
 
 
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Vivienda</h3></div>
  		</div>

		<br>
		

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select class="form-select"  aria-label="Floating label select example" >				  
				  	<option value="0"></option>
				  			 				  
				</select>
				<label >Tipo de vivienda</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	
    	
		<div class="row align-items-start">
			<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" >				  
				  <label >¿Cuántos ambientes tiene la vivienda?</label>
				</div>
    		</div>
		</div>
		
		<br>
    	
		
		<div class="row align-items-start">
			<div class="col">      						  
				  <label >¿Qué servicios tiene en su vivienda? Mencionar los del listado y marcar todos los que correspondan</label>
				  <br>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Agua</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Luz</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox"  >
  					<label class="form-check-label" >Gas natural</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label">Gas a garrafa</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Teléfono fijo</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Celular</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Internet</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Tv por cable</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Vehículo propio</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" >
  					<label class="form-check-label" >Otro</label>
				</div>
			</div>
		</div>

		<br>
		
		<div class="row align-items-start">
			<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" >				  
				  <label >Comentarios adicionales sobre ingresos/egresos familiares</label>
				</div>
    		</div>
		</div>
		
		
		<br>
		
		
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Salud</h3></div>
  		</div>

		<br>
		
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select class="form-select"  aria-label="Floating label select example" >				  
				  <option value="0"></option>
								 				  
				</select>
				<label >¿Tiene obra social o pregaga?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input  type="text"   class="form-control" 
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludBecado}" >value="Sí" </c:if>
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludBecado== false}" >value="No" </c:if> > 
				<label for="floatingSelect">¿Su hijo/a o familiar tiene algún problema de salud?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	
    	<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.saludBecadoCual}" >	
				 			  
				  <label >En caso afirmativo, ¿Qué problema de salud tiene?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select class="form-select"  aria-label="Floating label select example" >				  
				  <option value="0"></option>
				  				 				  
				</select>
				<label for="floatingSelect">¿Tiene inasistencias en la escuela por el problema de salud o tiene dificultades para cumplir con las tareas escolares por su problema de salud?</label>
				</div>
    		</div>
    	</div>	
    		
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input  type="text"   class="form-control" 
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludFamilia}" >value="Sí" </c:if>
					<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludFamilia== false}" >value="No" </c:if> > 
				<label >¿Ud. o algún otro integrante de la familia tiene problemas de salud?</label>
				</div>
    		</div>
    	</div>
    	
    	
    	<br>
    		
    	<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
      				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.saludFamiliarCual}" >	
				  <label >En caso afirmativo, ¿Qué problema de salud tiene?</label>
				</div>
    		</div>
    		     		
    	</div>	
    		
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select class="form-select"  aria-label="Floating label select example" >				  
				  <option value="0">n</option>
				  				 				  
				</select>
				<label >¿El/la candidato/a suele faltar a la escuela o tener dificultades para cumplir con las tareas escolares para atender a los familiares con problemas de salud?</label>
				</div>
    		</div>
    	</div>		
    		
    		
    	<br>	
    		
    	
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Evaluación del entrevistador/a</h3></div>
  		</div>

		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
      				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.observacionesGenerales}" >	
				 				  
				  <label >Información complementaria y percepciones</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
		
		<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
      			     <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.cognitivo}" >	
				<label >¿Se detectó alguna dificultad cognitiva o problema de aprendizaje?</label>
				</div>
    		</div>
    	</div>
    	<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select class="form-select"  aria-label="Floating label select example">				  
				  <option value="0"></option>
				 				 				  
				</select>
				<label >¿Se detectó alguna situación de riesgo extra-escolare?</label>
				</div>
    		</div>
    	</div>


		<br>
		
		<div class="row align-items-start">
			<div class="col">      						  
				  <label >En caso de respuesta positiva marcar aquellas situaciones de riesgo que se detectaron</label>
				  <br>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Fallecimiento de una persona significativa</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" > Enfermedad propia o de una persona significativa</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Maternidad/Paternidad del EP</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Mudanza</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Cambio de estructura familiar/convivientes</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox">
  					<label class="form-check-label" >Situación de crisis económica en la familia</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Situación de violencia familiar</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox">
  					<label class="form-check-label">Consumo problemático</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label">Situación de violencia escolar</label>
				</div>
				<div class="form-check">
  					<input class="form-check-input" type="checkbox" >
  					<label class="form-check-label" >Otra</label>
				</div>
			</div>
		</div>

		<br>
		
		<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
      			     <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.riesgoExtraEscolar}" >	
				  <label>¿Cuál?</label>
				</div>
    		</div>
    		     		
    	</div>
	<br><br><br>
		<c:choose>
			<c:when test="${isDetalleEntrevista}">
				<table align="center">
					<tr>
						<td><input type="button" value="Volver"
							class="btn btn-primary" id="buttonVolver"
							onclick="location.href='../entrevistaSeleccion/reporteEntrevistaSeleccion.do'; return false;" />
						</td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<table align="center">
					<tr>
						<td><input class="btn btn-primary"
							type="button" value="Finalizado"
							onclick="enviarForm('finalizado')" /></td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
	<br><br>
</div>


















































 















<%-- 




	<div id="main-content">
		<!-- Formulario para la busqueda del alumno por DNI -->

		<form action="" method="post" id="formAlumno" name="formAlumno">
			<input type="hidden" id="idEntrevista" name="idEntrevista"> 
			<input type="hidden" id="accion" name="accion" value="${accion}">
		</form>
		<form:form modelAttribute="entrevistaSeleccionDTO" id="altaEntrevista"
			commandName="entrevistaSeleccionDTO" method="post"
			name="altaEntrevista" enctype='multipart/form-data'> 
			<!-- Hidden para la validacion del alumno por ajax -->
			<input type="hidden" id="accion" name="accion" value="${accion}">
			<input type="hidden" id="idEntrevista" name="idEntrevista"
				value="${idEntrevista}">
			<c:if test="${!empty entrevistaSeleccionDTO.perfilAlumno.id}">
				<form:hidden path="perfilAlumno.id" />
				<form:hidden path="perfilAlumno.datosPersonales.id" />
				<form:hidden path="perfilAlumno.responsable1.id" />
				<form:hidden path="perfilAlumno.responsable2.id" />
				<form:hidden path="entrevistaSeleccion.idPerfilAlumno" />
			</c:if>

			<input type="hidden" id="estadoEntrevista" name="estadoEntrevista"
				value="">


	

			<div id="container" class="container" style="width: auto">
				<br>
				<div id="datosCandidato"
					style="width: auto; height: auto; ">
				
				  <!-- DMS elimino include y pego codigo completo -->
				  
					
					<!-- Datos Personales -->
					<fieldset>
							
							<!-- DMS reemplazo include "datosPersonalesAlumno.jsp" por codigo -->
							
						<div class=" container card border-secondary mb-3 " style="background-color: #D6D6D6; width:700px; ">								
							<fieldset class="card-body ">
								
									
										
										<p><font color="green"><label for="fechaEntrevista">Fecha Entrevista:</label> </font><br>
											<input class="form-control   "    value="<fmt:formatDate value="${entrevistaSeleccionDTO.entrevistaSeleccion.fechaEntrevista}" pattern="dd/MM/yyyy"/>" onChange="calcular_fecha(this.value)"  > 				
											<input type="hidden" name="excepcion" id="excepcion" value="No">
										</p>
									
									
										
											<p>	<font color="green"><label style="font-size: 10px;">
													<b>Convocatoria *</b>
												</label></font> 
													<input type="text" name="entrevistaSeleccion.convocatoria.nombre" class="required form-control " value="${entrevistaSeleccionDTO.entrevistaSeleccion.convocatoria.nombre}" onclick="limpiarConvocatoria()" onblur="chequearConvocatoria()" />
													<input type="hidden" name="idConvocatoria" 	id="idConvocatoria" value="${entrevistaSeleccionDTO.entrevistaSeleccion.convocatoria.idConvocatoria}"/>
											</p>
										
									
										
										<p><font color="green"><label style="font-size: 10px"><b>Estado Alumno *</b></label></font> 
											<select 	type="hidden name="estados" id="estados" class="required form-control" onchange="habilitarInputEstadoAlumno(this.value)">
												<option value="">Seleccione una opci&oacute;n:</option>
												<c:forEach items="${listEstadoAlumnos}" var="estado">
													<c:choose>
														<c:when
															test="${entrevistaSeleccionDTO.perfilAlumno.estadoAlumno.id == estado.id}">
															<option value="${estado.id}" selected="selected">${estado.valor}</option>
														</c:when>
														<c:otherwise>
															<option value="${estado.id}" >${estado.valor}</option>
														</c:otherwise>
													</c:choose>
									
												</c:forEach>
											</select>
										</p>
										
									
										
										
										<p><label style="font-size: 10px"><b>Motivo Rechazo</b></label>		
											<select class="form-control" name="idMotivoRechazo" disabled="disabled" id="motivoRechazo" onchange="habilitarMotivo(this)">
												<option id="idMotivoRechazo0" value="">Seleccione una opci&oacute;n:</option>
												<c:forEach items="${listMotivoRechazo}" var="motivoRech">
												<c:choose>
														<c:when
															test="${entrevistaSeleccionDTO.entrevistaSeleccion.motivoRechazo.id == motivoRech.id}">
															<option value="${motivoRech.id}"selected="selected">${motivoRech.valor}</option>
														</c:when>
														<c:otherwise>
															<option value="${motivoRech.id}">${motivoRech.valor}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select> 
										</p>
										
									
											<p ><label style="font-size: 10px">Otro motivo rechazo</label>
												<form:textarea class="form-control" path="entrevistaSeleccion.otroMotivoRechazo" rows="4" cols="30" id="otroMotivoRechazo" disabled="true" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
											</p>
										
									
									
										<p><label style="font-size: 10px"><b>Motivo Env&iacute;o TS</b></label>
											<select name="idMotivoTS" class="required form-control" disabled="disabled" id="motivoEnvioTS" >
												<option id="motivoEnvioTS0" value="">Seleccione una opci&oacute;n:</option>
												<c:forEach items="${listMotivoEnvioTS}" var="motivoEnvioTS">
													<c:choose>
														<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.motivoEnvioTS.id == motivoEnvioTS.id}">
															<option value="${motivoEnvioTS.id}" selected="selected">${motivoEnvioTS.valor}</option>
														</c:when>
														<c:otherwise>
															<option value="${motivoEnvioTS.id}">${motivoEnvioTS.valor}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>				
											</select>
										</p>
										
										
										<p ><label style="font-size: 10px">Observaciones para TS</label>
											<form:textarea class="form-control" disabled="true" path="perfilAlumno.responsable1.observacionesParaTS" rows="4" cols="30" id="observacionesParaTS" onblur="chequearLongitudRA(this);" onkeypress="chequearLongitudRA(this);"/>
										</p>
										
							
							</fieldset>
						</div>
							
							
							
							
							    
							<!-- Datos Personales -->
							
						
						<br><br><br><br>
							<div class="container-fluid" >
								<div class="row mb-4">
									<font color="blue" size="2">
										Si tenés duda con algún dato del Candidato/a y/o Responsable hacé click en el siguiente link</font>
								</div>
								<div class="row mb-4" >	
										
										<a href="http://www.buscardatos.com" target="_blank"><font size="2">Padrón electoral</font></a> (Buscás por apellido o DNI)	
								
								</div>
								<div class="row" >
									<div class="col" >
										<p>
											<label for="alumnoNombre" ><font color="green">Nombre *</font></label> 
											<input type="text" 	 onchange="this.value=this.value.toUpperCase();"    id="alumnoNombre" name="perfilAlumno.datosPersonales.nombre"  class="required form-control" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nombre}" >
										</p>  
									</div>
									<div class="col" >
										<p>			
											<font color="green"><label for="alumnoApellido">Apellido *</label></font> 
											<input type="text" 	class="form-control" onchange="this.value=this.value.toUpperCase();"  id="alumnoApellido" name="perfilAlumno.datosPersonales.apellido" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.apellido}">
										</p> 
									</div>
									
							
								</div>
							
								<div class="row" >
									<div class="col" >
										<p>
											<label><font color="green">Tipo  de DNI * </font></label>
												<select name="tipo" id="dni" class="required form-control" >
													<option value="">Seleccione una opci&oacute;n:</option>
													<c:forEach items="${listDni}" var="dni">
													<c:choose>
														<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.tipoDni.id == dni.id}">
															<option value="${dni.id}" selected="selected">${dni.valor}</option>
														</c:when>
														<c:otherwise>
															<option value="${dni.id}">${dni.valor}</option>
														</c:otherwise>
													</c:choose>	
													</c:forEach>
												</select>
										</p>
									</div>
									<div class="col" >
										<p>
											<c:choose>
											<c:when test="${accion == 'modificar'}">
												
													
														<font color="green"><label for="dniAlumno">DNI *</label></font>
														<input type="text" id="dniAlumno"
																   name="perfilAlumno.datosPersonales.dni" class="digits form-control"  maxlength="8" 
																   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  >
														<label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label>
												
											</c:when>
											<c:when test="${accion == 'carga'}">
												
													
														<font color="green"><label for="dniAlumno">DNI *</label></font>
														<input type="text" id="dniAlumno" disabled="disabled"
																   name="perfilAlumno.datosPersonales.dni" class="digits "  maxlength="8" 
																   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  >
														<label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label>
												
											</c:when>
											<c:when test="${accion == 'alta'}">
												
													
														<font color="green"><label for="dniAlumno">DNI *</label></font>
														<input type="text" id="dniAlumno" onblur="buscarAlumno()" 
																   name="perfilAlumno.datosPersonales.dni" class="digits form-control"  maxlength="8" 
																   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  >
														<label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label>
													
												
											</c:when>
											<c:when test="${accion == 'ver'}">
												
													
														<font color="green"><label for="dniAlumno">DNI *</label></font>
														<input type="text" id="dniAlumno" disabled="disabled"
																   name="perfilAlumno.datosPersonales.dni" class="digits form-control"  maxlength="8" 
																   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  >
														<label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label>
													
												
											</c:when>
										</c:choose>
										</p>
									</div>
									
								</div>
							
								
							
								<div class="row" >
									<div class="col" >
									  	<p>
											<font color="green"><label>Pais</label></font> 
											<!-- input type="text"  onchange="this.value=this.value.toUpperCase();"	id="alumnoNacionalidad" name="perfilAlumno.datosPersonales.nacionalidad" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad}"-->
											<select name="alumnoNacionalidad" id="alumnoNacionalidad" class="required form-control"  onchange="habilitarInputEstadoAlumno(this.value)">
												<c:choose>
							    					<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Argentina'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" selected="selected">Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Bolivia'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina">Argentina</option>
														<option value="Bolivia"  selected="selected">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Brasil'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil" selected="selected">Brasil</option>							
														<option value="Chile">Chile</option>							
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Chile'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile" selected="selected">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Colombia'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia" selected="selected">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Ecuador'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador" selected="selected">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Paraguay'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay" selected="selected">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Perú'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú" selected="selected">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Uruguay'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay" selected="selected">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Venezuela'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela" selected="selected">Venezuela</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Cuba'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba" selected="selected" >Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>	
												    </c:when>
												    <c:otherwise>
													 	<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Argentina" >Argentina</option>
														<option value="Bolivia">Bolivia</option>
														<option value="Brasil">Brasil</option>							
														<option value="Chile">Chile</option>
														<option value="Colombia">Colombia</option>
														<option value="Cuba">Cuba</option>
														<option value="Ecuador">Ecuador</option>
														<option value="Paraguay">Paraguay</option>
														<option value="Perú">Perú</option>
														<option value="Uruguay">Uruguay</option>
														<option value="Venezuela">Venezuela</option>
												    </c:otherwise>
												</c:choose>
												
												
											</select>
										</p>
									</div>
									<div class="col" >
										
										<p><font color="green"><label for="fechaNacimiento">Fecha de Nacimiento *</label> </font>
											<input  class="date required form-control" value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>"  > 
											<input name="input_id_2" id="input_id_2" type="hidden">
										</p>
									</div>
									
								
									</div>
								<div class="row" >
									<div class="col" >
										<p>
										
										
										<!-- 
											<font color="green"><label>Sexo *</label></font>
												M<input type="radio" id="alumnoSexoM" name="perfilAlumno.datosPersonales.sexo" 
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo}"> checked="checked"</c:if> value="true"> 
												F<input type="radio" id="alumnoSexoF" name="perfilAlumno.datosPersonales.sexo"
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo == false}"> checked="checked"</c:if> value="false">
										 -->
										<br>
											<font color="green"><label>Sexo *</label></font>
											<!-- 
											<label  class="form-check-label" for="alumnoSexoM">M</label>
											 -->M											
											<input  type="radio" id="alumnoSexoM" name="perfilAlumno.datosPersonales.sexo" 
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo}"> checked="checked"</c:if> value="true"> 
											<!--
											<label  class="form-check-label" for="alumnoSexoF">F</label>
											-->F
											<input  type="radio" id="alumnoSexoF" name="perfilAlumno.datosPersonales.sexo" 
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo == false}"> checked="checked"</c:if> value="false">
										
										
										</p>
									</div>
									<div class="col" >
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										<p>
											<font color="green"><label>Escuela *</label></font>
											<input type="hidden" name="idEscuela" 	id="idEscuela" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.id}"/>
											<input class="form-control" id="escuela" type="text" name="perfilAlumno.escuelaSeleccion.nombre" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.nombre}" onchange="limpiarComboBanco(this);" />
											
										</p>
									</div>
									<div class="col" >
										
											<div class=row>
												<font color="green"><label class="ml-3" >Zona Cimientos *</label> </font>
											</div>
											<div class="row form-inline">
												
												<input  type="hidden" name="perfilAlumno.escuelaSeleccion.zona.id" id="idZonaCimientos" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.id}" />
											
												<input class="form-control mx-3" id="zonaCimientos" name="perfilAlumno.escuelaSeleccion.zona.nombre" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.nombre}"  disabled="disabled"/>
											
												EAE:<input  class="form-control ml-3" id="eae" name="eae" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae}"  disabled="disabled"/>
											
											</div>
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
												<c:choose>			
												<c:when test="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae=='6/6'}">
													
														<font color="green"><label>Año Escolar 6/6*</label></font>				
															<select name="anioEscuela" id="anioEscuela" class="required form-control"  >
																<option value="">Seleccione una opci&oacute;n:</option>
																<c:forEach items="${listAnioEscolar}" var="anioEscolar">							
																	<c:choose>										
																		<c:when test="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.id == anioEscolar.id}">
																			<option  value="${anioEscolar.id}" selected="selected">${anioEscolar.valor}</option>
																		</c:when>													
																		<c:otherwise>																																			
																			<c:choose>
																				<c:when test="${anioEscolar.id == 8 }">
																					<option value="${anioEscolar.id}" disabled="disabled">${anioEscolar.valor} </option>
																				</c:when>
																				<c:otherwise>											
																					<option value="${anioEscolar.id}">${anioEscolar.valor} </option>																				
																				</c:otherwise>	
																			</c:choose>								
																		</c:otherwise>
																	</c:choose>	
																</c:forEach>
															</select>	
															<br>				
														<!-- font color="green"><label>Año Escolar PFE</label></font--> 
														<input type="hidden" id="ae" name="ae" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.valor}">
														<input type="hidden" id="idAe" name="idAe" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar}">
													
														<!-- font color="green"><label>Año Escolar real</label></font--> 
														
													<br>				
												</c:when>
												<c:when test="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae=='7/5'}">
													
														<p>
															<font color="green"><label>Año Escolar 7/5*</label></font> 
																<select name="anioEscuela" id="anioEscuela" class="required form-control" >
																	<option value="">Seleccione una opci&oacute;n:</option>
																	<c:forEach items="${listAnioEscolar}" var="anioEscolar">							
																		<c:choose>										
																			<c:when test="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.id == anioEscolar.id}">
																				<option  value="${anioEscolar.id}" selected="selected">${anioEscolar.valor}</option>
																			</c:when>													
																			<c:otherwise>																																			
																				<c:choose>
																					<c:when test="${anioEscolar.id == 15}">
																						<option value="${anioEscolar.id}" disabled="disabled">${anioEscolar.valor} </option>
																					</c:when>
																					<c:otherwise>											
																						<option value="${anioEscolar.id}">${anioEscolar.valor} </option>																				
																					</c:otherwise>	
																				</c:choose>								
																			</c:otherwise>
																		</c:choose>	
																	</c:forEach>
																</select>
														</p>
														<!-- font color="green"><label>Año Escolar PFE</label></font--> 
														<input type="hidden" id="ae" name="ae" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.valor}">
														<input type="hidden" id="idAe" name="idAe" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar}">
																	
												</c:when>
												<c:otherwise>
													
														<font color="green"><label>Año Escolar*</label></font>
														<select name="anioEscuela" id="anioEscuela" class="required form-control"  >
															<option value="">Seleccione una opci&oacute;n:</option>
														</select>
													<br>
												</c:otherwise>
											</c:choose>
									</div>
									<div class="col" >
										<p>
											<label>División</label> 
												<input class="form-control"	name="perfilAlumno.division" id="alumnoDivision" value="${entrevistaSeleccionDTO.perfilAlumno.division }"	 >
										</p>
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										<p>
											<font color="green"><label>Turno *</label></font>
									 			<select name="turno" id="turno" class="required form-control" >
									 				<option value="">Seleccione una opci&oacute;n:</option>
													<c:forEach items="${listTurno}" var="turno">
														<c:choose>
															<c:when test="${entrevistaSeleccionDTO.perfilAlumno.turno.id == turno.id}">
																<option value="${turno.id}" selected="selected">${turno.valor}</option>
															</c:when>
															<c:otherwise>
																<option value="${turno.id}">${turno.valor}</option>
															</c:otherwise>	
														</c:choose>
												</c:forEach>
											</select>
										</p>
									</div>
									<div class="col" >
										<p>
											<label>Orientación</label>
												<form:textarea path="entrevistaSeleccion.orientacion"   class="form-control" id="orientacion" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
										</p>
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										
									</div>
									<div class="col" >
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										
										
									</div>
									
									
							
								</div>
								<div class="row" >
									<div class="col" >
										
										
										
										
										<p><br>
											<label>¿Recibe otra Beca?</label>
												Si<input type="radio" id="alumnoRecibeOtraBeca" name="entrevistaSeleccion.recibeOtraBeca" onfocus="habilitarBeca('si')"
													<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca}"> checked="checked"</c:if> value="true"> 
												No<input type="radio" id="alumnoRecibeOtraBeca" name="entrevistaSeleccion.recibeOtraBeca" onfocus="habilitarBeca('no')"
													<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca == false}"> checked="checked"</c:if> value="false">
										</p>
									
								
										
									</div>
									<div class="col" >
										<p>
											<label>Cuál</label>
												<input class="form-control" type="text" name="entrevistaSeleccion.cualBeca" id="cualBeca" value="${entrevistaSeleccionDTO.entrevistaSeleccion.cualBeca}" disabled="disabled">
										</p> 
							
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										<p>
											<font color="green"><label>Calle *</label></font> 
												<input type="text" onchange="this.value=this.value.toUpperCase();" id="alumnoDireccion" name="perfilAlumno.datosPersonales.direccion" class="required form-control" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.direccion }">
										</p>
							
										
									</div>
									<div class="col" >
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										
												<p>
													<font color="green"><label>Número *</label></font>
													<input type="text"  onchange="this.value=this.value.toUpperCase();"  id="alumnoNumero" name="perfilAlumno.datosPersonales.numeroCalle" class="required form-control" 
														value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.numeroCalle }">
													
													<label id="numeroAlumnoError" style="color: red; display: none;">Solo puede ingresar Numero </label>
												</p>
												
										
										
									</div>
									<div class="col" >
										
										<label>Piso/Manzana</label>
													<input type="text"  onchange="this.value=this.value.toUpperCase();"   id="alumnoPiso" name="perfilAlumno.datosPersonales.piso" class="form-control" 
														value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.piso }">
													
													<label id="pisoAlumnoError" style="color: red; display: none;">Solo puede ingresar Numero </label>
												
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										
										
										<p>
											<label>Casa/Departamento </label> 
												<input type="text" onchange="this.value=this.value.toUpperCase();"	  id="alumnoEntreCalles" name="perfilAlumno.datosPersonales.departamento" 
											 	value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.departamento}" class="form-control">
										</p>
										
										
									</div>
									<div class="col" >
										<p>
											<label><font color="green">Entre Calles *</font></label> 
												<input type="text"  onchange="this.value=this.value.toUpperCase();" 	id="alumnoEntreCalles" name="perfilAlumno.datosPersonales.entreCalles" 
												 	value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.entreCalles}" class="required form-control">
										</p>
							
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										
										<p>
											<font color="green"><label>Barrio *</label></font>
												<input type="text" class="required form-control" onchange="this.value=this.value.toUpperCase();"  id="barrio" name="perfilAlumno.datosPersonales.barrio"
													value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.barrio}" >
										</p>
								
										
									</div>
									<div class="col" >
										<p>
											<font color="green"><label>Código Postal *</label></font> 
												<input type="text" onchange="this.value=this.value.toUpperCase();"  id="alumnoCodigoPostal" name="perfilAlumno.datosPersonales.codigoPostal" class="required form-control"  value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.codigoPostal}"> 
										</p>
							
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										
										<p>
											<font color="green"><label>Localidad *</label></font>
												<select name="perfilAlumno.datosPersonales.localidad.id" id="localidadAlumno"  class="required form-control" >
													<option value="">Seleccione una opci&oacute;n:</option>
													<c:forEach items="${localidades}" var="localidad">
														<c:choose>
															<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.localidad.id == localidad.id}">
																<option value="${localidad.id}" selected="selected">${localidad.nombre}</option>
															</c:when>
															<c:otherwise>
																<option value="${localidad.id}" title="${localidad.nombre}" style="width: 150px;"> ${localidad.nombre}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>			
												</select>
									   </p>
							
										
									</div>
									<div class="col" >
										
										<p>
											<font color="green"><label>Provincia * </label></font>
												<select name="perfilAlumno.datosPersonales.provincia.id" id="provinciaAlumno" class="required form-control" >
													<option value="">Seleccione una opci&oacute;n:</option>
													<c:forEach items="${listProvincias}" var="provincia">
														<c:choose>
															<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.provincia.id == provincia.id}">
																<option value="${provincia.id}" selected="selected">${provincia.descripcion}, ${provincia.pais}</option>
															</c:when>
															<c:otherwise>
																<option value="${provincia.id}">${provincia.descripcion}, ${provincia.pais}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>			
												</select>
									   </p>
							
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										<p><font color="green"><label for="telefono">Teléfono (cargá el código de área) *</label></font> 
											<input type="text" 	name="perfilAlumno.datosPersonales.telefono" id="alumnoTelefono" maxlength="19"
											class="required form-control" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.telefono}" onkeypress="return justNumbers(event);"/>
										</p>
						
										
									</div>
									<div class="col" >
										
								
										
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										<p>
											<label for="contacto1">Teléfono 1 (cargá el código de área)</label> 
												<input type="text" class=" form-control" onchange="this.value=this.value.toUpperCase();"  maxlength="19"  name="perfilAlumno.telefono1" id="telefono1"
												value="${entrevistaSeleccionDTO.perfilAlumno.telefono1}" onkeypress="return justNumbers(event);" />
										</p>
										
										
									</div>
									<div class="col" >
										<p>
											<label for="contacto1">Contacto 1</label> 
												<input type="text"  class="form-control" onchange="this.value=this.value.toUpperCase();" name="perfilAlumno.contactoTelefono1" id="alumnoContactoTelefono1"
												value="${entrevistaSeleccionDTO.perfilAlumno.contactoTelefono1}"/>
										</p>
						
										
										
								   	
										
												
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										<p>
											<label for="contacto2">Teléfono 2 (cargá el código de área)</label> 
												<input type="text" class=" form-control" onchange="this.value=this.value.toUpperCase();" 	maxlength="19" name="perfilAlumno.telefono2" id="telefono2"
												value="${entrevistaSeleccionDTO.perfilAlumno.telefono2}" onkeypress="return justNumbers(event);"/>
										</p>
										
								  
							
										
										
									</div>
									<div class="col" >
										<p>
											<label for="contacto2">Contacto 2</label> 
												<input type="text"  class=" form-control"onchange="this.value=this.value.toUpperCase();" 	name="perfilAlumno.contactoTelefono2" id="alumnoContactoTelefono2"
												value="${entrevistaSeleccionDTO.perfilAlumno.contactoTelefono2}"/>
										</p>
										
									
										
								
									</div>
							
								</div>
								<div class="row" >
									<div class="col" >
										<p>
											<label for="telefono">Mail / Facebook</label> 
												<input type="text" class=" form-control" onchange="this.value=this.value.toUpperCase();"  	name="perfilAlumno.datosPersonales.mail" id="alumnoMail"
												value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.mail}"/>
										</p>
										
										
										
									</div>
									<div class="col" >
										<p>
											<div class="row">
												<div class="col">
													<label>¿Tuvo algún hermano/a beca de Cimientos?</label>
												</div>
												<div class="col">
												<br>
													Si<input type="radio" id="otroBecado" name="otroBecado" 
														<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroBecado2}"> checked="checked"</c:if> value="true"> 
													No<input type="radio" id="otroBecado" name="otroBecado" 
														<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroBecado2 == false}"> checked="checked"</c:if> value="false">
												</div>
											</div>
										</p>
								
									</div>
							
								</div>
							</div>
							<br><br><br><br>
							
							
								
								<div id="dialog-ver" title="Estado alumno incorrecto" style="display: none">
									<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 10px 45px 0;"></span> 
									NO se puede dar de alta una entrevista de seleccion para el alumno debido a que el mismo no se encuentra en proceso de selección, seleccione 
									"Ver Datos Entrevista Selección" para obtener los datos del mismo.
									</p>
								</div>
								<div id="dialog-cargar" title="Carga de Entrevista de Selección" style="display: none">
									<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 10px 45px 0;"></span> 
									El alumno que quiere ingresar ya tiene una entrevista de Selección, seleccione 
									"Ver Datos Entrevista Selección" para visualizarla.
									</p>
								</div>
								<div id="dialog-DNI" title="Ya existe DNI" style="display: none">
									<p><span class="ui-icon ui-icon-alert" style="float:left; margin:0 10px 45px 0;"></span> 
									NO se puede dar de alta una entrevista de seleccion con este DNI, ya que el mismo se encuentra en la base de datos como usuario 
									</p>
								</div>
							
							
						
							<!-- DMS fin include -->
					</fieldset>
					<!-- Datos Escolares -->
					<fieldset>
					<br><br>
						<legend class="card bg-info text-white"> Datos Escolares </legend>
						<br><br>
						<!-- DMS reemplazo include "datosEscolaresAlumno.jsp" por codigo -->	
							
				    
						<table align="left">
						  <tr>
						  		<td colspan="3"></td>
						  </tr>
						  <tr>
						    <td>
						    	<table>    		
						   			<c:if test="${accion == 'ver' && !empty aniosRepitio}">
						   				<tr>
							    			<td valign="top" align="left" colspan="2">
										    	<p>
										    		<label>Repitió</label>
										    			Si<input type="radio" id="entrevistaSeleccion.repitio" name="entrevistaSeleccion.repitio" 
														  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.repitio}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
														No<input type="radio" id="entrevistaSeleccion.repitio" name="entrevistaSeleccion.repitio"
														  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.repitio == false}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="false">
												</p>
							    			</td>
						    			</tr>
						    			<tr>    			
							    			<td valign="top" colspan="2">
										    	<p>
										    		<label>Años que repitió</label>
										    			<textarea rows="4" cols="40">${aniosRepitio}</textarea>									
												</p>
							    			</td>
						    			</tr>
						   			</c:if>
						   			<c:if test="${accion != 'ver' || (accion == 'ver' && empty aniosRepitio)}">
						   				<tr>
							    			<td valign="top" align="left">
										    	<p>
										    		<label>Repitió</label>
										    			Si<input type="radio" id="entrevistaSeleccion.repitio" name="entrevistaSeleccion.repitio" 
														  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.repitio}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
														No<input type="radio" id="entrevistaSeleccion.repitio" name="entrevistaSeleccion.repitio"
														  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.repitio == false}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="false">
												</p>
							    			</td>
							    			<td valign="top">
										    	<p>
										    		<label>&nbsp;&nbsp;Años que repitió</label>
													<form:select path="idAnioRepitio" multiple="multiple" size="4" disabled="disabled">
														<form:options items="${listAnioEscolar}" itemLabel="valor" itemValue="id"/>		
													</form:select>					
												</p>
							    			</td>
						    			</tr>
						    		</c:if>
						    		<tr>
						    			<td colspan="2">
											<p>
												<label>Motivo de repitencia</label>
													<form:textarea path="entrevistaSeleccion.motivoRepitencia" rows="4" cols="40" disabled="true" id="motivoRepitencia" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
											</p>
						    			</td>
						    		</tr>
						    		<c:if test="${accion == 'ver' && !empty aniosAbandono}">
							    		<tr>
											<td valign="top" align="left" colspan="2">
											    <p>
												    <label>Abandonó</label>
														Si <input type="radio" id="abandonoAnio" name="entrevistaSeleccion.abandono" 
														<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono}"> checked="checked"</c:if> onclick="enableDisableAbondono(this.value)"  value="true" > 
														No<input type="radio" id="abandonoAnio1" name="entrevistaSeleccion.abandono"
														<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono == false}"> checked="checked"</c:if> onclick="enableDisableAbondono(this.value)" value="false" >
												</p>
											</td>
										</tr>
										<tr>
											<td valign="top" colspan="2">				    
										    	<p>
										    		<label>Años que abandono</label>
											 			<textarea rows="4" cols="40">${aniosAbandono}</textarea>			
												</p>
								    		</td>
									    </tr>
							    		</c:if>
						    			<c:if test="${accion != 'ver' || (accion == 'ver' && empty aniosAbandono)}">
							    			<tr>
												<td valign="top" align="left">
												    <p>
													    <label>Abandonó</label>
															Si <input type="radio" id="abandonoAnio" name="entrevistaSeleccion.abandono" 
															<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono}"> checked="checked"</c:if> onclick="enableDisableAbondono(this.value)"  value="true" > 
															No<input type="radio" id="abandonoAnio1" name="entrevistaSeleccion.abandono"
															<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.abandono == false}"> checked="checked"</c:if> onclick="enableDisableAbondono(this.value)" value="false" >
													</p>
												</td>
												<td valign="top">	
											    	<p>
											    		<label>&nbsp;&nbsp;Años de abandono</label>
														<form:select path="idAnioAbandono" multiple="multiple" size="4" disabled="disabled">
															<form:options items="${listAnioEscolar}" itemLabel="valor" itemValue="id"/>		
														</form:select>
													</p>
												</td>
											</tr>
										</c:if>
							  			<tr>
										  	<td colspan="2">
										  		<p>
										    		<label>Motivo de abandono</label>
										    			<form:textarea path="entrevistaSeleccion.motivoAbandono" rows="4" cols="40" id="motivoAbandono" disabled="true" onkeypress="chequearLongitud(this);" onblur="chequearLongitud(this);"/>
														<input type="hidden" name="idConducta" id="conducta" value="${conducta.id}">
												</p>
										  	</td>
							 			</tr>
							 			<tr>
										<td colspan="2">				
										<p>
											<label>Situación año escolar anterior</label> 
											<select name="situacionEscolarAnioAnterior" id="situacionEscolarAnioAnterior">
												<c:choose>
							    					<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.situacionEscolarAnioAnterior == 'Promovido sin adeudar materias'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Promovido sin adeudar materias" selected="selected">Promovido sin adeudar materias</option>
														<option value="Promovido con materias a rendir">Promovido con materias a rendir</option>
														<option value="Repitió">Repitió</option>
														<option value="Abandonó">Abandonó</option>
														<option value="Pendiente">Pendiente</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.situacionEscolarAnioAnterior == 'Promovido con materias a rendir'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
														<option value="Promovido con materias a rendir" selected="selected">Promovido con materias a rendir</option>
														<option value="Repitió">Repitió</option>
														<option value="Abandonó">Abandonó</option>
														<option value="Pendiente">Pendiente</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.situacionEscolarAnioAnterior == 'Repitió'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
														<option value="Promovido con materias a rendir">Promovido con materias a rendir</option>
														<option value="Repitió"  selected="selected">Repitió</option>
														<option value="Abandonó">Abandonó</option>
														<option value="Pendiente">Pendiente</option>	
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.situacionEscolarAnioAnterior == 'Abandonó'}">
												        <option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
														<option value="Promovido con materias a rendir">Promovido con materias a rendir</option>
														<option value="Repitió">Repitió</option>
														<option value="Abandonó" selected="selected">Abandonó</option>
														<option value="Pendiente">Pendiente</option>
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.situacionEscolarAnioAnterior == 'Pendiente'}">
														<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
														<option value="Promovido con materias a rendir">Promovido con materias a rendir</option>
														<option value="Repitió">Repitió</option>
														<option value="Abandonó">Abandonó</option>
														<option value="Pendiente" selected="selected">Pendiente</option>
												    </c:when>
												    <c:otherwise>						 	
														<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
														<option value="Promovido con materias a rendir">Promovido con materias a rendir</option>
														<option value="Repitió">Repitió</option>
														<option value="Abandonó">Abandonó</option>
														<option value="Pendiente">Pendiente</option>
												    </c:otherwise>
												</c:choose>
												
												
											</select>				
										</p>
										</td>
									</tr>
							 							
								</table>
							</td>
							</tr>
							</table>
		
				
						<!-- DMS fin reemplazo include -->
					</fieldset>
					<!-- EvaluaciÃ³n -->
					<fieldset>
					<br><br>
						<legend class="card bg-info text-white"> Evaluaci&oacute;n Candidato </legend>
						<br><br>
						<!-- DMS reemplazo include "evaluacion.jsp" por codigo -->
							
						<table>
						   
						 <tr>
						    <td>
						    	<p>
						    		<label>Percepciones sobre el candidato</label>
						    			<form:textarea path="entrevistaSeleccion.percepcionesCandidato" rows="2" cols="40" id="perfilAlumno.percepcionesCandidato" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/> 
								</p>
						    	<input type="hidden" name="entrevistaSeleccion.informacionComplementaria" id="perfilAlumno.informacionComplementaria" />
						    	<input type="hidden" name="idCompromiso" id="compromiso" value="3">				
								<input type="hidden" name="idCompromisoPBE" id="compromisoPBE" value="3">
						    </td>
						  </tr>
						</table>
							
						<!-- DMS fin include -->	
						
					</fieldset>
					<!-- Boletin -->
					<fieldset>	
					
					
						
						<label>MATERIAS QUE ME GUSTAN</label>
						<table >
								<thead>
									<tr>
										<th align="left"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td >
											<p><label >Lengua</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaLengua" id="perfilAlumno.materiaLengua"
												<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaLengua}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Matemática</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaMatem" id="perfilAlumno.materiaMatem"
												 <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaMatem}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Ciencias Sociales</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaCiencSociales" id="perfilAlumno.materiaCiencSociales"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCiencSociales}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Inglés / Lengua Extranjera</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaInglesLengExt" id="perfilAlumno.materiaInglesLengExt"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaInglesLengExt}"> checked="checked"</c:if>>
										</td>
									</tr>
											<tr>
										<td >
											<p><label >Educación Física</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaEduFisica" id="perfilAlumno.materiaEduFisica"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaEduFisica}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Educación Artística</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaEduArt" id="perfilAlumno.materiaEduArt"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaEduArt}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Ciencias Naturales</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaCienciasNaturales" id="perfilAlumno.materiaCienciasNaturales"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCienciasNaturales}"> checked="checked"</c:if>>
										</td>
									</tr>
									
									
									
										
								</tbody>
							</table>
						<label>MATERIAS QUE ME MAS ME CUESTAN</label>
						<table >
								<thead>
									<tr>
										<th align="left"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td >
											<p><label >Lengua</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaLenguaC" id="perfilAlumno.materiaLenguaC"
												<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaLenguaC}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Matemática</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaMatemC" id="perfilAlumno.materiaMatemC"
												 <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaMatemC}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Ciencias Sociales</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaCiencSocialesC" id="perfilAlumno.materiaCiencSocialesC"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCiencSocialesC}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Inglés / Lengua Extranjera</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaInglesLengExtC" id="perfilAlumno.materiaInglesLengExtC"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaInglesLengExtC}"> checked="checked"</c:if>>
										</td>
									</tr>
											<tr>
										<td >
											<p><label >Educación Física</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaEduFisicaC" id="perfilAlumno.materiaEduFisicaC"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaEduFisicaC}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Educación Artística</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaEduArtC" id="perfilAlumno.materiaEduArtC"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaEduArtC}"> checked="checked"</c:if>>
										</td>
									</tr>
									<tr>
										<td >
											<p><label >Ciencias Naturales</label> 
											</p>
										</td>
										<td>
											<input type="checkbox" 	name="entrevistaSeleccion.materiaCienciasNaturalesC" id="perfilAlumno.materiaCienciasNaturalesC"
											<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCienciasNaturalesC}"> checked="checked"</c:if>>
										</td>
									</tr>
									
									
									
										
								</tbody>
							</table>						
					
					</fieldset>

					<!-- Boletin -->
					<fieldset>
					<br></br>
						<legend class="card bg-info text-white"> Bolet&iacute;n </legend>
					<br></br>							
						<!-- DMS include boletinSeleccion -->
						
						<table>
									<thead>
										<tr>
											<th>Materias</th>
											
											<th>Nota Final</th>
											
										</tr>
									</thead>
									<tbody>
										<c:choose>
											<c:when test="${empty entrevistaSeleccionDTO.entrevistaSeleccion.boletinSeleccions }">
												<c:forEach items="${listMaterias}" var="materia">
													<tr>
														<!-- cambiar a materia.nombre -->
														<td><input type="hidden" name="idMateria" value="${materia.id}">${materia.nombre}</td>
														<td><input type="hidden" name="notaPrimTrim" class="digits" size="10" maxlength="2" value="0">
														<input type="hidden" name="notaSegTrim" class="digits" size="10" maxlength="2" value="0">
														<input type="hidden" name="notaTerTrim" class="digits" size="10" maxlength="2" value="0">
														<input type="text" name="notaFinal" class="digits"  size="10" maxlength="2" onchange="chequearDigitos(this);">
														<input type="hidden" name="notaDiciembre" class="digits" size="10" maxlength="2" value="0">
														<input type="hidden" name="notaMarzo" class="digits" size="10" maxlength="2" value="0"></td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<c:forEach items="${entrevistaSeleccionDTO.entrevistaSeleccion.boletinSeleccions }" var="boletin">
													<tr>
														<td>
															<input type="hidden" name="idMateria" value="${boletin.materia.id}">${boletin.materia.nombre}
															<input type="hidden" name="idBoletinSeleccions" value="${boletin.id}"> 
														</td>
														<td><input type="hidden" name="notaPrimTrim" class="digits" value="${boletin.notaPrimTrim}" size="10" maxlength="2" onchange="chequearDigitos(this);">
														<input type="hidden" name="notaSegTrim" class="digits" value="${boletin.notaSegTrim}" size="10" maxlength="2" onchange="chequearDigitos(this);">
														<input type="hidden" name="notaTerTrim" class="digits" value="${boletin.notaTerTrim}" size="10" maxlength="2" onchange="chequearDigitos(this);">
														<input type="text" name="notaFinal" class="digits" value="${boletin.notaFinal}" size="10" maxlength="2" onchange="chequearDigitos(this);">
														<input type="hidden" name="notaDiciembre" class="digits" value="${boletin.notaDiciembre}" size="10" maxlength="2" onchange="chequearDigitos(this);">
														<input type="hidden" name="notaMarzo" class="digits" value="${boletin.notaMarzo}" size="10" maxlength="2" onchange="chequearDigitos(this);"></td>
													</tr>
												</c:forEach>	
											</c:otherwise>
										</c:choose>
										
								   </tbody>
						</table>
						<br><br>
						<table>
							<tr><td><h1 align="left" id="titulo-informe">Carga de Boletín</h1></td></tr>
										<tr>
											<td>Boletín cargado actualmente si querés podes cargar uno nuevo. Si ves el logo de Cimientos es porque aún no lo cargaste.</td>
										</tr>
										<tr>	
											
											<td>			
											<a href="../entrevistaSeleccion/mostrarImagen.do?dni=${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}" target="_blank"> <img src="../entrevistaSeleccion/mostrarImagen.do?dni=${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}" width="100px"></a></td>			
										</tr>
										<tr>
											<td><center>Subir boletín
											<input name="foto" id="foto" type="file" onchange="validarExtension()"></center></td>
											
										</tr>		
										<tr>
											<td colspan="2"><font color="red">El tamaño de la foto del boletín no debe superar los 100kb y la extension debe ser "jpg"</font></td>
										</tr>
						
						</table>
						<br></br>
						<table>
							<tr>
								<td valign="top">
									<p><label>Materias Previas</label>
										<select name="materiasPrevias" id="materiasPrevias">
												<c:choose>
							    					<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiasPrevias == '0'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="0" selected="selected">0</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="+2">+2</option>									
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiasPrevias == '1'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="0" >0</option>
														<option value="1" selected="selected">1</option>
														<option value="2">2</option>
														<option value="+2">+2</option>											
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiasPrevias == '2'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="0">0</option>
														<option value="1">1</option>
														<option value="2" selected="selected">2</option>
														<option value="+2">+2</option>											
												    </c:when>
												    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.materiasPrevias == '+2'}">
							       						<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="0" >0</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="+2" selected="selected">+2</option>											
												    </c:when>
												    
												    <c:otherwise>						 	
														<option value=" ">Seleccione una opci&oacute;n:</option>
														<option value="0">0</option>
														<option value="1">1</option>
														<option value="2">2</option>
														<option value="+2">+2</option>			
												    </c:otherwise>
												</c:choose>
												
												
											</select>	
										
										<input type="hidden" id="observacionesMaterias" value="${entrevistaSeleccionDTO.entrevistaSeleccion.observacionesMaterias}" />
									</p>
								</td>
							</tr>	
						</table>
					
					</fieldset>
					
					<!-- DMS fin include boletinSeleccion -->
					
					<!-- Asistencia a clase -->
					<fieldset>
					<br></br>
						<legend class="card bg-info text-white"> Asistencia a Clase </legend>
					<br></br>	
						
						<!-- DMS include asistenciaClase -->
						
						<table cellspacing="3">
							<tr>
								<td colspan="3">
							</tr>
							<tr>
								<td valign="top">
									<p>
										<label><font color="green">Cantidad de inasistencias año pasado *</font></label>
										<c:choose>
											<c:when
												test="${entrevistaSeleccionDTO.entrevistaSeleccion.cantidadInasistenciaAnioPasado == null}">
												<input type="text"
													name="entrevistaSeleccion.cantidadInasistenciaAnioPasado"
													id="cantidadInasistenciaAnioPasado" class="required digits"
													value="0" maxlength="3" onblur="enableDisableInasistencia()"
													size="5" />
											</c:when>
											<c:otherwise>
												<input type="text"
													name="entrevistaSeleccion.cantidadInasistenciaAnioPasado"
													id="cantidadInasistenciaAnioPasado" size="5"
													class="required digits"
													value="${entrevistaSeleccionDTO.entrevistaSeleccion.cantidadInasistenciaAnioPasado}"
													maxlength="3" onblur="enableDisableInasistencia()" />
											</c:otherwise>
										</c:choose>
						
									</p>
								</td>
								<td valign="top">
									<p>
										<label>Motivo de inasistencias año pasado</label>
										<form:textarea
											path="entrevistaSeleccion.motivosInasistenciaAnioPasado" rows="3"
											cols="40" disabled="disabled" id="motivosInasistenciaAnioPasado"
											onblur="chequearLongitud(this);"
											onkeypress="chequearLongitud(this);" />
									</p>
								</td>
								<td></td>
							</tr>
							<tr>
								<td valign="top">
									<p>
										<font color="green"><label>Cantidad de inasistencias año en curso *</label></font>
										<c:choose>
											<c:when
												test="${entrevistaSeleccionDTO.entrevistaSeleccion.cantidadInasistenciaAnioCurso == null}">
												<input type="text"
													name="entrevistaSeleccion.cantidadInasistenciaAnioCurso"
													id="cantidadInasistenciaAnioCurso" class="required digits"
													value="0" maxlength="3" onblur="enableDisableInasistencia()"
													size="5" />
											</c:when>
											<c:otherwise>
												<input type="text"
													name="entrevistaSeleccion.cantidadInasistenciaAnioCurso"
													id="cantidadInasistenciaAnioCurso" class="required digits"
													onblur="enableDisableInasistencia()"
													value="${entrevistaSeleccionDTO.entrevistaSeleccion.cantidadInasistenciaAnioCurso}"
													size="5" />
											</c:otherwise>
										</c:choose>
									</p>
								</td>
								<td valign="top">
									<p>
										<label>Motivo de inasistencias año en curso</label>
										<form:textarea
											path="entrevistaSeleccion.motivosInasistenciaAnioCurso" rows="3"
											disabled="true" cols="40" id="motivosInasistenciaAnioCurso"
											onblur="chequearLongitud(this);"
											onkeypress="chequearLongitud(this);" />
									</p>
								</td>
								<td></td>
							</tr>
						
						</table>
													
						<!-- DMS fin include asistenciaClase -->
						
					</fieldset>
					
				<!-- DMS fin del include ficha candidato --> 
			
				</div>

				<h4 class="card bg-info text-white"	align="center">
					Responsable
				</h4>
				<div id="responsable"
					style="width: auto; height: auto; ">
			
			<!-- DMS eimino include page="fichaResponsable.jsp" y pego el codigo desplegado del archivo -->
			
					<!-- Datos Personales -->
						<fieldset>
						<br></br>
							<legend class="card bg-info text-white">Responsable 1</legend>
						<br></br>	
							<table id="tablaDatosResponsable">
								<tr>
									<td colspan="3"></td>
								</tr>
								<tr>
									<td>
										<p>
											<font color="green"><label for="Nombre">Nombre *</label></font>
											<input type="text"  onchange="this.value=this.value.toUpperCase();" id="responsableNombre" name="perfilAlumno.responsable1.nombre" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nombre}">
										</p>
									</td>
									<td>
										<p>
											<font color="green"><label>Apellido *</label></font>
											<input type="text" onchange="this.value=this.value.toUpperCase();" id="reponsableApellido" name="perfilAlumno.responsable1.apellido" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.apellido}">
										</p>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<p>
											<font color="green"><label>Tipo de DNI *</label></font>
												<select name="dni" id="responsableDni" class="required">
													<option value="">Seleccione una opci&oacute;n:</option>
													<c:forEach items="${listDni}" var="dni">
													<c:choose>
														<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idTipoDni.id == dni.id}">
															<option value="${dni.id}" selected="selected">${dni.valor}</option>
														</c:when>
														<c:otherwise>
															<option value="${dni.id}">${dni.valor}</option>
														</c:otherwise>
													</c:choose>	
													</c:forEach>
												</select>
										</p>
									</td>
									<td>
										<p>
											<table cellpadding="0" cellspacing="0">
												<tr>
													<td><font color="green"><label>N° de Documento *</label></font></td>
													<td><input type="text" id="dniResponsable" name="perfilAlumno.responsable1.dni" class="digits" maxlength="8" 
														value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.dni}" onblur="verificarCuil()" onkeyup="verificarCuil()"></input> </td>
													<td><label id="dniResponsableError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
												</tr>
											</table>
										</p>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<p>
											<font color="green"><label>Pais *</label></font> 
												<!--  input type="text" 	onchange="this.value=this.value.toUpperCase();" id="responsableNacionalidad" name="perfilAlumno.responsable1.nacionalidad" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad}"-->
										
												<select name="responsableNacionalidad" id="responsableNacionalidad" class="required" onchange="habilitarInputEstadoAlumno(this.value)">
											<c:choose>
						    					<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Argentina'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" selected="selected">Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Bolivia'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina">Argentina</option>
													<option value="Bolivia"  selected="selected">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Brasil'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil" selected="selected">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Chile'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile" selected="selected">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Colombia'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia" selected="selected">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Ecuador'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador" selected="selected">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Paraguay'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay" selected="selected">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Perú'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú" selected="selected">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Uruguay'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay" selected="selected">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Venezuela'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela" selected="selected">Venezuela</option>	
											    </c:when>
											    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad == 'Cuba'}">
						       						<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba" selected="selected">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>	
											    </c:when>
											    <c:otherwise>
												 	<option value=" ">Seleccione una opci&oacute;n:</option>
													<option value="Argentina" >Argentina</option>
													<option value="Bolivia">Bolivia</option>
													<option value="Brasil">Brasil</option>							
													<option value="Chile">Chile</option>
													<option value="Colombia">Colombia</option>
													<option value="Cuba">Cuba</option>
													<option value="Ecuador">Ecuador</option>
													<option value="Paraguay">Paraguay</option>
													<option value="Perú">Perú</option>
													<option value="Uruguay">Uruguay</option>
													<option value="Venezuela">Venezuela</option>
											    </c:otherwise>
											</c:choose>
											
											
										</select>
										
										
										</p>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<c:choose>
									<c:when test="${isNuevaEntrevista && !isOtraEntrevista}">
										<td>
										<p><font color="green"><label>Sexo *</label></font> 
											M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()" 
											value="true" class="required"> 
											F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
											value="false" class="required">
										</p>
									</td>
									</c:when>
									<c:when test="${isDetalleEntrevista}">
										<td>
											<p><font color="green"><label>Sexo *</label></font> 
												M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()"
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}"> checked="checked"</c:if>  value="true" class="required"> 
												F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" class="required">
											
											</p>
										</td>
									</c:when>
									<c:when test="${isOtraEntrevista}">
										<td>
											<p><font color="green"><label>Sexo *</label></font> 
												M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()"
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}"> checked="checked"</c:if>  value="true" class="required"> 
												F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" class="required">
											
											</p>
										</td>
									</c:when>
									<c:when test="${!isDetalleEntrevista && !isOtraEntrevista}">
										<td>
											<p><font color="green"><label>Sexo *</label></font> 
												M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()"
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}"> checked="checked"</c:if>  value="true" class="required"> 
												F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
												<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" class="required">
											
											</p>
										</td>
									</c:when>
									</c:choose>
									
									
									
									
									<td>
										<p><font color="green"><label for="fechaNacimiento">Fecha de Nacimiento: *</label></font> 
										
										<input name="perfilAlumno.responsable1.fechaNacimiento" id="fechaNacimientoRes"  value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.fechaNacimiento}" pattern="dd/MM/yyyy"/>" onchange="llenarFechaHidden()"> 
										</p>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<p>
											<label>CUIL *</label>
											<input type="text" name="perfilAlumno.responsable1.cuilCuit" id="cuil" class="required"   readonly="readonly"
												value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.cuilCuit}" style="background: #E6E6E6;" >
										</p>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td>
									<p>
											<label>Teléfono 1 (cargá el código de área)</label>
												<input type="text" onchange="this.value=this.value.toUpperCase();" maxlength="19"  name="perfilAlumno.responsable1.telefono1" id="responsableTelefono1" 
													value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono1 }" onkeypress="return justNumbers(event);">
										</p>
										
									</td>
									<td>
										<p>
											<label>Contacto 1</label>
												<input type="text" onchange="this.value=this.value.toUpperCase();"  name="perfilAlumno.responsable1.contactoTelefono1" id="responsableContactoTelefono1" 
													value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.contactoTelefono1 }">
										</p>
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<p>
											<label>Teléfono 2 (cargá el código de área)</label>
												<input type="text" onchange="this.value=this.value.toUpperCase();"  maxlength="19"  name="perfilAlumno.responsable1.telefono2" id="responsableTelefono2"
													value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono2 }" onkeypress="return justNumbers(event);">
										</p>
										
									</td>
									<td>
										<p>
											<label>Contacto 2</label>
												<input type="text" onchange="this.value=this.value.toUpperCase();"  name="perfilAlumno.responsable1.contactoTelefono2" id="responsableContactoTelefono2" 
													value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.contactoTelefono2 }">
										</p>	
									</td>
									<td></td>
								</tr>
								<tr>
									<td>
										<p>
											<font color="green"><label>Vínculo *</label></font>
												<select name="vinculoRA" id="vinculoRespo" class="required">
													<option value="">Seleccione una opci&oacute;n:</option>
													<c:forEach items="${listVinculo}" var="vinculo">
														<c:choose>
															<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idVinculo.id == vinculo.id}">
																	<option value="${vinculo.id}" selected="selected">${vinculo.valor}</option>
															</c:when>
															<c:otherwise>
																	<option value="${vinculo.id}">${vinculo.valor}</option>
															</c:otherwise>	
														</c:choose>
													</c:forEach>
												</select>
										</p>
									</td>
									<td></td>
									<td></td>
								</tr>
								<tr>
									<td colspan="3">
										<label>NO asiste a entrevista</label>
										<input type="checkbox" name="perfilAlumno.responsable1.noAsisteEntrevista"
											<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.noAsisteEntrevista}"> checked="checked"</c:if> id="noAsisteEntrevista" onclick="habilitarRA2()" >
										<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
										<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
									</td>
								</tr>
							</table>
							<!-- DOMICILIO RA -->
							<input type="hidden" id="direccionRA" name="perfilAlumno.responsable1.calle"></input>
							<input type="hidden" id="codPostalRA" name="perfilAlumno.responsable1.codigoPostal"></input> 
							<input type="hidden" id="entreCallesRA" name="perfilAlumno.responsable1.entreCalles"></input> 
							<input type="hidden" id="nroCalleRA" name="perfilAlumno.responsable1.nroCalle"></input> 
							<input type="hidden" id="idLocalidadRA" name="perfilAlumno.responsable1.idLocalidad"></input>
							<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
							<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
						</fieldset>
						<!-- Fin de datosPErsonales -->
						<fieldset>
						<br></br>
							<legend class="card bg-info text-white">Responsable 2</legend>
						<br></br>
						
						<!-- DMS despliego include ficharesponsable2 -->	
							
												
						<table width="80%;" id="tablaDatosResponsable2">
							<tr>
								<td colspan="3"></td>
							</tr>
							<c:choose>
							<c:when test="${!empty entrevistaSeleccionDTO}">
							<tr>
								<td>
									<p>
										<font color="black"><label for="Nombre">Nombre *</label></font>
										<input type="text"  onchange="this.value=this.value.toUpperCase();" name="perfilAlumno.responsable2.nombre"  id="nombreResponsable2" class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nombre}">
									</p>
								</td>
								<td>
									<p>
										<font color="black"><label>Apellido *</label></font>
										<input type="text"  onchange="this.value=this.value.toUpperCase();" name="perfilAlumno.responsable2.apellido" id="apellidoResponsable2"  class="required" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.apellido}">
									</p>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>
									<p>
										<label for="telefono"><b>Teléfono 1</b></label> 
											<input type="text" onchange="this.value=this.value.toUpperCase();"  name="perfilAlumno.responsable2.telefono1" id="responsable2Telefono1" 
											value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.telefono1 }" class="digits"/>
									</p>
								</td>
									
								</td>
								<td>
									<p>
										<label>Contacto 1</label>
											<input type="text" onchange="this.value=this.value.toUpperCase();"  name="perfilAlumno.responsable2.contactoTelefono1" id="responsable2ContactoTelefono1"
											value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.contactoTelefono1 }">
									</p>
									
								<td></td>
							</tr>
							<tr>
								<td>
									<p>
										<font color="black"><label>Vínculo *</label></font>
											<select name="vinculoRA2" id="vinculoRespo2" disabled="disabled" class="required">
												<option value="">Seleccione una opci&oacute;n:</option>
												<c:forEach items="${listVinculo}" var="vinculo">
													<c:choose>
														<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.idVinculo.id == vinculo.id}">
																<option value="${vinculo.id}" selected="selected">${vinculo.valor}</option>
														</c:when>
														<c:otherwise>
																<option value="${vinculo.id}">${vinculo.valor}</option>
														</c:otherwise>	
													</c:choose>
												</c:forEach>
											</select>
									</p>
								</td>
							</tr>
							</c:when>
							<c:otherwise>
							<tr>
								
							</tr>
							<tr>		
								<td><font color="black"><label>Apellido *</label></font></td>
								<td>
									<input type="text" onchange="this.value=this.value.toUpperCase();"  name="responsable2.apellido" id="apellidoResponsable2" class="required" value="${perfilAlumno.responsable2.apellido}">
								</td>
							</tr>
							<tr>
								<td><label for="telefono">Teléfono</label></td>
								<td>
									<input type="text" onchange="this.value=this.value.toUpperCase();"  name="responsable2.telefono1" id="responsable2Telefono1" 
									value="${perfilAlumno.responsable2.telefono1 }" class="digits"/>
								</td>	
							</tr>
							<tr>
								<td><label>Contacto</label></td>
								<td>
									<input type="text" onchange="this.value=this.value.toUpperCase();"  name="responsable2.contactoTelefono1" id="responsable2ContactoTelefono1" 
									value="${perfilAlumno.responsable2.contactoTelefono1 }">
								</td>
								
							</tr>
							<tr>
								<td><font color="black"><label>Vínculo *</label></font></td>
								<td>
									<select name="vinculoRA2" id="vinculoRespo2" disabled="disabled" class="required">
										<option value="">Seleccione una opci&oacute;n:</option>
											<c:forEach items="${listVinculo}" var="vinculo">
												<c:choose>
													<c:when test="${perfilAlumno.responsable2.idVinculo.id == vinculo.id}">
														<option value="${vinculo.id}" selected="selected">${vinculo.valor}</option>
													</c:when>
													<c:otherwise>
														<option value="${vinculo.id}">${vinculo.valor}</option>
													</c:otherwise>	
												</c:choose>
											</c:forEach>
										</select>
								</td>
							</tr>
							</c:otherwise>
							</c:choose>
						</table>
						
						<!-- DMS fin include -->
						
						<!-- DOMICILIO RA -->
						
					<!--	<input type="hidden" id="idLocalidadRA" name="perfilAlumno.responsable1.idLocalidad"></input> -->
												
											
						</fieldset>
						
						<!-- Datos generales -->
						<fieldset>
							
												<input type="hidden" name="perfilAlumno.responsable1.informacionComplementaria" id="informacionComplementaria"/>
										
												<input type="hidden" name="perfilAlumno.responsable1.percepcionesSobreRA" id="percepcionesSobreRA" />
										
													<input type="hidden" name="compromisoEscolaridad" id="compromisoEscolaridad" value="3">
														
													<input type="hidden"t name="posibilidadCompromisoPBE" id="posibilidadCompromisoPBE" value="3">
														
													<input type="hidden" name="aptoComoRA" id="aptoComoRA" value="3">
														
													<input type="hidden" name="identrevistador" id="identrevistador" value=" ">
													
											
						</fieldset>
						<!-- fIN dATOS GENERALES -->
						<!-- Datos Bancarios -->
						<fieldset>
						<br></br>
							<legend class="card bg-info text-white"> Datos Bancarios</legend>
						<br></br>	
							<table>
								<tr>
									<td colspan="3">
								</tr>
								<tr>
									<td>
										<p>
											<font color="green"><label>Sucursal *</label></font>
											<!-- Esta combo se popula cuando  se selecciona una Escuela. el metodo javascript que maneja esto esta en  fichaCandidato.jsp se llama 
												populateComboSucursal, y el metodo que trae los datos por ajax buscarSucursalBancoPorZona que se llama cuando se activa el autocompletar de Escuela
													  -->
												<select id="respoSucursal" style="width: 208px;" name="perfilAlumno.responsable1.sucursalBanco.id" class="required" onchange="seleccionarBanco(this.value);"  >
													<option value="">Seleccione una opci&oacute;n:</option>
													<c:choose>
													
														<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.id != null}">
																<option id="removerOption" selected="selected" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.id}" >
																${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.banco.nombre}, ${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.nombre}</option>
															
														</c:when>
														<c:otherwise>
																<option id="removerOption"></option>
														</c:otherwise>
													</c:choose>
												</select>
											
										</p>
									</td>
									<td align="center">
										<p>
											<label>Banco</label>
											<input name="respoBanco" id="respoBanco" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.banco.nombre}" >
										</p>
									
									</td>
								</tr>
								<tr>			
									<td >
										<p>
											<label>N&uacute;mero de Cuenta</label>
											<input  type="text" id="numeroCuentaRespo" disabled="disabled"  value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nroCuenta}" >					
										</p>
									</td>
								</tr>	
							</table>
						</fieldset>

			
			<!-- DMS fin del include ficha responsable -->
			
				</div>

				<h4 class="card bg-info text-white"
					align="center">
					Ficha Familiar
				</h4>
				<div id="fichaFamiliar"
					style="width: auto; height: auto;">
			
			<!-- DMS eimino include page="fichaFamiliar.jsp" y pego el codigo desplegado del archivo -->
			
			
									<br></br>
				<table id="tablaFicha" border="0" width="80%" style="font-size: x-small">
							
							<thead align="center" >
								<tr >
									<th></th>
									<th width="100px">V&iacute;nculo</th>
									<th width="100px">Nombre</th>
									<th width="100px">Apellido</th>
									<th width="100px">Edad</th>
									<th width="100px">Convive </th>
									<th width="100px">Max. nivel educativo alcanzado</th>
									<th width="100px">Motivo de abandono / repitencia</th>
									<th width="100px">(Si trabaja) Nombre de la ocupaci&oacute;n </th>
									<th width="100px">Estabilidad Laboral</th>
									<th width="100px">Remuneración</th>
									<th width="100px">Otros Ingresos(jubilaci&oacute;n/pensi&oacute;n/AuxHijo)</th>
								</tr>
							</thead>
							<tbody id="tbody">
								<c:if test="${!empty entrevistaSeleccionDTO.perfilAlumno.fichaFamiliar}">
									<c:forEach items="${entrevistaSeleccionDTO.fichasFamiliares}" var="fichaFamiliar" varStatus="loop">
											<script>
												incrementarCounter();
												
											</script>
											<tr id="fila<c:out value="${loop.count}"/>">
												<td><input type="checkbox" value="fila<c:out value="${loop.count}"/>"></td>
												<td align="left" valign="middle" style="font-size: 12px;">
													<select name="vinculoFFs" id="vinculoFicha" >
														<c:forEach items="${listVinculo}" var="vinculoFicha">
															<c:choose>
																<c:when test="${fichaFamiliar.vinculo.id == vinculoFicha.id}">
																		<option value="${vinculoFicha.id}" selected="selected">${vinculoFicha.valor}</option>
																</c:when>
																<c:otherwise>
																		<option value="${vinculoFicha.id}">${vinculoFicha.valor}</option>
																</c:otherwise>	
															</c:choose>
														
														</c:forEach>
													</select>
												</td>
												<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="nombreFichas" id="nombreFichas" value="${fichaFamiliar.nombre}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
												<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas" id="apellidoFichas"  value="${fichaFamiliar.apellido}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
												<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" size="2" id="edadFichas" value="${fichaFamiliar.edad}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
												
												<td align="left" valign="middle" style="font-size: 12px;">
												<select name="conviveFichas" id="conviveFichas" >
													<c:forEach items="${listConvive}" var="convive">
														<c:choose>
															<c:when test="${fichaFamiliar.convive.id == convive.id}">
																<option value="${convive.id}" selected="selected">${convive.valor}</option>
															</c:when>
															<c:otherwise>
																	<option value="${convive.id}">${convive.valor}</option>
															</c:otherwise>	
														</c:choose>
													</c:forEach>
												</select>
												</td>
												<td align="left" valign="middle" style="font-size: 12px;">
												<select name="nivelEducativoFichas" id="nivelEducativoFichas" >
													<c:forEach items="${listNivelEducativo}" var="nivelEducativo">
														<c:choose>
															<c:when test="${fichaFamiliar.nivelEducativo.id == nivelEducativo.id}">
																<option value="${nivelEducativo.id}" selected="selected">${nivelEducativo.valor}</option>
															</c:when>
															<c:otherwise>
																	<option value="${nivelEducativo.id}">${nivelEducativo.valor}</option>
															</c:otherwise>	
														</c:choose>
													</c:forEach>
												</select>
												</td>
												<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="abandonoRepitenciaFichas"  id="abandonoRepitenciaFichas" value="${fichaFamiliar.abandonoRepitencia}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
												<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" id="ocupacionLaboralFichas" value="${fichaFamiliar.ocupacionLaboral}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
												<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" id="estabilidadLaboralFichas"  value="${fichaFamiliar.estabilidadLaboral}" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>
												<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();" id="renumeracionFichas" value="${fichaFamiliar.renumeracion}"></td>
												<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();" id="otrosIngresosFichas" value="${fichaFamiliar.otrosIngresos}"></td>
											</tr>
									</c:forEach>
								</c:if>
						</tbody>
				</table>
				
				<br>
				
				<table>
					<tr>
						<td>
							<input type="button" value="Agregar Familiar" id="botonAgregarFicha" class="ui-state-default ui-corner-all"/>
							<input type="hidden" id="contadorFicha" name="contadorFicha">
							<input type="hidden" id="deNombreFF" name="deNombreFF">
							<input type="button" value="Eliminar Familiar" id="botonBorrarFicha" class="ui-state-default ui-corner-all"/>
						</td>
					</tr>
				</table>
				
				<br><br>
				
				<table>
					<tr>
						<td>
							<p><font color="green"><label>Relación con la vivienda *</label></font>
							<select name="relacionVivienda" id="relacionViviendaFicha" class="required">
								<option value="">Seleccione una opci&oacute;n:</option>
								<c:forEach items="${listRelacionVivienda}" var="relacionVivienda">
									<c:choose>
										<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idRelacionVivienda.id == relacionVivienda.id}">
												<option value="${relacionVivienda.id}" selected="selected">${relacionVivienda.valor}</option>
										</c:when>
										<c:otherwise>
												<option value="${relacionVivienda.id}">${relacionVivienda.valor}</option>
										</c:otherwise>	
									</c:choose>
								</c:forEach>
							</select></p>
							
							
								<input type="hidden"  name="perfilAlumno.responsable1.egresosTotales" id="egresosTotalesFicha"  
									value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.egresosTotales}">	
							
							
							<p><label>Ingresos Totales</label>
								<input name="entrevistaSeleccion.ingresosTotalesFichaFamiliar" id="ingresosTotales" 
									value="${entrevistaSeleccionDTO.entrevistaSeleccion.ingresosTotalesFichaFamiliar}" class="digits" disabled="disabled"/>	
							</p>
							
							<p><label>Observaciones Egresos/Ingresos</label>
								<form:textarea path="entrevistaSeleccion.observacionesEgresoIngreso" rows="4" cols="40" id="observacionesEgresoIngreso" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
							</p>
							
						</td>
					</tr>
				</table>
				<br></br>
			
			
				</div>

				<h4 class="card bg-info text-white"
					align="center">
					Evaluación del Candidato
				</h4>
				<div id="observacionesGenerales"
					style="width: auto; height: auto; ">
			
			
			<!-- DMS eimino include page="observacionesGenerales.jsp" y pego el codigo desplegado del archivo -->
			
					ENTREVISTA DE SELECCION 
					<table>
							<tr>
								<td>
								<label>Problemas de salud del becado?</label>
								Si<input type="radio" id="entrevistaSeleccion.saludBecado" name="entrevistaSeleccion.saludBecado" 
								  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludBecado}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
								No<input type="radio" id="entrevistaSeleccion.saludBecado" name="entrevistaSeleccion.saludBecado"
								  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludBecado == false}"> checked="checked"</c:if> value="false">			
								</td>
							</tr>
							<tr>
								<td>
								<label>Cuales?</label>
									<form:textarea path="entrevistaSeleccion.saludBecadoCual" rows="4" cols="40" id="saludBecadoCual" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
								
								</td>	
							</tr>
					    		
					</table>
					<table>
							<tr>
								<td>
								<label>Problemas de salud Familiar?</label>
								Si<input type="radio" id="entrevistaSeleccion.saludFamilia" name="entrevistaSeleccion.saludFamilia" 
								  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludFamilia}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
								No<input type="radio" id="entrevistaSeleccion.saludFamilia" name="entrevistaSeleccion.saludFamilia"
								  <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludFamilia == false}"> checked="checked"</c:if> value="false">			
								</td>
							</tr>
							<tr>	
								<td>
								<label>Cuales?</label>
									<form:textarea path="entrevistaSeleccion.saludFamiliarCual" rows="4" cols="40" id="saludFamiliarCual" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
								
								</td>	
							</tr>
					    		
					</table>
					<br><br>
					
					<br></br>
						<p><label>Información complementaria y evaluación</label>
							<form:textarea path="entrevistaSeleccion.observacionesGenerales" rows="4" cols="40" id="observacionesGenerales" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
						</p>
					<br></br>
						<p><label>Uso del tiempo libre</label>
							<select name="tiempoLibre" id="tiempoLibre">
										<c:choose>
					    					<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Salir con amigos'}">
					       						<option value=" ">Seleccione una opci&oacute;n:</option>
												<option value="Escuchar música">Escuchar música</option>
												<option value="Estar con la familia">Estar con la familia</option>								
												<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
												<option value="Hacer deporte">Hacer deporte</option>
												<option value="Leer">Leer</option>
												<option value="Navegar en Internet">Navegar en internet</option>
												<option value="Salir con amigos" selected="selected">Salir con amigos</option>															
										    </c:when>
										    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Escuchar música'}">
					       						<option value=" ">Seleccione una opci&oacute;n:</option>
												<option value="Escuchar música" selected="selected">Escuchar música</option>
												<option value="Estar con la familia">Estar con la familia</option>								
												<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
												<option value="Hacer deporte">Hacer deporte</option>
												<option value="Leer">Leer</option>
												<option value="Navegar en Internet">Navegar en internet</option>
												<option value="Salir con amigos">Salir con amigos</option>															
										    </c:when>
										    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Estar con la familia'}">
					       						<option value=" ">Seleccione una opci&oacute;n:</option>
												<option value="Escuchar música">Escuchar música</option>
												<option value="Estar con la familia" selected="selected">Estar con la familia</option>								
												<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
												<option value="Hacer deporte">Hacer deporte</option>
												<option value="Leer">Leer</option>
												<option value="Navegar en Internet">Navegar en internet</option>
												<option value="Salir con amigos">Salir con amigos</option>																
										    </c:when>
										    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Hacer actividades artísticas'}">
					       						<option value=" ">Seleccione una opci&oacute;n:</option>
												<option value="Escuchar música">Escuchar música</option>
												<option value="Estar con la familia">Estar con la familia</option>								
												<option value="Hacer actividades artísticas" selected="selected">Hacer actividades artísticas</option>
												<option value="Hacer deporte">Hacer deporte</option>
												<option value="Leer">Leer</option>
												<option value="Navegar en Internet">Navegar en internet</option>
												<option value="Salir con amigos">Salir con amigos</option>														
										    </c:when>
										    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Hacer deporte'}">
					       						<option value=" ">Seleccione una opci&oacute;n:</option>
												<option value="Escuchar música">Escuchar música</option>
												<option value="Estar con la familia">Estar con la familia</option>								
												<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
												<option value="Hacer deporte" selected="selected">Hacer deporte</option>
												<option value="Leer">Leer</option>
												<option value="Navegar en Internet">Navegar en internet</option>
												<option value="Salir con amigos">Salir con amigos</option>																
										    </c:when>
										    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Leer'}">
					       						<option value=" ">Seleccione una opci&oacute;n:</option>
												<option value="Escuchar música">Escuchar música</option>
												<option value="Estar con la familia">Estar con la familia</option>								
												<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
												<option value="Hacer deporte">Hacer deporte</option>
												<option value="Leer" selected="selected">Leer</option>
												<option value="Navegar en Internet">Navegar en internet</option>
												<option value="Salir con amigos">Salir con amigos</option>													
										    </c:when>
										    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.tiempoLibre == 'Navegar en internet'}">
					       						<option value=" ">Seleccione una opci&oacute;n:</option>
												<option value="Escuchar música">Escuchar música</option>
												<option value="Estar con la familia">Estar con la familia</option>								
												<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
												<option value="Hacer deporte">Hacer deporte</option>
												<option value="Leer">Leer</option>
												<option value="Navegar en Internet" selected="selected">Navegar en internet</option>
												<option value="Salir con amigos">Salir con amigos</option>														
										    </c:when>
										    
										    <c:otherwise>						 									
												<option value=" ">Seleccione una opci&oacute;n:</option>
												<option value="Escuchar música">Escuchar música</option>
												<option value="Estar con la familia">Estar con la familia</option>								
												<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
												<option value="Hacer deporte">Hacer deporte</option>
												<option value="Leer">Leer</option>
												<option value="Navegar en Internet">Navegar en internet</option>
												<option value="Salir con amigos">Salir con amigos</option>	
										    </c:otherwise>
										</c:choose>
									</select>	
						</p>
							<br></br>
						<p><label>Cuando termine la secundaria me gustaría</label>
							<textarea rows="4" cols="40" id="cuandoTermine" name="cuandoTermine" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.cuandoTermine2}</textarea>
						</p>
					<br></br>
						<p><label>Vos mismo</label>		
							<textarea rows="4" cols="40" id="vosMismo" name="vosMismo" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.vosMismo}</textarea>
						</p>
						
					<br></br>
						<p><label>Trabajás?</label>
							<textarea rows="4" cols="40" id="trabajas" name="trabajas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.trabajas}</textarea>
						</p>
					<br></br>
						<p><label>En Qué?</label>
							<textarea rows="4" cols="40" id="enQue" name="enQue" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.enQue}</textarea>
						</p>
					<br></br>
						<p><label>Responsabilidad</label>
							<textarea rows="4" cols="40" id="responsabilidad" name="responsabilidad" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.responsabilidad}</textarea>
						</p>
					<br></br>
						<p><label>Repetiste?</label>
							<textarea rows="4" cols="40" id="repetiste" name="repetiste" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste}</textarea>
						</p>
					<br></br>
						<p><label>Por qué repetiste?</label>
							<textarea rows="4" cols="40" id="porQueRepetiste" name="porQueRepetiste" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.porQueRepetiste}</textarea>
						</p>				
					<br></br>
						<p><label>Abandonaste?</label>
							<textarea rows="4" cols="40" id="abandonaste" name="abandonaste" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.abandonaste}</textarea>
						</p>
					<br></br>
						<p><label>Por qué abandonaste?</label>
							<textarea rows="4" cols="40" id="porQueAbandonaste" name="porQueAbandonaste" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.porQueAbandonaste}</textarea>
						</p>		
					<br></br>
						<p><label>Situación Escolar Año Pasado</label>
							<textarea rows="4" cols="40" id="situacionEscolarAnioPasado" name="situacionEscolarAnioPasado" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.situacionEscolarAnioPasado}</textarea>
						</p>
					<br></br>
						<p><label>Previas</label>
							<textarea rows="4" cols="40" id="previas" name="previas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.previas}</textarea>
						</p>
					<br></br>
						<p><label>Cuáles Previas</label>
							<textarea rows="4" cols="40" id="cualesPrevias" name="cualesPrevias" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.cualesPrevias}</textarea>
						</p>	
					<br></br>
						<p><label>Desempeño</label>
							<textarea rows="4" cols="40" id="desempenio" name="desempenio" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.desempenio}</textarea>
						</p>
					<br></br>
						<p><label>Por qué desempeño?</label>
							<textarea rows="4" cols="40" id="porQueDesempenio" name=porQueDesempenio onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.porQueDesempenio}</textarea>
						</p>		
					<br></br>
						<p><label>Faltas</label>
							<textarea rows="4" cols="40" id="faltas" name="faltas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.faltas}</textarea>
						</p>	
					<br></br>
						<p><label>Motivos de faltas</label>
							<textarea rows="4" cols="40" id="motivosFaltas" name="motivoFaltas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.motivoFaltas}</textarea>
						</p>			
					<br></br>
						<p><label>Materias Preferidas</label>
							<textarea rows="4" cols="40" id="materiasPreferidas" name="materiasPreferidas" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.materiasPreferidas}</textarea>	
							</p>	
					<br></br>
						<p><label>Materias Cuestan</label>
							<textarea rows="4" cols="40" id="materiaCuesta" name="materiaCuesta" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.materiaCuesta}</textarea>
						</p>	
					<br></br>
						<p><label>Comentario Adicional</label>
							<textarea rows="4" cols="40" id="comentarioAdicional" name="comentarioAdicional" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.comentarioAdicional}</textarea>
						</p>
					<br></br>
						<p><label>Aportar PFE</label>
							<textarea rows="4" cols="40" id="aportarPFE" name="aportarPFE" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.aportarPFE}</textarea>
						</p>		
					<br></br>
						<p><label>Cognitivo</label>
							<textarea rows="4" cols="40" id="cognitivo" name="cognitivo" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.cognitivo}</textarea>
						</p>
					<br></br>
						<p><label>riesgo Extra Escolar</label>
							<textarea rows="4" cols="40" id="riesgoExtraEscolar" name="riesgoExtraEscolar" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.riesgoExtraEscolar}</textarea>
						</p>	

		<!-- DMS fin include observaciones generales -->
		
		
				</div>

			</div>
			<c:choose>
				<c:when test="${isDetalleEntrevista}">
					<table align="center">
						<tr>
							<td><input type="button" value="Volver"
								class="ui-state-default ui-corner-all" id="buttonVolver"
								onclick="location.href='../entrevistaSeleccion/reporteEntrevistaSeleccion.do'; return false;" />
							</td>
						</tr>
					</table>
				</c:when>
				<c:otherwise>
					<table align="center">
						<tr>
							<td><input class="ui-state-default ui-corner-all "
								type="button" value="Finalizado"
								onclick="enviarForm('finalizado')" /></td>
						</tr>
					</table>
				</c:otherwise>
			</c:choose>
		</form:form>
	</div>
	
	  --%>
	
</body>
</html>