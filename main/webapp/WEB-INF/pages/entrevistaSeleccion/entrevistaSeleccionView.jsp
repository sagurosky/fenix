<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="mif" uri="/list-operator.tld" %>
<%@ page import="java.util.List" %>
<%@ page import="org.cimientos.intranet.modelo.FichaFamiliar" %>
<%@ page import="org.cimientos.intranet.dto.EntrevistaSeleccionDTO" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<div ID="waitDiv"
	style="position: absolute; left: 380; top: 280; visibility: hidden; filter: alpha(opacity : 80);">
	<center>
		<table border=0 cellpadding=0 cellspacing=0 width="1130" height="3600">
			<tr>
				<td bgcolor="#000000">
					<table cellpadding=2 cellspacing=1 border=0 width="1130"
						height="3600">
						<tr>
							<td bgcolor="#000000">
								<table width="450" height="20">
									<tr>
										<td bgcolor="#FBFAFA">
											<center>
												<font color="#786C6C"
													face="Verdana, Arial, Helvetica, sans-serif" size="3">
													<img src="../static/images/busy.gif" /><b>Espere por
														favor...</b>
												</font>
											</center>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</center>
</div>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"
	media="all">
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<link rel="stylesheet" type="text/css"
	href="../pages/includes/jquery.tabs.css" />
<script type="text/javascript"
	src="<c:url  value="/static/js/dFilter.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<script>
$(document).ready(function(){
	$('#mismoRA').click(function(){
		
		document.getElementById("fechaNacimientoRA2").readOnly = true;
		document.getElementById("apellidoRA2").readOnly = true;
		document.getElementById("nombreRA2").readOnly = true;
		document.getElementById("dniRA2").readOnly = true;
		document.getElementById("celularRA2").readOnly = true;
		document.getElementById("generoRA2").readOnly = true;
		document.getElementById("paisRA2").readOnly = true;		
		document.getElementById("vinculoRA2").readOnly = true;
		document.getElementById("cuitRA2").readOnly = true;
		
});
});	
</script>

<script>
	$(document).ready(function(){
	$('#mismoRA').click(function(){
			$('#mostrarRABanco').hide(500);		
				
});
});
</script>

<script>
	$(document).ready(function(){
	$('#otroRA').click(function(){
			$('#mostrarRABanco').show(500);		
				
});
});
</script>


    
<script>
$(document).ready(function(){

		document.getElementById("fechaNacimientoRA2").readOnly = true;
		document.getElementById("apellidoRA2").readOnly = true;
		document.getElementById("nombreRA2").readOnly = true;
		document.getElementById("dniRA2").readOnly = true;
		document.getElementById("celularRA2").readOnly = true;
		document.getElementById("generoRA2").readOnly = true;
		document.getElementById("paisRA2").readOnly = true;		
		document.getElementById("vinculoRA2").readOnly = true;
		document.getElementById("cuitRA2").readOnly = true;
		
		
	$('#otroRA').click(function(){
		
		document.getElementById("fechaNacimientoRA2").readOnly = false;
		document.getElementById("apellidoRA2").readOnly = false;
		document.getElementById("nombreRA2").readOnly = false;
		document.getElementById("dniRA2").readOnly = false;
		document.getElementById("celularRA2").readOnly = false;
		document.getElementById("generoRA2").readOnly = false;
		document.getElementById("paisRA2").readOnly = false;		
		document.getElementById("vinculoRA2").readOnly = false;
		document.getElementById("cuitRA2").readOnly = false;
		
});
});	
</script> 
<script type="text/javascript">


 
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
 
</script>

<script type="text/javascript">
 
function calcular_fecha(fecha){
    var today = new Date();
    var fe = new Date($("#fechaEntrevista").datepicker("getDate"));    
    if (fe>today){
    	alert("La fecha de la entrevista tiene que ser menor o igual a la fecha actual. \n");
    }
    
}
 
</script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>

var counter = 0;
var contadorff=0;

function incrementarCounter(){
	
	counter++;
	//alert();
	
	
}



$(document).ready(function(){
	
	
	
	$("#botonAgregarFicha").click(function () {
		var counterMasUno=counter+1;
		var selectVinculo ='<select name="vinculoFFs" id="vinculo'+counterMasUno+'" class=" form-control p-0"style="font-size: 12px;" ><option ></option>'+
						   	'<c:forEach items="${listVinculo}" var="vinculo"><option value="${vinculo.id}" >${vinculo.valor}</option></c:forEach></select>';
		var selectConviveFichas ='<select name="conviveFichas" id="conviveFichas'+counterMasUno+'" style="display:none"><option ></option>'+
								 '<c:forEach items="${listConvive}" var="convive"><option value="${convive.id}">${convive.valor}</option></c:forEach></select>';
		var selectNivelEducativo ='<select name="nivelEducativoFichas" id="nivelEducativoFichas'+counterMasUno+'" class=" form-control p-0" style="font-size: 12px;" ><option></option>'+
								  '<c:forEach items="${listNivelEducativo}" var="nivelEducativo"><option value="${nivelEducativo.id}">${nivelEducativo.valor}</option></c:forEach></select>';						 
									  
		counter++;
		//contadorff++;
		contadorff=counter;
		
		$('#tbody').append('<tr id="fila' + counterMasUno + '">'+
				'<td><input type="checkbox" value="fila' + counterMasUno + '"></td>'+
				'<td>' + selectVinculo + '</td>'+
				'<td><input type="text" name="apellidoFichas" id="apellidoFichas'+counterMasUno+'" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);" class=" form-control p-0" style="font-size: 12px;" size="30"></td>'+
				'<td><input type="text" id="nombreFichas'+counterMasUno+'" name="nombreFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);" class=" form-control p-0" style="font-size: 12px; " size="25"></td>'+
				'<td><input type="text" name="edadFichas"id="edadFichas'+counterMasUno+'" class=" form-control p-0" style="font-size: 12px;"size="2" size="2"></td>'+
				'<td>' + selectNivelEducativo + '</td>'+
				'<td><input type="text"  name="estabilidadLaboralFichas" id="estabilidadLaboralFichas'+counterMasUno+'" class=" form-control p-0" style="font-size: 12px;"></td>'+
				'<td><input type="text" class=" form-control p-0" style="font-size: 12px;"name="ocupacionLaboralFichas" id="ocupacionLaboralFichas'+counterMasUno+'"></td>'+
				'<td><input type="text"  class=" form-control p-0" style="font-size: 12px;"name="tipoTrabajoFichas" id="tipoTrabajoFichas'+counterMasUno+'"></td>'+
				'<td><input type="text"  name="renumeracionFichas" id="renumeracionFichas'+counterMasUno+'" class=" form-control p-0" style="font-size: 12px;"></td>'+
				'<input type="hidden" name="conviveFichas" id="conviveFichas" />'+
				'<input type="hidden" name="abandonoRepitenciaFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);">'+
				'<input type="hidden" name="condicionLaboralFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);">'+
				'<input type="hidden" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();">'+
				'</tr>');
		
			
		
		
// 		$("#tablaFicha :text").css("width", "80px");
		$("#contadorFicha").val(contadorff);
		
		$("#nombreFichas").change(function(){
			//alert(2);
			$("#deNombreFF").val($(this).val());
			});
		
		//document.getElementById("deNombreFF").value = document.getElementById("nombreFichas").value;
		
		
	}); 
	
	
// 	<th style="min-width: 100px; ">V&iacute;nculo</th>
//     <th style="min-width: 50px;">Apellido</th>
//     <th style="min-width: 50px;">Nombre</th>
//     <th style="min-width: 20px;">Edad</th>
//     <th style=" min-width: 150px; ">M&aacute;x. nivel educativo alcanzado</th>
//     <th style="min-width: 120px;">Condici&oacute;n laboral</th>
//     <th>Ocupaci&oacute;n</th>
//     <th style="min-width: 210px;">Tipo de trabajo</th>
//     <th style="width:100px;">Remuneraci&oacute;n mensual</th>
	
	
	
	
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
	
// 	$("#tablaFicha :text").css("width", "80px");
	$("#contadorFicha").val(contadorff);
	
	$("#nombreFichas").change(function(){
		//alert(2);
		$("#deNombreFF").val($(this).val());
		});
	
	}
	//document.getElementById("deNombreFF").value = document.getElementById("nombreFichas").value;
	
	
});
});

</script>


<script type="text/javascript">

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
// 	jQuery.validator.messages.required = "(*)";
	jQuery.validator.messages.minlength = "Ingrese al menos 7 digitos";
	var estado1 = document.getElementById("estados").value;
	var convocatoria = document.getElementById("convocatoria").value;
	habilitarInputEstadoAlumno(estado1);
	
	
	//DMS decido anular el validate de jquery y usar el mismo que usamos en esd
	/*  $("#altaEntrevista").validate({
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
				"perfilAlumno.datosPersonales.apellido":{
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
// 	    	  habilitarRA2();
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
	});  */
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
 	
 	
 	
 	//DMS oculto todo el codigo viejo pero me queda funcional
 	
 $("#accordion").hide();
 	
 	
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
// function habilitarRA2(){
// 	if($("#noAsisteEntrevista").attr("checked")){
// 		//No asiste: Habilita RA2
// 		$("#tablaDatosResponsable2 :text").removeAttr("disabled");
// 		$("#vinculoRespo2").removeAttr("disabled");
// 	}else{
// 		//Asiste: Deshabilita y Borra
// // 		$("#responsable2Telefono1").val("");
// // 		$("#responsable2ContactoTelefono1").val("");
// // 		$("#nombreResponsable2").val("");
// // 		$("#apellidoResponsable2").val("");
// // 		$("#vinculoRespo2").val("");
// // 		$("#vinculoRespo2").attr("disabled","disabled");
// // 		$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
// 	}
// }

