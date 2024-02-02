<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="mif" uri="/list-operator.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modificación de Informe de Seguimiento Nro 3</title>
<style>
span {
	background-color: yellow;
}
</style>
<style type="text/css">
.td {
	text-indent: 30px;
}

.fechas {
	text-indent: 60px;
	text-transform: inherit;
	font-family: cursive;
	font-size: small;
	font-stretch: ultra-condensed;
	color: purple;
	font-weight: bold;
	vertical-align: top;
}

.column-right {
	vertical-align: top;
}

.title-right {
	text-indent: 20px;
	margin-left: 20px;
	font-weight: bold;
	color: purple;
	font-family: cursive;
}

.tabla {
	background-image: url('../static/images/papel.jpg');
	color: black;
	font-family: sans-serif;
	align: center;
	border: 0;
}

.ui-dropdownchecklist-text {
	font-size: 11px;
}

.errormsg {
	font-weight: bold;
	COLOR: red;
}
</style>
<script type="text/javascript"
	src="<c:url value="/static/js/ui.dropdownchecklist.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/static/js/funcionesEntrevista.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
	
	
	

<script type="text/javascript">
$(document).ready(function(){	
	$("#cgse").change(function(){
            //alert($('select[id=cgse]').val());
       $('#cgseM').empty();
       if($('select[id=cgse]').val()=="enRiesgo"){
       	$("#cgseM").append($("<option></option>").val('suo').html("Selecciona"))
       	$("#cgseM").append($("<option></option>").val(1).html("presenta asistencia intermitente a la escuela y la mayor parte de las materias desaprobadas."))
       	$("#cgseM").append($("<option></option>").val(2).html("seis o más materias desaprobadas."))
       	$("#cgseM").append($("<option></option>").val(3).html("perdida de condición de alumno regular."))
       }else{
        if($('select[id=cgse]').val()=="regular"){
        	$("#cgseM").append($("<option></option>").val('suo').html("Selecciona"))
        	$("#cgseM").append($("<option></option>").val(1).html("inasistencia a clase mayor al 25% en el período trimestral (60 días hábiles)"))
        	$("#cgseM").append($("<option></option>").val(2).html("cuatro o cinco materias desaprobadas."))
        	$("#cgseM").append($("<option></option>").val(3).html("ha recibido llamados de atención por faltas graves de conducta."))
        	$("#cgseM").append($("<option></option>").val(4).html("si bien ha recibido algunos llamados de atención por la conducta, su rendimiento académico ha sido aceptable."))
        	$("#cgseM").append($("<option></option>").val(5).html("si bien tiene más del 40% de las materias desaprobadas, manifiesta esfuerzo y tenacidad para mejorar su situación acedémica."))
        }else{
         if($('select[id=cgse]').val()=="bueno"){
         	$("#cgseM").append($("<option></option>").val('suo').html("Selecciona"))
         	$("#cgseM").append($("<option></option>").val('1').html("ha cumplido con el 75% de asistencia y cuenta con el 80% de las materias aprobadas."))
         	$("#cgseM").append($("<option></option>").val('2').html("ha mantenido una buena conducta y cuenta con el 80% de las materias aprobadas."))
         	
         }else{
           if($('select[id=cgse]').val()=="muyBueno"){
           	$("#cgseM").append($("<option></option>").val('suo').html("Selecciona"))
           	$("#cgseM").append($("<option></option>").val('1').html("ha cumplido con la asitencia en más del 80% y ha tenido una conducta destacada."))
           	$("#cgseM").append($("<option></option>").val('2').html("tiene todas las materias aprobadas y su conducta ha sido destacada."))
           }else{
           	 $('#cgseM').empty();
           }
         	}
        	}
       	}            
 	});
	
});
</script>

