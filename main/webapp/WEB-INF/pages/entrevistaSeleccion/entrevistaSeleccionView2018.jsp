<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


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
<style type="text/css">
label {
	width: 12em;
	float: left;
	font-weight: bold;
	vertical-align: text-bottom;
}

legend {
	width: 9em;
	float: left;
	font-size: 15px;
	padding-left: .1em
}

label.error {
	float: none;
	color: red;
	padding-left: .5em;
	vertical-align: top;
}

p {
	clear: both;
}

.submit {
	margin-left: 12em;
}

em {
	font-weight: bold;
	padding-right: 1em;
	vertical-align: top;
}

textarea {
	text-align: justify;
}
</style>

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
    	alert("La fecha de la entrevista tiene que ser menor o igual a la fecha actual");
    }
    
}
 
</script>



<script>
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
		if (parseInt(anioA)<1994 || parseInt(anioA)>2014){			
			mens = 'Chequear el año de nacimiento del candidato\n';
			$("#zonaCimientos").attr("disabled","disabled");
			$("#cualBeca").attr("disabled","disabled");
			$("#cuil").attr("disabled","disabled");
			$("#respoBanco").attr("disabled","disabled");
			$("#nroCuentaRespo").attr("disabled","disabled");
			flag = true;
		}						
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

<body>
	<div id="main-content">
		<!-- Formulario para la busqueda del alumno por DNI -->

		<form action="" method="post" id="formAlumno" name="formAlumno">
			<input type="hidden" id="idEntrevista" name="idEntrevista"> <input
				type="hidden" id="accion" name="accion" value="${accion}">
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

			<div id="accordion" style="width: auto">

				<h3 class="ui-accordion-header  ui-state-default ui-corner-all"
					align="left">
					<a href="#" onclick="mostrar(1)">Ficha del Candidato</a>
				</h3>
				<div id="datosCandidato"
					style="width: auto; height: auto; overflow: scroll;">
					<jsp:include page="fichaCandidato.jsp"></jsp:include>
				</div>

				<h3 class="ui-accordion-header  ui-state-default ui-corner-all"
					align="left">
					<a href="#" onclick="mostrar(2)">Responsable</a>
				</h3>
				<div id="responsable"
					style="width: auto; height: auto; overflow: scroll;">
					<jsp:include page="fichaResponsable.jsp"></jsp:include>
				</div>

				<h3 class="ui-accordion-header  ui-state-default ui-corner-all"
					align="left">
					<a href="#" onclick="mostrar(3)">Ficha Familiar</a>
				</h3>
				<div id="fichaFamiliar"
					style="width: auto; height: auto; overflow: scroll;">
					<jsp:include page="fichaFamiliar.jsp"></jsp:include>
				</div>

				<h3 class="ui-accordion-header  ui-state-default ui-corner-all"
					align="left">
					<a href="#" onclick="mostrar(4)">Evaluación del Candidato</a>
				</h3>
				<div id="observacionesGenerales"
					style="width: auto; height: auto; overflow: scroll;">
					<jsp:include page="observacionesGenerales.jsp"></jsp:include>
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