function validarSubmit(){	
	$("#direccionRA").val($("#alumnoDireccion").val());
	$("#codPostalRA").val($("#alumnoCodigoPostal").val());
	$("#entreCallesRA").val($("#alumnoEntreCalles").val());
	$("#nroCalleRA").val($("#alumnoNumero").val());
	$("input").removeAttr("disabled");
	$("select").removeAttr("disabled");
	$("textarea").removeAttr("disabled");
	
// 	habilitarRA2();
//DMS comento lo siguiente porque no le encuentro el sentido
// 	if($("#fechaNacimientoRes2").val() == ""){
// 		$("#fechaNacimientoRes2").attr("disabled","disabled");
// 	}

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
	
	
	//###################################################
	//DMS aca arrancan las validaciones
	//####################################################
	//validaciones viejas:
	
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
	
	
	console.log("nombrefichas: "+document.getElementById( "nombreFichas1" ));
	if ( document.getElementById( "nombreFichas1" ) ) {
		
		//alert("existe");
		
		document.getElementById("deNombreFF").value=document.getElementById("nombreFichas1").value;
	
	}else{
	
		//alert("No existe");
		mens += 'El cuadro familiar es obligatorio, al menos debe existir 1 familiar cargado como conviviente. \n';
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
	
// 	if (document.getElementById("alumnoTelefono").value.length<10) {
// 		mens += 'El campo teléfono del becado no puede tener menos de 10 caracteres (recordá anteponer el código de área). \n';
// 		flag = true;
//     }
	
//	if (document.getElementById("telefono1").value.length<10) {
//		if (document.getElementById("telefono1").value.length==0) {
//		}else{
//			mens += 'El campo teléfono 1 del becado no puede tener menos de 10 caracteres (recordá anteponer el código de área). \n';
//			flag = true;		
//		}
//		
//    }
	if (document.getElementById("telefono2").value.length<10) {
		if (document.getElementById("telefono2").value.length==0) {
		}else{
			mens += 'El campo teléfono 2 del becado no puede tener menos de 10 caracteres (recordá anteponer el código de área). \n';
			flag = true;		
		}
		
    }
	
	if (document.getElementById("responsableTelefono1").value.length<10) {
		if (document.getElementById("responsableTelefono1").value.length==0) {
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
	//if (document.getElementById("celularEp").value.length<10){
	//	if (document.getElementById("celularEp").value.length==0) {
	//	}else{
	//		mens += 'El campo celular EP no puede tener menos de 10 caracteres (recordá anteponer el código de área). \n';
	//		flag = true;		
	//	}
		
    //}
	
	if (document.getElementById("responsableNacionalidad").value.length==1) {		
		mens += 'El campo País del RA es obligatorio. \n';
		flag = true;		
    }

	
	 
	
	 var today = new Date();
	    var fe = new Date($("#fechaEntrevista").datepicker("getDate"));    
	    if (fe>today || document.getElementById("fechaEntrevista").value.length!=10){
	    	mens +="La fecha de la entrevista es obligatoria y debe ser menor o igual a la fecha actual. \n";
	    	flag = true;
	    }
	// DMS validaciones nuevas
	var mensRef="";
	var referencia=[mensRef,flag];
	
	//inputs
	validar("input","identrevistador","entrevistador",referencia);
	validar("input","convocatoria","convocatoria",referencia);
	validar("input","alumnoApellido","apellido del alumno",referencia);
	validar("input","alumnoNombre","nombre del alumno",referencia);
	validar("input","dniAlumno","DNI del alumno",referencia);
	validar("input","alumnoDivision","división",referencia);
	validar("input","conQuienVivis","con quién vivís",referencia);
	validar("input","rutinaDiaria","rutina diaria",referencia);
	validar("input","comoTeLlevas","¿como te llevas con tus compañeros?",referencia);
	validar("input","desempenioPorque","¿por qué? en ¿cómo crees que fue tu desempeño el año pasado?",referencia);
	validar("input","inasistenciasPasado","¿cuántas inasistencias tuviste el año pasado?",referencia);
	validar("input","inasistenciasActual","¿cuántas inasistencias tuviste el año en curso?",referencia);
	validar("input","elegiste","¿por que elegiste este colegio secundario?",referencia);
	validar("input","gustaria","¿qué te gustaría hacer cuando termines la secundaria?",referencia);
	validar("input","informacionComplemetariaEp","información complementaria y percepciones",referencia);
	validar("input","aportePfe","¿qué le puede aportar PFE al ep?",referencia);
	validar("input","apellido","apellido del RA",referencia);
	validar("input","nombre","nombre del RA",referencia);
	validar("input","dniResponsable","DNI del RA",referencia);
	validar("input","cuilCuit","cuil del RA",referencia);
	validar("input","responsableTelefono1","celular del RA",referencia);
	validar("input","calle","calle",referencia);
	validar("input","nroCalle","número calle",referencia);
	validar("input","piso","piso",referencia);
	validar("input","localidadRA","localidad",referencia);
	validar("input","codigoPostal","código postal",referencia);
	validar("input","barrio","barrio",referencia);
	validar("input","dirias","¿qué dirías de t hijo como estudiante?",referencia);
	validar("input","complicacion","¿presntó alguna complicación en su tryectoria....?",referencia);
	validar("input","cuandoTermine","¿cómo te lo imaginás cuando termine....?",referencia);
	validar("input","pensas","¿qué pensas que le puede aportar el programa...?",referencia);
	validar("input","auh","cantidad auh",referencia);
	//estoy en duda si deben ser obligatorios los siguientes dos campos
	//validar("input","totalAuh","total auh",referencia);
	//validar("input","otroIngreso","¿cuenta con algún otro ingreso?",referencia);
	validar("input","montoOtroIngreso","monto mensual de otros ingresos",referencia);
	validar("input","ambientes","¿cuántos ambientes tiene la vivienda?",referencia);
	validar("input","comentariosAdicionalesRa","comentarios adicionales sobre ingresos",referencia);
	validar("input","informacionComplementariaRa","información complementaria y percepciones",referencia);
	validar("input","porqueImportante","¿por que? en importancia de terminar el secundario",referencia);
	
	//select
	validar("select","riesgoEscolarRa","¿se detectó alguna situación de resgo extra-escolar?",referencia);
	validar("select","problemaAprendizaje","¿se detectó alguna dificultad cognitiva...?",referencia);
	validar("select","genero","genero",referencia);
	validar("select","alumnoNacionalidad","nacionalidad del alumno",referencia);
	validar("select","escuelaTecnica","¿es escuela técnica?",referencia);
	validar("select","alumnoRecibeOtraBeca","¿recibe otra beca?",referencia);
	validar("select","accesoCelular","¿tenés acceso a un celular en tu hogar?",referencia);
	validar("select","computadora","¿tenés computadora en tu hogar?",referencia);
	validar("select","conexion","¿tenés conexión a internet en tu hogar?",referencia);
	validar("select","trabajas","¿trabajas?",referencia);
	validar("select","comoTerminaste","¿cómo terminaste la escuela el año pasado?",referencia);
	validar("select","desempenioEscolar","¿cómo fue tu desempeño escolar el año pasado?",referencia);
	validar("select","abandono2","¿abandonaste alguna vez?",referencia);
	validar("select","sanciones","¿tuviste problemas de conducta?",referencia);
	validar("select","importanteTerminar","¿te parece importante terminar el secundario?",referencia);
	validar("select","participarReuniones","¿estas dispuesto a participar de las reuniones...?",referencia);
	validar("select","participarPrograma","¿crees que te puede servir participar del programa...?",referencia);
	validar("select","cognitivaEp","¿se detectó alguna dificultad conginitiva...?",referencia);
	validar("select","riesgoEscolarEp","¿se detectó alguna situacion de riesgo...?",referencia);
	validar("select","sexo","género RA",referencia);
	validar("select","vinculoRespo","vínculo del Ra",referencia);
	validar("select","disponibilidad","¿tenés disponibilidad para participar de las reuniones...?",referencia);
	validar("select","otroBecado2","¿tenés otro hijo beccado por cimientos?",referencia);
	validar("select","cobertura","¿Tiene obra social o prepaga?",referencia);

	//checkboxes
	if (!(document.getElementById("carpetaMama").checked||
		document.getElementById("carpetaPapa").checked ||
		document.getElementById("carpetaHno").checked ||
		document.getElementById("carpetaNadie").checked ||
		document.getElementById("carpetaOtros").checked )){
		referencia[0] += "no hay seleccion en ¿le mostras a alguien las carpetas...? \n";
		referencia[1] = true;
	}
	if (!(document.getElementById("ayudaTareas").checked||
		document.getElementById("cuidaHnos").checked ||
		document.getElementById("cuidaOtros").checked ||
		document.getElementById("noCuida").checked )){
		referencia[0] += "no hay seleccion en ¿tenés alguna de estas responsabilidades...? \n";
		referencia[1] = true;
	}
	if (document.getElementById("riesgoEscolarEp").value=="Sí") 	
		if (!(document.getElementById("fallecimientoEp").checked||
			document.getElementById("enfermedadEp").checked ||
			document.getElementById("maternidadEp").checked ||
			document.getElementById("mudanzaEp").checked ||
			document.getElementById("cambioEstructuraEp").checked ||
			document.getElementById("economiaEp").checked ||
			document.getElementById("violenciaEp").checked ||
			document.getElementById("consumoEp").checked ||
			document.getElementById("violenciaEscolarEp").checked ||
			document.getElementById("otraSituacionEp").checked) ){
			referencia[0] += "no hay seleccion en situaciones de riesgo EP detectadas \n";
			referencia[1] = true;
		}
	if (!(document.getElementById("regularmente").checked||
		document.getElementById("pregunta").checked ||
		document.getElementById("cuaderno").checked ||
		document.getElementById("padres").checked ||
		document.getElementById("carpetas").checked ||
		document.getElementById("cuenta").checked ||
		document.getElementById("noSabe").checked ||
		document.getElementById("grupo").checked ||
		document.getElementById("otroEnteras").checked )){
		referencia[0] += "no hay seleccion en ¿de que manera te enteras como le va en la escuela? \n";
		referencia[1] = true;
	}
	if (!(document.getElementById("agua").checked||
		document.getElementById("luz").checked ||
		document.getElementById("gasNatural").checked ||
		document.getElementById("gasGarrafa").checked ||
		document.getElementById("telefoniaFija").checked ||
		document.getElementById("celular").checked ||
		document.getElementById("internet").checked ||
		document.getElementById("tvcable").checked ||
		document.getElementById("otroServicio").checked ||
		document.getElementById("vehiculo").checked )){
		referencia[0] += "no hay seleccion en ¿que servicios tiene tu vivienda? \n";
		referencia[1] = true;
	}
	if (document.getElementById("riesgoEscolarRa").value=="Sí") 		
		if (!(document.getElementById("fallecimientoRa").checked||
			document.getElementById("enfermedadRa").checked ||
			document.getElementById("maternidadRa").checked ||
			document.getElementById("mudanzaRa").checked ||
			document.getElementById("cambioEstructuraRa").checked ||
			document.getElementById("economiaRa").checked ||
			document.getElementById("violenciaRa").checked ||
			document.getElementById("consumoRa").checked ||
			document.getElementById("violenciaEscolarRa").checked ||
			document.getElementById("otraSituacionRa").checked )){
			referencia[0] += "no hay seleccion en Situciones de riesgos RA dettectadas \n";
			referencia[1] = true;
		}
	
	
	//condicionados y especiales
	
	
	if (document.getElementById("saludHijo").value.length=="") {		
		referencia[0] += "El campo ¿su hijo tiene algún problema de salud? es obligatorio. \n";
		referencia[1] = true;		
    }
	if (document.getElementById("saludFliar").value.length=="") {		
		referencia[0] += "El campo ud u otro integrante  ¿tiene problemas de salud? es obligatorio. \n";
		referencia[1] = true;		
    }
	
	if(document.getElementById("alumnoRecibeOtraBeca").value.length==4)
	validar("input","cualBeca","¿cual beca?",referencia);
	
	//if(document.getElementById("vinculoRespo").value.length==0){
	//	referencia[0] += "El campo vínculo RA es obligatorio. \n";
	//	referencia[1] = true;
	//}

	if(document.getElementById("accesoCelular").value=="Si, tiene celular de uso propio"||
			document.getElementById("computadora").value=="Sí"||
			document.getElementById("accesoCelular").value=="Si, comparte celular con otros integrantes del hogar")
			validar("input","usoCelular","¿qué uso le das al celular?",referencia);
	
	if (document.getElementById("tipoVivienda").value==0) {		
		referencia[0] += "El campo tipo de vivienda es obligatorio. \n";
		referencia[1] = true;		
    }
	if (document.getElementById("turno").value=="") {		
		referencia[0] += "El campo turno es obligatorio. \n";
		referencia[1] = true;		
    }
	if (document.getElementById("ayudaTareas").checked||
		document.getElementById("cuidaHnos").checked ||
		document.getElementById("cuidaOtros").checked ){
		if (document.getElementById("faltasCuidado").value.length==1) {		
			referencia[0] += "El campo ¿tenés faltas en la escuela o dificultades para cumplir...? es obligatorio. \n";
			referencia[1] = true;		
	    }
	}
	
	if (document.getElementById("trabajas").value=="Sí"){
		validar("input","deQueTrabajas","¿de qué trabajas?",referencia);
	}
	if (document.getElementById("comoTerminaste").value=="Promovido con materias a rendir"||
			document.getElementById("comoTerminaste").value=="Promoción pendiente"){
		validar("input","materiasAdeuda","¿que materias adeuda?",referencia);
	}
	if (document.getElementById("inasistenciasPasado").value!=null&&document.getElementById("inasistenciasPasado").value>0){
		validar("input","motivoInasistenciasPasado","¿motivo inasistencias año pasado?",referencia);
	}
	if (document.getElementById("inasistenciasActual").value!=null&&document.getElementById("inasistenciasActual").value>0){
		validar("input","motivoInasistenciasActual","¿motivo inasistencias año actual?",referencia);
	}
	if (document.getElementById("repetiste2").value=="1"||
		document.getElementById("repetiste2").value=="2"||
		document.getElementById("repetiste2").value=="3"){
		validar("input","porqueRepatiste","¿por qué repetiste?",referencia);
	}
	if (document.getElementById("abandono2").value=="Si, en primaria"||
		document.getElementById("abandono2").value=="Si, en secundaria"||
		document.getElementById("abandono2").value=="Si, en primaria y secundaria"){
		validar("input","porqueAbandono","¿por qué abandonaste?",referencia);
	}
	if (document.getElementById("sanciones").value=="Sí"){
		validar("input","porqueSanciones","¿Cuál fue el motivo del problema de conducta?",referencia);
	}
	if (document.getElementById("participarReuniones").value=="No"){
		validar("input","porqueReuniones","¿por qué? en disposición a pariticipar de las reuniones...",referencia);
	}
	if (document.getElementById("participarPrograma").value=="Sí"){
		validar("input","porquePrograma","¿por qué? en ¿crees que te puede servir paticipar del programa?...",referencia);
	}
	if (document.getElementById("repetiste2").value=="0"){
		referencia[0] += "El campo repetiste es obligatorio. \n";
		referencia[1] = true;	
	}
	if (document.getElementById("otraSituacionEp").checked){
		validar("input","cualOtraSituacionEp","¿cuál? al haber seleccionado otra en los riesgos detectados del Ep",referencia);
	}
	if (document.getElementById("saludHijo").value=="Sí"){
		validar("input","problemaSaludHijo","¿por qué? en ¿que problema de salud tiene el EP?...",referencia);
		validar("select","inasistenciasSalud","¿tiene inasistencias por el problema de salud el EP?",referencia);
	}
	if (document.getElementById("saludFliar").value=="Sí"){
		validar("input","problemaSaludFliar","¿por qué? en ¿que problema de salud tiene el RA?...",referencia);
		validar("select","faltaFliar","¿tiene inasistencias por el problema de salud del familiar?",referencia);
	}
	if (document.getElementById("otraSituacionRa").checked){
		validar("input","cualOtraSituacionRa","¿cuál? al haber seleccionado otra en los riesgos detectados del Ra",referencia);
	}
	if (document.getElementById("anioEscuela").value.length==0) {		
		referencia[0] += "El campo año escolar es obligatorio. \n";
		referencia[1] = true;		
    }
	
	//Si exite RA2 valido
	console.log("ra2: "+$("#existenciaRA2").val())
	console.log("ra2: "+$("#existenciaRA2").val()>0 )
if($("#existenciaRA2").val()>0 ){
	validar("input","apellidoResponsable2","apellido RA titular de la cuenta bancaria",referencia);
	validar("input","nombreResponsable2","nombre RA titular de la cuenta bancaria",referencia);
	validar("input","dniRes2","DNI RA titular de la cuenta bancaria",referencia);
	validar("input","fechaNacimientoRes2","fecha de nacimiento RA titular de la cuenta bancaria",referencia);
	validar("input","celularRes2","celular RA titular de la cuenta bancaria",referencia);
	validar("input","cuilCuitRes2","cuil RA titular de la cuenta bancaria",referencia);
	if(document.getElementById("vinculoRespo2").value.length==0){
		referencia[0] += "El campo vínculo RA titular de la cuenta bancaria es obligatorio. \n";
		referencia[1] = true;
	}
	validar("select","sexoRes2","género del RA titular de la cuenta bancaria",referencia);
	validar("select","nacionalidadRes2","nacionalidad del RA titular de la cuenta bancaria",referencia);
	}
	
	
	
	
	
	//DMS validaciones de las fichas familares
	
	//averiguo la cantidad de familiares
	var cantidadFamiliares=0;
	for(var i=1;i<=10;i++){
		if ($("#vinculo"+i+"").val()==null)break;
		cantidadFamiliares=i;
	}
	// testeo cada uno de ellos
	for(var i=1; i<=cantidadFamiliares;i++){
		
		//si hay vinculo tienen que estar todos los campos cargados menos remuneracion
		//el primer vinculo es el candidato, no son obligatorios los campos relacionados a trabajo
		if(document.getElementById("vinculo"+i).value.length!=0){
			validar("input","apellidoFichas"+i,"apellido de familiar "+i,referencia);
			validar("input","nombreFichas"+i,"nombre de familiar "+i,referencia);
			validar("input","edadFichas"+i,"edad de familiar "+i,referencia);
			if(document.getElementById("nivelEducativoFichas"+i).value==""){
				referencia[0] += "El campo nivel edcativo de familiar "+i+" es obligatorio. \n";
				referencia[1] = true;
			}
			if(i>1){//pueden quedar vacios los campos relacionados a trabajo del candidato
				validar("input","estabilidadLaboralFichas"+i,"condición laboral de familiar "+i,referencia);
				validar("input","ocupacionLaboralFichas"+i,"ocupación laboral de familiar "+i,referencia);
				validar("input","tipoTrabajoFichas"+i,"tipo de trabajo de familiar "+i,referencia);
				}
			}
		
	}
	
	
	//funcion
	function validar(tipo,id,mensaje,referencia){
		if(tipo=="input"){
			if (document.getElementById(id).value.length=="") {		
				referencia[0] += "El campo "+mensaje+" es obligatorio. \n";
				referencia[1] = true;		
		    }
		}else if(tipo=="select"){
			if (document.getElementById(id).value.length==1) {		
				referencia[0] += "El campo "+mensaje+" es obligatorio. \n";
				referencia[1] = true;		
		    }
		}
	}
	
	//DMS con esto mergeo las validaciones viejas con lo nuevo
	mens+=referencia[0];
	if(flag==false)
	flag=referencia[1];
	
	
	//#################################################
	//#### fin validaciones############################
	//#################################################
	//#################################################
		
	
	
	
	if(flag){
		$("#zonaCimientos").attr("disabled","disabled");
		//$("#cualBeca").attr("disabled","disabled");
		//$("#cuil").attr("disabled","disabled");
		$("#respoBanco").attr("disabled","disabled");
		$("#nroCuentaRespo").attr("disabled","disabled");
		jAlert('warning', mens, 'Advertencia');
	}
	
	
	
	
	
	
	
	
	
	return flag;
	
	 
	
}

//Este metodo es para mostrar los accordiones 
function mostrar(idx){


	var selector;
		switch (idx) {
		case 1:
			selector = "#datosCandidato";
			break
		case 2:
			selector = "#responsable";
			break
		case 3:
			selector = "#fichaFamiliar";
			break
		case 4:
			selector = "#observacionesGenerales";
		//DMS prueba para oculltar todo
		case 5:
			
			//$("#accordion").hide();
			//selector = "#accordion";
		}

		$(selector).toggle("blind");
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
	


</script>
</head>

<body >
	<div id="main-content">
		<!-- Formulario para la busqueda del alumno por DNI -->

		<form action="" method="post" id="formAlumno" name="formAlumno">
			<input type="hidden" id="idEntrevista" name="idEntrevista"> <input
				type="hidden" id="accion" name="accion" value="${accion}">
		</form>
		<form:form modelAttribute="entrevistaSeleccionDTO" id="altaEntrevista"
			commandName="entrevistaSeleccionDTO" method="post"
			name="altaEntrevista" enctype='multipart/form-data' >
			<!-- Hidden para la validacion del alumno por ajax -->
			<input type="hidden" id="accion" name="accion" value="${accion}">
			<input type="hidden" id="idEntrevista" name="idEntrevista"
				value="${idEntrevista}">
			<c:if test="${!empty entrevistaSeleccionDTO.perfilAlumno.id}">
				<form:hidden path="perfilAlumno.id" />
				<form:hidden path="perfilAlumno.datosPersonales.id" />
				<form:hidden path="perfilAlumno.responsable1.id" />
				<form:hidden path="perfilAlumno.responsable2.id" id="existenciaRA2"/>
				<form:hidden path="entrevistaSeleccion.idPerfilAlumno" />
<%-- 				<form:hidden path="entrevistaSeleccion.id" /> --%>
			</c:if>

			<input type="hidden" id="estadoEntrevista" name="estadoEntrevista"
				value="">


<!-- DMS codigo nuevo proyecto esd -->
 
<div id="codigoNuevo">



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
	  <input type="text" class="form-control" id="identrevistador" name="identrevistador"  value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idEntrevistador}">
<!-- 				  <input type="text" class="form-control" id="entrevistador" > -->
				  <label for="fechaEntrevista">Entrevistador</label>
			</div>	
    		</div>
    		<br>
      		
    		
    	
    	</div>	
    	<br>
    	
    	<div class="row align-items-start">    		
    			<div class="col">
    			<div class="form-floating">
<!--     			falta convocatoria en bd temporal -->
    				<input type="text" class="form-select"  aria-label="Floating label select example" id="convocatoria" name="entrevistaSeleccion.convocatoria.nombre"  value="${entrevistaSeleccionDTO.entrevistaSeleccion.convocatoria.nombre}" onclick="limpiarConvocatoria()" onblur="chequearConvocatoria()">
					    
  					<label for="floatingSelect">Convocatoria</label>
				</div>	
    		</div>		
  		</div>
  		
  		<br>
  		<div class="row align-items-start">    		
    			<div class="col">
    			<div class="form-floating">
    				<input type="text" name="fechaEntrevista" id="fechaEntrevista"  class="form-control" value="<fmt:formatDate value="${entrevistaSeleccionDTO.entrevistaSeleccion.fechaEntrevista}" pattern="dd/MM/yyyy"/>" >
  					<input type="hidden" name="excepcion" id="excepcion" value="No">
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
				  <input type="text" class="form-control "  id="alumnoApellido" name="perfilAlumno.datosPersonales.apellido" value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.apellido}" >
				  <label >Apellido</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" id="alumnoNombre" name="perfilAlumno.datosPersonales.nombre"  value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nombre}"  >
				  <label >Nombre</label>
				</div>
    		</div>
    	</div>
		<br>
  		<div class="row align-items-start">
    		<div class="col">
    		
      			<div class="form-floating">
      			
 					
      			<c:choose> 
 					<c:when test="${accion == 'modificar'}"> 
									
													
 								<input type="text" id="dniAlumno" 
 										   name="perfilAlumno.datosPersonales.dni" class="digits form-control"  maxlength="8"  
 										   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  > 
 								<label for="dniAlumno">DNI *</label>
 								<label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label> 
												
 					</c:when> 
 					<c:when test="${accion == 'carga'}"> 
												
													
 								<input type="text" id="dniAlumno" disabled="disabled" 
 										   name="perfilAlumno.datosPersonales.dni" class="digits "  maxlength="8"  
 										   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  > 
 								<label for="dniAlumno">DNI *</label>
 								<label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label> 
											
 					</c:when> 
 					<c:when test="${accion == 'alta'}"> 
												
													
 								<input type="text" id="dniAlumno" onblur="buscarAlumno()"  
 										   name="perfilAlumno.datosPersonales.dni" class="digits form-control"  maxlength="8"  
 										   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  > 
 								<label for="dniAlumno">DNI *</label>
 								<label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label> 
													
												
 					</c:when> 
 					<c:when test="${accion == 'ver'}"> 
												
													
 								
 								<input type="text" id="dniAlumno" disabled="disabled" 
 										   name="perfilAlumno.datosPersonales.dni" class="digits form-control"  maxlength="8"  
 										   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  > 
 								<label for="dniAlumno">DNI *</label>
 								<label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label> 
													
												
 					</c:when> 
 				</c:choose> 
      			
      			
      			
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
      			
				  <input type="text" name="fechaNacimientoCandidato" id="fechaNacimiento"  onChange="calcular_edad(this.value)" class="form-control" value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>" >
				  <input name="input_id_2" id="input_id_2" type="hidden">
				  <label for="fechaNacimientoEP">Fecha de Nacimiento</label>
				</div>
    		</div>
    	</div>
		
		<br>
  		
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				
				<select name="perfilAlumno.datosPersonales.sexo" class=" form-control" id="genero"  >
					<c:choose>
						<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo == true}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="true" selected="selected">Masculino</option>
							<option value="false">Femenino</option>
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo == false}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="false" selected="selected">Femenino</option>
							<option value="true">Masculino</option>
					    </c:when>
					    <c:otherwise>
						 	<option value=" "selected="selected">Seleccione una opci&oacute;n:</option>
							<option value="false" >Femenino</option>
							<option value="true">Masculino</option>
						   </c:otherwise>
					</c:choose>
				</select>
				<label >Género</label>
				
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
								 <select name="alumnoNacionalidad" id="alumnoNacionalidad" class=" form-control"  onchange="habilitarInputEstadoAlumno(this.value)">
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
				
				<c:choose>			
			<c:when test="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae=='6/6'}">
					
						<select name="anioEscuela" id="anioEscuela" class=" form-control" >
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
						<label for="floatingSelect">Año Escolar 6/6</label>		
					<!-- font color="green"><label>Año Escolar PFE</label></font--> 
					<input type="hidden" id="ae" name="ae" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.valor}">
					<input type="hidden" id="idAe" name="idAe" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar}">
				
					<!-- font color="green"><label>Año Escolar real</label></font--> 
					
			</c:when>
			<c:when test="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae=='7/5'}">
							<select name="anioEscuela" id="anioEscuela" class=" form-control" >
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
							<label for="floatingSelect">Año Escolar 7/5</label>
					<!-- font color="green"><label>Año Escolar PFE</label></font--> 
					<input type="hidden" id="ae" name="ae" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.valor}">
					<input type="hidden" id="idAe" name="idAe" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar}">
			</c:when>
			<c:otherwise>
					<select name="anioEscuela" id="anioEscuela" class=" form-control" >
						<option value="">Seleccione una opci&oacute;n:</option>
					</select>
					<label for="floatingSelect">Año Escolar</label>
			</c:otherwise>
		</c:choose>
				
				
				
				
				
				</div>
    		</div>
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" name="perfilAlumno.division" id="alumnoDivision" value="${entrevistaSeleccionDTO.perfilAlumno.division }">				  
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
	      			<select  class=" form-control" name=perfilAlumno.anioAdicional id="escuelaTecnica">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.perfilAlumno.anioAdicional}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value=true selected="selected">Sí</option>
								<option value=false>No</option>
						    </c:when>
						    <c:when test="${!entrevistaSeleccionDTO.perfilAlumno.anioAdicional}">
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
      			
      			<select  class=" form-control" id="alumnoRecibeOtraBeca" name="entrevistaSeleccion.recibeOtraBeca" >
					<c:choose>
						<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="true" selected="selected">Sí</option>
							<option value="false">No</option>
					    </c:when>
					    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca== false}">
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="false" selected="selected">No</option>
							<option value="true">Sí</option>
					    </c:when>
					    <c:otherwise>
							<option value="false">No</option>
							<option value="true">Sí</option>
					    </c:otherwise>
					</c:choose>
				</select>
				<label >Recibe otra beca</label>
      			
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.cualBeca" id="cualBeca" value="${entrevistaSeleccionDTO.entrevistaSeleccion.cualBeca}">				  
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
      			
      			
	      			<select  class=" form-control" id="accesoCelular" name="entrevistaSeleccion.accesoCelular" >
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
				 <input type="number" class="form-control"  id="celularEp" name="entrevistaSeleccion.celularEp" value="${entrevistaSeleccionDTO.entrevistaSeleccion.celularEp}">				  
				 <label >Número de celular EP (Característica + número)</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>
	
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
      			<select  class=" form-control" id="computadora" name="entrevistaSeleccion.computadora" >
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
				 	<select  class=" form-control" id="conexion" name="entrevistaSeleccion.conexion" >
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
				 <input type="text" class="form-control" id="usoCelular" name="entrevistaSeleccion.usoCelular"value="${entrevistaSeleccionDTO.entrevistaSeleccion.usoCelular}">				  
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
				 <input type="text" class="form-control" value="${entrevistaSeleccionDTO.entrevistaSeleccion.conQuienVivis}" id="conQuienVivis" name="entrevistaSeleccion.conQuienVivis">				  
				  <label >¿Con quién vivís? ¿Cómo está compuesta tu familia?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <textarea class="form-control"  style="height: 100px" id="rutinaDiaria" name="entrevistaSeleccion.rutinaDiaria">${entrevistaSeleccionDTO.entrevistaSeleccion.rutinaDiaria }</textarea>
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
					<input type="checkbox" 	id="carpetaMama" name="entrevistaSeleccion.carpetaMama" <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaMama=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Mamá </label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="carpetaPapa" name="entrevistaSeleccion.carpetaPapa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaPapa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Papá</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="carpetaHno" name="entrevistaSeleccion.carpetaHno"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaHno=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Hermano/a</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="carpetaNadie" name="entrevistaSeleccion.carpetaNadie"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaNadie=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Nadie</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="carpetaOtros" name="entrevistaSeleccion.carpetaOtros"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetaOtros=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Otros</label>
				</div>
			</div>
    	</div>
    	 	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" id="comoTeLlevas"name="entrevistaSeleccion.comoTeLlevas" value="${entrevistaSeleccionDTO.entrevistaSeleccion.comoTeLlevas}">				  
				  <label for="celularEP">¿Cómo te llevas con tus compañeros/as? ¿Tenés amigos/as en el curso?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	  	
    	<div class="row align-items-start">
    		<div class="col">      						  
				  <label >¿Tenés alguna de estas responsabilidades en tu familia?</label>
				  <br>
				<div class="form-check">
					<input type="checkbox" id="ayudaTareas"name="entrevistaSeleccion.ayudaTareas"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.ayudaTareas=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Ayudas en las tareas generales de la casa</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="cuidaHnos"name="entrevistaSeleccion.cuidaHnos"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.cuidaHnos=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Cuidas hermanos/as, hijos/as, sobrinos/as menores</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="cuidaOtros" name="entrevistaSeleccion.cuidaOtros"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.cuidaOtros=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1">Cuidas otros familiares adultos</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="noCuida"name="entrevistaSeleccion.noCuida"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.noCuida=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" for="defaultCheck1"> No, ninguna</label>
				</div>
			</div>
    	</div>
    	
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 	<select  class=" form-control" name="entrevistaSeleccion.faltasCuidado" id="faltasCuidado" >
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
				 <select  class=" form-control" name="entrevistaSeleccion.trabajas" id="trabajas" >
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
				 <input type="text" class="form-control" name="entrevistaSeleccion.deQueTrabajas" id="deQueTrabajas" value="${entrevistaSeleccionDTO.entrevistaSeleccion.deQueTrabajas}">				  
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
					<select  class=" form-control"  name="entrevistaSeleccion.comoTerminaste" id="comoTerminaste">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.comoTerminaste=='Promovido con materias a rendir'}">
								<option value="Promovido con materias a rendir" selected="selected">Promovido con materias a rendir</option>
								  <option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
								  <option value="Repitió">Repitió</option>				  			  				  
								  <option value="Promoción pendiente">Promoción pendiente</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.comoTerminaste=='Promovido sin adeudar materias'}">
								<option value="Promovido con materias a rendir" >Promovido con materias a rendir</option>
								  <option value="Promovido sin adeudar materias"selected="selected">Promovido sin adeudar materias</option>
								  <option value="Repitió">Repitió</option>				  			  				  
								  <option value="Promoción pendiente">Promoción pendiente</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.comoTerminaste=='Repitió'}">
								<option value="Promovido con materias a rendir" >Promovido con materias a rendir</option>
								  <option value="Promovido sin adeudar materias">Promovido sin adeudar materias</option>
								  <option value="Repitió"selected="selected">Repitió</option>				  			  				  
								  <option value="Promoción pendiente">Promoción pendiente</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.comoTerminaste=='Promoción pendiente'}">
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
				 <input type="text" class="form-control" name="entrevistaSeleccion.materiasAdeuda" id="materiasAdeuda" value="${entrevistaSeleccionDTO.entrevistaSeleccion.materiasAdeuda}">				  
				  <label >En caso de adeudar materias, ¿Cuáles son?</label>
				</div>
				
    		</div>
    		     		
    	</div>
    	
    	<br>

		<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select  class=" form-control" name="entrevistaSeleccion.desempenioEscolar" id="desempenioEscolar"  >
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
				 <input type="text" class="form-control" name="entrevistaSeleccion.desempenioPorque" id="desempenioPorque" value="${entrevistaSeleccionDTO.entrevistaSeleccion.desempenioPorque }">				  
				  <label for="celularEP">¿Por qué?</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="number" class="form-control" name="entrevistaSeleccion.inasistenciasPasado" id="inasistenciasPasado" value="${entrevistaSeleccionDTO.entrevistaSeleccion.inasistenciasPasado }">				  
				  <label for="celularEP">¿Cuántas inasistencias tuviste el año pasado?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.motivoInasistenciasPasado" id="motivoInasistenciasPasado" value="${entrevistaSeleccionDTO.entrevistaSeleccion.motivoInasistenciasPasado }">				  
				  <label>Motivo de las inasistencias</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.inasistenciasActual" id="inasistenciasActual" value="${entrevistaSeleccionDTO.entrevistaSeleccion.inasistenciasActual }">				  
				  <label >¿Cuántas inasistencias tenés este año en curso?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.motivoInasistenciasActual" id="motivoInasistenciasActual" value="${entrevistaSeleccionDTO.entrevistaSeleccion.motivoInasistenciasActual }">				  
				  <label >Motivo de las inasistencias</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
      				<select  class=" form-control" name="entrevistaSeleccion.repetiste2" id="repetiste2">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste2=='Si, en primaria'}">
								<option value="0">Seleccioná una opción</option>
			 				    <option value="Si, en primaria"selected="selected">Si, en primaria</option>
							    <option value="Si, en secundaria">Si, en secundaria</option>
							    <option value="Si, en primaria y secundaria">Si, en primaria y secundaria</option>				  			  				  
							    <option value="Nunca">Nunca</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste2=='Si, en secundaria'}">
								<option value="0">Seleccioná una opción</option>
			 				    <option value="Si, en primaria">Si, en primaria</option>
							    <option value="Si, en secundaria"selected="selected">Si, en secundaria</option>
							    <option value="Si, en primaria y secundaria">Si, en primaria y secundaria</option>				  			  				  
							    <option value="Nunca">Nunca</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste2=='Si, en primaria y secundaria'}">
								<option value="0">Seleccioná una opción</option>
			 				    <option value="Si, en primaria">Si, en primaria</option>
							    <option value="Si, en secundaria">Si, en secundaria</option>
							    <option value="Si, en primaria y secundaria"selected="selected">Si, en primaria y secundaria</option>				  			  				  
							    <option value="Nunca">Nunca</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.repetiste2=='Nunca'}">
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
				
					<label for="floatingSelect">¿Repetiste alguna vez?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.porqueRepatiste" id="porqueRepatiste" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueRepatiste}">				  
				  <label >En caso afirmativo, ¿Por qué crees que repetiste?</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>
		

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 			 
				 	<select  class=" form-control" name="entrevistaSeleccion.abandono2" id="abandono2" >
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
				 <input type="text" class="form-control" name="entrevistaSeleccion.porqueAbandono"id="porqueAbandono" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueAbandono}" >				  
				  <label >En caso afirmativo, ¿Cuál fue el motivo?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				<select  class=" form-control" name="entrevistaSeleccion.sanciones" id="sanciones">
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
				 <input type="text" class="form-control" name="entrevistaSeleccion.porqueSanciones" id="porqueSanciones" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueSanciones}">				  
				  <label for="celularEP">En caso afirmativo, ¿Cuál fue el motivo?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		
		<div class="row align-items-start">
			<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.elegiste" id="elegiste" value="${entrevistaSeleccionDTO.entrevistaSeleccion.elegiste}" >				  
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
					<select  class=" form-control" name="entrevistaSeleccion.importanteTerminar" id="importanteTerminar">
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
				 <input type="text" class="form-control" name="entrevistaSeleccion.porqueImportante" id="porqueImportante" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueImportante}">				  
				  <label >¿Por qué?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		
		<div class="row align-items-start">
			<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.gustaria" id="gustaria" value="${entrevistaSeleccionDTO.entrevistaSeleccion.gustaria}">				  
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
				 	<select  class=" form-control" name="entrevistaSeleccion.participarReuniones" id="participarReuniones">
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
				 <input type="text" class="form-control" name="entrevistaSeleccion.porqueReuniones" id="porqueReuniones" value="${entrevistaSeleccionDTO.entrevistaSeleccion.porqueReuniones}">				  
				  <label >¿Por qué?En caso de respuesta negativa ¿por qué?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					<select  class=" form-control" name="entrevistaSeleccion.participarPrograma" id="participarPrograma" >
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
				 <input type="text" class="form-control" name="entrevistaSeleccion.porquePrograma" id="porquePrograma"value="${entrevistaSeleccionDTO.entrevistaSeleccion.porquePrograma}">				  
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
				 <input type="text" class="form-control" name="entrevistaSeleccion.informacionComplemetariaEp" id="informacionComplemetariaEp" value="${entrevistaSeleccionDTO.entrevistaSeleccion.informacionComplemetariaEp}">				  
				  <label for="celularEP">Información complementaria y percepciones</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
		
		<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.aportePfe" id="aportePfe" value="${entrevistaSeleccionDTO.entrevistaSeleccion.aportePfe}">				  
				  <label >¿Qué le puede aportar PFE al EP?</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					 <select  class=" form-control" name="entrevistaSeleccion.cognitivaEp" id="cognitivaEp" >
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
				  	<select  class=" form-control" name="entrevistaSeleccion.riesgoEscolarEp" id="riesgoEscolarEp">
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
					<input type="checkbox" id="fallecimientoEp"	name="entrevistaSeleccion.fallecimientoEp" <c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.fallecimientoEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Fallecimiento de una persona significativa</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="enfermedadEp"name="entrevistaSeleccion.enfermedadEp"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.enfermedadEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" > Enfermedad propia o de una persona significativa</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="maternidadEp" name="entrevistaSeleccion.maternidadEp"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.maternidadEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Maternidad/Paternidad del EP</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="mudanzaEp"name="entrevistaSeleccion.mudanzaEp"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.mudanzaEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Mudanza</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="cambioEstructuraEp"name="entrevistaSeleccion.cambioEstructuraEp"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.cambioEstructuraEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Cambio de estructura familiar/convivientes</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="economiaEp"name="entrevistaSeleccion.economicaEp"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.economicaEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Situación de crisis económica en la familia</label>
				</div><div class="form-check">
					<input type="checkbox" id="violenciaEp"name="entrevistaSeleccion.violenciaEp"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.violenciaEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Situación de violencia familiar</label>
				</div><div class="form-check">
					<input type="checkbox"id="consumoEp" name="entrevistaSeleccion.consumoEp"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.consumoEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Consumo problemático</label>
				</div><div class="form-check">
					<input type="checkbox"id="violenciaEscolarEp" name="entrevistaSeleccion.violenciaEscolarEp"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.violenciaEscolarEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Situación de violencia escolar</label>
				</div><div class="form-check">
					<input type="checkbox"id="otraSituacionEp" name="entrevistaSeleccion.otraSituacionEp"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otraSituacionEp=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Otra</label>
				</div>
			</div>
		</div>

		<br>
		
		<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.cualOtraSituacionEp" id="cualOtraSituacionEp" value="${entrevistaSeleccionDTO.entrevistaSeleccion.cualOtraSituacionEp}">				  
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
				  <input type="text" class="form-control" name="perfilAlumno.responsable1.apellido" id="apellido" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.apellido}">
				  <label >Apellido</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" name="perfilAlumno.responsable1.nombre"id="nombre" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nombre}">
				  <label >Nombre</label>
				</div>
    		</div>
    	</div>
		<br>
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="number" class="form-control" id="dniResponsable" name="perfilAlumno.responsable1.dni" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.dni}">
				  <label >DNI</label>
				  <label id="dniResponsableError" style="color: red; display: none;">Ingrese un DNI válido</label>
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
	      			<select class=" form-control" name="perfilAlumno.responsable1.sexo" id="sexo">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == true}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value='true' selected="selected">Masculino</option>
								<option value='false'>Femenino</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value='false' selected="selected">Femenino</option>
								<option value='true'>Masculino</option>
						    </c:when>
						</c:choose>
					</select>
				  
					<label >Género</label>
				</div>
			
				
				
				<br>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
      				<select  class=" form-control" name="responsableNacionalidad" id="responsableNacionalidad" >
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
				  <label for="floatingSelect">País</label>
				</div>
			</div>
		
			
    		 
    	</div>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="perfilAlumno.responsable1.cuilCuit" id="cuilCuit"  value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.cuilCuit}">
				  <label >Ingresá el nro de CUIL</label>
				</div>
			</div>
			<div class="col"></div>
		</div>
		
		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" id="responsableTelefono1" name="perfilAlumno.responsable1.telefono1" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono1 }">
				  <label >Número celular RA (Característica + número)</label>
				</div>
			</div>
    		
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" id="responsableTelefono2" name="perfilAlumno.responsable1.telefono2" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono2 }" >
				  <label >Teléfono alternativo</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
					
					<select name="vinculoRA" id="vinculoRespo" class="form-control">
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
				  <input type="text" class="form-control" name="perfilAlumno.responsable1.calle" id="calle" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.calle }">				  
				  <label >Calle</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" name="perfilAlumno.responsable1.nroCalle" id="nroCalle" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nroCalle }">				  
				  <label >Número</label>
				</div>
    		</div>
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" name="perfilAlumno.responsable1.piso" id="piso" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.piso }" >				  
				  <label >Piso</label>
				</div>
    		</div> 
    	</div>
    		
    	<br>
		
		<div class="row align-items-start">
    		
    		<div class="col">
      			<div class="form-floating">
					<input type="text" class="form-control" onchange="this.value=this.value.toUpperCase();"  id="barrio" name="perfilAlumno.datosPersonales.barrio"
					value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.barrio}" >
				  <label >Barrio</label>
				  
				</div>
    		</div>
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" name="perfilAlumno.responsable1.idLocalidad.nombre" id="localidadRA" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idLocalidad.nombre }">				  
				  <input type="hidden" class="form-control" name="perfilAlumno.responsable1.idLocalidad.id" id="idLocalidadRA" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idLocalidad.id }">				  
				 
				  <label >Localidad </label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" name="perfilAlumno.responsable1.codigoPostal" id="codigoPostal" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.codigoPostal }">				  
				  <label>Código Postal</label>
				</div>
    		</div>
    	</div>
	
		<br>
	
	<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.id!=null}">