<script type="text/javascript">
$(document).ready(function(){	
	$("#cgpp").change(function(){
            //alert($('select[id=cgse]').val());
            $('#cgppM').empty();
            if($('select[id=cgpp]').val()=="enRiesgo"){
            	//$("#cgppM").append($("<option></option>").val('suo').html("Selecciona"))
            	$("#cgppM").append($("<option></option>").val(1).html("reiteradas inasistencias a entrevistas sin justificación ni aviso previo."))
            	$("#cgppM").append($("<option></option>").val(2).html("ha dejado de asistir a la escuela y ha sido imposible tomar contacto con la familia."))
            	$("#cgppM").append($("<option></option>").val(3).html("mantiene previas de años anteriores sin rendir."))            	
            	$("#cgppM").append($("<option></option>").val(4).html("se encuentra en una situación familiar de inestablidad dado que están atravesando una situación delicada de crisis."))
            	$("#cgppM").append($("<option></option>").val(5).html("la familia está evaluando la posibilidad de mudarse a una localidad en la que Cimientos no se encuentra presente."))
            	$("#cgppM").append($("<option></option>").val(6).html("la familia ha manifestado que su situación económica ha mejorado, por lo cual se evaluará su continuidad en el Programa."))
            }else{
	            if($('select[id=cgpp]').val()=="regular"){
	            	//$("#cgppM").append($("<option></option>").val('suo').html("Selecciona"))
	            	$("#cgppM").append($("<option></option>").val(1).html("no ha presentado los materiales solicitados con regularidad."))
	            	$("#cgppM").append($("<option></option>").val(2).html("en varias ocasiones, no ha podido cumplir con los propósitos establecidos."))
	            	$("#cgppM").append($("<option></option>").val(3).html("la asistencia a las entrevistas ha sido discontínua."))
	            	$("#cgppM").append($("<option></option>").val(4).html("en reiteradas ocasiones se ha ausentado el responsable adulto sin justificativo."))	            	
	            }else{
		            if($('select[id=cgpp]').val()=="bueno"){
		            	//$("#cgppM").append($("<option></option>").val('suo').html("Selecciona"))
		            	$("#cgppM").append($("<option></option>").val('1').html("asiste regularmente a las entrevistas. En pocas ocasiones se ha debido reprogramar la cita."))
		            	$("#cgppM").append($("<option></option>").val('2').html("en la mayoría de las entrevistas presenta el material solicitado en tiempo y forma."))
		            	$("#cgppM").append($("<option></option>").val('3').html("se ha mostrado muy comprmetido con el cumplimiento de los propósitos establecidos."))
		            }else{
				            if($('select[id=cgpp]').val()=="muyBueno"){
				            	//$("#cgppM").append($("<option></option>").val('suo').html("Selecciona"))
				            	$("#cgppM").append($("<option></option>").val('1').html("asiste al total de las entrevistas con su Responsable Adulto y se muestra muy comprometido."))
				            	$("#cgppM").append($("<option></option>").val('2').html("presenta todo el material solicitado en tiempo y forma."))
				            	$("#cgppM").append($("<option></option>").val('3').html("participa de la jornada de encuentro de becados y otras actividades propuestas por el Programa."))
				            	$("#cgppM").append($("<option></option>").val('4').html("participa activamente en la formulación de propósitos y se compromete con su cumplimiento."))
				            }else{
				            	 $('#cgppM').empty();
				            }
		            	}
	            	}
            	}            
 	});
	
});
</script>

