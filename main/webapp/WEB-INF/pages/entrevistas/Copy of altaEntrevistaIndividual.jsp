<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function alerta(){
	var d = new Date();
	var n = d.getMonth()+1;
	//alert(n);
	if(n==8){
		$( document ).ready(function() {
	    		$('#myModal').modal('toggle')
		});
	}
	if(n==9){
		$( document ).ready(function() {
	    		$('#myModal2').modal('toggle')
		});
	}	
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Espacio de acompañamiento Individual ::..</title>
<link rel="stylesheet" href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@3/dark.css" rel="stylesheet">
</head>
<!-- body  onload="cargarDatos();"-->
<body onload="alerta();">

<div class="container-fluid">

<div class="row">
	<div class="col-lg-2">
		<br>
		<div class="position-fixed">
			<img src="../fichaAlumno/mostrarImagen.do?dni=${alumno.datosPersonales.dni}" width="100px">	
			<br><br>	
			<div class="form-group">			
					<input type="button" class="btn btn-secondary" value="Construcción" 	onclick="guardar('c','${tipoPerfil}');">
			</div>
			<!--${boletin}-->
			<div class="form-group">				
					<c:if test="${tipoPerfil == 'rr' && boletin=='SinBoletin'}">
						<input type="button" class="btn btn-secondary "  value="Finalizar" class="ui-state-default ui-corner-all" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>
					<c:if test="${tipoPerfil == 'ea' && boletin=='SinBoletin'}">
						<input type="button" class="btn btn-secondary " value="Finalizar" class="ui-state-default ui-corner-all" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>
														
					<c:if test="${tipoPerfil == 'superUsuario' && boletin=='SinBoletin'}">
						<input type="button" class="btn btn-secondary"  value="Finalizar" class="ui-state-default ui-corner-all" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>
					<c:if test="${tipoPerfil == 'rr' && boletin=='ConBoletin'}">
						<input type="button" class="btn btn-secondary "  value="Finalizar" class="ui-state-default ui-corner-all" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>
					<c:if test="${tipoPerfil == 'ea' && boletin=='ConBoletin'}">
						<input type="button" class="btn btn-secondary " value="Finalizar" class="ui-state-default ui-corner-all" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>
														
					<c:if test="${tipoPerfil == 'superUsuario' && boletin=='ConBoletin'}">
						<input type="button" class="btn btn-secondary" value="Finalizar" class="ui-state-default ui-corner-all" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>
			</div>
			<div class="form-group">				
					<c:if test="${tipoPerfil == 'rr'}">
						<input type="button" class="btn btn-secondary " value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listaEntrevistasAprobar.do'; return false;" />
					</c:if>
					<c:if test="${tipoPerfil == 'ea'}">
						<input type="button" class="btn btn-secondary" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
					</c:if>	
					<c:if test="${tipoPerfil == 'superUsuario'}">
							<input type="button" class="btn btn-secondary" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
					</c:if>	
				
			</div>
		</div>
	</div>
	<div class="col-lg-10">

	<form:form id="altaEntrevistaIndividual" commandName="entrevista" modelAttribute="entrevista" cssClass="cmxform" method="post" action="guardar.do?alumnoId=${alumno.id}&EA=${ea}">
	
			
		<div class="card-body p-3 my-3 bg-secondary text-white">
		 <input type="hidden" id="mesEntrevista" name="mesEntrevista" value="${periodo.nombre}">
		  <h3 title="IdAlumno=${alumno.id}">Espacio de acompañamiento Individual - ${periodo.nombre} ${periodo.ciclo.nombre}  ${entrevista.periodoDePago.nombre} ${entrevista.periodoDePago.ciclo.nombre} - ${entrevista.estadoEntrevista.valor}<br>${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</h3>
			${entrevista.periodoDePago.nombre}
		  
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
			
				
		</div>
		
		
	
		<c:if test="${boletin=='SinBoletin' && periodo.nombre=='Enero'}">						
			<table>	
				<tr>
					<td colspan="2"><b><img src="../static/images/atencion.gif" width=10><font color="red"  size="2">¡Atención! Deberás cargar el primer trimestre completo del boletín para poder generar la entrevista de Enero.</font></b> </td>
				</tr>						
				<tr>
					<td colspan="2"><b><font color="red"  size="2"></font></b></td>
				</tr>	
				<tr><td></td></tr>
				<tr>
					<td  width="50">
						<center>
							<c:if test="${tipoPerfil == 'rr'}">
								<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listaEntrevistasAprobar.do'; return false;" />
							</c:if>
							<c:if test="${tipoPerfil == 'ea'}">
								<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
							</c:if>	
							<c:if test="${tipoPerfil == 'superUsuario'}">
									<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
							</c:if>	
						</center>
					</td>		
				</tr>	
			</table>
		</c:if>
		<c:if test="${boletin=='incompleto' && periodo.nombre=='Enero'}">						
			<table>	
				<tr>
					<td colspan="2"><b><img src="../static/images/atencion.gif" width=10><font color="red"  size="2">¡Atención! Te faltan completar notas en el primer trimestre del boletín para poder generar la entrevista de Enero.</font></b> </td>
				</tr>						
				<tr>
					<td colspan="2"><b><font color="red"  size="2"></font></b></td>
				</tr>	
				<tr><td></td></tr>
				<tr>
					<td  width="50">
						<center>
							<c:if test="${tipoPerfil == 'rr'}">
								<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listaEntrevistasAprobar.do'; return false;" />
							</c:if>
							<c:if test="${tipoPerfil == 'ea'}">
								<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
							</c:if>	
							<c:if test="${tipoPerfil == 'superUsuario'}">
									<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
							</c:if>	
						</center>
					</td>		
				</tr>
			</table>
		</c:if>
	
		<div class="card bg-info text-white">
			<div class="card-body">Datos Generales</div>
		</div>	
		<br>
		<c:if test="${periodo.nombre!='Enero'|| (boletin=='completo' && periodo.nombre=='Enero')}">
		
			<c:if test="${entrevista.entrevistaGrupal != null}">
				<c:set var="isGrupal" value="true"></c:set>			
			</c:if>
			
			<c:if test="${entrevista.entrevistaGrupal == null}">
				<c:set var="isGrupal" value="false"></c:set>
			</c:if>	
			
			<c:if test="${periodo.nombre=='Enero'}">						
				<c:if test="${alumno.situacionEscolar=='PROMOVIDO_CON_PREVIAS'}">
					<img src="../static/images/atencion.gif" width=10>¡Atención! Recordá actualizar el registro de materias previas para este alumno en su boletín del ciclo actual
					(si aún no lo generaste, deberás hacerlo desde tu panel)	
				</c:if>		 
			</c:if>				
							
	  		<div class="form-group form-inline">
		  		<label for="sel1">Tipo encuentro<br>acompañamiento &nbsp;&nbsp;</label>
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
			
			<!-- div class="form-group form-inline">		
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
			</div-->
			
				
						
			<div class="form-group form-inline">
				<label class="text-danger">Participó Becado &nbsp; &nbsp;</label>						
				<!-- form:checkbox path="participoBecado" id="participoBecado" onclick="habilitarCamposBecado(this)"/-->										
				<select class="form-control" id="participoBecado" name="participoBecado" style='width:auto'>							
					<c:choose>
						<c:when test="${entrevista.participoBecado == 'true'}">
								<option value="1" selected="selected">Si</option>
								<option value="0" >No</option>    	
					    </c:when>													    
					    <c:when test="${entrevista.participoBecado == 'false'}">       						
								<option value="1" >Si</option>
								<option value="0" selected="selected">No</option>    	
					    </c:when>													    								
					</c:choose>			
				</select>		
			</div>
						
			<div class="form-group form-inline">
				<label class="text-danger">Motivo Ausencia &nbsp;&nbsp;&nbsp;</label>			
				<select class="form-control" name="motivoAusencia" id="motivoAusencia" style='width:auto'>
				<!-- >form:select path="motivoAusencia" id="motivoAusencia" class="required"-->
					<c:choose>
	   					<c:when test="${entrevista.motivoAusencia == 'ENFERMEDAD'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option value=1 selected="selected">Razones de salud propia o de terceros</option>
							<option Value=2> in justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'EVENTUALIDAD'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=2  selected="selected">Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'INASISTENCIA'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=2 selected="selected">Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'CUIDADO'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=3 selected="selected">Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6  selected="selected">Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'MOTIVOSLABORALES'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=2>Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7  selected="selected">Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'DESCONOCIMIENTO'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=2>Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8 selected="selected">Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'DIFICULTADES'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=2>Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9  selected="selected">Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'TRAMITES'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=2>Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10 selected="selected">Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'FACTORESCLIMATICOS'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=2>Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11 selected="selected">Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'VIAJEAOTRALOCALIDAD'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=2>Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12 selected="selected">Viaje a otra localidad</option>
					    	<option Value=13>No demuestra interés-compromiso</option>
					    </c:when>
					    <c:when test="${entrevista.motivoAusencia == 'NODEMUESTRAINTERES'}">
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1 selected="selected">Razones de salud propia o de terceros</option>
							<option Value=2>Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
					    	<option Value=9>Dificultades en el traslado</option>
					    	<option Value=10>Realización de trámites</option>
					    	<option Value=11>Factores climáticos</option>
					    	<option Value=12>Viaje a otra localidad</option>
					    	<option Value=13 selected="selected">No demuestra interés-compromiso</option>
					    </c:when>
					    <c:otherwise>
	      						<option value=0>Seleccione una opci&oacute;n:</option>
							<option Value=1>Razones de salud propia o de terceros</option>
							<option Value=2>Sin justificación-se desconoce el motivo</option>
							<!--option Value=3>Sin justificación-se desconoce el motivo</option-->
							<option Value=4 >Otros</option>
							<option Value=5 disabled="disabled">No corresponde</option>								
					    	<option Value=6>Cuidado-ayuda a terceros</option>
					    	<option Value=7>Motivos laborales</option>
					    	<option Value=8>Desconocimiento, olvido o confusión fecha entrevista</option>
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
				<label>Otro Motivo &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>										
				<form:textarea path="otroMotivoAusencia" class="form-control" name="otroMotivoAusencia" id="otroMotivoAusencia" rows="4" style="width:270px" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</div>				
			
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
	<br>
	<div class="form-group">
		<label for="uname">Orientación Escolar: ${alumno.escuela.modalidadEscolar.valor}</label>										
	</div>
	 
	<div class="form-group form-inline"> 
		<label for="uname">Inasistencias mensuales &nbsp;&nbsp;</label>
		<form:input path="cantidadInasistencias" class="form-control" name="cantidadInasistencias" id="cantidadInasistencias" onkeypress="return validarDecimal(event, this);" onchange="habilitarMotivoInasistencias(this)" size="5"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<!--  ENTREVISTA JULIO-->
	
	<c:choose>
 		<c:when test="${entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio' }">
			<div class="card bg-info text-white">
				<div class="card-body">Acompañamiento Mensual</div>
			</div>
			<br>		
			<div class="form-group form-inline">
				<label class="text-danger">Objetivo del encuentro de julio/diciembre y actividad implementada &nbsp;&nbsp;</label>
				<textarea rows="4" cols="50" id="objetivoEncuentro" name="objetivoEncuentro"    class="form-control">${entrevista.objetivoEncuentro}</textarea>
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Principal HSE trabajada &nbsp;&nbsp;</label>
				<select  name="hsTrabajarAño" id="hsTrabajarAño" style='width:auto' class="form-control"> 
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
					    	<option Value="Toma de decisiones" >Toma de decisiones</option>
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
				</select>
			</div>
			<div class="form-group form-inline">		
				<label>&nbsp;&nbsp;Otra&nbsp; &nbsp;</label>										
				<form:textarea path="observacionesGenerales" class="form-control" name="observacionesGenerales" id="observacionesGenerales" rows="4" style="width:270px" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</div>
			<div class="form-group form-inline">
				<label>Principales Contenidos trabajados &nbsp;&nbsp;</label>
				<form:select path="contenidosTrabajarEnElAnio" style='width:auto' class="form-control">
					<form:options items="${contenidosTrabajarEnElAnio}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</div>
			<div class="form-group form-inline">
				<label>Otro contenido trabajado &nbsp;&nbsp;</label>										
				<form:input path="motivoInasistencia" id="motivoInasistencia"  class="form-control" style="width:500px;"/>
			</div>	
			<div class="form-group form-inline">
			<label>Situación de Riesgo extra-escolar &nbsp;&nbsp;</label>						
				<form:select path="situacionCrisis" style='width:auto' class="form-control">
					<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
				</form:select>							
			</div>	
			<div class="form-group form-inline">
				<label>Situacion de Riesgo escolar &nbsp;&nbsp;</label>						
				<form:select path="situacionRiesgoEscolar" style='width:auto' class="form-control">
					<form:options items="${situacionRiesgoEscolar}" itemLabel="valor" itemValue="id"/>				
				</form:select>							
			</div>
			<div class="form-group form-inline">
				<label>Ampliar información sobre la situación de riesgo seleccionada &nbsp;&nbsp;</label>				
				<form:textarea path="ossr" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" style='width:auto' class="form-control"/>
			</div>	
			<div class="card bg-info text-white">
					<div class="card-body">Acompañamiento - Semestral</div>
			</div>
			<br>
			<div class="form-group form-inline">
				<label class="text-danger">Trabajo de acompañamiento realizado a nivel grupal &nbsp;&nbsp;</label>
				<br><br>
				<label>Atención. Esta información se incluye en el Informe de Seguimiento<img src="../static/images/atencion.gif" width=10></label>				
				<form:textarea path="ossr" rows="4" cols="140" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" style='width:auto' class="form-control"/>
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Propósito Anual de Acompañamiento &nbsp;&nbsp;</label>
				<br><br>
				<label>Atención. Esta información se incluye en el Informe de Seguimiento<img src="../static/images/atencion.gif" width=10></label>				
				<form:textarea path="ossr" rows="4" cols="140" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" style='width:auto' class="form-control"/>
			</div>
		<div class="jumbotron">
			<div class="card bg-light text-white">
					<div class="card-body text-danger">Valoración de la trayectoria escolar y en el programa de el/la estudiante <br>
						Esta información se incluye en el Informe de Seguimiento</div>
			</div>	
			<br>
			<div class="form-group form-inline">
				<label class="text-danger">Asistencia a la modalidad de cursada definida por la escuela (virtual y/o presencial) &nbsp;&nbsp;</label>				
				<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
					<c:choose>
						<c:when test="${entrevista.motivoAusenciaRa2 == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Necesita mejorar'}">
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
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Cumplimiento con las tareas asignadas por la escuela &nbsp;&nbsp;</label>				
				<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
					<c:choose>
						<c:when test="${entrevista.motivoAusenciaRa2 == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Necesita mejorar'}">
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
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Pone en juego estrategias para resolver dificultades escolares &nbsp;&nbsp;</label>				
				<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
					<c:choose>
						<c:when test="${entrevista.motivoAusenciaRa2 == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Necesita mejorar'}">
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
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Compromiso activo para rendir materias pendientes &nbsp;&nbsp;</label>				
				<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
					<c:choose>
						<c:when test="${entrevista.motivoAusenciaRa2 == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Necesita mejorar'}">
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
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Rendimiento escolar en esta etapa del año &nbsp;&nbsp;</label>				
				<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
					<c:choose>
						<c:when test="${entrevista.motivoAusenciaRa2 == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Necesita mejorar'}">
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
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Asistencia y participación en las actividades propuestas en los encuentros de acompañamiento de Cimientos &nbsp;&nbsp;</label>				
				<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
					<c:choose>
						<c:when test="${entrevista.motivoAusenciaRa2 == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Necesita mejorar'}">
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
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Apropiación de las Habilidades Socioemocionales trabajadas en el acompañamiento &nbsp;&nbsp;</label>				
				<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
					<c:choose>
						<c:when test="${entrevista.motivoAusenciaRa2 == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Necesita mejorar'}">
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
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Compromiso para el cumplimiento de los propósitos establecidos en el acompañamiento &nbsp;&nbsp;</label>				
				<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
					<c:choose>
						<c:when test="${entrevista.motivoAusenciaRa2 == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Necesita mejorar'}">
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
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Asistencia y participación del Responsable Adulto en los espacios de acompañamiento &nbsp;&nbsp;</label>				
				<select  class="form-control"  id="motivoAusenciaRa2" name="motivoAusenciaRa2" style='width:auto'>
					<c:choose>
						<c:when test="${entrevista.motivoAusenciaRa2 == 'Excelente'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' selected="selected">Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Muy bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' selected="selected">Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Bien'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente' >Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' selected="selected">Bien</option>
								<option value='Regular' >Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Regular'}">
	       						<option value='0'>Seleccione una opci&oacute;n:</option>
								<option value='Excelente'>Excelente</option>
								<option value='Muy bien' >Muy bien</option>
								<option value='Bien' >Bien</option>
								<option value='Regular' selected="selected">Regular</option>
								<option value='Necesita mejorar' >Necesita mejorar</option>    	
					    </c:when>	
					    <c:when test="${entrevista.motivoAusenciaRa2 == 'Necesita mejorar'}">
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
			</div>			
		</div>
		<div class="form-group form-inline">
			<label class="text-danger">Información adicional sobre el trabajo de acompañamiento realizado a nivel individual &nbsp;&nbsp;</label>
			<br><br>
			<label>Atención. Esta información se incluye en el Informe de Seguimiento<img src="../static/images/atencion.gif" width=10></label>				
			<form:textarea path="ossr" rows="4" cols="140" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" style='width:auto' class="form-control"/>
		</div>
		<div class="form-group form-inline">
			<label class="text-danger">Materias Pendientes &nbsp;&nbsp;</label>
			<br><br>
			<label>Atención. Esta información se incluye en el Informe de Seguimiento<img src="../static/images/atencion.gif" width=10></label>				
			<form:textarea path="ossr" rows="4" cols="140" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" style='width:auto' class="form-control"/>
		</div>
	
		<div class="form-group form-inline">
			<label class="text-danger">Suspensiones &nbsp;&nbsp;</label>
			<br><br>
			<label>Atención. Esta información se incluye en el Informe de Seguimiento<img src="../static/images/atencion.gif" width=10></label>				
			<form:textarea path="ossr" rows="4" cols="140" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" style='width:auto' class="form-control"/>
		</div>
		<div class="form-group form-inline">	
			<label class="text-danger">¿Usaste el fichero en esta primer parte del año? &nbsp;&nbsp;</label>			
			<select  class="form-control"  id="usasteFichero" name="usasteFichero" style='width:auto'>
				<c:choose>
					<c:when test="${entrevista.usasteFichero == 'true'}">      					
						<option value='1' selected="selected">Si</option>
						<option value='0' >No</option>							 	
				    </c:when>													    
				    <c:when test="${entrevista.usasteFichero == 'false'}">	      					
						<option value='1'>Si</option>
						<option value='0'  selected="selected">No</option>							   	
				    </c:when>											    									
				    <c:otherwise>				    	
						<option value='1'>Si</option>
						<option value='0' selected="selected" >No</option>							
				    </c:otherwise>								
				</c:choose>				
			</select>
		</div>
		<div class="form-group form-inline">	
			<label class="text-danger">¿Completaste la brújula con el EP en esta primer parte del año? &nbsp;&nbsp;</label>					
			<select  class="form-control"  id="brujula" name="brujula" style='width:auto'>
				<c:choose>
					<c:when test="${entrevista.brujula == 'true'}">      					
							<option value='1' selected="selected">Si</option>
							<option value='0' >No</option>							 	
				    </c:when>													    
				    <c:when test="${entrevista.brujula == 'false'}">	      					
							<option value='1'>Si</option>
							<option value='0'  selected="selected">No</option>							   	
				    </c:when>											    									
				    <c:otherwise>				    		
							<option value='1'>Si</option>
							<option value='0' selected="selected" >No</option>							
				    </c:otherwise>								
				</c:choose>				
			</select>
		
		</div>
		
		<!-- ESTO SOLO ES PARA LOS EGRESADOS -->
		
		<c:set var="egreso" value="${0}"/>
		<c:if test="${alumno.escuela.zonaCimientos.eae=='6/6'}">
	    	<c:if test="${alumno.anioAdicional}">
				<c:set var="egreso" value="${alumno.beca.ciclo.nombre+14-alumno.anioEscolar.id+1}" />	
			</c:if>
			<c:if test="${!alumno.anioAdicional}">				
				<c:set var="egreso" value="${alumno.beca.ciclo.nombre+14-alumno.anioEscolar.id}" />
			</c:if>
		</c:if>
		<c:if test="${alumno.escuela.zonaCimientos.eae=='7/5'}">
	    	<c:if test="${alumno.anioAdicional}">				
				<c:set var="egreso" value="${alumno.beca.ciclo.nombre+13-alumno.anioEscolar.id+1}" />
			</c:if>
			<c:if test="${!alumno.anioAdicional}">
				<c:set var="egreso" value="${alumno.beca.ciclo.nombre+13-alumno.anioEscolar.id}" />
			</c:if>
		</c:if>
		<input type="hidden" id="anioEgreso" name="anioEgreso" value="${egreso}">		
		<c:if test="${(egreso==2022 || egreso==2023) && (entrevista.periodoDePago.nombre=='Julio' || periodo.nombre=='Julio') }">
			<div class="card bg-info text-white">
    			<div class="card-body">Egreso: ${egreso} </div>
  			</div>		
			<div class="card bg-light text-dark">
    			<div>						
					<div class="form-group form-inline">
						<label class="text-danger">Proyección post-escolar del EP  &nbsp;&nbsp;</label>	
						<select id="sarpepe" name="sarpepe" style='width:auto' class="form-control">				
			  					<c:if test="${entrevista.sarpepe == 'Tiene pensado estudiar'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Tiene pensado estudiar" selected="selected">Tiene pensado estudiar</option>
								<option value="Tiene pensado estudiar y trabajar">Tiene pensado estudiar y trabajar</option>
								<option value="Tiene pensado trabajar">Tiene pensado trabajar</option>
								<option value="Aun no lo sabe">Aun no lo sabe</option>
							</c:if>
							<c:if test="${entrevista.sarpepe == 'Tiene pensado estudiar y trabajar'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Tiene pensado estudiar">Tiene pensado estudiar</option>
								<option value="Tiene pensado estudiar y trabajar" selected="selected">Tiene pensado estudiar y trabajar</option>
								<option value="Quiere trabajar">Quiere trabajar</option>
								<option value="Aun no lo sabe">Aun no lo sabe</option>
							</c:if>
							<c:if test="${entrevista.sarpepe == 'Tiene pensado trabajar'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Tiene pensado estudiar">Tiene pensado estudiar</option>
								<option value="Tiene pensado estudiar y trabajar">Tiene pensado estudiar y trabajar</option>
								<option value="Tiene pensado trabajar"  selected="selected">Tiene pensado trabajar</option>
								<option value="Aun no lo sabe">Aun no lo sabe</option>
							</c:if>
							<c:if test="${entrevista.sarpepe == 'Aun no lo sabe'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Tiene pensado estudiar">Tiene pensado estudiar</option>
								<option value="Tiene pensado estudiar y trabajar">Tiene pensado estudiar y trabajar</option>
								<option value="Tiene pensado trabajar">Tiene pensado trabajar</option>
								<option value="Aun no lo sabe" selected="selected">Aun no lo sabe</option>
							</c:if>
							<c:if test="${entrevista.sarpepe != 'Tiene pensado estudiar' && entrevista.sarpepe != 'Tiene pensado estudiar y trabajar' 
									&& entrevista.sarpepe != 'Tiene pensado trabajar' && entrevista.sarpepe != 'Aun no lo sabe'}">
								<option value="0" >Seleccione una opción</option>
									<option value="Tiene pensado estudiar">Tiene pensado estudiar</option>
									<option value="Tiene pensado estudiar y trabajar">Tiene pensado estudiar y trabajar</option>
									<option value="Tiene pensado trabajar">Tiene pensado trabajar</option>
									<option value="Aun no lo sabe">Aun no lo sabe</option>
							</c:if>				
						</select>
					</div>
					
					<div class="form-group form-inline">					
						<label>En caso de que quiera estudiar, ¿qué tipo de estudios?  &nbsp;&nbsp;</label>			
						<select id="te" name="te" style='width:auto' class="form-control">				
			  					<c:if test="${entrevista.te == 'Universitarios'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Universitarios" selected="selected">Universitarios</option>
								<option value="Terciarios">Terciarios</option>
								<option value="Curso-oficio">Curso-oficio</option>
								<option value="Aun no lo sabe">Aun no lo sabe</option>
							</c:if>
							<c:if test="${entrevista.te == 'Terciarios'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Universitarios">Universitarios</option>
								<option value="Terciarios" selected="selected">Terciarios</option>
								<option value="Curso-oficio">Curso-oficio</option>
								<option value="Aun no lo sabe">Aun no lo sabe</option>
							</c:if>
							<c:if test="${entrevista.te == 'Curso-oficio'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Universitarios">Universitarios</option>
								<option value="Terciarios">Terciarios</option>
								<option value="Curso-oficio" selected="selected">Curso-oficio</option>
								<option value="Aun no lo sabe">Aun no lo sabe</option>
							</c:if>
							<c:if test="${entrevista.te == 'Aun no lo sabe'}">
								<option value="0" >Seleccione una opción</option>
								<option value="Universitarios">Universitarios</option>
								<option value="Terciarios" selected="selected">Terciarios</option>
								<option value="Curso-oficio">Curso-oficio</option>
								<option value="Aun no lo sabe"  selected="selected">Aun no lo sabe</option>
							</c:if>
							<c:if test="${entrevista.te != 'Si' && entrevista.te != 'No' }">
								<option value="0" >Seleccione una opción</option>
									<option value="Universitarios">Universitarios</option>
									<option value="Terciarios">Terciarios</option>
									<option value="Curso-oficio">Curso-oficio</option>
									<option value="Aun no lo sabe">Aun no lo sabe</option>
							</c:if>				
						</select>			
					</div>
					<div class="form-group form-inline">
						<label>Especificar nombre de Estudios o Carrera que le interesa &nbsp;&nbsp;</label>	
						<form:input path="ie" id="ie"  style="width:600px;" class="form-control"/>
					</div>	
					<div class="form-group form-inline">
						<label>Si ya lo tiene definido, especificar Institución &nbsp;&nbsp;</label>	
						<form:input path="facebook" id="facebook"  style="width:600px;" class="form-control"/>
					</div>				
					
					<div class="form-group form-inline">	
						<label>¿Tiene su CV armado?  &nbsp;&nbsp;</label>
						<select  class="form-control"  id="cv" name="cv" style='width:auto'>
						<c:choose>
								<c:when test="${entrevista.cv == 'true'}">      					
										<option value='1' selected="selected">Si</option>
										<option value='0' >No</option>
										 	
							    </c:when>													    
							    <c:when test="${entrevista.cv == 'false'}">	      					
										<option value='1'>Si</option>
										<option value='0'  selected="selected">No</option>
										   	
							    </c:when>											    									
							    <c:otherwise>
							    		
										<option value='1'>Si</option>
										<option value='0' selected="selected" >No</option>
										
							    </c:otherwise>								
							</c:choose>				
						</select>
					
						<label class="text-danger">&nbsp;&nbsp; Celular  &nbsp;&nbsp;</label>										
						<form:input path="celular" id="celular"  style="width:auto;" class="form-control"/>					
					</div>
					<div class="form-group form-inline">
						<label>Correo electrónico &nbsp;&nbsp;</label>
						<form:input path="dirMail" class="form-control" name="dirMail" id="dirMail" style="width:500px;" />				
					
					</div>
				</div>
			</div>
		</c:if>
		<div class="form-group form-inline">
			<label class="text-danger">Información general sobre la escuela &nbsp;&nbsp;</label>
			<br><br>
			<label>Atención. Esta información se incluye en el Informe de Seguimiento<img src="../static/images/atencion.gif" width=10></label>				
			<form:textarea path="ossr" rows="4" cols="140" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" style='width:auto' class="form-control"/>
		</div>	
		<div class="form-group form-inline">
			<label class="text-danger">Evaluacion Cobro de Beca  &nbsp;&nbsp;</label>		
			<form:select style='width:auto' path="evaluacionCobroBeca" id="evaluacionCobroBeca" class="form-control">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>				
			</form:select>			
		</div>		
		<div class="form-group form-inline">	
			<label>Motivo de Suspensión  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>		
			<form:select style='width:auto' path="motivoSuspension" id="motivoSuspension"  class="form-control">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoSuspension}" itemLabel="valor" itemValue="id"/>				
			</form:select>
		</div>	
		<div class="form-group form-inline">	
			<label>Motivo de Cesación  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>		
			<form:select style='width:auto' path="motivoCesacion" id="motivoCesacion"  class="form-control">
				<form:option value="">Seleccione una opción...</form:option>
				<form:options items="${motivoCesacion}" itemLabel="valor" itemValue="id"/>				
			</form:select>		
		</div>		
		<c:if test="${tipoPerfil != 'ea'}">  	
			<div class="form-group form-inline">				
				<label>Paga Entrevista  &nbsp;&nbsp;</label>
				<form:checkbox path="pagaEntrevista" checked="checked" style='width:auto' class="form-control"/>
			</div>
		</c:if>					
		</c:when>

		<!-- ENTREVISTAS DE MARZO A NOVIEMBRE MENOS JULIO -->
		<c:otherwise>
			<div class="card bg-info text-white">
				<div class="card-body">Acompañamiento</div>
			</div>			
			<br>	
			<div class="form-group form-inline">	
				<label class="text-danger">Observaciones sobre rendimiento escolar<br>y asistencia &nbsp;&nbsp;</label>
				<form:textarea path="osme" class="form-control" id="osme" rows="4" cols="50" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/> &nbsp;&nbsp;
			</div>		
			<div class="form-group form-inline">
				<label class="text-danger">Principal HSE trabajada &nbsp;&nbsp;</label>
				<select  name="hsTrabajarAño" id="hsTrabajarAño" style='width:auto' class="form-control"> 
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
			    	<option Value="Toma de decisiones" >Toma de decisiones</option>
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
				</select>
			</div>
			<div class="form-group form-inline">		
				<label>&nbsp;&nbsp;Otra&nbsp; &nbsp;</label>										
				<form:textarea path="observacionesGenerales" class="form-control" name="observacionesGenerales" id="observacionesGenerales" rows="4" style="width:270px" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</div>
			<div class="form-group form-inline">
				<label>Principales Contenidos trabajados &nbsp;&nbsp;</label>
				<form:select path="contenidosTrabajarEnElAnio" style='width:auto' class="form-control">
					<form:options items="${contenidosTrabajarEnElAnio}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</div>
			<div class="form-group form-inline">
				<label>Otro contenido trabajado &nbsp;&nbsp;</label>										
				<form:input path="motivoInasistencia" id="motivoInasistencia"  class="form-control" style="width:500px;"/>
			</div>									
			<div class="form-group form-inline">
				<label class="text-danger">Objetivo del encuentro y actividad implementada &nbsp;&nbsp;</label>												   					
				<textarea rows="4" cols="50" id="objetivoEncuentro" name="objetivoEncuentro"    class="form-control">${entrevista.objetivoEncuentro}</textarea> 
			</div>
			<div class="form-group form-inline">
				<label>Situación de Riesgo extra-escolar &nbsp;&nbsp;</label>						
				<form:select path="situacionCrisis" style='width:auto' class="form-control">
					<form:options items="${situacionCrisis}" itemLabel="valor" itemValue="id"/>				
				</form:select>							
			</div>	
			<div class="form-group form-inline">
				<label>Situacion de Riesgo escolar &nbsp;&nbsp;</label>						
				<form:select path="situacionRiesgoEscolar" style='width:auto' class="form-control">
					<form:options items="${situacionRiesgoEscolar}" itemLabel="valor" itemValue="id"/>				
				</form:select>							
			</div>
			<div class="form-group form-inline">
				<label>Ampliar información sobre la situación de riesgo seleccionada &nbsp;&nbsp;</label>				
				<form:textarea path="ossr" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" style='width:auto' class="form-control"/>
			</div>
			<div class="form-group form-inline">
				<label class="text-danger">Evaluacion Cobro de Beca  &nbsp;&nbsp;</label>		
				<form:select style='width:auto' path="evaluacionCobroBeca" id="evaluacionCobroBeca" class="form-control">
					<form:option value="">Seleccione una opción...</form:option>
					<form:options items="${evaluacionCobroBeca}" itemLabel="valor" itemValue="id"/>					
				</form:select>
			
			</div>		
			<div class="form-group form-inline">	
				<label>Motivo de Suspensión  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>		
				<form:select style='width:auto' path="motivoSuspension" id="motivoSuspension"  class="form-control">
					<form:option value="">Seleccione una opción...</form:option>
					<form:options items="${motivoSuspension}" itemLabel="valor" itemValue="id"/>				
				</form:select>
			</div>	
			<div class="form-group form-inline">	
				<label>Motivo de Cesación  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>		
				<form:select style='width:auto' path="motivoCesacion" id="motivoCesacion"  class="form-control">
					<form:option value="">Seleccione una opción...</form:option>
					<form:options items="${motivoCesacion}" itemLabel="valor" itemValue="id"/>				
				</form:select>		
			</div>		
			<c:if test="${tipoPerfil != 'ea'}">  	
				<div class="form-group form-inline">				
					<label>Paga Entrevista  &nbsp;&nbsp;</label>
					<form:checkbox path="pagaEntrevista" checked="checked" style='width:auto' class="form-control"/>
				</div>
			</c:if>	
			<div class="form-group form-inline">
				<label>Comentarios de revisión, intercambio RR - EA  &nbsp;&nbsp;</label>
				<form:textarea path="comentariosRevision" rows="4" cols="60" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" style='width:auto' class="form-control"/>
			</div>
		</c:otherwise>	
	</c:choose>
	<input type="hidden" id="ecabp" name="ecabp" value="">
	<input type="hidden" id="vcrae" name="vcrae" value="">
	<input type="hidden" id="qtam"  name="qtam"  value="">
	<input type="hidden" id="propositoAnual"  name="propositoAnual"  value="">
	<input type="hidden" id="osme"  name="osme"  value="">	
		
	
		
	
		<c:if test="${egreso!=2021 && egreso!=2022 }">
			<input type="hidden" id="sarpepe" value="0">
			<input type="hidden" id="te" value="0">
			<input type="hidden" id="ie" value="">
			<input type="hidden" id="cv" value="0">
			<input type="hidden" id="celular" name="celular" value="">										
		</c:if>		
		