<%-- 			<input type="hidden"   name="perfilAlumno.responsable2.id"  class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.id}"> --%>
				
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Datos personales RA titular de la cuenta bancaria (RA 2)</h3></div>
  		</div>
  		<br>
  		
<!--   		<div class="card bg-danger text-white"> -->
<!--     		<div class="card-body"><h3>Datos personales RA titular de la cuenta bancaria</h3>  -->
<!-- 	    		<button type="button" class="btn btn-primary" id="mismoRA" name="mismoRA">Mismo RA</button> -->
<!-- 	    		<button type="button" class="btn btn-primary" id="otroRA" name="otroRA">Otro RA</button> -->
<!--     		</div> -->
<!--   		</div> -->
  		
  		<br>
  		
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					<input type="text"   name="perfilAlumno.responsable2.apellido" id="apellidoResponsable2"  class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.apellido}">
				  <label >Apellido</label>
				</div>
    		</div> 
    		<div class="col">
      			<div class="form-floating">
					<input type="text"   name="perfilAlumno.responsable2.nombre"  id="nombreResponsable2" class="form-control" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nombre}">
				  <label >Nombre</label>
				</div>
    		</div>
    	</div>
		<br>
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="number" class="form-control" name="perfilAlumno.responsable2.dni" id="dniRes2"value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.dni}" >
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
      				<select class=" form-control" name="perfilAlumno.responsable2.sexo" id="sexoRes2">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.sexo ==true}">
								<option value=" ">Seleccione una opci&oacute;n:</option>
								<option value=true selected="selected">Masculino</option>
								<option value=false>Femenino</option>
						    </c:when>
						    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.sexo == false}">
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
      			
      			
				 	 <select  class=" form-control" name="perfilAlumno.responsable2.nacionalidad" id="nacionalidadRes2" >
							<c:choose>
		    					<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Argentina'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Bolivia'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Brasil'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Chile'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Colombia'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Ecuador'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Paraguay'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Perú'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Uruguay'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Venezuela'}">
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
							    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nacionalidad == 'Cuba'}">
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
				  <label for="floatingSelect">País</label>
				
				</div>
    		</div> 
    	</div>
		
		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				  <input type="text" class="form-control" name="perfilAlumno.responsable2.celular" id="celularRes2"value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.telefono1 }">
				  <label >Número celular RA2 (Característica + número)</label>
				</div>
				</div>
    		    		
    		<div class="col">
      			<div class="form-floating">
      			
				  <select name="vinculoRA2" id="vinculoRespo2"  class=" form-control">
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
				<input type="text" class="form-control" name="perfilAlumno.responsable2.cuilCuit" id="cuilCuitRes2" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.cuilCuit }">
				<label > CUIL</label>		
			</div>
		</div>
		</div>	
	</c:if>
