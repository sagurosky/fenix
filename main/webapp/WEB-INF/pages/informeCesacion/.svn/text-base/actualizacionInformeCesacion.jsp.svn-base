<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Informe de Cesacion</title>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script>
	$(document).ready(function(){
	    $("#actualizacionInformeCesacion").validate(
	    		{   			
			   		invalidHandler: function(form, validator) {
						var errors = validator.numberOfInvalids();
						if (errors) {
							$.unblockUI();
						}
					}	
				}
	    );
    	habilitarDatosEstimadosBoletin();
	});
</script>
<script type="text/javascript">
	function chequearLongitud(obj){
		if (obj.value.length > 10000) {
		obj.value = obj.value.substring(0, 10000);
		}
	}
	
	function validarCheckDatosEstimadosBoletin(obj)
	{
		if(obj == true)
		{
			$("#materiasAprobadas").addClass("required");
			$("#materiasDesaprobadas").addClass("required");
			$("#inasistencias").addClass("required");
		}
		else
		{
			$("#materiasAprobadas").removeClass("required");
			$("#materiasDesaprobadas").removeClass("required");
			$("#inasistencias").removeClass("required");
		}	
	}
	
	function habilitarDatosEstimadosBoletin()
	{
		var datosEstimados = $("#datosEstimadosCheck").is(":checked");
		if(datosEstimados == true)
		{
			$("#materiasAprobadas").removeAttr("disabled");
			$("#materiasDesaprobadas").removeAttr("disabled");
			$("#inasistencias").removeAttr("disabled");
			$("#obsBoletin").removeAttr("disabled");
		}
		else
		{
			$("#materiasAprobadas").attr("disabled","disabled");
			$("#materiasDesaprobadas").attr("disabled","disabled");
			$("#inasistencias").attr("disabled","disabled");
			$("#obsBoletin").attr("disabled","disabled");
		}
	}
	
	