</c:if>
	
	
	
	
		
	<c:if test="${entrevista.periodoDePago.nombre!='Julio' && periodo.nombre!='Julio'}">			
		<input type="hidden" name="corroboradoBoletin" id="corroboradoBoletin"  value="No"/>
		<input type="hidden" name="situacionCrisis" id="situacionCrisis" value="">									
		<input type="hidden" name="ossr" id="ossr" value="">				
		<input type="hidden" name="dirMail" id="dirMail"  value=""/>					
		<input type="hidden" name="facebook" id="facebook"  value=""/>				
		<input type="hidden" name="sarpepe" id="sarpepe"  value=""/>		
		<input type="hidden" name="celular" id="celular"  value=""/>			
		<input type="hidden" name="hsTrabajarAño" id="hsTrabajarAño" value="0"/>
		<input type="hidden" name="ase2020" id="ase2020" value="0"/>
		<input type="hidden" name="propositoAnual" id="propositoAnual"  value=""/>
		<input type="hidden" name="av" id="av"  value="0"/>
		<input type="hidden" name="qtam" id="qtam"  value=""/>
		<input type="hidden" name="iamp" id="iamp"  value=""/>
															
	</c:if>
		
	
	
	<!-- hidden obligatorios -->
	<input id="idEA" type="hidden" value="${idEA}"/>
	<input id="fechaActual" type="hidden" value="${fechaActual}">
	<input id="isGrupal" type="hidden" value="${isGrupal}"/>
	<input type="hidden" id="horaProxEntrevista" name="horaProxEntrevista" value="12:00">
	<input type="hidden" id="lugarProximaEntrevista" name="lugarProximaEntrevista" value="${alumno.escuela.nombre}">
	<input type="hidden" id="idProxima" name="lugarProximaEntrevista.id" value="${alumno.escuela.id}">
	<input type="hidden" name="valorGuardar" />
	<input type="hidden" name="valorPerfil" />		
	<input type="hidden" value="${boletin}">
	<form:hidden path="id"/>
	<form:hidden path="fechaCarga"/>
	<form:hidden path="periodoDePago"/>
	<input type="hidden" id="entrevistaReprogramada" name="entrevistaReprogramada">
	<input type="hidden" id="masDeUnEncuentro" name="masDeUnEncuentro" size="39" value="0" />
	<input type="hidden" id="participoBecadoX" name="participoBecadoX" value="${entrevista.participoBecado}">		
	<input type="hidden" id="motivoNoConvocatoria" name="motivoNoConvocatoria" value="${entrevista.motivoNoConvocatoria}">
	<input type="hidden" value="${entrevista.participoRA}">						
	<input type="hidden" id="motivoAusenciaRA" name="motivoAusenciaRA" value="${entrevista.motivoAusenciaRA}">
	<input type="hidden" id="cpaEA" name="cpaEA" value="0">
	<!-- input type="hidden" id="motivoInasistencia" name="motivoInasistencia"-->	
	<input type="hidden" id="periodo" name="periodo" value="${entrevista.periodoDePago.nombre}${periodo.nombre}">
	<input type="hidden" id="estrategiaComp" name="estrategiaComp" value="1">
	<input type="hidden" name="contenidosTrabajarDuranteAnio" id="contenidosTrabajarDuranteAnio" value="0">
	<input type="hidden" name="compromisoRA" id="compromisoRA" value="1">		
	<input type="hidden" id="masDeUnEncuentro" name="masDeUnEncuentro" value="0">
	<input type="hidden" id="telFijo" value="0">
	<input type="hidden" id="tma" value="0">