<%-- 	${entrevistaSeleccionDTO.entrevistaSeleccion.id} --%>
	<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable2.id==null}">
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Datos personales RA titular de la cuenta bancaria: mismo RA</h3></div>
  		</div>
  		<br>
  		
	</c:if>
	
    	<br>
    	
    	<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Participación del RA en la escolaridad del candidato. Proyección a futuro</h3></div>
  		</div>
  		
  		<br>
  		
  		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.dirias" id="dirias" value="${entrevistaSeleccionDTO.entrevistaSeleccion.dirias }">				  
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
					<input type="checkbox" id="regularmente"name="entrevistaSeleccion.regularmente"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.regularmente=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Voy regularmente a la escuela y charlo con el personal</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="pregunta"name="entrevistaSeleccion.pregunta"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.pregunta=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label">Le pregunto a mi hijo/a</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="cuaderno" name="entrevistaSeleccion.cuaderno"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.cuaderno=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >A través del cuaderno de comunicaciones</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="padres" name="entrevistaSeleccion.padres"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.padres=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Asisto a las reuniones de padres</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="carpetas" name="entrevistaSeleccion.carpetas"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.carpetas=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label">Miro sus carpetas</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="cuenta" name="entrevistaSeleccion.cuenta"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.cuenta=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Él/ella me cuenta</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="noSabe"name="entrevistaSeleccion.noSabe"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.noSabe=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >No sabe cómo le va en la escuela</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="grupo" name="entrevistaSeleccion.grupo"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.grupo=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Grupo de WhatsApp</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="otroEnteras"name="entrevistaSeleccion.otroEnteras"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroEnteras=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Otro</label>
				</div>
			</div>
    	</div>
    	
    	<br>
	
		
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.complicacion" id="complicacion"value="${entrevistaSeleccionDTO.entrevistaSeleccion.complicacion}">				  
				  <label >¿Presentó alguna complicación en su trayectoria escolar en primaria o secundaria, como repitencia, abandono, u otras? ¿Cuál?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.cuandoTermine2" id="cuandoTermine"value="${entrevistaSeleccionDTO.entrevistaSeleccion.cuandoTermine2}" >				  
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
				 <select  class=" form-control" name="entrevistaSeleccion.disponibilidad" id="disponibilidad">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.disponibilidad=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.disponibilidad=='No'}">
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
				<label >¿Tenés disponibilidad para participar de las reuniones mensuales en las que seas convocado/a y estar en contacto con el/la tutor/a de Cimientos?</label>
				</div>
    		</div>
		</div>
    	
    	<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <textarea class="form-control"  style="height: 100px"  name="entrevistaSeleccion.pensas" id="pensas">${entrevistaSeleccionDTO.entrevistaSeleccion.pensas}</textarea>				  
				  <label >¿Qué pensás que le puede aportar el programa de Cimientos a tu hijo/a o familiar? ¿En qué crees que lo/a puede ayudar?</label>
				</div>    			
    		</div>
    	</div>
    	
    	<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select  class=" form-control" name="entrevistaSeleccion.otroBecado2" id="otroBecado2">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroBecado2=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
							    <option value="Si, actualmente">Si, actualmente</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroBecado2=='No'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No"selected="selected">No</option>
							    <option value="Si, actualmente">Si, actualmente</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroBecado2=='Si, actualmente'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No">No</option>
							    <option value="Si, actualmente"selected="selected">Si, actualmente</option>
						    </c:when>
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
							    <option value="Sí">Sí</option>
							    <option value="No">No</option>
							    <option value="Si, actualmente">Si, actualmente</option>
							</c:otherwise>
						</c:choose>
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

		
		
 		 <table  id="tablaFicha" style="font-size: small"  >	 
                            <thead align="center" class="card-header " >
                                <tr >
                               		<th></th>
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
								
								
								
								
								<%
								//DMS necesito tener al candidato al inicio de la lista, por alguna razón muchas veces llega mal, este código ordena la lista   
								// Obtener la lista de fichas familiares del request
								
									EntrevistaSeleccionDTO entrevistaSeleccionDTO = (EntrevistaSeleccionDTO) request.getAttribute("entrevistaSeleccionDTO");
								   List<FichaFamiliar> fichas = entrevistaSeleccionDTO.getPerfilAlumno().getFichaFamiliar();

								
								
								   // Ordenar la lista moviendo el elemento con vinculoFicha.valor=="candidato" al principio
									if (fichas != null) {
											   java.util.Collections.sort(fichas, new java.util.Comparator<org.cimientos.intranet.modelo.FichaFamiliar>() {
									     		public int compare(org.cimientos.intranet.modelo.FichaFamiliar ficha1, org.cimientos.intranet.modelo.FichaFamiliar ficha2) {
									           // Poner el elemento con vinculoFicha.valor=="candidato" primero
									           if (ficha1.getVinculo().getValor().equals("Candidato")||ficha1.getVinculo().getValor().equals("Candidata/o")) {
									               
									        	   return -1; // Poner ficha1 antes de ficha2
									           } else if ((ficha2.getVinculo().getValor().equals("Candidato")||ficha2.getVinculo().getValor().equals("Candidata/o"))) {
									        	   
									        	   return 1; // Poner ficha2 antes de ficha1
									           }
									           // En otros casos, no cambia el orden
									           return 0;
									       }
									   });
									}
								%>
								
								
							
								
								
								
								
								
									<c:forEach items="${entrevistaSeleccionDTO.perfilAlumno.fichaFamiliar}" var="fichaFamiliar" varStatus="loop">
											<script>
											//viñeta
											
												incrementarCounter();
												
											</script>
												<tr id="fila<c:out value="${loop.count}"/>" >
													<td><input type="checkbox" value="fila<c:out value="${loop.count}"/>"></td>
													<td  >
														<select  name="vinculoFFs" id="vinculo<c:out value="${loop.count}"/>" class=" form-control p-0"style="font-size: 12px;">
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
													<td  ><input type="text" name="apellidoFichas" id="apellidoFichas<c:out value="${loop.count}"/>" value="${fichaFamiliar.apellido}" class=" form-control p-0" style="font-size: 12px;" size="30"></td>
													<td  ><input type="text" name="nombreFichas" id="nombreFichas<c:out value="${loop.count}"/>" value="${fichaFamiliar.nombre}" class=" form-control p-0" style="font-size: 12px;"size="25"></td>
													<td  ><input type="text"name="edadFichas"  id="edadFichas<c:out value="${loop.count}"/>"  value="${fichaFamiliar.edad}" class=" form-control p-0" style="font-size: 12px;"size="2"></td>
													
													<td >
													<select  name="nivelEducativoFichas" id="nivelEducativoFichas<c:out value="${loop.count}"/>"  class=" form-control p-0" style="font-size: 12px;">
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
													<td ><input type="text"  value="${fichaFamiliar.estabilidadLaboral}" class=" form-control p-0" style="font-size: 12px;"name="estabilidadLaboralFichas" id="estabilidadLaboralFichas<c:out  value="${loop.count}"/>"></td>
													<td ><input type="text" value="${fichaFamiliar.ocupacionLaboral}" class=" form-control p-0" style="font-size: 12px;"name="ocupacionLaboralFichas" id="ocupacionLaboralFichas<c:out value="${loop.count}"/>"></td>
													<td ><input type="text"   value="${fichaFamiliar.tipoTrabajo}" class=" form-control p-0" style="font-size: 12px;"name="tipoTrabajoFichas" id="tipoTrabajoFichas<c:out value="${loop.count}"/>"></td>
													<td ><input type="text"  value="${fichaFamiliar.renumeracion}"  name="renumeracionFichas" id="renumeracionFichas<c:out value="${loop.count}"/>" class=" form-control p-0" style="font-size: 12px;"></td>
													
											
											<input type="hidden" name="conviveFichas" id="conviveFichas" value="${fichaFamiliar.convive.id}"/>
											<input type="hidden" name="abandonoRepitenciaFichas"  id="abandonoRepitenciaFichas" value="${fichaFamiliar.abandonoRepitencia}"/>
											<input type="hidden" name="condicionLaboralFichas" id="condicionLaboralFichas"  value="${fichaFamiliar.condicionLaboral}" />
											<input type="hidden" name="otrosIngresosFichas" class="ingreso digits" id="otrosIngresosFichas" value="${fichaFamiliar.otrosIngresos}"/>
									
									</tr>
									
									
									
									</c:forEach>
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
									
								</c:if>
						</tbody>
				</table> 
		
		
		
		<br>
		
		<table>
					<tr>
						<td>
							<input type="button" value="Agregar Familiar" id="botonAgregarFicha"  class="btn btn-primary"/>
							<input type="hidden" id="contadorFicha" name="contadorFicha">
							<input type="hidden" id="deNombreFF" name="deNombreFF">
							<input type="button" value="Eliminar Familiar" id="botonBorrarFicha" class="btn btn-primary"/>
						</td>
					</tr>
				</table>
		
		<br><br>
		
		
		
		
		
		
		
		
		

		<div class="row align-items-start">
    	
    	<br><br><br>
    	
    		<div class="col">
      			<div class="form-floating">
				  <input type="number" class="form-control" name="entrevistaSeleccion.auh" id="auh"value="${entrevistaSeleccionDTO.entrevistaSeleccion.auh}">
				  <label >Cantidad AUH</label>
				</div>
    		</div>
    		
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.totalAuh" id="totalAuh"value="${entrevistaSeleccionDTO.entrevistaSeleccion.totalAuh}">				  
				  <label >Total AUH</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

		<div class="row align-items-start">
    		    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.otroIngreso" id="otroIngreso"value="${entrevistaSeleccionDTO.entrevistaSeleccion.otroIngreso}">				  
				  <label >¿Cuenta con algún otro ingreso familiar además de los mencionados? ¿De dónde proviene?</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="number" class="form-control" name="entrevistaSeleccion.montoOtroIngreso"id="montoOtroIngreso" value="${entrevistaSeleccionDTO.entrevistaSeleccion.montoOtroIngreso}">				  
				  <label >Monto mensual de otros ingresos</label>
				</div>
    		</div>
 		<br><br><br>