</script>
<style type="text/css">
.td
{
text-indent: 30px;
}
.fechas
{
text-indent: 60px;
text-transform: inherit;
font-family: cursive;
font-size: small;
font-stretch: ultra-condensed;
color: purple;
font-weight: bold;
vertical-align: top;
}
.column-right 
{
	vertical-align: top;
}
.title-right 
{
	text-indent: 20px;
	margin-left: 20px;
	font-weight: bold;
	color: purple;
	font-family: cursive;
	
}
.tabla
{
	background-image:url('../static/images/papel.jpg');
	color:black;
	font-family:sans-serif;
	align:center; 
	border:0; 
}
</style>
<script type="text/javascript">
function enviarForm(action){	
	document.forms['actualizacionInformeCesacion'].action = "../informeCesacion/actualizarInformeFinalizado.do?accion=" + action;
	if(action == 'guardar'){		
		validarCheckDatosEstimadosBoletin($("#datosEstimadosCheck").is(":checked"));
		$.blockUI();		
		$('#actualizacionInformeCesacion').submit();
	}
	else{
		$("#materiasAprobadas").removeClass("required");
		$("#materiasDesaprobadas").removeClass("required");
		$("#inasistencias").removeClass("required");
		$.blockUI();
		document.forms['actualizacionInformeCesacion'].submit();
	}

}
</script>
</head>
<body>
<div id="main-content">
<form:form id="actualizacionInformeCesacion" commandName="informe" cssClass="cmxform"  modelAttribute="informe" action="" method="post">
<h1 id="titulo-informe">:: Informe de Cesación ::</h1>
	<table  border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		<tr>
			<td>${informe.estado.valor}</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
    	<tr>
			<td colspan="2"><h1 id="subtitulo-informe">Datos del Becado</h1></td>
		</tr>
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
					<tr>
						<td width="200"><label>Ciclo Lectivo:</label></td>
						<td  width="600"><label>${informe.cicloActual.nombre}</label></td>
					</tr>
					<tr>
						<td ><label>Alumno:</label></td>
						<td><label>${informe.becado.datosPersonales.nombre}&nbsp;${informe.becado.datosPersonales.apellido}</label></td>
					</tr>	
					<tr>
						<td><label>Fecha Nacimiento:</label></td>
						<td><label><fmt:formatDate value="${informe.becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/></label></td>
					</tr>
					<tr>
						<td><label>Edad:</label></td>
						<td><label>${informe.edad}</label></td>
					</tr>
					<tr>
						<td><label>Fecha Incorporación al PFE:</label></td>
						<td><label><fmt:formatDate value="${informe.fechaPBE}" pattern="dd/MM/yyyy"/></label></td>
					</tr>
					<c:if test="${!empty informe.fechaReincorporacionPBE}">
						<tr>
							<td><label>Fecha Reincorporación al PFE:</label></td>
							<td><label><fmt:formatDate value="${informe.fechaReincorporacionPBE}" pattern="dd/MM/yyyy"/></label></td>
						</tr>						
					</c:if>	
					<tr>	
						<td><label>Localidad donde vive:</label></td>
						<td><label>${informe.becado.datosPersonales.localidad.nombre}</label>
						</td>
					</tr>
					<c:if test="${!empty informe.becado.responsable2}">
						<tr>
							<td><label>Responsable Adulto:</label></td>						
							<td><label>${informe.becado.responsable2.nombre },&nbsp;${informe.becado.responsable2.apellido}</label>					
						</tr>
						<c:if test="${!empty informe.becado.responsable2.idVinculo}">
							<tr>
								<td><label>V&iacute;nculo:</label></td>
								<td><label>${informe.becado.responsable2.idVinculo.valor}</label></td>
							</tr>
						</c:if>
					</c:if>
					<c:if test="${empty informe.becado.responsable2}">
						<tr>
							<td><label>Responsable Adulto:</label></td>						
							<td><label>${informe.becado.responsable1.nombre },&nbsp;${informe.becado.responsable1.apellido}</label>					
						</tr>
						<c:if test="${!empty informe.becado.responsable1.idVinculo}">
							<tr>
								<td><label>V&iacute;nculo:</label></td>
								<td><label>${informe.becado.responsable1.idVinculo.valor}</label></td>
							</tr>
						</c:if>
					</c:if>
					<tr>	
						<td><label>A&ntilde;o que cursa:</label></td>
						<c:if test="${empty boletin}">
							<td><label>${informe.becado.anioEscolar.valor}</label></td>
						</c:if>
						<c:if test="${!empty boletin}">
							<td><label>${boletin.ano.valor}</label></td>
						</c:if>
					</tr>
					<tr>		
						<td><label>A&ntilde;o adicional:</label></td>
						<td>
							<input type="checkbox" name="anioAdicional"
								<c:if test="${informe.becado.anioAdicional}"> checked="checked" </c:if> 
							id="anioAdicional"  disabled="true">
						</td>
					</tr>
					<tr>	
						<td><label>Institución educativa:</label></td>
						<td><label>${informe.becado.escuela.nombre}</label>
						</td>
					</tr>
					<tr>	
						<td><label>Localidad:</label></td>
						<td><label>${informe.becado.escuela.localidad.nombre}</label>
						</td>
					</tr>
					<tr>	
						<td><label>Padrino:</label></td>
						<td>
							<label>
								${informe.padrino.empresa.denominacion}			
								${informe.padrino.datosPersonales.nombre}&nbsp;${informe.padrino.datosPersonales.apellido}
							</label>
						</td>		
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
      	    <td>&nbsp;</td>
       	    <td>&nbsp;</td>
      	</tr>	
		
		<c:if test="${!empty boletin}">
			<tr>
				<td colspan="2"><h1 id="subtitulo-informe"><label>Boletín de Calificaciones</label></h1></td>
			</tr>
			
			<tr>
				<td>
					<table>
						<tr>
							<td><label>Incluir el boletín en informe a padrinos </label></td>
							<c:choose>
								<c:when test="${incluirBoletinCheck == true}">
									<td><input type="checkbox" name="incluirBoletinCheck" checked="checked" id="incluirBoletinCheck" ></input></td>
								</c:when>
								<c:when test="${incluirBoletinCheck == false}">
									<td><input type="checkbox" name="incluirBoletinCheck" id="incluirBoletinCheck" ></input></td>
								</c:when>								
							</c:choose>
						</tr>
					</table>
				</td>
			</tr>
			
			<tr>
				<td>&nbsp;</td>
      		</tr>	
			
			<tr>	
				<td colspan="2">
					<table>	
						<tr>
							<td>
								<label>
									Recuerda que las materias y/o asistencias, días hábiles que contengan en todos los trimestres los valores "No aplica" y/o "No existe" y/o "Sin dato", no serán agregados al PDF para el padrino.
								</label>
							</td>
						</tr>
					</table>
					<jsp:include page="/WEB-INF/pages/informes/boletinView.jsp"></jsp:include>
				</td>
			</tr>
			
			<tr>
				<td>&nbsp;</td>
      		</tr>
      		
			<c:if test="${!empty boletin.materiasPrevias}">			
				<tr>			
					<td colspan="2">
						<jsp:include page="/WEB-INF/pages/informes/previasView.jsp"></jsp:include>
					</td>
				</tr>			
			</c:if>						
		</c:if>				

		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Datos estimados de bolet&iacute;n</label></h1></td>
		</tr>
		
		<tr>
			<td>
				<table>
					<tr>
						<td><label>Incluir datos estimados en informe a padrinos</label></td>
						<c:choose>
							<c:when test="${datosEstimadosCheck == true}">
								<td><input type="checkbox" name="datosEstimadosCheck" checked="checked" id="datosEstimadosCheck" onclick="habilitarDatosEstimadosBoletin();" onchange="habilitarDatosEstimadosBoletin();"></input></td>
							</c:when>
							<c:when test="${datosEstimadosCheck == false}">
								<td><input type="checkbox" name="datosEstimadosCheck" id="datosEstimadosCheck" onclick="habilitarDatosEstimadosBoletin();" onchange="habilitarDatosEstimadosBoletin();"></input></td>
							</c:when>
							<c:otherwise>
								<td><input type="checkbox" name="datosEstimadosCheck" id="datosEstimadosCheck" onclick="habilitarDatosEstimadosBoletin();" onchange="habilitarDatosEstimadosBoletin();"></input></td>
							</c:otherwise>
						</c:choose>
					</tr>
					<tr>
						<td><label>Materias aprobadas</label></td>
						<td>
							<input name="materiasAprobadas" id="materiasAprobadas" type="text" disabled="disabled" onkeypress="return soloNumeros(event);" value="${materiasAprobadas}" class="required numeric text-input"></input>