<script type="text/javascript">
var estadoEntrevistaFinal = '3';
$(document).ready(function(){
	
	$("#idMateriaInteres").dropdownchecklist({icon: {}, 
		width: 250, 
		maxDropHeight: 250,
		emptyText: "Seleccione al menos 1 opción ...",
		onComplete: function(selector) {
			var accion = document.forms['modificarInformeIS3'].accion.value;
			var checkCount = 0;
			var values = "";
		    for( i=0; i < selector.options.length; i++ ) {					        
		        if ( selector.options[i].selected&& (selector.options[i].value != "")){
		        	checkCount += 1;	
		        	if ( values != "" )
						values += ",";
					values += selector.options[i].value;
		        }
		    }
		    document.forms['modificarInformeIS3'].materiasInteres.value = values;
			if(accion == ""){
			    if(checkCount == 0)
			    	jConfirm('Como mínimo debes seleccionar 1 materia de interés', 'Aviso');
				else{
			    	if ( checkCount > 3 ) 
			        	jConfirm('Como máximo podés seleccionar 3 materias de interés', 'Aviso');	
				}
			}
		},
		onItemClick: function(checkbox){		
			var checkChequed = checkbox.attr("checked");	
			var check = (checkChequed) ? 1 : -1;
			var cantidad =  document.forms['modificarInformeIS3'].cantMateriasInteres.value;
			var checkCount = parseInt(cantidad) + parseInt(check);	
 		    if ( checkCount > 3 ) {
 		    	jConfirm('Como máximo podés seleccionar 3 materias de interés', 'Aviso');		
 				throw rejected;
 		    }	
 		   document.forms['modificarInformeIS3'].cantMateriasInteres.value = checkCount;
		}
	});
	$("#idMateriaCuestan").dropdownchecklist({icon: {}, 
		width: 250, 
		maxDropHeight: 250,
		emptyText: "Seleccione al menos 1 opción ...",
		onComplete: function(selector) {
			var accion = document.forms['modificarInformeIS3'].accion.value;			
			var checkCount = 0;
			var values = "";
		    for( i=0; i < selector.options.length; i++ ) {					        
		        if ( selector.options[i].selected&& (selector.options[i].value != "")){
		        	checkCount += 1;	
		        	if ( values != "" )
						values += ",";
					values += selector.options[i].value;
		        }
		    }
		    document.forms['modificarInformeIS3'].materiasCuestan.value = values;
		    if(accion == ""){
			    if(checkCount == 0)
			    	jConfirm('Como mínimo debes seleccionar 1 materia que le cuesta', 'Aviso');
				else{
			    	if ( checkCount > 3 ) 
			        	jConfirm('Como máximo podés seleccionar 3 materias que le cuestan', 'Aviso');	
				}
			}
		},
		onItemClick: function(checkbox){
			var checkChequed = checkbox.attr("checked");	
			var check = (checkChequed) ? 1 : -1;
			var cantidad =  document.forms['modificarInformeIS3'].cantMateriasCuestan.value;
			var checkCount = parseInt(cantidad) + parseInt(check);	
			if ( checkCount > 3 ) {
 		    	jConfirm('Como máximo podes seleccionar 3 materias que le cuestan', 'Aviso');		    	
 				throw rejected;
 		    }	
 		   document.forms['modificarInformeIS3'].cantMateriasCuestan.value = checkCount; 		   
		}
	});
	
	//	$("#modificarInformeIS3").validate(
	//{
	//	errorClass: 'errormsg',
	//	rules: 
	//	{			
	//		escuelaNombre : {
	//			required:true
	//		},
	//		modalidadTrabajoEscuela : {
	//			required:true
	//		},
	//		escuelaComienzoPBE : {
	//			required:true
	//		},
	//		escuelaMatricula :{
	//			required:true
	//		},
	//		cantidadBecados :{
	//			required:true
	//		},
			//escuelaIndicadorRepitencia : {
			//	required:true
			//},
			//escuelaIndicadorAbandono : {
			//	required:true
			//},
	//		actividadAcompanamiento : {
	//			required:true
	//		},
			//materiasCuestan: {
			//	required:true
			//},
			//cgse: {
			//	required:true
			//},
			//cgseM: {
			//	required:true
			//},
			//cgpp: {
			//	required:true
			//},
			//cgppM: {
			//	required:true
			//},
			//materiasInteres: {
			//	required:true
			//}
			
	//	},
	//	messages: 
	//	{			
	//		escuelaNombre : {
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
	//		modalidadTrabajoEscuela : {
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
	//		escuelaComienzoPBE : {
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
	//		escuelaMatricula :{
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
	//		cantidadBecados :{
	//			required:'Este campo es requerido en la ficha de la escuela'
	//		},
			//escuelaIndicadorRepitencia : {
			//	required:'Este campo es requerido en la ficha de la escuela'
			//},
			//escuelaIndicadorAbandono : {
			//	required:'Este campo es requerido en la ficha de la escuela'
			//},
			//cgse : {
			//	required:'Este campo es requerido'
			//},		
			//cgseM : {
			//	required:'Este campo es requerido'
			//},		
			//cgpp : {
			//	required:'Este campo es requerido'
			//},		
			//cgppM : {
			//	required:'Este campo es requerido'
			//},		
	//		actividadAcompanamiento : {
	//			required:'Este campo es requerido'
	//		}		
	//	},	
   	//	invalidHandler: function(form, validator) 
   	//	{
	//		var errors = validator.numberOfInvalids();
	//		if (errors) 	
	//		{
	//			$.unblockUI();
	//		}
	//	}
	//});
 
});

function setearMateriasSeleccionadas(selector, campo1, campo2){
	var checkCount = 0;
	var values = "";
	var valorCampo2 = parseInt(campo2.value);
	if(valorCampo2 != parseInt(0)){
		values = selector.val();
	}
	campo1.value = values;
};

	
</script>