<!--  		<button type="button" class="btn btn-primary" >Cálculo Ingresos totales y Ingreso por Conviviente</button>	 -->
 	   	</div>
    	
    	<br>	
    	<div class="row align-items-start">	
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.ingresosTotales" value="${entrevistaSeleccionDTO.entrevistaSeleccion.ingresosTotales}">				  
				  <label >Ingresos Totales</label>
				</div>
    		</div>
    		
    		<div class="col">
      			<div class="form-floating">
				 <input type="number" class="form-control" name="entrevistaSeleccion.ingresoConviviente" value="${entrevistaSeleccionDTO.entrevistaSeleccion.ingresoConviviente}">				  
				  <label >Ingreso por persona conviviente</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	<br>

<!-- 		<div class="row align-items-start">	 -->
<!--     		<div class="col">      			 -->
<!-- 				<table class="table"> -->
<!-- 					<tr class="table-success"> -->
<!-- 				    	<td align="center" colspan="2"><b>Cuadro aclaratorio de canasta básica por región</b></td> -->
<!-- 				    </tr>				    				    	 -->
<!-- 				      <tr class="table-primary"> -->
<!-- 				        <td align="center"><b>Zona</b></td> -->
<!-- 				        <td align="center"><b>Importe</b></td>				         -->
<!-- 				      </tr>				     -->
<!-- 				    <tbody>				           -->
<!-- 				      <tr class="table-info"> -->
<!-- 				        <td align="center">Local</td> -->
<!-- 				        <td align="center">$ 36.895</td>				         -->
<!-- 				      </tr> -->
<!-- 				      <tr class="table-warning"> -->
<!-- 				        <td align="center">Interior</td> -->
<!-- 				        <td align="center">$ 34.095</td>				         -->
<!-- 				      </tr> -->
<!-- 				      <tr class="table-danger"> -->
<!-- 				        <td align="center">Sur</td> -->
<!-- 				        <td align="center">$ 43.330</td>				         -->
<!-- 				      </tr> -->
<!-- 				     </tbody>  -->
<!-- 				</table> -->
<!--     		</div>    		     		 -->
<!--     	</div> -->
    	
    	<br>
 
 
		
		<div class="card bg-danger text-white">
    		<div class="card-body"><h3>Vivienda</h3></div>
  		</div>

		<br>
		

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select  class=" form-control" name="entrevistaSeleccion.idTipoVivienda" id="tipoVivienda" >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.idTipoVivienda=='1'}">
								<option value="0">Seleccioná una opción</option>
							  	<option value="1" selected="selected">Propia</option>				
								<option value="2">Alquilada</option>
								<option value="3">Prestada</option>
								<option value="4">Cedida</option>
								<option value="5">Terreno_Fiscal</option>
								<option value="6">Otro</option>	
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.idTipoVivienda=='2'}">
								<option value="0">Seleccioná una opción</option>
							  	<option value="1" >Propia</option>				
								<option value="2"selected="selected">Alquilada</option>
								<option value="3">Prestada</option>
								<option value="4">Cedida</option>
								<option value="5">Terreno_Fiscal</option>
								<option value="6">Otro</option>	
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.idTipoVivienda=='3'}">
								<option value="0">Seleccioná una opción</option>
							  	<option value="1">Propia</option>				
								<option value="2">Alquilada</option>
								<option value="3" selected="selected">Prestada</option>
								<option value="4">Cedida</option>
								<option value="5">Terreno_Fiscal</option>
								<option value="6">Otro</option>	
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.idTipoVivienda=='4'}">
								<option value="0">Seleccioná una opción</option>
							  	<option value="1" >Propia</option>				
								<option value="2">Alquilada</option>
								<option value="3">Prestada</option>
								<option value="4"selected="selected">Cedida</option>
								<option value="5">Terreno_Fiscal</option>
								<option value="6">Otro</option>	
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.idTipoVivienda=='5'}">
								<option value="0">Seleccioná una opción</option>
							  	<option value="1" >Propia</option>				
								<option value="2">Alquilada</option>
								<option value="3">Prestada</option>
								<option value="4">Cedida</option>
								<option value="5"selected="selected">Terreno_Fiscal</option>
								<option value="6">Otro</option>	
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.idTipoVivienda=='6'}">
								<option value="0">Seleccioná una opción</option>
							  	<option value="1" >Propia</option>				
								<option value="2">Alquilada</option>
								<option value="3">Prestada</option>
								<option value="4">Cedida</option>
								<option value="5">Terreno_Fiscal</option>
								<option value="6"selected="selected">Otro</option>	
						    </c:when>
							
						    <c:otherwise>
								<option value="0">Seleccioná una opción</option>
							  	<option value="1" selected="selected">Propia</option>				
								<option value="2">Alquilada</option>
								<option value="3">Prestada</option>
								<option value="4">Cedida</option>
								<option value="5">Terreno_Fiscal</option>
								<option value="6">Otro</option>	
							</c:otherwise>
						</c:choose>
					</select>
				<label >Tipo de vivienda</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	
    	
		<div class="row align-items-start">
			<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" id="ambientes" name="entrevistaSeleccion.ambientes" value="${entrevistaSeleccionDTO.entrevistaSeleccion.ambientes}">				  
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
					<input type="checkbox" id="agua"name="entrevistaSeleccion.agua"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.agua=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Agua</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="luz"name="entrevistaSeleccion.luz"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.luz=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Luz</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="gasNatural" name="entrevistaSeleccion.gasNatural"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.gasNatural=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Gas natural</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="gasGarrafa" name="entrevistaSeleccion.gasGarrafa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.gasGarrafa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label">Gas a garrafa</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="telefoniaFija"name="entrevistaSeleccion.telefoniaFija"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.telefoniaFija=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Teléfono fijo</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="celular"name="entrevistaSeleccion.celular"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.celular=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Celular</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="internet" name="entrevistaSeleccion.internet"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.internet=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Internet</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="tvcable"name="entrevistaSeleccion.tvcable"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.tvcable=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Tv por cable</label>
				</div>
				<div class="form-check">
					<input type="checkbox"id="vehiculo" name="entrevistaSeleccion.vehiculo"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.vehiculo=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Vehículo propio</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="otroServicio"name="entrevistaSeleccion.otroServicio"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroServicio=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Otro</label>
				</div>
			</div>
		</div>

		<br>
		
		<div class="row align-items-start">
			<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.comentariosAdicionalesRa" id="comentariosAdicionalesRa"value="${entrevistaSeleccionDTO.entrevistaSeleccion.comentariosAdicionalesRa}">				  
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
				 <select  class=" form-control" name="entrevistaSeleccion.cobertura" id="cobertura" >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.cobertura=='No'}">
								  <option value="0">Seleccioná una opción</option>
								  <option value="No" selected="selected">No</option>
								  <option value="Si, obra social">Si, obra social</option>
								  <option value="Si, medicina privada">Si, medicina privada</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.cobertura=='Si, obra social'}">
								  <option value="0">Seleccioná una opción</option>
								  <option value="No" >No</option>
								  <option value="Si, obra social" selected="selected">Si, obra social</option>
								  <option value="Si, medicina privada">Si, medicina privada</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.cobertura=='Si, medicina privada'}">
								  <option value="0">Seleccioná una opción</option>
								  <option value="No" >No</option>
								  <option value="Si, obra social">Si, obra social</option>
								  <option value="Si, medicina privada" selected="selected">Si, medicina privada</option>
						    </c:when>
							
						    <c:otherwise>
								<option value="0"selected="selected">Seleccioná una opción</option>
								<option value="No" >No</option>
								<option value="Si, obra social">Si, obra social</option>
								<option value="Si, medicina privada">Si, medicina privada</option>
							</c:otherwise>
						</c:choose>
					</select>
				<label >¿Tiene obra social o prepaga?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					<select  class=" form-control" name="entrevistaSeleccion.saludHijo" id="saludHijo" >
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludHijo=='1'}">
								<option value="">Seleccioná una opción</option>
							    <option value="1"selected="selected">Sí</option>
							    <option value="0">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludHijo=='0'}">
								<option value="">Seleccioná una opción</option>
							    <option value="1">Sí</option>
							    <option value="0"selected="selected">No</option>
						    </c:when>
						    <c:otherwise>
								<option value=""selected="selected">Seleccioná una opción</option>
							    <option value="1">Sí</option>
							    <option value="0">No</option>
							</c:otherwise>
						</c:choose>
					</select>
				<label for="floatingSelect">¿Su hijo/a o familiar tiene algún problema de salud?</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
    	
    	<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
				 <input type="text" class="form-control" name="entrevistaSeleccion.problemaSaludHijo" id="problemaSaludHijo" value="${entrevistaSeleccionDTO.entrevistaSeleccion.problemaSaludHijo}" >	
				 			  
				  <label >En caso afirmativo, ¿Qué problema de salud tiene?</label>
				</div>
    		</div>
    		     		
    	</div>

		<br>
		
		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					<select  class=" form-control" name="entrevistaSeleccion.inasistenciasSalud" id="inasistenciasSalud">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.inasistenciasSalud=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.inasistenciasSalud=='No'}">
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

				<label for="floatingSelect">¿Tiene inasistencias en la escuela por el problema de salud o tiene dificultades para cumplir con las tareas escolares por su problema de salud?</label>
				</div>
    		</div>
    	</div>	
    		
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
					<select  class=" form-control" name="entrevistaSeleccion.saludFliar" id="saludFliar">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludFliar=='1'}">
								<option value="">Seleccioná una opción</option>
							    <option value="1"selected="selected">Sí</option>
							    <option value="0">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.saludFliar=='0'}">
								<option value="">Seleccioná una opción</option>
							    <option value="1">Sí</option>
							    <option value="0"selected="selected">No</option>
						    </c:when>
						    <c:otherwise>
								<option value=""selected="selected">Seleccioná una opción</option>
							    <option value="1">Sí</option>
							    <option value="0">No</option>
							</c:otherwise>
						</c:choose>
					</select>
				<label >¿Ud. o algún otro integrante de la familia tiene problemas de salud?</label>
				</div>
    		</div>
    	</div>
    	
    	
    	<br>
    		
    	<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
      				 <input type="text" class="form-control" name="entrevistaSeleccion.problemaSaludFliar" id="problemaSaludFliar" value="${entrevistaSeleccionDTO.entrevistaSeleccion.problemaSaludFliar}" >	
				  <label >En caso afirmativo, ¿Qué problema de salud tiene?</label>
				</div>
    		</div>
    		     		
    	</div>	
    		
    	<br>
    	
    	<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 <select  class=" form-control" name="entrevistaSeleccion.faltaFliar" id="faltaFliar">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.faltaFliar=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.faltaFliar=='No'}">
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
      				 <input type="text" class="form-control" name="entrevistaSeleccion.informacionComplementariaRa" id="informacionComplementariaRa" value="${entrevistaSeleccionDTO.entrevistaSeleccion.informacionComplementariaRa}" >	
				  <label >Información complementaria y percepciones</label>
				</div>
    		</div>
    	</div>
    	
    	<br>
		
		<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
					<select  class=" form-control" name="entrevistaSeleccion.problemaAprendizaje" id="problemaAprendizaje">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.problemaAprendizaje=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.problemaAprendizaje=='No'}">
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
				<label >¿Se detectó alguna dificultad cognitiva o problema de aprendizaje?</label>
				</div>
    		</div>
    	</div>
    	<br>

		<div class="row align-items-start">
    		<div class="col">
      			<div class="form-floating">
				 	<select  class=" form-control" name="entrevistaSeleccion.riesgoEscolarRa" id="riesgoEscolarRa">
						<c:choose>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.riesgoEscolarRa=='Sí'}">
								<option value="0">Seleccioná una opción</option>
							    <option value="Sí"selected="selected">Sí</option>
							    <option value="No">No</option>
						    </c:when>
							<c:when test="${entrevistaSeleccionDTO.entrevistaSeleccion.riesgoEscolarRa=='No'}">
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
					<input type="checkbox" id="fallecimientoRa"name="entrevistaSeleccion.fallecimientoRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.fallecimientoRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Fallecimiento de una persona significativa</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="enfermedadRa" name="entrevistaSeleccion.enfermedadRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.enfermedadRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" > Enfermedad propia o de una persona significativa</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="maternidadRa" name="entrevistaSeleccion.maternidadRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.maternidadRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Maternidad/Paternidad del EP</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="mudanzaRa"name="entrevistaSeleccion.mudanzaRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.mudanzaRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Mudanza</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="cambioEstructuraRa"name="entrevistaSeleccion.cambioEstructuraRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.cambioEstructuraRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Cambio de estructura familiar/convivientes</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="economiaRa"name="entrevistaSeleccion.economiaRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.economiaRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Situación de crisis económica en la familia</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="violenciaRa"name="entrevistaSeleccion.violenciaRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.violenciaRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Situación de violencia familiar</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="consumoRa" name="entrevistaSeleccion.consumoRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.consumoRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label">Consumo problemático</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="violenciaEscolarRa" name="entrevistaSeleccion.violenciaEscolarRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.violenciaEscolarRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label">Situación de violencia escolar</label>
				</div>
				<div class="form-check">
					<input type="checkbox" id="otraSituacionRa"name="entrevistaSeleccion.otraSituacionRa"	<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otraSituacionRa=='1'}"> checked="checked"</c:if>>
  					<label class="form-check-label" >Otra</label>
				</div>
			</div>
		</div>

		<br>
		
		<div class="row align-items-start">	
    		<div class="col">
      			<div class="form-floating">
      			     <input type="text" class="form-control" name="entrevistaSeleccion.cualOtraSituacionRa" id="cualOtraSituacionRa" value="${entrevistaSeleccionDTO.entrevistaSeleccion.cualOtraSituacionRa}" >	
				  <label>¿Cuál?</label>
				</div>
    		</div>
    		     		
    	</div>
    	
    	</br>
            <div class="card bg-danger text-white">
                            <div class="card-body"><h3>Enviar Entrevista de Asignación a Fénix</h3></div>
                          </div>
        
                        </br></br>
                        
                        <div class="row align-items-start">
                            <div class="col">
                                      <div class="form-floating">
                
                                                <select name="estados" id="estados"  onchange="habilitarInputEstadoAlumno(this.value)"class="form-select">
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
                                                <label for="floatingSelect">Estado del Alumno</label>
                                        </div>
                            </div>
                            <div class="col">                              
                                      <div class="form-floating">
                                          
                                          <select class="form-select"  aria-label="Floating label select example" name="respoBanco" id="respoBanco" >                                  
                                                         <option value="0">${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.banco.nombre}</option>
                                                                                                  
                                                </select>
                                                <label for="floatingSelect">Banco</label>
                                        </div>
                            </div>
                            <div class="col">
                                      <div class="form-floating">
                                      
                                      
                                      <!-- Esta combo se popula cuando  se selecciona una Escuela. el metodo javascript que maneja esto esta en  fichaCandidato.jsp se llama
                                                populateComboSucursal, y el metodo que trae los datos por ajax buscarSucursalBancoPorZona que se llama cuando se activa el autocompletar de Escuela
                                                          -->
                                                <select id="respoSucursal"  name="perfilAlumno.responsable1.sucursalBanco.id"  onchange="seleccionarBanco(this.value);" class="form-select"  >
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
                                      
                                                <label for="floatingSelect">Sucursal</label>
                                        </div>
                            </div>
                    </div>
                    </br></br>
    	
    	
    	
    	
    	