</form:form>
</div>
</div>
</div>



<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/validador.js"/>"></script>
<!--  script type="text/javascript" src="<c:url  value="/static/js/funcionesEntrevista.js"/>"></script-->
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
 <script type="text/javascript" src="<c:url  value="/static/js/dFilter.js"/>"></script>
 
 
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<!-- sweetalert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
 
<script>
$(document).ready(() => {
	
	var select = $("#motivoAusencia").val();
	var participoAB=($("#participoBecado").val());
	var observacionesGenerales=$("#hsTrabajarAño").val();
	if(participoAB==="1"){
 	   $("#motivoAusencia").prop('disabled', true); 
 	   $("#otroMotivoAusencia").prop('readonly', true);
 	   $("#motivoAusencia").val("0");
 	   $("#otroMotivoAusencia").val("");
    }else{
 	   $("#otroMotivoAusencia").prop('readonly', true);
 	   $("#motivoAusencia").prop('disabled', false);
    }
	
	//alert(select);	
	//$("#motivoAusencia").prop('disabled', true);
	
	
	$("#otroMotivoAusencia").prop('readonly', true);
	$("#motivoInasistenciaR").prop("disabled", true);
	$("#motivoSuspension").prop("disabled", true);
	$("#motivoCesasion").prop("disabled", true);
	$("#observacionesGenerales").prop('readonly', true);
	
	$("#participoBecado").change(function(){
		var participoAB = $(this).children("option:selected").val();
		//alert(participoAB);
      	
        if(participoAB==="1"){
    	   $("#motivoAusencia").prop('disabled', true); 
    	   $("#otroMotivoAusencia").prop('readonly', true);
    	   $("#motivoAusencia").val("0");
    	   $("#otroMotivoAusencia").val("");
       }else{
    	   $("#otroMotivoAusencia").prop('readonly', true);
    	   $("#motivoAusencia").prop('disabled', false);
       }
    });
	
	
	$("#motivoAusencia").change(function(){
        var otros = $(this).children("option:selected").val();
       if(otros==="4"){
    	   $("#otroMotivoAusencia").prop('readonly', false); 
       }else{
    	   $("#otroMotivoAusencia").prop('readonly', true);
    	   $("#otroMotivoAusencia").val("");
       }
    });	
	
	$("#hsTrabajarAño").change(function(){
        var otrosHSE = $(this).children("option:selected").val();
       if(otrosHSE==="Otra"){
    	   $("#observacionesGenerales").prop('readonly', false); 
       }else{
    	   $("#observacionesGenerales").prop('readonly', true);
    	   $("#observacionesGenerales").val("");
       }
    });	
	
	
	if(("#cantidadInasistencias")!==0 && ("#cantidadInasistencias")!=="0.0"){
		$("#motivoInasistenciaR").prop("disabled", false); 
	}else{
		$("#motivoInasistenciaR").prop("disabled", true);
 	   	$("#motivoInasistenciaR").val("0");
	}
	
	$("#cantidadInasistencias").change(function(){
        var cantidadInasistencias = $(this).val();        
       if(cantidadInasistencias!=="0"){
    	   $("#motivoInasistenciaR").prop("disabled", false); 
       }else{
    	   $("#motivoInasistenciaR").prop("disabled", true);
    	   $("#motivoInasistenciaR").val("0");
       }
    });
	
	$("#evaluacionCobroBeca").change(function(){
        var tipoCobro = $(this).children("option:selected").val();
       if(tipoCobro==="2"){
    	   $("#motivoSuspension").prop("disabled", false); 
    	   $("#motivoCesacion").prop("disabled", true);
       }else{
	       if(tipoCobro==="4"){
	    	   $("#motivoSuspension").prop("disabled", true); 
	    	   $("#motivoCesacion").prop("disabled", false);
	       }else{
	    	   $("#motivoSuspension").prop("disabled", true); 
	    	   $("#motivoCesacion").prop("disabled", true);   
	       }
      }
    });	
	
	
});
</script>