<%-- 						<form:input path="materiasAprobadas" cssClass="required numeric text-input" onkeypress="return soloNumeros(event);" disabled="disabled"></form:input> --%>
						</td>						
					</tr>
					<tr>
						<td><label>Materias desaprobadas</label></td>
						<td>
							<input name="materiasDesaprobadas" id="materiasDesaprobadas" type="text" disabled="disabled" onkeypress="return soloNumeros(event);" value="${materiasDesaprobadas}" class="required numeric text-input"></input>
<%-- 						<form:input path="materiasDesaprobadas" cssClass="required numeric text-input" onkeypress="return soloNumeros(event);" disabled="disabled"></form:input> --%>
						</td>
					</tr>
					<tr>
						<td><label>Inasistencias</label></td>
						<td>
							<input name="inasistencias" id="inasistencias" type="text" disabled="disabled"  onkeypress="return validarDecimal(event, this);" value="${inasistencias}" class="required text-input"></input>
<%-- 						<form:input path="inasistencias" onkeypress="return validarDecimal(event, this);" cssClass="required text-input" disabled="disabled"></form:input> --%>
						</td>
					</tr>
					<tr>
						<td><label>Observaciones de bolet&iacute;n</label></td>
						<td colspan="2">
							<textarea cols="60" rows="5" disabled="disabled" name="obsBoletin" id="obsBoletin" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);">${obsBoletin}</textarea>