</div>    
</div>	
  


			<div id="accordion" style="width: auto" >
<!-- DMS prueba para ocultar todo -->
				<h3 class="ui-accordion-header  ui-state-default ui-corner-all"
					align="left">
					<a href="#" onclick="mostrar(5)">ocultar todo</a>
				</h3>

				<h3 class="ui-accordion-header  ui-state-default ui-corner-all"
					align="left">
					<a href="#" ">Ficha del Candidato</a>
				</h3>
				
					
<!-- 				###########################################################################	 -->
<!-- 				###################### fichaCandidato.jsp##################################	 -->
<!-- 				###########################################################################	 -->
				
				<div id="datosCandidato"
					style="width: auto; height: auto; overflow: scroll;">
					
					
					
					
					
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
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
<!-- <script type="text/javascript" -->
<%-- 	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script> --%>
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
 	$("#localidadRA").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarLocalidadPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					name_startsWith: request.term,
					maxRows:40
				},
				success: function(data) {
					response($.map(data.localidades, function(item) {
						return {
							label: item.nombre + ", " + item.nombreProvincia ,
							value: item.nombre,
							id: item.id,
							zonaCimientos: item.nombreZona,								
							idZonaCimientos: item.idZona,
							provincia: item.nombreProvincia,
							idProvincia: item.idProvincia
							
						}
					}))
				}
			})
		},
		select: function(event, ui) {
			$("#localidadRA").val(ui.item.id);				
			$("#idLocalidadRA").val(ui.item.id);
// 			$("#idZonaCimientos").val(ui.item.idZonaCimientos);
// 			$("#nombreProvincia").val(ui.item.provincia);
// 			$("#provinciaId").val(ui.item.idProvincia);
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
		
		
<%-- 		<jsp:include page="datosPersonalesAlumno.jsp"></jsp:include> --%>
<!-- 		########################################################################## -->
<!-- 		##################datosPersonalesAlumno.jsp############################### -->
<!-- 		########################################################################## -->
		<div id="datosPersonalesAlumnoJsp">
		
<%-- 		<%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">

<script type="text/javascript">
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

</script>



<fieldset style="width: 450px; height: auto; margin-left: 15px; background-color: #D6D6D6">
	<table align="left" width="550px">
		<tr>
			<td>
			<p><font color="green"><label for="fechaEntrevista">Fecha Entrevista:</label> </font>
<%-- 				<input name="fechaEntrevista" id="fechaEntrevista"   value="<fmt:formatDate value="${entrevistaSeleccionDTO.entrevistaSeleccion.fechaEntrevista}" pattern="dd/MM/yyyy"/>" onChange="calcular_fecha(this.value)"  > 				 --%>
<!-- 				<input type="hidden" name="excepcion" id="excepcion" value="No"> -->
			</p>
		</td>
		</tr>
		
		
		
		
		<tr align="left">	
			<td align="left">
				<br>
				<br>
				<p>	<font color="green"><label style="font-size: 10px;">
						<b>Convocatoria *</b>
					</label></font> 
<%-- 						<input id="convocatoria" type="text" name="entrevistaSeleccion.convocatoria.nombre"  value="${entrevistaSeleccionDTO.entrevistaSeleccion.convocatoria.nombre}" onclick="limpiarConvocatoria()" onblur="chequearConvocatoria()" /> --%>
						<input type="hidden" name="idConvocatoria" 	id="idConvocatoria" value="${entrevistaSeleccionDTO.entrevistaSeleccion.convocatoria.idConvocatoria}"/>
				</p>
			</td>
		</tr>
		<tr>
			<td align="left">
			<br>
			<br>
			<p><font color="green"><label style="font-size: 10px"><b>Estado Alumno *</b></label></font> 
<!-- 				<select 	name="estados" id="estados"  onchange="habilitarInputEstadoAlumno(this.value)"> -->
<!-- 					<option value="">Seleccione una opci&oacute;n:</option> -->
<%-- 					<c:forEach items="${listEstadoAlumnos}" var="estado"> --%>
<%-- 						<c:choose> --%>
<%-- 							<c:when --%>
<%-- 								test="${entrevistaSeleccionDTO.perfilAlumno.estadoAlumno.id == estado.id}"> --%>
<%-- 								<option value="${estado.id}" selected="selected">${estado.valor}</option> --%>
<%-- 							</c:when> --%>
<%-- 							<c:otherwise> --%>
<%-- 								<option value="${estado.id}" >${estado.valor}</option> --%>
<%-- 							</c:otherwise> --%>
<%-- 						</c:choose> --%>
		
<%-- 					</c:forEach> --%>
<!-- 				</select> -->
			</p>
			</td>
		</tr>
		<tr>
			<td ></td>
		</tr>
		<tr>
			<td align="left">
			<br>
			<br>
			<p><label style="font-size: 10px"><b>Motivo Rechazo</b></label>		
				<select name="idMotivoRechazo" disabled="disabled" id="motivoRechazo" onchange="habilitarMotivo(this)">
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
			</td>
		</tr>
		<tr>
			<td align="left">
				<p><label style="font-size: 10px">Otro motivo rechazo</label>
					<form:textarea path="entrevistaSeleccion.otroMotivoRechazo" rows="4" cols="30" id="otroMotivoRechazo" disabled="true" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
				</p>
			</td>
		</tr>
		<tr>
			<td align="left">
			<br>
			<br>
			<p><label style="font-size: 10px"><b>Motivo Env&iacute;o TS</b></label>
				<select name="idMotivoTS"  disabled="disabled" id="motivoEnvioTS" >
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
			</td>
		</tr>
		<tr>
			<td align="left">
			<br>
			<br>
			<p><label style="font-size: 10px">Observaciones para TS</label>
				<form:textarea disabled="true" path="perfilAlumno.responsable1.observacionesParaTS" rows="4" cols="30" id="observacionesParaTS" onblur="chequearLongitudRA(this);" onkeypress="chequearLongitudRA(this);"/>
			</p>
			</td>
		</tr>
			
	</table>
</fieldset>

    
<!-- Datos Personales -->
<table id="tablaDatosPersonales" align="left" cellspacing="8">
	<tr>
		<td colspan="3">
	</tr>
	<tr>
		<td></td>
		<td>
			
		</td>
		
		<td></td>
	</tr>
	
	<tr>
		<td colspan="3">		
			<font color="blue" size="2">
			Si tenés duda con algún dato del Candidato/a y/o Responsable hacé click en el siguiente link</font>
			<br><br>			
			<a href="http://www.buscardatos.com" target="_blank"><font size="2">Padrón electoral</font></a> (Buscás por apellido o DNI)						 				
		</td>
	</tr>
	<tr>
		<td>
			<p>
				<label for="Nombre" ><font color="green">Nombre *</font></label> 
<%-- 				<input type="text" 	onchange="this.value=this.value.toUpperCase();"    id="alumnoNombre" name="perfilAlumno.datosPersonales.nombre"   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nombre}" > --%>
			</p>
					
		</td>
		<td>	
			<p>			
				<font color="green"><label for="Apellido">Apellido *</label></font> 
<%-- 				<input type="text" 	onchange="this.value=this.value.toUpperCase();"  id="alumnoApellido" name="perfilAlumno.datosPersonales.apellido"  value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.apellido}"> --%>
			</p>
		</td>
		<td></td>
	</tr>
	<tr>
		<td>
			<p>
				<font color="green"><label>Tipo  de DNI *</label> </font>
					<select name="tipo" id="dni" >
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
		</td>
		<td >
			<p>
			<%-- <c:choose>
				<c:when test="${accion == 'modificar'}">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td><font color="green"><label for="dniAlumno">DNI *</label></font></td>
							<td><input type="text" id="dniAlumno"
									   name="perfilAlumno.datosPersonales.dni" class="digits"  maxlength="8" 
									   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  ></td>
							<td><label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
						</tr>
					</table>
				</c:when>
				<c:when test="${accion == 'carga'}">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td><font color="green"><label for="dniAlumno">DNI *</label></font></td>
							<td><input type="text" id="dniAlumno" disabled="disabled"
									   name="perfilAlumno.datosPersonales.dni" class="digits"  maxlength="8" 
									   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  ></td>
							<td><label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
						</tr>
					</table>
				</c:when>
				<c:when test="${accion == 'alta'}">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td><font color="green"><label for="dniAlumno">DNI *</label></font></td>
							<td><input type="text" id="dniAlumno" onblur="buscarAlumno()" 
									   name="perfilAlumno.datosPersonales.dni" class="digits"  maxlength="8" 
									   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  ></td>
							<td><label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
						</tr>
					</table>
				</c:when>
				<c:when test="${accion == 'ver'}">
					<table cellpadding="0" cellspacing="0">
						<tr>
							<td><font color="green"><label for="dniAlumno">DNI *</label></font></td>
							<td><input type="text" id="dniAlumno" disabled="disabled"
									   name="perfilAlumno.datosPersonales.dni" class="digits"  maxlength="8" 
									   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}"  ></td>
							<td><label id="dniAlumnoError" style="color: red; display: none;">Ingrese un DNI válido</label></td>
						</tr>
					</table>
				</c:when>
			</c:choose> --%>
		</td>
		<td></td>
	</tr>
	<tr>
		<td >
			<p>
				<font color="green"><label>Pais</label></font> 
				<!-- input type="text"  onchange="this.value=this.value.toUpperCase();"	id="alumnoNacionalidad" name="perfilAlumno.datosPersonales.nacionalidad"  value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad}"-->
<!-- 				<select name="alumnoNacionalidad" id="alumnoNacionalidad"  onchange="habilitarInputEstadoAlumno(this.value)"> -->
<%-- 					<c:choose> --%>
<%--     					<c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Argentina'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" selected="selected">Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option>							 -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Bolivia'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina">Argentina</option> -->
<!-- 							<option value="Bolivia"  selected="selected">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option>							 -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Brasil'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil" selected="selected">Brasil</option>							 -->
<!-- 							<option value="Chile">Chile</option>							 -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Chile'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option>							 -->
<!-- 							<option value="Chile" selected="selected">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Colombia'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option>							 -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia" selected="selected">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Ecuador'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option>							 -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador" selected="selected">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Paraguay'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option>							 -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay" selected="selected">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Perú'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option>							 -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú" selected="selected">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Uruguay'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option> -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay" selected="selected">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Venezuela'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option> -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela" selected="selected">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:when test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.nacionalidad == 'Cuba'}"> --%>
<!--        						<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option>							 -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba" selected="selected" >Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option>	 -->
<%-- 					    </c:when> --%>
<%-- 					    <c:otherwise> --%>
<!-- 						 	<option value=" ">Seleccione una opci&oacute;n:</option> -->
<!-- 							<option value="Argentina" >Argentina</option> -->
<!-- 							<option value="Bolivia">Bolivia</option> -->
<!-- 							<option value="Brasil">Brasil</option>							 -->
<!-- 							<option value="Chile">Chile</option> -->
<!-- 							<option value="Colombia">Colombia</option> -->
<!-- 							<option value="Cuba">Cuba</option> -->
<!-- 							<option value="Ecuador">Ecuador</option> -->
<!-- 							<option value="Paraguay">Paraguay</option> -->
<!-- 							<option value="Perú">Perú</option> -->
<!-- 							<option value="Uruguay">Uruguay</option> -->
<!-- 							<option value="Venezuela">Venezuela</option> -->
<%-- 					    </c:otherwise> --%>
<%-- 					</c:choose> --%>
					
					
<!-- 				</select> -->
			</p>
		</td>	
		<td></td>
		<td></td>
	</tr>
	<tr>
		<td>
			<p>
				<font color="green"><label>Sexo *</label></font>
					<%-- M<input type="radio" id="alumnoSexoM" name="perfilAlumno.datosPersonales.sexo" 
					<c:if test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo}"> checked="checked"</c:if> value="true"> 
					F<input type="radio" id="alumnoSexoF" name="perfilAlumno.datosPersonales.sexo"
					<c:if test="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.sexo == false}"> checked="checked"</c:if> value="false"> --%>
			</p>
		</td>
		<td>
