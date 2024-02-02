<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
	input[type=text]{	
		width: 120px;
	}
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
</style>

<script type="text/javascript" src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>	
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>

<script type="text/javascript">
//variable para simular un map 
var arrayBanco = new Array();

//Variables para activar el tab Actualizacion PFE
var ESTADO_FIN_PBE 		= '9';
var ESTADO_NO_RENUEVA 	= '5';
var ESTADO_NO_INCORPORA	= '19';
var ESTADO_CESADO	 	= '10';

$(document).ready(function(){

 	activarTabPBE();
 	
	$("#alumnoForm").validate({
		invalidHandler: function(form, validator) {
			var errors = validator.numberOfInvalids();			
			if (errors) {
				$.unblockUI();
				jAlert('warning', 'Para poder guardar, asegúrese que todos los campos obligatorios de ambas solapas hayan sido completados', 'Atención!');
			}
		}
	});
 	
	$.ajax( {
	     type: "GET",
	     url: "../ajax/buscarSucursalBancoPorZona.do",
	     data: { idZona: $("#idZonaCimientos").val() },
	     dataType: "json",
	     success: function(data) {
		   	$(data.sucursales).each(function() { 
				arrayBanco[this.id] = this.banco; 						
			});		          
	     }
	   } )

	$("#nombreEscuela").autocomplete({
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
							eae:item.eae,
							idZona: item.idZona
							
						}
					}))
				}
			})
		},
		select: function(event, ui) {
			$("#idEscuela").val(ui.item.id);
			$("#zonaCimientos").val(ui.item.zona);
			$("#idZonaCimientos").val(ui.item.idZona);
			$("#eae").val(ui.item.eae);
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
			            $("select#sucursal").html(options);
			            $("#banco").val(" ");
			     }
			   } )
		}
	});
	
});

/**
 * Este metodo es para poder cargar el banco dependiendo de la sucursal
 */	
function seleccionarBanco(id){
	$("#banco").val(arrayBanco[id]);
}

function validarDNI(id){
	var selector = "#" + id;
	var error = "#" + id + "Error";
	var dni = $(selector).val();
	if(dni.length > 6){
		$(error).css("display","none");
	}else{
		$(error).css("display","block");
	}
}


function justNumbers(e) {
	var keynum = window.event ? window.event.keyCode : e.which;
	if ( keynum == 8 ) return true;
	return /\d/.test(String.fromCharCode(keynum));
}
	


/**
 * Metodo para activar y desactivar el tab de actualizacion situacion escolar
 * segun el estado del becado
 */
function activarTabPBE(){
	var estado_alumno =  $("#alumnoEstado").val();
	var arrayDisabled = [1];
	if(estado_alumno == ESTADO_FIN_PBE || estado_alumno == ESTADO_NO_RENUEVA ||
			estado_alumno == ESTADO_NO_INCORPORA || estado_alumno == ESTADO_CESADO){
		$("#tabs").tabs();
		document.forms['alumnoForm'].actualizacionPBE.value = true;
	}
	else{
		$("#tabs").tabs({ disabled: arrayDisabled });
		document.forms['alumnoForm'].actualizacionPBE.value = false;
	}

	if(${tieneBeca} == true){
		document.forms['alumnoForm'].actualizacionPeriodoAsignacion.value = true;		
	}
	else{
		document.forms['alumnoForm'].actualizacionPeriodoAsignacion.value = false;		
	}
	
	if(${desasignarBeca} == true){
		document.forms['alumnoForm'].becaDesasignar.value = true;
	}
	else{
		document.forms['alumnoForm'].becaDesasignar.value = false;
	}
}