<script>

function guardarAprobar(valor, valorPerfil){		
	//alert(valorPerfil);
	var texto="<ul style ='list-style:none'>";
	texto=texto+"<li><b>Te falta completar los siguientes campos</b></li><li> </li>";
	//if(document.forms['altaEntrevistaIndividual'].tipoEncuentroAcompanamiento.value=="0" ){	 
	//	texto=texto+"<li>Principal tipo encuentro acompañamiento</li>";					
	//}
	
	if(document.forms['altaEntrevistaIndividual'].participoBecado.value=="0" && document.forms['altaEntrevistaIndividual'].motivoAusencia.value=="0"){		  
		texto=texto+"<li>Motivo de no participación Becado</li>";			
	}
	
	if(document.forms['altaEntrevistaIndividual'].motivoAusenciaRa2.value=="0" ){		
		texto=texto+"<li>Participación RA</li>";
	}
	
	
	if(document.forms['altaEntrevistaIndividual'].periodo.value=="Julio"){
		if(document.forms['altaEntrevistaIndividual'].ase2020.value=="0"){					
			texto=texto+"<li>Actualización Situación Escolar 2020 ¿Cuál fue el resultado escolar del ciclo 2020? </li>";
		}
	}else{
		document.forms['altaEntrevistaIndividual'].ase2020.value="0";
		
	}
	if(document.forms['altaEntrevistaIndividual'].periodo.value=="Julio"){
		if(document.forms['altaEntrevistaIndividual'].propositoAnual.value==""){					
			texto=texto+"<li>Seguimiento del propósito anual y desafíos a trabajar en el segundo semestre</li>";
		}
	}else{
		document.forms['altaEntrevistaIndividual'].propositoAnual.value="";
		
	}
	
	if(document.forms['altaEntrevistaIndividual'].osme.value==""){					
		texto=texto+"<li>Observaciones sobre rendimiento escolar y asistencia en esta primer parte del año</li>";
	}
	if(document.forms['altaEntrevistaIndividual'].periodo.value=="Julio"){
		if (document.forms['altaEntrevistaIndividual'].iamp.value== "" ) { 			  		
		  	texto=texto+"<li>Información adicional sobre materias pendientes</li>";
		}
	}else{
		document.forms['altaEntrevistaIndividual'].iamp.value="";
		
	}
	if(document.forms['altaEntrevistaIndividual'].hsTrabajarAño.value=="0"){					
		texto=texto+"<li>Principal HSE trabajada en esta primer parte del año</li>";
	}
	if(document.forms['altaEntrevistaIndividual'].periodo.value=="Julio"){				
		if(document.forms['altaEntrevistaIndividual'].anioEgreso.value=="2021" || document.forms['altaEntrevistaIndividual'].anioEgreso.value=="2022"){
			if(document.forms['altaEntrevistaIndividual'].sarpepe.value=="0"){					
				texto=texto+"<li>Proyección post-escolar del EP</li>";
			}
		}	
	}
	if(document.forms['altaEntrevistaIndividual'].periodo.value=="Julio"){				
		if(document.forms['altaEntrevistaIndividual'].anioEgreso.value=="2021" || document.forms['altaEntrevistaIndividual'].anioEgreso.value=="2022"){
			if(document.forms['altaEntrevistaIndividual'].celular.value==""){					
				texto=texto+"<li>Celular</li>";
			}
		}	
	}
	if(document.forms['altaEntrevistaIndividual'].objetivoEncuentro.value==""){					
		texto=texto+"<li>Objetivo del encuentro de julio y actividad implementada</li>";
	}	
	if(document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value==""){					
		texto=texto+"<li>Evaluación cobro beca</li>";
	}	
	
			
	if(document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value=="2"){		
		if(document.forms['altaEntrevistaIndividual'].motivoSuspension.value==""){						
			texto=texto+"<li>Motivo de suspensión</li>";
		} 
	}
	//alert(11);
	if(document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value=="4"){
		if(document.forms['altaEntrevistaIndividual'].motivoCesacion.value==""){			
			texto=texto+"<li>Motivo de cesación</li>";
		}
	}
	//alert(12);
	if (document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value == 3 ) { 			  		
	  	texto=texto+"<li>No se puede finalizar una entrevista en estado dudoso</li>";
	}
	
	
	//alert(13);
	texto=texto+"</ul>";
	//alert(texto.length);
	if(texto.length>100){			
		const Toast = Swal.mixin({
			  toast: true,
			  position: 'top-end',
			  //showConfirmButton: false,			  
			  //timer: 7000,
			  html:texto,
			  timerProgressBar: true,
			  footer: 'Cualquier duda contactate con tu Responsable Regional',
			  onOpen: (toast) => {
			    toast.addEventListener('mouseenter', Swal.stopTimer)
			    toast.addEventListener('mouseleave', Swal.resumeTimer)
			  }
			})
			Toast.fire({
			  icon: 'error',
			  //title: 'Falta completar'
			})
			texto="";
			
		return false;
	}else{
		document.forms['altaEntrevistaIndividual'].valorPerfil.value = valorPerfil;
		document.forms['altaEntrevistaIndividual'].valorGuardar.value = valor;			
		//$.blockUI();			
		document.forms['altaEntrevistaIndividual'].submit();		
	}
}	
</script>
<script>
	function guardar(valor, valorPerfil){	
		
		document.forms['altaEntrevistaIndividual'].valorPerfil.value = valorPerfil;
		var valor=document.forms['altaEntrevistaIndividual'].valorGuardar.value = valor;		
		//alert(valor);
		if (valor == 'f'){
			
			
			if (esMayor(document.forms['altaEntrevistaIndividual'].fechaEntrevista.value, document.forms['altaEntrevistaIndividual'].fechaActual.value)){
				document.forms['altaEntrevistaIndividual'].fechaEntrevista.focus();
				jAlert('warning', '"Fecha Entrevista" no puede ser mayor a la fecha actual', 'Atención!')
				
			}
			else{
				if (document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value == 4 ){
					$.blockUI();
					$('#altaEntrevistaIndividual').submit();
				}else{
					if(valorPerfil != 'superUsuario'){
						if (!esMayor(document.forms['altaEntrevistaIndividual'].proximaEntrevista.value, document.forms['altaEntrevistaIndividual'].fechaActual.value)){
							document.forms['altaEntrevistaIndividual'].proximaEntrevista.focus();
							jAlert('warning', '"Fecha Proxima Entrevista" debe ser mayor a la fecha actual', 'Atención!')
						}
						else{
							$.blockUI();
							$('#altaEntrevistaIndividual').submit();
						}
					}
					else{
						$.blockUI();
						$('#altaEntrevistaIndividual').submit();
					}
				}
			}	
		}else{
			//$.blockUI();
			var cantidadInasistencias=$("#cantidadInasistencias").val();
			//alert(cantidadInasistencias.length);
			if(cantidadInasistencias.length==0){
				$("#cantidadInasistencias").val(0);
				
			}
			document.forms['altaEntrevistaIndividual'].submit();
		}
		
	}