</head>
<body>
	<div id="main-content">
		<form id="modificarInformeIS3" class="cmxform" action="" method="post">
			<input type="text" id="estadoEntrevista" name="estadoEntrevista" value="${estadoEntrevista}"></input>
			<input type="text" id="evalRenovacionBeca" name="evalRenovacionBeca" value="${evalRenovacionBeca}"></input>
			<h1 id="titulo-informe">:: Informe de Seguimiento Nº 33 ::</h1>
			<c:set var="urlRegreso" value="${urlRegreso}"></c:set>
			<table border="0" align="left" cellpadding="0" cellspacing="0"
				id="table-informe">
				<tr>
					<td><label>Construcción - Mod 2023</label></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><label>Ciclo lectivo </label> <label>${cicloActual.nombre}</label>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<h1 id="subtitulo-informe">Mis datos</h1>
					</td>
				</tr>
				<tr>
					<td>
						<table width="200" border="0" align="left" cellpadding="0"
							cellspacing="0" id="table-forms">
							<tr>
								<td colspan="2">
									${becado.datosPersonales.nombre}&nbsp;${becado.datosPersonales.apellido}
								</td>
							</tr>
							<c:if test="${tieneFoto == true}">
								<tr>
									<td colspan="2"><img
										src="../fichaAlumno/mostrarImagen.do?dni=${becado.datosPersonales.dni}"
										width="100px"></td>
								</tr>
							</c:if>
							<c:if test="${tieneFoto == false}">
								<tr>
									<td colspan="2"><img
										src="../fichaAlumno/mostrarImagen.do?dni=0" width="100px">
									</td>
								</tr>
								<tr>
									<td colspan="2"><label> Recuerda que si no
											cargaste una foto, ésta es la que se enviará en el Informe al
											padrino.<img src="../static/images/atencion.gif" width=10>
									</label></td>
								</tr>
							</c:if>
							<tr>
								<td colspan="2">Nací el <fmt:formatDate
										value="${becado.datosPersonales.fechaNacimiento}"
										pattern="dd/MM/yyyy" />
								</td>
							</tr>
							<tr>
								<td colspan="2">Tengo ${edad} años</td>
							</tr>
							<tr>
								<td colspan="2">Vivo en
									${becado.datosPersonales.localidad.nombre}</td>
							</tr>
							<tr>
								<td colspan="2">Curso <c:if test="${empty boletin}">
								${becado.anioEscolar.valor}
							</c:if> <c:if test="${!empty boletin}">
								${boletin.ano.valor}
							</c:if>
							</tr>
							<c:if test="${!empty becado.responsable2}">
								<tr>
									<td colspan="2">Viene a las entrevistas
										${becado.responsable2.nombre }&nbsp;${becado.responsable2.apellido}
									</td>
								</tr>
								<c:if test="${!empty becado.responsable2.idVinculo}">
									<tr>
										<td colspan="2">V&iacute;nculo
											${becado.responsable2.idVinculo.valor}</td>
									</tr>
								</c:if>
							</c:if>
							<c:if test="${empty becado.responsable2}">
								<tr>
									<td colspan="2">Viene a las entrevistas
										${becado.responsable1.nombre }&nbsp;${becado.responsable1.apellido}
									</td>
								</tr>
								<c:if test="${!empty becado.responsable1.idVinculo}">
									<tr>
										<td colspan="2">V&iacute;nculo
											${becado.responsable1.idVinculo.valor}</td>
									</tr>
								</c:if>
							</c:if>
							<tr>
								<td colspan="2">Fecha incorporación al Programa
									${periodoFechaPBE}</td>
							</tr>
							<c:if test="${!empty periodoFechaReincorporacionPBE}">
								<tr>
									<td colspan="2">Fecha reincorporación al Programa
										${periodoFechaReincorporacionPBE}</td>
								</tr>
							</c:if>
						</table>
					</td>
				</tr>

				<tr>
					<td colspan="2"><h1 id="subtitulo-informe">
							<label>Mi escuela</label>
						</h1></td>
				</tr>
				<tr>
					<td>
						
						<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
					<!--  c:if test="${empty escuela.modalidadTrabajoEscuela}" -->
						<tr>
							<td nowrap="nowrap">Nombre:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="100" style="border:0;" name="escuelaNombre" id="escuelaNombre"
									value="${becado.escuela.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Modalidad de trabajo:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="modalidadTrabajoEscuela"
									value="${becado.escuela.modalidadTrabajoEscuela}"></input>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">El programa se implementa desde:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaComienzoPBE"
									value="${becado.escuela.comienzoPBE.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Matricula total:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaMatricula"
									value="${becado.escuela.matricula}"/>
							</td>
						</tr>	
						<tr>
							<td nowrap="nowrap">Becados por Cimientos:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="cantidadBecados"
									value="${cantidadBecadosCimiento}"/>
							</td>
						</tr>	
						<!-- tr>
							<td nowrap="nowrap">Indicadores de repitencia:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaIndicadorRepitencia"
									value="${escuela.indicadorRepitencia}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Indicadores de abandono:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaIndicadorAbandono"
									value="${escuela.indicadorAbandono}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Porcentaje de inasistencia de los alumnos a la escuela:</td>
							<td>
								<input type="text" readonly="readonly" size="45" style="border:0;" name="escuelaPorcentajeInasistencia"
									value="${escuela.porcentajeInasistencia}"/>
							</td>
						</tr-->						
					<!-- /c:if -->
					<c:if test="${!empty escuela.modalidadTrabajoEscuela.id && escuela.modalidadTrabajoEscuela.id == 1}">
						<tr>
							<td nowrap="nowrap">Nombre:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="100" style="border:0;" name="escuelaNombre"
									value="${escuela.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Modalidad de trabajo:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="modalidadTrabajoEscuela"
									value="${escuela.modalidadTrabajoEscuela.valor}"></input>
							</td>
						</tr>
						<tr>				
							<td colspan="2">
								<img src="../escuela/mostrarImagen.do" align="middle" width="90px" height="90px">
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Becados por Cimientos:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="cantidadBecados"
									value="${cantidadBecadosCimiento}"/>
							</td>
						</tr>							
					</c:if>		
					<c:if test="${!empty escuela.modalidadTrabajoEscuela.id && escuela.modalidadTrabajoEscuela.id != 1}">
						<tr>
							<td nowrap="nowrap">Nombre:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="100" style="border:0;" name="escuelaNombre"
									value="${escuela.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Modalidad de trabajo:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="modalidadTrabajoEscuela"
									value="${escuela.modalidadTrabajoEscuela.valor}"></input>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">El programa se implementa desde:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaComienzoPBE"
									value="${escuela.comienzoPBE.nombre}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Matricula total:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaMatricula"
									value="${escuela.matricula}"/>
							</td>
						</tr>	
						<tr>
							<td nowrap="nowrap">Becados por Cimientos:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="cantidadBecados"
									value="${cantidadBecadosCimiento}"/>
							</td>
						</tr>	
						<!-- tr>
							<td nowrap="nowrap">Indicadores de repitencia:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaIndicadorRepitencia"
									value="${escuela.indicadorRepitencia}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Indicadores de abandono:</td>
							<td>
								<input type="text" class="required" readonly="readonly" size="45" style="border:0;" name="escuelaIndicadorAbandono"
									value="${escuela.indicadorAbandono}"/>
							</td>
						</tr>
						<tr>
							<td nowrap="nowrap">Porcentaje de inasistencia de los alumnos a la escuela:</td>
							<td>
								<input type="text" readonly="readonly" size="45" style="border:0;" name="escuelaPorcentajeInasistencia"
									value="${escuela.porcentajeInasistencia}"/>
							</td>
						</tr-->	
					</c:if>			
				</table>
					</td>
				</tr>



				<!--tr>
				<td colspan="2"><h1 id="subtitulo-informe"><label>Principal HSE trabajada</label></h1></td>
		</tr-->
				<tr>
					<td><input type="hidden" id="hsTrabajarAño"
						name="hsTrabajarAño" value="${hsTrabajarAño}"> <input
						type="hidden" name="cantMateriasDesaprobadas"
						id="cantMateriasDesaprobadas" value="0" /> <input type="hidden"
						name="cantInasistencias" id="cantInasistencias" value="0" /> <input
						type="hidden" id="materiasInteres" name="materiasInteres"
						value="0"> <input type="hidden" id="materiasCuestan"
						name="materiasCuestan" value="0"> <input type="hidden"
						name="propositoAnual" id="propositoAnual" value=""> <input
						type="hidden" name="qtam" id="qtam" value=""> <input
						type="hidden" name="osme" id="osme" value=""></td>
				</tr>

				<!--tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Principales Contenidos trabajados</label></h1></td>
		</tr-->
				<tr>
					<td colspan="2"><input type="hidden"
						name="actividadAcompanamiento" id="actividadAcompanamiento"
						value="${actividadAcompanamiento}"></td>
				</tr>

				<!-- 2022 -->

				<tr>
					<td><h1 id="subtitulo-informe">
							<label> Trabajo de acompañamiento realizado a nivel
								grupal:</label>
						</h1> <textarea cols="60" rows="5" name="tarang" id="tarang">${tarang}</textarea>
					</td>
				</tr>
				<tr>
					<td><h1 id="subtitulo-informe">
							<label> Propósito Anual de Acompañamiento:</label>
						</h1> <textarea cols="60" rows="5" name="paa" id="paa">${paa}</textarea>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="form-group form-inline">
				<label>Asistencia a la modalidad de cursada definida por la escuela (virtual y/o presencial) &nbsp;&nbsp;</label>								
				<select  class="form-control"  id="vtepa" name="vtepa" style='width:auto'>
					<c:choose>
						<c:when test="${vtepa == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepa == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepa == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepa == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepa == 'Necesita mejorar'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' selected="selected" >Necesita mejorar</option>    	
					    </c:when>													    
					    							
					    <c:otherwise>
					    		<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option> 
					    </c:otherwise>								
					</c:choose>				
				</select>				
				<img src="../static/images/estrella.gif" id="exa" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mba" style="visibility: hidden;" width="50px"> 
				<img src="../static/images/estrella.gif" id="ba" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="ra" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="nma" style="visibility: hidden;" width="50px">

			</div>
			<div class="form-group form-inline">
				<label>Cumplimiento con las tareas asignadas por la escuela: </label>				
				<select  class="form-control"  id="vtepb" name="vtepb" style='width:auto'>
					<c:choose>
						<c:when test="${vtepb == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepb == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepb == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepb == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepb == 'Necesita mejorar'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' selected="selected" >Necesita mejorar</option>    	
					    </c:when>													    					    							
					    <c:otherwise>
					    		<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option> 
					    </c:otherwise>								
					</c:choose>				
				</select>
				<img src="../static/images/estrella.gif" id="exb" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="mbb" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="bb" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="rb" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="nmb" style="visibility: hidden;" width="50px">

			</div>
			<div class="form-group form-inline">
				<label>Pone en juego estrategias para resolver dificultades escolares: </label>				
				<select  class="form-control"  id="vtepc" name="vtepc" style='width:auto'>
					<c:choose>
						<c:when test="${vtepc == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepc == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepc == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepc == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepc == 'Necesita mejorar'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' selected="selected" >Necesita mejorar</option>    	
					    </c:when>													    					    							
					    <c:otherwise>
					    		<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option> 
					    </c:otherwise>								
					</c:choose>				
				</select>
				<img src="../static/images/estrella.gif" id="exc" style="visibility: hidden;" width="50px">
				<img src="../static/images/estrella.gif" id="mbc" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="bc" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="rc" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="nmc" style="visibility: hidden;" width="50px">

				
			</div>
			<div class="form-group form-inline">
				<label>Compromiso activo para rendir materias pendientes de años anteriores: </label>				
				<select  class="form-control"  id="vtepd" name="vtepd" style='width:auto'>
					<c:choose>
						<c:when test="${vtepd == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>
								<option value='No Aplica' >No Aplica</option>    	
					    </c:when>	
					    <c:when test="${vtepd == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>
								<option value='No Aplica' >No Aplica</option>    	
					    </c:when>	
					    <c:when test="${vtepd == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
								<option value='No Aplica' >No Aplica</option>    
					    </c:when>	
					    <c:when test="${vtepd == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
								<option value='No Aplica' >No Aplica</option>    
					    </c:when>	
					    <c:when test="${vtepd == 'Necesita mejorar'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' selected="selected" >Necesita mejorar</option>    	
					    			<option value='No Aplica' >No Aplica</option>
					    </c:when>
					    <c:when test="${vtepd == 'No Aplica'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    			<option value='No Aplica' selected="selected" >No Aplica</option>
					    </c:when>													    					    							
					    <c:otherwise>
					    		<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option> 
								<option value='No Aplica' >No Aplica</option>
					    </c:otherwise>								
					</c:choose>				
				</select>
				<img src="../static/images/estrella.gif" id="exd" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="mbd" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="bd" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="rd" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="nmd" style="visibility: hidden;" width="50px">

				
			</div>
			<div class="form-group form-inline">
				<label>Rendimiento escolar en esta etapa del año: </label>				
				<select  class="form-control"  id="vtepe" name="vtepe" style='width:auto'>
					<c:choose>
						<c:when test="${vtepe == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepe == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepe == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepe == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepe == 'Necesita mejorar'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' selected="selected" >Necesita mejorar</option>    	
					    </c:when>													    					    							
					    <c:otherwise>
					    		<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option> 
					    </c:otherwise>								
					</c:choose>				
				</select>
				<img src="../static/images/estrella.gif" id="exe" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="mbe" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="be" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="re" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="nme" style="visibility: hidden;" width="50px">

				
			</div>
			<div class="form-group form-inline">
				<label>Asistencia y participación en las actividades propuestas en los encuentros de acompañamiento y otras actividades de Cimientos: </label>				
				<select  class="form-control"  id="vtepf" name="vtepf" style='width:auto'>
					<c:choose>
						<c:when test="${vtepf == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepf == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepf == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepf == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepf == 'Necesita mejorar'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' selected="selected" >Necesita mejorar</option>    	
					    </c:when>													    					    							
					    <c:otherwise>
					    		<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option> 
					    </c:otherwise>								
					</c:choose>				
				</select>
				<img src="../static/images/estrella.gif" id="exf" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="mbf" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="bf" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="rf" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="nmf" style="visibility: hidden;" width="50px">

				
			</div>
			<div class="form-group form-inline">
				<label>Apropiación de las Habilidades Socioemocionales trabajadas en el acompañamiento: </label>				
				<select  class="form-control"  id="vtepg" name="vtepg" style='width:auto'>
					<c:choose>
						<c:when test="${vtepg == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepg == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepg == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepg == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepg == 'Necesita mejorar'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' selected="selected" >Necesita mejorar</option>    	
					    </c:when>													    					    							
					    <c:otherwise>
					    		<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option> 
					    </c:otherwise>								
					</c:choose>				
				</select>
				<img src="../static/images/estrella.gif" id="exg" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="mbg" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="bg" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="rg" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="nmg" style="visibility: hidden;" width="50px">

				
			</div>
			<div class="form-group form-inline">
				<label>Compromiso para el cumplimiento de los >propósitos establecidos en el acompañamiento: </label>				
				<select  class="form-control"  id="vteph" name="vteph" style='width:auto'>
					<c:choose>
						<c:when test="${vteph == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vteph == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vteph == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vteph == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vteph == 'Necesita mejorar'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' selected="selected" >Necesita mejorar</option>    	
					    </c:when>													    					    							
					    <c:otherwise>
					    		<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option> 
					    </c:otherwise>								
					</c:choose>				
				</select>
				<img src="../static/images/estrella.gif" id="exh" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="mbh" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="bh" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="rh" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="nmh" style="visibility: hidden;" width="50px">

				
			</div>
			<div class="form-group form-inline">
				<label>Asistencia y participación del Responsable Adulto en los espacios de acompañamiento: </label>				
				<select  class="form-control"  id="vtepi" name="vtepi" style='width:auto'>
					<c:choose>
						<c:when test="${vtepi == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepi == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepi == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepi == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${vtepi == 'Necesita mejorar'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' selected="selected" >Necesita mejorar</option>    	
					    </c:when>													    					    							
					    <c:otherwise>
					    		<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option> 
					    </c:otherwise>								
					</c:choose>				
				</select>
				<img src="../static/images/estrella.gif" id="exi" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="mbi" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="bi" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="ri" style="visibility: hidden;" width="50px">

				<img src="../static/images/estrella.gif" id="nmi" style="visibility: hidden;" width="50px">

				
			</div>			
	
					
					
					
					
					
					
					
					</td>
				</tr>



				<tr>
					<td><h1 id="subtitulo-informe">
							<label> Trabajo de acompañamiento realizado a nivel
								individual:</label>
						</h1> <textarea cols="60" rows="5" name="iatarni" id="iatarni">${iatarni}</textarea>
					</td>
				</tr>
				<tr>
					<td><h1 id="subtitulo-informe">
							<label> Materias Pendientes: ${mp}</label>
						</h1> <input type="hidden" name="mp" id="mp" value="${mp}"></td>
				</tr>
				<tr>
					<td><h1 id="subtitulo-informe">
							<label> Suspensiones: ${sus}</label>
						</h1> <input type="hidden" name="sus" id="sus" value="${sus}">
					</td>
				</tr>

				<c:if
					test="${becado.anioEscolar.id==14 || becado.anioEscolar.id==15}">
					<tr>
						<td colspan="2"><h1 id="subtitulo-informe">
								<label>Proyección post-escolar del EP:</label>
							</h1></td>
					</tr>
					<tr>
						<td colspan="2">${sarpepe} <input type="hidden"
							name="sarpepe" id="sarpepe" value="${sarpepe}">
						</td>
					</tr>
				</c:if>
				<c:if
					test="${becado.anioEscolar.id==13 && becado.anioAdicional==false}">
					<tr>
						<td colspan="2"><h1 id="subtitulo-informe">
								<label>Proyección post-escolar del EP</label>
							</h1></td>
					</tr>
					<tr>
						<td colspan="2">${sarpepe} <input type="hidden"
							name="sarpepe" id="sarpepe" value="${sarpepe}">
						</td>
					</tr>
				</c:if>


				<tr>
					<td><h1 id="subtitulo-informe">
							<label> Información general sobre la escuela:</label>
						</h1> <textarea cols="100" rows="10" name="ige" id="ige">${ige}</textarea>
					</td>
				</tr>

				<tr>
					<td><input type="hidden" id="iamp" name="iamp" value=""></td>
				</tr>




				
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
				<tr>
					 	       <td colspan="2">
					 	       		<table align="left">
					 	       			<tr>
										  <td width="50" align="left" valign="middle">
									       	<center>
												<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="history.back();" />
											</center>
									       </td>
					 	       			</tr>
					 	       		</table>			
						       </td>
						  </tr>
			</table>
			<input type="hidden" name="idEi" value="${idEi}"></input> 
			<input type="text" name="acciones" id="acciones">
			<input type="text" name="edad" id="edad" value="${edad}"></input> 
			<input type="hidden" name="idAlumno" id="idAlumno" value="${becado.id}"></input> 
			<input type="hidden" name="urlRegreso" id="urlRegreso" value="${urlRegreso}"></input> 
			<input type="text" name="idInformeIS3" id="idInformeIS3" value="${idInformeis3}"></input> 
			<input type="hidden" name="mensajePadrino" id="mensajePadrino" value="${mensajePadrino}"></input>
			<input type="hidden" name="alo" id="alo" value=""></input>
			<input type="hidden" name="sarpepe" id="sarpepe" value=""></input>
			<input type="hidden" name="estadoIS3" id="estadoIS3" value="1"></input>
		</form>
	</div>