<%-- 						<form:textarea cols="60" rows="5" path="obsBoletin" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);" disabled="disabled"></form:textarea> --%>
						</td>
					</tr>
				</table>
			</td>
		</tr>		
			
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Escolaridad</label></h1></td>
		</tr>
		
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
					<tr>
						<td width="300"><label>Compromiso del alumno:</label></td>
						<td width="600">
						<form:select path="compromisoEscolaridad" cssClass="required"> 
							<form:option value="">Seleccione una opción...</form:option>
							<form:options items="${compromisoEscolaridades}" itemLabel="valor" itemValue="id" />
						</form:select>
						</td>
					</tr>
					<tr>
						<td><label>Esfuerzo:</label></td>
						<td>
						<form:select path="esfuerzo" cssClass="required">
							<form:option value="">Seleccione una opción...</form:option> 
							<form:options items="${esfuerzos}" itemLabel="valor" itemValue="id" />
						</form:select>
						</td>
					</tr>
					<tr>
						<td><label>Conducta:</label></td>
						<td>
						<form:select path="conducta" cssClass="required"> 
							<form:option value="">Seleccione una opción...</form:option>
							<form:options items="${conductas}" itemLabel="valor" itemValue="id" />
						</form:select>
						</td>
					</tr>
					<tr>
						<td><label>Compromiso del Responsable Adulto:</label></td>
						<td>
						<form:select path="compromisoRa" cssClass="required"> 
							<form:option value="">Seleccione una opción...</form:option>
							<form:options items="${compromisosRa}" itemLabel="valor" itemValue="id" />
						</form:select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Participación en el Programa Futuros Egresados</label></h1></td>
		</tr>
		
		<tr>
			<td>
				<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
					<tr>
						<td width="300"><label>Asitencia becado a entrevistas:</label></td>
						<td width="600">
						<form:select path="asistenciaBecadoAEntrevista" cssClass="required"> 
							<form:option value="">Seleccione una opción...</form:option>
							<form:options items="${asistenciaBecados}" itemLabel="valor" itemValue="id" />
						</form:select>
						</td>
					</tr>
					<tr>
						<td><label>Presentación Material:</label></td>
						<td>
						<form:select path="presentacionMaterial" cssClass="required" > 
							<form:option value="">Seleccione una opción...</form:option>
							<form:options items="${presentacionMateriales}" itemLabel="valor" itemValue="id" />
						</form:select>
						</td>
					</tr>
					<tr>
						<td><label>Compromiso del alumno:</label></td>
						<td>
						<form:select path="compromisoEscolaridadPBE" cssClass="required"> 
							<form:option value="">Seleccione una opción...</form:option>
							<form:options items="${compromisoEscolaridadesPBE}" itemLabel="valor" itemValue="id" />
						</form:select>
						</td>
					</tr>
					<tr>
						<td><label>Asitencia responsable a entrevistas:</label></td>
						<td>
						<form:select path="asistenciaRAEntrevista" cssClass="required">
							<form:option value="">Seleccione una opción...</form:option> 
							<form:options items="${asistenciaRAs}" itemLabel="valor" itemValue="id" />
						</form:select>
						</td>
					</tr>
					<tr>
						<td><label>Compromiso del Responsable Adulto:</label></td>
						<td>
						<form:select path="compromisoRaPBE" cssClass="required"> 
							<form:option value="">Seleccione una opción...</form:option>
							<form:options items="${compromisosRaPBE}" itemLabel="valor" itemValue="id" />
						</form:select>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Actividad de Acompañamiento</label></h1></td>
		</tr>
		<tr>	
			<td colspan="2"><form:textarea cols="60" rows="5"  cssClass="required" path="actividadAcompanamiento" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"></form:textarea></td>
		</tr>
		<c:if test="${!empty informe.detallePagosSuspendidos}">
			<tr>
				<td colspan="2"><h1 id="subtitulo-informe"><label>Suspensiones de la Beca</label></h1></td>
			</tr>
			<tr>	
				<td colspan="2">
					<form:textarea cols="60" rows="5"  cssClass="required" path="detallePagosSuspendidos" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"></form:textarea>	
				</td>
			</tr>
		</c:if>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Cesación de la Beca</label></h1></td>
		</tr>
		<tr>
			<td><label>Mes de Cesación:</label></td>
		</tr>
		<tr>
		   <td colspan="2"><form:textarea cols="60" rows="5" cssClass="required" path="mesCesacion" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"></form:textarea></td>
		</tr>
		<tr>
        	<td>&nbsp;</td>
    	    <td>&nbsp;</td>
    	</tr>
		<tr>
			<td><label>Motivo de Cesación:</label></td>
		</tr>
		<tr>
		   <td colspan="2">
				<form:textarea cols="60" rows="5" path="motivoCesacion" cssClass="required" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
		   </td>
		</tr>
		<tr>
        	<td>&nbsp;</td>
    	    <td>&nbsp;</td>
    	</tr>
		<tr>
			<td><label>Comentarios de Cesación:</label></td>
		</tr>
		<tr>
		    <td colspan="2"><form:textarea cols="60" rows="5" path="comentariosCesacion" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"></form:textarea></td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Observaciones Generales</label></h1></td>
		</tr>
		<tr>
	  		<td colspan="2">
	  		<form:textarea  cols="60" rows="5"  path="observaciones" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"></form:textarea>
			</td>
		</tr>
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Destino del dinero de la Beca</label></h1></td>
		</tr>
		<tr>
			<td colspan="2">
			<form:textarea cols="60" rows="5"  cssClass="required" path="detalle" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"></form:textarea>
			</td>
		</tr>
		<tr>
      	    <td>&nbsp;</td>
       	    <td>&nbsp;</td>
      	</tr>
      	<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Comentarios de Revisión</label></h1></td>
		</tr>
		<tr>
			<td colspan="2"><label>Comentarios:</label></td>
		</tr>
		<tr>
		    <td colspan="2"><label><form:textarea  cols="60" rows="5" path="comentarios" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"></form:textarea></label></td>
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
			<td colspan="2">
				<table width="800" border="0" align="right" cellpadding="0" cellspacing="0" id="table-botons-small">
			    	<tr>
			    		<c:if test="${valorPerfil == 'superUsuario' && informe.estado.valor == estadoConstruccion}">
	              			<td width="50" height="0" align="center" valign="middle">
		  	  					<input class="ui-state-default ui-corner-all " onclick="enviarForm('revisar')"  type="button" value="Guardar" />
		  	  				</td>	
		  	  				<td width="50" height="0" align="center" valign="middle">
				  	  			<input class="ui-state-default ui-corner-all " type="button" onclick="enviarForm('guardar')" value="Finalizar" />
				  	  		</td>
			  	  		</c:if>
			  	  		<c:if test="${valorPerfil == 'superUsuario' && informe.estado.valor == estadoFinalizado}">
				  	  		<td width="50" height="0" align="center" valign="middle">
		  	  					<input class="ui-state-default ui-corner-all " onclick="enviarForm('revisar')"  type="button" value="Construcción" />
		  	  			</td>
				  	  		<td width="50" height="0" align="center" valign="middle">
				  	  			<input class="ui-state-default ui-corner-all " type="button" onclick="enviarForm('guardar')" value="Guardar" />
				  	  		</td>				  	  		
				  	  	</c:if>
			    		<c:if test="${valorPerfil != 'superUsuario'}">			    	
				 			<td width="50" height="0" align="center" valign="middle">
				 				<input class="ui-state-default ui-corner-all " onclick="enviarForm('revisar')"  type="button" value="Construcción" />				 				
							</td>	
							<td width="50" height="0" align="center" valign="middle">
								<input class="ui-state-default ui-corner-all " type="button" onclick="enviarForm('guardar')" value="Guardar" />
				 			</td>	  
				 		</c:if>
						<td width="50" align="center" valign="middle">
							<input type="button" value="Volver" class="ui-state-default ui-corner-all" 
						    	onclick="location.href='../reporteGeneralInformes/verReporteGeneralInformes.do'"/>
						</td>
			           <td width="292" height="30" align="center" valign="middle">&nbsp;</td>
					</tr>
				</table> 
			</td>
		</tr>
	</table>
	<input type="hidden" name="id" value="${informe.id}"></input>
	<input type="hidden" name="ei.id" value="${informe.ei.id}"></input>
	<input type="hidden" name="beca.id" value="${informe.beca.id}"></input>
	<input type="hidden" name="padrino.id" value="${informe.padrino.id}"></input>
	<input type="hidden" name="eaPerfil.idPerfilEA" value="${informe.eaPerfil.idPerfilEA}"></input>
	<input type="hidden" name="rrPerfil.idPerfilRR" value="${informe.rrPerfil.idPerfilRR}"></input>
	<input type="hidden" name="fechaAlta"  value="<fmt:formatDate value="${informe.fechaAlta}" pattern="dd/MM/yyyy"/>" ></input>
	<input type="hidden" name="estado" value="${informe.estado}"></input>
	<input type="hidden" name="fechaPBE" value="<fmt:formatDate value="${informe.fechaPBE}" pattern="dd/MM/yyyy"/>"></input>
	<input type="hidden" name="informe" value="${informe}"></input>
	<input type="hidden" name="becado.id" value="${informe.becado.id}"></input>	
	<input type="hidden" name="urlInforme" value="${urlInforme}"></input>
	<input type="hidden" name="edad" value="${informe.edad}"></input>
	<input type="hidden" name="nombre" value="${informe.nombre}"></input>
	<input type="hidden" name="cicloActual.id" value="${informe.cicloActual.id}"></input>
	<input type="hidden" name="esfuerzo"  value="${informe.esfuerzo.id}"/>
	<input type="hidden" name="compromisoEscolaridad"  value="${informe.compromisoEscolaridad.id}"/>	
	<input type="hidden" name="compromisoRa"  value="${informe.compromisoRa.id}"/>	
	<input type="hidden" name="asistenciaBecadoAEntrevista"  value="${informe.asistenciaBecadoAEntrevista.id}"/>	
	<input type="hidden" name="presentacionMaterial"  value="${informe.presentacionMaterial.id}"/>	
	<input type="hidden" name="compromisoEscolaridadPBE"  value="${informe.compromisoEscolaridadPBE.id}"/>	
	<input type="hidden" name="asistenciaRAEntrevista"  value="${informe.asistenciaRAEntrevista.id}"/>	
	<input type="hidden" name="compromisoRaPBE"  value="${informe.compromisoRaPBE.id}"/>	
	<input type="hidden" name="motivoCesacion"  value="${informe.motivoCesacion}"/>
	<input type="hidden" name="conducta"  value="${informe.conducta.id}"/>	
		
	
</form:form>
</div>
</body>
</html>