</script>

<script>
	function raNoFueConvocado(inputSelect){
		//alert(1);
	
		if(document.getElementById("raNoConvocado").checked==true){		
			//alert(2);
			$('#motivoNoConvocatoria').attr('disabled','disabled');
			$('#motivoNoConvocatoria').attr('value', 'Seleccione una opción:');
			//$('#motivoNoConvocatoria > option[value="0"]').attr('selected', 'selected');
			$('#participoRA').removeAttr('disabled');
			//$('#motivoAusenciaRA').removeAttr('disabled');
			//$('#motivoAusenciaRA').attr('value', 'Seleccione una opción:');
		}else{		
			//alert(3);
			$('#motivoNoConvocatoria').removeAttr('disabled');
			//$('#participoRA').removeAttr('disabled');
			$('#participoRA').removeAttr("checked");
			$('#participoRA').attr('disabled','disabled');	
			//$('#motivoAusenciaRA').attr('disabled','disabled');
			//$('#motivoAusenciaRA').attr('value', 'Seleccione una opción:');
		}	
	}
</script>

<script>
	$(document).ready(function(){  
	  
    	$("#participoRA").click(function() {  
        	if($("#participoRA").is(':checked')) {  
            	//alert("Está activado");  
        		//$('#motivoAusenciaRA').attr('disabled','disabled');
    			//$('#motivoAusenciaRA').attr('value', 'Seleccione una opción:');
    	    }  
            	
        	 else {  
	            //alert("No está activado");
        		//$('#motivoAusenciaRA').removeAttr('disabled');
    			//$('#motivoAusenciaRA').attr('value', 'Seleccione una opción:');
        	}	
    	});  
  
	});  