</body>
<script>
function enviarForm(actions, idIS3, idBecado){
	//alert("1"+actions);
	var pp=actions;
	//alert("2"+pp);
	document.forms['modificarInformeIS3'].acciones.value = pp;
	//alert("3"+document.forms['modificarInformeIS3'].acciones.value);
	document.forms['modificarInformeIS3'].idAlumno.value = idBecado;
	//alert(4);
	document.forms['modificarInformeIS3'].idInformeIS3.value = idIS3;
	//setearMateriasSeleccionadas($("#idMateriaInteres"), document.forms['modificarInformeIS3'].materiasInteres, document.forms['modificarInformeIS3'].cantMateriasInteres);
	//setearMateriasSeleccionadas($("#idMateriaCuestan"), document.forms['modificarInformeIS3'].materiasCuestan, document.forms['modificarInformeIS3'].cantMateriasCuestan);
	//alert(5);
	if(actions == 'finalizar'){
		//alert(actions);
		if(document.getElementById("estadoEntrevista").value == estadoEntrevistaFinal){
			if (document.getElementById("evalRenovacionBeca").value == "" ) { 
	    	  jAlert('warning', 'El informe no se puede Finalizar hasta que no se apruebe la entrevista Final', 'Atención!');
			}else{
				document.forms['modificarInformeIS3'].action = "../informeIS3/finalizar.do";									
				$.blockUI();
				//document.forms['modificarInformeIS3'].accion.value = "";
				$('#modificarInformeIS3').submit();
		  }
		}else{
			jAlert('warning', 'El informe no se puede Finalizar hasta que no se apruebe la entrevista Final', 'Atención!');
		}
	}
	if(actions == 'construccion'){ 	
		document.forms['modificarInformeIS3'].action ="../informeIS3/modificarIS3.do?accion="+actions;	
		$.blockUI();
		document.forms['modificarInformeIS3'].submit();
	}	
}
</script>
</html>