function habilitarRA2(){
	if($("#noAsisteEntrevista").attr("checked")){
		//No asiste: Habilita RA2
		//alert(1);
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

function grisarReaperturaCuenta(){
	if(!$("#reapertura").attr("checked"))
		$("#reapertura").attr("disabled","disabled");
}

function revisarFechaN(){
	
	//alert();
	
	var fechaAlum = $("#fechaDeNacimiento").val();
	var fechaResp = $("#fechaNacimientoRes").val();
	var mens="";
	var flag=false;
	//alert(fechaAlum);
	//alert(fechaResp);
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
	flag=false;
	//alert(edadA);
	//alert(mesA);
	//alert(parseInt(mesA));
	if(fechaAlum.length != 10){
		mens = 'La fecha de nacimiento del alumno es invalida\n';
		flag = true;
	}else{	
		if ((parseInt(edadA))<10 ){
			mens = 'El candidato no puede tener menos de 10 años\n';
			flag= true;
		}		
		//if (parseInt(diaA)<1 || parseInt(diaA)>31){		
		if (diaA!="01" &&  diaA!="02" &&  diaA!="03" &&  diaA!="04" &&  diaA!="05" &&  diaA!="06" &&  diaA!="07" &&  diaA!="08" &&  diaA!="09" &&  diaA!="10" &&  diaA!="11" &&  diaA!="12" &&  diaA!="13" &&  diaA!="14" &&  diaA!="15" &&  diaA!="16" &&  diaA!="17" &&  diaA!="18" &&  diaA!="19" &&  diaA!="20" &&  diaA!="21" &&  diaA!="22" &&  diaA!="23" &&  diaA!="24" &&  diaA!="25" &&  diaA!="26" &&  diaA!="27" &&  diaA!="28" &&  diaA!="29" &&  diaA!="30" &&  diaA!="31"){
			mens = 'Chequear el día de nacimiento del candidato\n';
			flag = true;
		}	
		//if (parseInt(mesA)<1 || parseInt(mesA)>12){			
		if (mesA!="01" && mesA!="02" &&  mesA!="03" && mesA!="04" && mesA!="05" && mesA!="06" && mesA!="07" && mesA!="08" && mesA!="09" && mesA!="10" && mesA!="11" && mesA!="12" ){	
			mens = 'Chequear el mes de nacimiento del candidato\n';
			flag = true;
		}
		if (parseInt(anioA)<1994 || parseInt(anioA)>2014){			
			mens = 'Chequear el año de nacimiento del candidato\n';
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
	
	
	if(fechaResp.length != 10){
		mens += 'La fecha de nacimiento del RA es invalida';
		flag=true;
		
	}else{
		if ((edadR)<18 ){
			mens += 'El RA no puede tener menos de 18 años\n';
			flag= true;
		}		
		//if (parseInt(diaR)<1 || parseInt(diaR)>31){		
		if (diaR!="01" &&  diaR!="02" &&  diaR!="03" &&  diaR!="04" &&  diaR!="05" &&  diaR!="06" &&  diaR!="07" &&  diaR!="08" &&  diaR!="09" &&  diaR!="10" &&  diaR!="11" &&  diaR!="12" &&  diaR!="13" &&  diaR!="14" &&  diaR!="15" &&  diaR!="16" &&  diaR!="17" &&  diaR!="18" &&  diaR!="19" &&  diaR!="20" &&  diaR!="21" &&  diaR!="22" &&  diaR!="23" &&  diaR!="24" &&  diaR!="25" &&  diaR!="26" &&  diaR!="27" &&  diaR!="28" &&  diaR!="29" &&  diaR!="30" &&  diaR!="31"){	
			mens += 'Chequear el día de nacimiento del RA\n';
			flag = true;
		}	
		//if (parseInt(mesR)<1 || parseInt(mesR)>12){		
		if (mesR!="01" && mesR!="02" &&  mesR!="03" && mesR!="04" && mesR!="05" && mesR!="06" && mesR!="07" && mesR!="08" && mesR!="09" && mesR!="10" && mesR!="11" && mesR!="12" ){
			mens += 'Chequear el mes de nacimiento del RA\n';
			flag = true;
		}
		if (parseInt(anioR)<1920 || parseInt(anioR)>2014){			
			mens += 'Chequear el año de nacimiento del RA\n';
			flag = true;
		}
	}		
	//alert(flag);	
	if(flag){	  	
		jAlert('warning', mens, 'Advertencia');
	}
	return flag;
	
}

function hacerSubmit(){
	$("*").removeAttr("disabled");
	actualizacionDatosPostPBE();
	habilitarCamposEgreso(document.getElementById("fechaSituacionEscolar"));
	habilitarOtraSituacion(document.getElementById("situacionActual"));
	habilitarOtraProyeccion(document.getElementById("proyeccionDeseada"));
	validarPeriodoCicloEgreso();
	deshabilitarFechas();
	if(document.getElementById("actualizacionPeriodoAsignacion").value == 'true')
		actualizacionPeriodoAsignacion(document.getElementById("periodoIdAsignacionAlumno"),document.getElementById("periodoIdAsignacion"));
	if(document.getElementById("becaDesasignar").value == 'true')
		desasignarBeca();
	if($("#urlRegreso").val() != '')
		document.forms['alumnoForm'].urlRegreso.value = $("#urlRegreso").val();
	document.forms['alumnoForm'].action ="<c:url value='guardarCambios.do'/>";
	habilitarRA2();	
	grisarReaperturaCuenta();
	var devuelveFecha=revisarFechaN();
	if (devuelveFecha){
		
	}else{
		if($("#nroCuentaRA").val().length > 0 && $("#modificarCuenta").val() == 'true'){	
			if($("#nroCuenta").val().length == 0 && !$("#reapertura").attr("checked")){
				jConfirm('Está seguro que desea borrar el número de cuenta del RA?. Recuerde que al realizar esta operación la cuenta se inactivará', 'Confirmación', function(result){
				    if (result) {
				    	$.blockUI();
				    	$("#alumnoForm").submit();
				    }
				 	else {
				      return false;
					}
				});	
			}
			else{
				$.blockUI();
				$("#alumnoForm").submit();
			}
		}
		else{
			$.blockUI();
			$("#alumnoForm").submit();	
		}
	}
}
</script>	

</head>
<body>
<form:form name="alumnoForm" id="alumnoForm" commandName="perfilAlumno" enctype='multipart/form-data' modelAttribute="perfilAlumno" method="post" >
<input type="hidden" name="alumnoEstado" id="alumnoEstado" value="${perfilAlumno.estadoAlumno.id}"/>
<div id="main-content">

<c:if test="${!empty volver}">
	<script>
		javascript:history.go(-2);
	</script>
</c:if> 
<%-- <c:if test="${!empty mensaje}"> --%>
<!-- 	<div class="ui-state-highlight ui-corner-all" -->
<!-- 		style="margin-top: 10px; padding: 0 .7em; width: auto; font: normal; font-size: 13px; vertical-align: middle; height: 20px;"> -->
<!-- 	<p><span class="ui-icon ui-icon-info" -->
<%-- 		style="float: left; margin-right: .3em;"> </span> <strong><c:out  --%>
<%-- 		value="${mensaje}"></c:out></strong></p> --%>
<!-- 	</div> -->
<%-- </c:if> --%>
<br><br><br><br>
<div id="tabs">
	<ul>
		<li><a href="#tabs-1">Alumno</a></li>
		<li><a href="#tabs-2">Actualizaci&oacute;n datos post PFE</a></li>
			<c:if test="${tieneBeca == true}">
				<li><a href="#tabs-3">Datos Beca</a></li>
			</c:if>

<!--		<li><a href="#tabs-4">Historial</a></li>-->
	</ul>
	<div id="tabs-1">
		<jsp:include page="datosAlumno.jsp"></jsp:include>
	</div>
	<div id="tabs-2">
		<jsp:include page="situacionPostPBE.jsp"></jsp:include>
	</div>

		<c:if test="${tieneBeca == true}">
			<div id="tabs-3">
				<jsp:include page="datosBeca.jsp"></jsp:include>
			</div>
		</c:if>
<!--	<div id="tabs-4">-->
<!--		<jsp:include page="historialAlumno.jsp"></jsp:include>-->
<!--	</div>-->
</div>

</div>
<input type="button" onclick="hacerSubmit()" value="Guardar cambios" class="ui-state-default ui-corner-all modificar"></input>
<c:if test="${urlRegreso != null}">
	<input type="button" value="Volver" class="ui-state-default ui-corner-all" onclick="location.href='..${urlRegreso}'; return false;" />
</c:if>	
<input type="hidden" name="actualizacionPBE" id="actualizacionPBE"/>
<input type="hidden" id="actualizacionPeriodoAsignacion" name="actualizacionPeriodoAsignacion"/>
<input type="hidden" id="becaDesasignar" name="becaDesasignar"/>
</form:form>
</body>
</html>