</script>

<script>
	function verificarCantidad(){
		//alert(document.getElementById("contenidosAbordados").length);
		var e = document.getElementById("contenidosAbordados");
		var a=0;
		for (var i = 0; i < e.length; i++){				
				if(e.options[i].selected == true){
				var name = e[i].getAttribute("text");
				a++;								
				}
		}
		if(a>2){
			alert("Tenés que seleccionar no más de 2 habilidades y/o contenidos. Seleccionaste "+a);
		}
		
	} 
</script>

<script>
function chequearLongitud(obj){
	if (obj.value.length > 10000) {
	obj.value = obj.value.substring(0, 10000);
	}
}
</script>
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
                    <h4 class="modal-title">Recordatorio</h4>
        </div>
        <div class="modal-body">
          <p style="font-size:25px; color:red;">Si aún no creaste el boletín 2021, recordá hacerlo, sino no podrás generar la próxima Entrevista del mes de Septiembre 2021</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>
 <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
                    <h4 class="modal-title">Recordatorio</h4>
        </div>
        <div class="modal-body">
          <p style="font-size:25px; color:red;">Si aún no creaste el boletín 2021, recordá hacerlo, porque no podrás finalizar la Entrevista del mes de Septiembre 2021</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
      
    </div>
  </div>	
</body>
</html>