<!-- 			<p><font color="green"><label for="fechaNacimiento">Fecha de Nacimiento *</label> </font> -->
<%-- 				<input name="fechaNacimientoCandidato" id="fechaNacimiento"  onChange="calcular_edad(this.value)"  class="date required" value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>"  >  --%>
<!-- 				<input name="input_id_2" id="input_id_2" type="hidden"> -->
<!-- 			</p> -->
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="height: 15px;"></td><td></td><td></td>
	</tr>
	<tr >
		<td >
			<p>
				<font color="green"><label>Escuela *</label></font>
				<input type="hidden" name="idEscuela" 	id="idEscuela" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.id}"/>
				<input id="escuela" type="text" name="perfilAlumno.escuelaSeleccion.nombre"  value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.nombre}" onchange="limpiarComboBanco(this);" />
				
			</p>
		</td>
		<td>
			<p>
				<font color="green"><label>Zona Cimientos *</label> </font>
					<input type="hidden" name="perfilAlumno.escuelaSeleccion.zona.id" id="idZonaCimientos" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.id}" />
					<input id="zonaCimientos" name="perfilAlumno.escuelaSeleccion.zona.nombre" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.nombre}"  disabled="disabled"/>
					EAE:<input id="eae" name="eae" value="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae}"  disabled="disabled"/>
			</p>
		</td>
		<td></td>
	</tr>
	<tr>
		
		<%-- <c:choose>			
			<c:when test="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae=='6/6'}">
				<td>
					<p>
					<font color="green"><label>Año Escolar 6/6*</label></font>				
						<select name="anioEscuela" id="anioEscuela"  >
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
					<!-- font color="green"><label>Año Escolar PFE</label></font--> 
					<input type="hidden" id="ae" name="ae" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar.valor}">
					<input type="hidden" id="idAe" name="idAe" disabled="disabled" value="${entrevistaSeleccionDTO.perfilAlumno.anioEscolar}">
				
					<!-- font color="green"><label>Año Escolar real</label></font--> 
					
				</td>				
			</c:when>
			<c:when test="${entrevistaSeleccionDTO.perfilAlumno.escuelaSeleccion.zonaCimientos.eae=='7/5'}">
				<td>
					<p>
						<font color="green"><label>Año Escolar 7/5*</label></font> 
							<select name="anioEscuela" id="anioEscuela"  >
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
				</td>				
			</c:when>
			<c:otherwise>
				<td>
					<font color="green"><label>Año Escolar*</label></font>
					<select name="anioEscuela" id="anioEscuela"  >
						<option value="">Seleccione una opci&oacute;n:</option>
					</select>
				</td>
			</c:otherwise>
		</c:choose> --%>
	</tr>
	<tr>
		
	</tr>
	
	
	<tr>	
		<td>
			<p>
				<label>División</label> 
<%-- 					<input 	name="perfilAlumno.division" id="alumnoDivision" value="${entrevistaSeleccionDTO.perfilAlumno.division }"	 > --%>
			</p>
				 	
		</td>
	</tr>
	<tr>
		<td>
			<p>
				<font color="green"><label>Turno *</label></font>
<!-- 		 			<select name="turno" id="turno" > -->
<!-- 		 				<option value="">Seleccione una opci&oacute;n:</option> -->
<%-- 						<c:forEach items="${listTurno}" var="turno"> --%>
<%-- 							<c:choose> --%>
<%-- 								<c:when test="${entrevistaSeleccionDTO.perfilAlumno.turno.id == turno.id}"> --%>
<%-- 									<option value="${turno.id}" selected="selected">${turno.valor}</option> --%>
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<%-- 									<option value="${turno.id}">${turno.valor}</option> --%>
<%-- 								</c:otherwise>	 --%>
<%-- 							</c:choose> --%>
<%-- 					</c:forEach> --%>
<!-- 				</select> -->
			</p>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<p>
				<label>Orientación</label>
					<form:textarea path="entrevistaSeleccion.orientacion" rows="4" cols="40"  id="orientacion" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</p>
		</td>
	</tr>
	
	
	<tr>
		<td>
			<p>
				<label>¿Recibe otra Beca?</label>
					<%-- Si<input type="radio" id="alumnoRecibeOtraBeca" name="entrevistaSeleccion.recibeOtraBeca" onfocus="habilitarBeca('si')"
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca}"> checked="checked"</c:if> value="true"> 
					No<input type="radio" id="alumnoRecibeOtraBeca" name="entrevistaSeleccion.recibeOtraBeca" onfocus="habilitarBeca('no')"
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.recibeOtraBeca == false}"> checked="checked"</c:if> value="false"> --%>
			</p>
		</td>
		<td><p>
				<label>Cuál</label>
<%-- 					<input type="text" name="entrevistaSeleccion.cualBeca" id="cualBeca" value="${entrevistaSeleccionDTO.entrevistaSeleccion.cualBeca}" disabled="disabled"> --%>
			</p> 
		</td>
		<td></td>
	</tr>
	<tr>
		<td style="height: 10px;"></td><td></td><td></td>
	</tr>
	<tr>
		<td>
			<p>
				<font color="green"><label>Calle *</label></font> 
					<input type="text" onchange="this.value=this.value.toUpperCase();" id="alumnoDireccion" name="perfilAlumno.datosPersonales.direccion"  value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.direccion }">
			</p>
		</td>
		<td></td>
		<td>
		</td>
	</tr>
	
	<tr>
		<td>
			<table cellpadding="0" cellspacing="0">
					<tr>
						<td><font color="green"><label>Número *</label></font></td>
						<td><input type="text"  onchange="this.value=this.value.toUpperCase();"  id="alumnoNumero" name="perfilAlumno.datosPersonales.numeroCalle"  
							value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.numeroCalle }">
						</td>
						<td><label id="numeroAlumnoError" style="color: red; display: none;">Solo puede ingresar Numero </label></td>
					</tr>
			</table>
			
		</td>
		<td>
			<table cellpadding="0" cellspacing="0">
					<tr>
						<td><label>Piso/Manzana</label></td>
						<td><input type="text"  onchange="this.value=this.value.toUpperCase();"   id="alumnoPiso" name="perfilAlumno.datosPersonales.piso" class="" 
							value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.piso }">
						</td>
						<td><label id="pisoAlumnoError" style="color: red; display: none;">Solo puede ingresar Numero </label></td>
					</tr>
			</table>
		<p>
				
					
			</p>
		</td>
	</tr>
	<tr>		
		<td>
			<p>
				<label>Casa/Departamento </label> 
					<input type="text" onchange="this.value=this.value.toUpperCase();"	  id="alumnoEntreCalles" name="perfilAlumno.datosPersonales.departamento" 
				 	value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.departamento}" >
			</p>
			
		</td>
	
	
	
		<td>
			<p>
				<label><font color="green">Entre Calles *</font></label> 
					<input type="text"  onchange="this.value=this.value.toUpperCase();" 	id="alumnoEntreCalles" name="perfilAlumno.datosPersonales.entreCalles" 
<%-- 					 	value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.entreCalles}" > --%>
					 	value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.entreCalles}" >
			</p>
		</td>
	</tr>
	<tr>
		<td>
<!-- 			<p> -->
<!-- 				<font color="green"><label>Barrio *</label></font> -->
<!-- 					<input type="text" onchange="this.value=this.value.toUpperCase();"  id="barrio" name="perfilAlumno.datosPersonales.barrio" -->
<%-- 						value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.barrio}" > --%>
<!-- 			</p> -->
		</td>
		<td>
			<p>
				<font color="green"><label>Código Postal *</label></font> 
					<input type="text" onchange="this.value=this.value.toUpperCase();"  id="alumnoCodigoPostal" name="perfilAlumno.datosPersonales.codigoPostal"   value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.codigoPostal}"> 
			</p>
		</td>
	</tr>
		
	<tr>
		<td>
			<p>
				<font color="green"><label>Localidad *</label></font>
					<select name="perfilAlumno.datosPersonales.localidad.id" id="localidadAlumno" style="width: 208px;" >
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
		</td>
		<td>
			<p>
				<font color="green"><label>Provincia * </label></font>
					<select name="perfilAlumno.datosPersonales.provincia.id" id="provinciaAlumno" >
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
		   </p></td>
		<td></td>
	</tr>
		
	<tr>
		<td>
		
			<p><font color="green"><label for="telefono">Teléfono (cargá el código de área) *</label></font> 
				<input type="text" 	name="perfilAlumno.datosPersonales.telefono" id="alumnoTelefono" maxlength="19"
<%-- 				 value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.telefono}" onkeypress="return justNumbers(event);"/> --%>
				 value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.telefono}" onkeypress="return justNumbers(event);"/>
			</p>
		</td>
		<td></td>
		<td></td>
	</tr>
	
	<tr>
		<td>
			<p>
				<label for="contacto1">Teléfono 1 (cargá el código de área)</label> 
					<input type="text"  onchange="this.value=this.value.toUpperCase();"  maxlength="19"  name="perfilAlumno.telefono1" id="telefono1"
					value="${entrevistaSeleccionDTO.perfilAlumno.telefono1}" onkeypress="return justNumbers(event);" />
			</p>
			
		</td>
		
		<td>
			<p>
				<label for="contacto1">Contacto 1</label> 
					<input type="text"   onchange="this.value=this.value.toUpperCase();" name="perfilAlumno.contactoTelefono1" id="alumnoContactoTelefono1"
					value="${entrevistaSeleccionDTO.perfilAlumno.contactoTelefono1}"/>
			</p>
		</td>
	   	<td></td>
	</tr>
	
	<tr>
		<td>
			<p>
				<label for="contacto2">Teléfono 2 (cargá el código de área)</label> 
					<input type="text"  onchange="this.value=this.value.toUpperCase();" 	maxlength="19" name="perfilAlumno.telefono2" id="telefono2"
					value="${entrevistaSeleccionDTO.perfilAlumno.telefono2}" onkeypress="return justNumbers(event);"/>
			</p>
			
	   	</td>
	   	<td>
			<p>
				<label for="contacto2">Contacto 2</label> 
					<input type="text"  onchange="this.value=this.value.toUpperCase();" 	name="perfilAlumno.contactoTelefono2" id="alumnoContactoTelefono2"
					value="${entrevistaSeleccionDTO.perfilAlumno.contactoTelefono2}"/>
			</p>
	   	</td>
	   	<td></td>
	</tr>
		
	<tr>
		<td>
			<p>
				<label for="telefono">Mail / Facebook</label> 
					<input type="text" onchange="this.value=this.value.toUpperCase();"  	name="perfilAlumno.datosPersonales.mail" id="alumnoMail"
					value="${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.mail}"/>
			</p>
		</td>
		<td>
			<p>
				<label>¿Tuvo algún hermano/a beca de Cimientos?</label>
					Si<input type="radio" id="otroBecado" name="otroBecado" 
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroBecado}"> checked="checked"</c:if> value="true"> 
					No<input type="radio" id="otroBecado" name="otroBecado" 
						<c:if test="${entrevistaSeleccionDTO.entrevistaSeleccion.otroBecado == false}"> checked="checked"</c:if> value="false">
			
					
			
			</p>
		</td>
		
		<td></td>
	</tr>
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
</table>
		
		
		
		
		</div>
</fieldset>
<!-- Datos Escolares -->
<fieldset>
	<legend> Datos Escolares </legend>
<%-- 		<jsp:include page="datosEscolaresAlumno.jsp"></jsp:include> --%>
<!-- 		########################################################################## -->
<!-- 		##################datosEscolaresAlumno.jsp############################### -->
<!-- 		########################################################################## -->	
<div id="datosEscolaresAlumnoJsp">
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="mif" uri="/list-operator.tld" %>

<script type="text/javascript">
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
</script>
    
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
		
</div>	
</fieldset>
<!-- EvaluaciÃ³n -->
<fieldset>
	<legend> Evaluaci&oacute;n Candidato </legend>
<%-- 		<jsp:include page="evaluacion.jsp"></jsp:include> --%>
<!-- 		########################################################################## -->
<!-- 		##################evaluacion.jsp############################### -->
<!-- 		########################################################################## -->	
<div id="evaluacionJsp">
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>
</div>

</fieldset>
<!-- Boletin -->
<fieldset>	
<%-- 	<jsp:include page="materiasInteres.jsp"></jsp:include> --%>
<!-- 		########################################################################## -->
<!-- 		##################materiasInteres.jsp############################### -->
<!-- 		########################################################################## -->	
<div id="materiasInteresJsp">
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     

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

</div>

</fieldset>

<!-- Boletin -->
<fieldset>
	<legend> Bolet&iacute;n </legend>
<%-- 	<jsp:include page="boletinSeleccion.jsp"></jsp:include>	 --%>
<!-- 		########################################################################## -->
<!-- 		##################boletinSeleccion.jsp############################### -->
<!-- 		########################################################################## -->	
<div id="boletinSeleccionJsp">
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     	 pageEncoding="ISO-8859-1"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script>
function chequearDigitos(obj){
	if (obj.value != '1' && obj.value != '2' && obj.value != '3' && obj.value != '4' && obj.value != '5' && obj.value != '6'
		&& obj.value != '7' && obj.value != '8' && obj.value != '9' && obj.value != '10') {
		obj.value = '';
	}
}
</script>

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
<%-- 					<a href="../entrevistaSeleccion/mostrarImagen.do?dni=${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}" target="_blank"> <img src="../entrevistaSeleccion/mostrarImagen.do?dni=${entrevistaSeleccionDTO.perfilAlumno.datosPersonales.dni}" width="100px"></a></td>			 --%>
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

</div>
</fieldset>
<!-- Asistencia a clase -->
<fieldset>
	<legend> Asistencia a Clase </legend>
<%-- 		<jsp:include page="asistenciaClase.jsp"></jsp:include> --%>
<!-- 		########################################################################## -->
<!-- 		##################asistenciaClase.jsp############################### -->
<!-- 		########################################################################## -->
<div id="asistenciaClaseJsp">
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%-- 	pageEncoding="ISO-8859-1"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script type="text/javascript">
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
</script>
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
							id="cantidadInasistenciaAnioPasado" class=" digits"
							value="0" maxlength="3" onblur="enableDisableInasistencia()"
							size="5" />
					</c:when>
					<c:otherwise>
						<input type="text"
							name="entrevistaSeleccion.cantidadInasistenciaAnioPasado"
							id="cantidadInasistenciaAnioPasado" size="5"
							class=" digits"
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
							id="cantidadInasistenciaAnioCurso" class=" digits"
							value="0" maxlength="3" onblur="enableDisableInasistencia()"
							size="5" />
					</c:when>
					<c:otherwise>
						<input type="text"
							name="entrevistaSeleccion.cantidadInasistenciaAnioCurso"
							id="cantidadInasistenciaAnioCurso" class=" digits"
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
</div>
</fieldset>
					
					
					
				
					
					
				</div>
				
				
				<h3 class="ui-accordion-header  ui-state-default ui-corner-all"
					align="left">
					<a href="#" >Ficha Responsable</a>
				</h3>
<!-- 				###########################################################################	 -->
<!-- 				###################### fichaResponsable.jsp##################################	 -->
<!-- 				###########################################################################	 -->
				
				<div id="responsable"
					style="width: auto; height: auto; overflow: scroll;">
					
					
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript">

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
	
// 	habilitarRA2();

});
	
	
</script>
<script>
	function verificarCuil(){
		if($("#responsableSexoM").attr("checked")){
			generarCuil("true");
		}
		if($("#responsableSexoF").attr("checked")){
			generarCuil("false");
		}
	}

	var digito;
	/* function generarCuil(){
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
	} */
	
	
	
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

// 	function habilitarRA2(){
// 		if($("#noAsisteEntrevista").attr("checked"))
// 		{
// 			//No asiste: Habilita RA2
// 			if(${isDetalleEntrevista == false})
// 			{
// 				$("#tablaDatosResponsable2 :text").removeAttr("disabled");
// 				$("#vinculoRespo2").removeAttr("disabled");
// 			}
// 			else
// 			{
// 				$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
// 				$("#tablaDatosResponsable2 :checkbox").attr("disabled","disabled");
// 				$("#tablaDatosResponsable2 :input").attr("disabled","disabled");
// 			}
// 		}
// 		else
// 		{
// 			//Asiste: Deshabilita y Borra
// // 			$("#responsable2Telefono1").val("");
// // 			$("#responsable2ContactoTelefono1").val("");
// // 			$("#nombreResponsable2").val("");
// // 			$("#apellidoResponsable2").val("");
// // 			$("#vinculoRespo2").val("");
// // 			$("#vinculoRespo2").attr("disabled","disabled");
// // 			$("#tablaDatosResponsable2 :text").attr("disabled","disabled");
// 		}
// 	}
	
	
	function llenarFechaHidden(){
		//alert();
		valor = $("#fechaNacimientoRes").val();
		$("#fechaNacRes").val(valor);
	}
	

</script>



</head>
<body>
<!-- Datos Personales -->
<fieldset>
	<legend>Responsable 1</legend>
	<table id="tablaDatosResponsable">
		<tr>
			<td colspan="3"></td>
		</tr>
		<tr>
			<td>
				<p>
					<font color="green"><label for="Nombre">Nombre *</label></font>
<%-- 					<input type="text"  onchange="this.value=this.value.toUpperCase();" id="responsableNombre" name="perfilAlumno.responsable1.nombre"  value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nombre}"> --%>
				</p>
			</td>
			<td>
				<p>
					<font color="green"><label>Apellido *</label></font>
<%-- 					<input type="text" onchange="this.value=this.value.toUpperCase();" id="reponsableApellido" name="perfilAlumno.responsable1.apellido"  value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.apellido}"> --%>
				</p>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<p>
					<font color="green"><label>Tipo de DNI *</label></font>
						<select name="dni" id="responsableDni" >
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
<!-- 							<td><input type="text" id="dniResponsable" name="perfilAlumno.responsable1.dni" class="digits" maxlength="8"  -->
<%-- 								value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.dni}" onblur="verificarCuil()" onkeyup="verificarCuil()"></input> </td> --%>
<!-- 							<td><label id="dniResponsableError" style="color: red; display: none;">Ingrese un DNI válido</label></td> -->
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
						<!--  input type="text" 	onchange="this.value=this.value.toUpperCase();" id="responsableNacionalidad" name="perfilAlumno.responsable1.nacionalidad"  value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.nacionalidad}"-->
				
						<%-- <select name="responsableNacionalidad" id="responsableNacionalidad"  onchange="habilitarInputEstadoAlumno(this.value)">
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
					
					
				</select> --%>
				
				
				</p>
			</td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<%-- <c:choose>
			<c:when test="${isNuevaEntrevista && !isOtraEntrevista}">
				<td>
				<p><font color="green"><label>Sexo *</label></font> 
					M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()" 
					value="true" > 
					F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
					value="false" >
				</p>
			</td>
			</c:when>
			<c:when test="${isDetalleEntrevista}">
				<td>
					<p><font color="green"><label>Sexo *</label></font> 
						M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}"> checked="checked"</c:if>  value="true" > 
						F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" >
					
					</p>
				</td>
			</c:when>
			<c:when test="${isOtraEntrevista}">
				<td>
					<p><font color="green"><label>Sexo *</label></font> 
						M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}"> checked="checked"</c:if>  value="true" > 
						F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" >
					
					</p>
				</td>
			</c:when>
			<c:when test="${!isDetalleEntrevista && !isOtraEntrevista}">
				<td>
					<p><font color="green"><label>Sexo *</label></font> 
						M<input type="radio" id="responsableSexoM" name="perfilAlumno.responsable1.sexo"  onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo}"> checked="checked"</c:if>  value="true" > 
						F<input type="radio" id="responsableSexoF" name="perfilAlumno.responsable1.sexo" onclick="generarCuil()"
						<c:if test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sexo == false}"> checked="checked"</c:if> value="false" >
					
					</p>
				</td>
			</c:when>
			</c:choose> --%>
			
			
			
			
			<td>
				<p><font color="green"><label for="fechaNacimiento">Fecha de Nacimiento: *</label></font> 
<%-- 				<input name="perfilAlumno.responsable1.fechaNacimiento" id="fechaNacimientoRes"  value="<fmt:formatDate value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.fechaNacimiento}" pattern="dd/MM/yyyy"/>" onchange="llenarFechaHidden()">  --%>
				</p>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				<p>
					<label>CUIL *</label>
<!-- 					<input type="text" name="perfilAlumno.responsable1.cuilCuit" id="cuil"    readonly="readonly" -->
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
<!-- 						<input type="text" onchange="this.value=this.value.toUpperCase();" maxlength="19"  name="perfilAlumno.responsable1.telefono1" id="responsableTelefono1"  -->
<%-- 							value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono1 }" onkeypress="return justNumbers(event);"> --%>
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
<!-- 						<input type="text" onchange="this.value=this.value.toUpperCase();"  maxlength="19"  name="perfilAlumno.responsable1.telefono2" id="responsableTelefono2" -->
<%-- 							value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.telefono2 }" onkeypress="return justNumbers(event);"> --%>
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
<!-- 						<select name="vinculoRA" id="vinculoRespo" > -->
<!-- 							<option value="">Seleccione una opci&oacute;n:</option> -->
<%-- 							<c:forEach items="${listVinculo}" var="vinculo"> --%>
<%-- 								<c:choose> --%>
<%-- 									<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idVinculo.id == vinculo.id}"> --%>
<%-- 											<option value="${vinculo.id}" selected="selected">${vinculo.valor}</option> --%>
<%-- 									</c:when> --%>
<%-- 									<c:otherwise> --%>
<%-- 											<option value="${vinculo.id}">${vinculo.valor}</option> --%>
<%-- 									</c:otherwise>	 --%>
<%-- 								</c:choose> --%>
<%-- 							</c:forEach> --%>
<!-- 						</select> -->
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
<!-- 	<input type="hidden" id="direccionRA" name="perfilAlumno.responsable1.calle"></input> -->
<!-- 	<input type="hidden" id="codPostalRA" name="perfilAlumno.responsable1.codigoPostal"></input>  -->
	<input type="hidden" id="entreCallesRA" name="perfilAlumno.responsable1.entreCalles"></input> 
<!-- 	<input type="hidden" id="nroCalleRA" name="perfilAlumno.responsable1.nroCalle"></input>  -->
<%-- 	<input type="hidden" id="idLocalidadRA" name="perfilAlumno.responsable1.idLocalidad"value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.idLocalidad }"></input> --%>
	<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
	<input type="text" id="fechaNacRes" name="fechaNacRes"></input>
</fieldset>
<!-- Fin de datosPErsonales -->
<fieldset>
	<legend>Responsable 2</legend>
<%-- 	<jsp:include page="fichaResponsable2.jsp"></jsp:include> --%>
<!-- 		########################################################################## -->
<!-- 		##################fichaResponsable2.jsp############################### -->
<!-- 		########################################################################## -->
<div id="fichaResponsable2Jsp">
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--     pageEncoding="ISO-8859-1"%> --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript">

$(function() {

	$("#tablaDatosResponsable2 :text").css("width","90px");
	$("#tablaGeneralesResponsable2 :text").css("width","90px");

});
	
</script>
<script>
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
<%-- 					<input type="text"  onchange="this.value=this.value.toUpperCase();" name="perfilAlumno.responsable2.nombre"  id="nombreResponsable2" class="" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.nombre}"> --%>
				</p>
			</td>
			<td>
				<p>
					<font color="black"><label>Apellido *</label></font>
<%-- 					<input type="text"  onchange="this.value=this.value.toUpperCase();" name="perfilAlumno.responsable2.apellido" id="apellidoResponsable2"  class="" value="${entrevistaSeleccionDTO.perfilAlumno.responsable2.apellido}"> --%>
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
						<%-- <select name="vinculoRA2" id="vinculoRespo2" disabled="disabled" class="">
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
						</select> --%>
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
<%-- 				<input type="text" onchange="this.value=this.value.toUpperCase();"  name="responsable2.apellido" id="apellidoResponsable2" class="" value="${perfilAlumno.responsable2.apellido}"> --%>
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
				<%-- <select name="vinculoRA2" id="vinculoRespo2" disabled="disabled" class="">
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
					</select> --%>
			</td>
		</tr>
		</c:otherwise>
		</c:choose>
	</table>
	<!-- DOMICILIO RA -->
	
<!--	<input type="hidden" id="idLocalidadRA" name="perfilAlumno.responsable1.idLocalidad"></input> -->

</body>
</html>
</div>
</fieldset>

<!-- Datos generales -->
<fieldset>
	
						<input type="hidden" name="perfilAlumno.responsable1.informacionComplementaria" id="informacionComplementaria"/>
				
						<input type="hidden" name="perfilAlumno.responsable1.percepcionesSobreRA" id="percepcionesSobreRA" />
				
							<input type="hidden" name="compromisoEscolaridad" id="compromisoEscolaridad" value="3">
								
							<input type="hidden"t name="posibilidadCompromisoPBE" id="posibilidadCompromisoPBE" value="3">
								
							<input type="hidden" name="aptoComoRA" id="aptoComoRA" value="3">
								
<!-- 							<input type="hidden" name="identrevistador" id="identrevistador" value=" "> -->
							
					
</fieldset>
<!-- fIN dATOS GENERALES -->
<!-- Datos Bancarios -->
<fieldset>
	<legend> Datos Bancarios</legend>
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
<!-- 						<select id="respoSucursal" style="width: 208px;" name="perfilAlumno.responsable1.sucursalBanco.id"  onchange="seleccionarBanco(this.value);"  > -->
<!-- 							<option value="">Seleccione una opci&oacute;n:</option> -->
<%-- 							<c:choose> --%>
							
<%-- 								<c:when test="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.id != null}"> --%>
<%-- 										<option id="removerOption" selected="selected" value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.id}" > --%>
<%-- 										${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.banco.nombre}, ${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.nombre}</option> --%>
									
<%-- 								</c:when> --%>
<%-- 								<c:otherwise> --%>
<!-- 										<option id="removerOption"></option> -->
<%-- 								</c:otherwise> --%>
<%-- 							</c:choose> --%>
<!-- 						</select> -->
					
				</p>
			</td>
			<td align="center">
<!-- 				<p> -->
<!-- 					<label>Banco</label> -->
<%-- 					<input name="respoBanco" id="respoBanco"  value="${entrevistaSeleccionDTO.perfilAlumno.responsable1.sucursalBanco.banco.nombre}" > --%>
<!-- 				</p> -->
			
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

</body>
</html>
					
					
				</div>

				<h3 class="ui-accordion-header  ui-state-default ui-corner-all"
					align="left">
					<a href="#" >Ficha Familiar</a>
				</h3>
				
<!-- 				###########################################################################	 -->
<!-- 				###################### fichaFamiliar.jsp##################################	 -->
<!-- 				###########################################################################	 -->
				
				<div id="fichaFamiliar"
					style="width: auto; height: auto; overflow: scroll;">
					
					
					
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
// var counter = 0;
// var contadorff=0;

// function incrementarCounter(){
	
// 	counter++;
// 	//alert();
	
	
// }



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
		document.getElementById("deNombreFF").value = document.getElementById("nombreFichas1").value;	
	}
	
	
	
	//$("#deNombreFF").val("#nombreFichas");
	
	//document.getElementById("deConviveSN").value = document.getElementById("nombreFichas").value;
	
	
// 	$("#tablaFicha :text").css("width", "80px");
	
// 	$("#botonAgregarFicha").click(function () {
// 		var selectVinculo ='<select name="vinculoFFs" id="vinculo"><option ></option>'+
// 						   	'<c:forEach items="${listVinculo}" var="vinculo"><option value="${vinculo.id}" >${vinculo.valor}</option></c:forEach></select>';
// 		var selectConviveFichas ='<select name="conviveFichas" id="conviveFichas" ><option ></option>'+
// 								 '<c:forEach items="${listConvive}" var="convive"><option value="${convive.id}">${convive.valor}</option></c:forEach></select>';
// 		var selectNivelEducativo ='<select name="nivelEducativoFichas" id="nivelEducativoFichas" ><option></option>'+
// 								  '<c:forEach items="${listNivelEducativo}" var="nivelEducativo"><option value="${nivelEducativo.id}">${nivelEducativo.valor}</option></c:forEach></select>';						 
		
									  
// 		counter++;
// 		//contadorff++;
// 		contadorff=counter;
// 		$('#tbody').append('<tr id="fila' + counter + '">'+
// 				'<td><input type="checkbox" value="fila' + counter + '"></td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px">' + selectVinculo + '</td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" id="nombreFichas" name="nombreFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="apellidoFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="edadFichas" size="2" class="digits"></td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;">' + selectConviveFichas + '</td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;">' + selectNivelEducativo + '</td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="abandonoRepitenciaFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="ocupacionLaboralFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="estabilidadLaboralFichas" onblur="chequearLongitudFF(this);" onkeypress="chequearLongitudFF(this);"></td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="renumeracionFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
// 				'<td align="left" valign="middle" style="font-size: 12px;"><input type="text" name="otrosIngresosFichas" class="ingreso digits" onblur="sumarIngreso();"></td>'+
// 			'</tr>');
		
// // 		$("#tablaFicha :text").css("width", "80px");
// 		$("#contadorFicha").val(contadorff);
		
// 		$("#nombreFichas").change(function(){
// 			//alert(2);
// 			$("#deNombreFF").val($(this).val());
// 			});
		
// 		//document.getElementById("deNombreFF").value = document.getElementById("nombreFichas").value;
		
		
// 	});



// 	$("#botonBorrarFicha").click(function () {
		
		
		
		
	//DMS funcion original borrar ficha	
	
$("#botonBorrarFicha").click(function () {
		
		//agrego linea porque fallaba al borrar un registro (contadorff queda en 0 si no agrego familiar)
		contadorff=counter;
		
		var checks = $("#tablaFicha :checked");
		var i=0;
		for (i=0;i<checks.length;i++){
			
			//agrego condicion porque checks[i].value trae varios datos
			if(checks[i].value.substr(0,4)=="fila"){
				$("#" + checks[i].value).remove();
				if(contadorff<=0){
// 					console.log("contadorff: "+contadorff)
// 					console.log("counter: "+counter)
					$("#contadorFicha").val(contadorff);		
				}else{
// 					console.log("contadorff: "+contadorff)
// 					console.log("counter: "+counter)
					contadorff--;
					$("#contadorFicha").val(contadorff);
				}
			}
			
			
			
		}
    	
	});

//funcion modificada para que haga referencia solo a la fila en cuestion

// 	$("#botonBorrarFicha").click(function () {
		
		
		
		
// 		var checks = $("#tablaFicha :checked");
// 		var i=0;
// 		console.log("tamaño: "+checks.length);
// 		for (i=0;i<checks.length;i++){
			
// 			console.log("valor de "+i+": "+checks[i].value);

// 			if(checks[i].value.substr(0,4)=="fila"){
// 				console.log("entro en: "+i)			
// 	 			$("#" + checks[i].value).remove();
// 			}
			
			
// //  			console.log($("#" + checks[i]).checked);
			
		
// 			if(contadorff<=0){
// 				$("#contadorFicha").val(contadorff);		
// 			}else{
// 				contadorff--;
// 				$("#contadorFicha").val(contadorff);
// 			}
			
// 		}
    	
// 	});
	
});

</script>
</head>
<body>
<br></br>
 <%-- <table id="tablaFicha" border="0" width="80%" style="font-size: x-small">
			
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
</table>  --%>

<br>

 <table>
	<tr>
		<td>
<!-- 			<input type="button" value="Agregar Familiar" id="botonAgregarFicha" class="ui-state-default ui-corner-all"/> -->
<!-- 			<input type="hidden" id="contadorFicha" name="contadorFicha"> -->
<!-- 			<input type="hidden" id="deNombreFF" name="deNombreFF"> -->
<!-- 			<input type="button" value="Eliminar Familiar" id="botonBorrarFicha" class="ui-state-default ui-corner-all"/> -->
		</td>
	</tr>
</table> 

<br><br>

<table>
	<tr>
		<td>
			<p><font color="green"><label>Relación con la vivienda *</label></font>
			<select name="relacionVivienda" id="relacionViviendaFicha" >
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
</body>
</html>
					
					
					
				</div>

				<h3 class="ui-accordion-header  ui-state-default ui-corner-all"
					align="left">
					<a href="#" ">Evaluación del Candidato</a>
				</h3>
<!-- 				###########################################################################	 -->
<!-- 				###################### observacionesGenerales.jsp##################################	 -->
<!-- 				###########################################################################	 -->				
				
				<div id="observacionesGenerales"
					style="width: auto; height: auto; overflow: scroll;">
					
					
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>entrevista seleccion</title>
</head>
<body>
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
<%-- 		<textarea rows="4" cols="40" id="cuandoTermine" name="cuandoTermine" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${entrevistaSeleccionDTO.entrevistaSeleccion.cuandoTermine}</textarea> --%>
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
</body>
</html>
					
					
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
</body>
</html>