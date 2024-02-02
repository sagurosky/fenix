<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://displaytag.sf.net" prefix="display" %> 
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">
</head>
<style type="text/css">
table#exportacion{  
	background-color: #C0C2FF;
	border: 0;
	}
	
</style>
<script type="text/javascript">
$(function(){
	if($('#zonaCimientos').val() != ''){
		$('#ea').removeAttr('disabled');
		$('#convocatoria').removeAttr('disabled');
	}

});
$(function() {
	$("#padrino").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarPadrinosPorNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxRows: 15,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.padrinos, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idPadrino").val(ui.item.id);
		},
		open: function() {
			$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
		},
		close: function() {
			$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
		}
	});
});
$(function() {

	$("#zonaCimientos").keypress(function(){
		$("#zonaCimientosId").val(0);
		$("#zonaCimientos").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarZonaPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.zonas, function(item) {
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
				$("#zonaCimientosId").val(ui.item.id);
				$("#ea").removeAttr('disabled');
				$("#convocatoria").removeAttr('disabled');
			}
		});
	});

});
	
/**
 * Este metodo busca por ajax y arma un select filtrando por zona
 *@parameter: IdZona
 *@paramter url
 *@parameter IdSelect(id del combo para armar)
 * NOTA:El objeto Json devuelto tiene que tener por nombre json y 
 */	
function buscarDatosAjaxCombo(idZona,url,idSelect){
	$.ajax({
		url: url+"?idZona="+idZona,
		dataType: "json",
		data: {
			style: "full"
		},
		success:
			function(data) {
			$('#removerOption').remove();
		//	document.formEx.idSelect.options.length = 0;
				for(var i= 0 ; i < data.json.length ; i++){
					//Este metodo es que el popula el combo de eas 
					populateCombos(data.json[i].id,data.json[i].nombre,idSelect);
				}
			
			}
	});
}
/**
 * Este metodo arma los combos 
 */
function populateCombos(id,nombre,idSelect){
	
	var option =document.createElement('option');
	option.id="removerOption";
	option.text=nombre;
	option.value=id;
	var select=document.getElementById(idSelect);
	try
	  {
	  	select.add(option,null); 
	  }
	catch(ex)
	  {
	  	select.add(option); 
	  }
	}
/*
if(document.getElementById("zona").value == ""){
	document.getElementById("ea").disabled = true;
	document.getElementById("idEa").value = "";
	document.getElementById("idRR").value = "";
	document.getElementById("idZona").value = "";
}
*/
</script>
<script type="text/javascript">
$(function() {
	$("#ea").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEasPorZonaYNombre.do?idZona=" + $("#zonaCimientosId").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.json, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							ea: item.nombre
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idEa").val(ui.item.id);
			$("#ea").text(ui.item.nombre);
		}
	});
});
</script>
<script type="text/javascript">

function validarFiltros(){
	if($('#convocatoria').val() == ''){
		$('#idConvocatoria').removeAttr('value');
	}
	if($('#ea').val() == ''){
		$('#idEa').removeAttr('value');
	}
	if($('#zonaCimientos').val() == ''){
		$('#zonaCimientosId').removeAttr('value');
	}
	if($('#padrino').val() == ''){
		$('#idPadrino').removeAttr('value');
	}
	document.forms['formEx'].action = "../exportarAlumnos/listaAlumnosExportar.do";
	document.forms['formEx'].submit();
	
}
$(function() {
	$("#convocatoria").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarConvocatoriaPorZonaYNombre.do?idZona=" + $("#zonaCimientosId").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.json, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							ea: item.nombre
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idConvocatoria").val(ui.item.id);
			$("#convocatoria").text(ui.item.nombre);
		}
	});
});

function disbledInput(){
	if($('#zonaCimientos').val() == ''){
		$('#zonaCimientosId').removeAttr('value');
		$('#ea').val('')
		$('#idEa').removeAttr('value');
		$("#ea").attr("disabled","disabled");
		$('#convocatoria').val('');
		$('#idConvocatoria').removeAttr('value');
		$("#convocatoria").attr("disabled","disabled");
	}
}

function habilitarEstados(){
	if(document.getElementById("becadosActivos").checked)
		document.getElementById("estados").disabled = true;
	else
		document.getElementById("estados").disabled = false;
}

function enviarForm(){
	if(document.getElementById("cicloNuevoId").value == 'seleccione'){
		jConfirm('Debes seleccionar el ciclo para el cual quiere exportar el/los boletín/es', 'Aviso');
	}
	else{
		jConfirm('Esta tarea puede tomar varios minutos, deseas continuar?', 'Confirmación', function(result){
		    if (result) {
		    	document.forms['formEx'].idCicloNuevo.value = $('#cicloNuevoId').val();
				document.forms['formEx'].action = "../exportarAlumnos/exportarBoletines.do";
		    	document.forms['formEx'].submit();							
		   	} 
			else{
			      return false;
			}
		});
	}
}
</script>

<body onload="habilitarEstados()">
<br><br>
<center><h3>Listado de Alumnos</h3></center>
<br><br>
<form method="post" name="formEx" id="formEx" action="<c:url value='/exportarAlumnos/listaAlumnosExportar.do'/>">
<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">

    
    <input type="hidden" name="idCicloNuevo">
<table id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">
	 	<tr align="center">
	 		<td align="left" style="font-size: 13px; font-weight: bold">Alumno:</td>
			<td align="left">
				<input id="alumno" width="150px;" type="text" name="nombreAlumno" value="${nombreAlumno}" />
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">Estado Alumno:</td>
			<td align="left">
				<select name="idEstadoAlumno" id="estados"  >
					<option value="0">Todos</option>
					<c:forEach items="${listEstadoAlumnos}" var="estado1">
						<c:choose>
							<c:when test="${estado.id == estado1.id}">
								<option value="${estado.id}" selected="selected">${estado1.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${estado1.id}" >${estado1.valor}</option>
							</c:otherwise>
						</c:choose>					
					</c:forEach>
				</select>			
			</td>
		</tr>
		
		<tr align="center">
	 		<td align="left" style="font-size: 13px; font-weight: bold">Año Escolar:</td>
			<td align="left">
				<select name="idAnioEscolar" id="aniosEscolares"  >
					<option value="0">Todos</option>
					<c:forEach items="${listAniosEscolares}" var="anio1">
						<c:choose>
							<c:when test="${anio.id == anio1.id}">
								<option value="${anio.id}" selected="selected">${anio1.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${anio1.id}" >${anio1.valor}</option>
							</c:otherwise>
						</c:choose>					
					</c:forEach>
				</select>							
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">Año Adicional:</td>
			<td align="left">
				<select name="anioAdicional" id="anioAdicional">
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
		</tr>
			
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Zona Cimientos:</td>
			<td align="left">
	    			<input type="hidden" name="idZonaCimientos" id="zonaCimientosId" value="${zonaCimientos.id}" />
					<input type="text" id="zonaCimientos" value="${zonaCimientos.nombre}" onchange="disbledInput()" />
					
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">EA:</td>
			<td align="left">
				<c:choose>
					<c:when test="${perfilEA.idPerfilEA != null}">
						<input type="hidden" name="idEa" id="idEa" 
							value="${perfilEA.idPerfilEA}" />
						<input type="text" id="ea" value="${perfilEA.datosPersonales.apellido}, ${perfilEA.datosPersonales.nombre}" />
					</c:when>
					<c:otherwise>
						<input type="hidden" name="idEa" id="idEa" 
							value="" />
						<input type="text" id="ea" value="" disabled="disabled"/>
					</c:otherwise>	
				</c:choose>
			</td>
		</tr>
		<tr align="center">
			<td align="left" style="font-size: 13px; font-weight: bold">Convocatoria</td>
			<td align="left">
				<c:choose>
						<c:when test="${convocatoria.idConvocatoria != null}">
							<input type="hidden" name="idConvocatoria" id="idConvocatoria" 
								value="${convocatoria.idConvocatoria}" />
							<input type="text" id="convocatoria" value="${convocatoria.nombre}" />
						</c:when>
						<c:otherwise>
							<input type="hidden" name="idConvocatoria" id="idConvocatoria" 
								value="" />
							<input type="text" id="convocatoria" value="" disabled="disabled"/>
						</c:otherwise>	
					</c:choose>
				
				</p>
			</td>
			<td align="left" style="font-size: 13px; font-weight: bold">Padrino:</td>
			<td align="left">
				<input type="hidden" name="idPadrino" id="idPadrino" value="${padrino.id}" />
				<c:choose>
					<c:when test="${padrino.datosPersonales != null}">
						<input type="text" id="padrino" value="${padrino.datosPersonales.apellido},${padrino.datosPersonales.nombre}" />
					</c:when>
					<c:when test="${padrino.empresa != null}">
						<input type="text" id="padrino" value="${padrino.empresa.denominacion}" />
					</c:when>
					<c:otherwise>
						<input type="text" id="padrino" value="${padrino.datosPersonales.nombre}" />
					</c:otherwise>
				</c:choose>
				
				
			</td>
		</tr>
		<tr>
			<td>
				<label>Becados activos</label>
			</td>
			<td>
				<input type="checkbox" name="becadosActivos"
					<c:if test="${becadosActivos}"> checked="checked"</c:if>id="becadosActivos"  onclick="habilitarEstados()">
			</td>
		</tr>
		<tr align="center">
			<td colspan="4">
				<input align="middle" id="buscar" type="button" onclick="validarFiltros()" value="Buscar" class="ui-state-default ui-corner-all" ></input>
			</td>			
		</tr>
</table>
</fieldset>
<br><br>
			<!-- fin - filtros -->	
				<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">
					<table id="table-ciclo" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">		
						<tr align="center">
							<td align="left" style="font-size: 13px; font-weight: bold">Seleccione el ciclo para el cual se exportaran los boletines:</td>
							<td align="left">
								 <select id="cicloNuevoId" name="cicloNuevoId" class="required" style="width:150px;">
									<option id="cicloNuevo" value="seleccione">Seleccione</option>
									<c:forEach var="ciclo" items="${ciclos}">
										<option id="ciclo" value="${ciclo.id}">${ciclo.nombre}</option>
									</c:forEach>
								</select>
							</td>
												
						<td>
							<input type="button" id="exportarBoletin" class="ui-state-default ui-corner-all" value="Exportar Boletines" onclick="enviarForm('')"/>							
						</td>
					
						</tr>
						
					</table>
				</fieldset>
<CENTER style="width: 1100px;">
<display:table name="alumnos" export="true" class="displayTags_wrapper" id="dto"  
	style="font-size: 12px; margin-left: 50px; margin-right: 50px;width:1000px; background-color: #C0C2FF;"  
	pagesize="50" defaultsort="50" defaultorder="ascending" requestURI="" 
	excludedParams="cicloNuevoId">
	<display:column property="alumno.id" title="Id Alumno" media="excel"></display:column>
	<display:column property="alumno.beca.id" title="Id Beca" media="excel" ></display:column>
	<display:column  title="Apellido alumno" media="html">
		${dto.alumno.datosPersonales.apellido}
		<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Detalle Alumno">
			<a  href="<c:url value='/fichaAlumno/fichaAlumnoView.do?idAlumno=${dto.alumno.id}&urlRegreso=${urlRegreso}'/>"> 
				<span class="ui-icon ui-icon-search" ></span>
			</a>		
		</div>
	</display:column>
		<display:column  title="Apellido alumno" media="excel">
		${dto.alumno.datosPersonales.apellido}		
	</display:column>
	<display:column  title="Nombre alumno" >
		${dto.alumno.datosPersonales.nombre}
	</display:column>
	<display:column property="alumno.datosPersonales.tipoDni.valor" title="Tipo de Dni" ></display:column>
	<display:column property="alumno.datosPersonales.dni" title="N° de Documento" ></display:column>
	<display:column title="Fecha de nacimiento" media="excel">
		<fmt:formatDate pattern="dd/MM/yyyy" value="${dto.alumno.datosPersonales.fechaNacimiento}" ></fmt:formatDate>
	</display:column>
<%-- 	<display:column title="Estado Alumno" > --%>
<%-- 		<c:if test="${dto.alumno.estadoAlumno.valor == 'En condiciones de renovar'}"> --%>
<!-- 			En condiciones de renovar -->
<%-- 		</c:if> --%>
<%-- 		<c:if test="${dto.alumno.estadoAlumno.valor == 'Pendiente'}"> --%>
<!-- 			Pendiente -->
<%-- 		</c:if> --%>
<%-- 		<c:if test="${dto.alumno.estadoAlumno.id != 20 && dto.alumno.estadoAlumno.id != 22}"> --%>
<%-- 			${dto.alumno.estadoAlumno.valor} --%>
<%-- 		</c:if>	 --%>
<%-- 	</display:column> --%>
	
	<display:column title="Estado Alumno" >
		<c:if test="${dto.alumno.estadoAlumno.id == 20 || dto.alumno.estadoAlumno.id == 22}">
			${dto.alumno.estadoRenovacion.valor}
		</c:if>
		<c:if test="${dto.alumno.estadoAlumno.id != 20 && dto.alumno.estadoAlumno.id != 22}">
			${dto.alumno.estadoAlumno.valor}
		</c:if>	
	</display:column>
	
	<display:column property="convocatoria.nombre" title="Convocatoria" ></display:column>
	<display:column property="alumno.responsable1.nombre" title="Nombre Responsable 1" media="excel"></display:column>
	<display:column property="alumno.responsable1.apellido" title="Apellido Responsable 1" media="excel"></display:column>
	<display:column property="alumno.responsable1.idVinculo.valor" title="Vinculo RA 1" media="excel"></display:column>
	<display:column property="alumno.responsable1.idTipoDni.valor" title="Tipo de Documento RA1" media="excel"></display:column>
	<display:column property="alumno.responsable1.dni" title="N° DNI RA1" media="excel"></display:column>
	<display:column property="alumno.responsable1.cuilCuit" title="N° Cuil RA1" media="excel"></display:column>
	<display:column property="alumno.responsable1.sucursalBanco.banco.nombre" title="Banco" media="excel"></display:column>
	<display:column property="alumno.responsable1.nroCuenta" title="N° de Cuenta" media="excel"></display:column>
	<display:column property="alumno.responsable2.nombre" title="Nombre Responsable2" media="excel"></display:column>
	<display:column property="alumno.responsable2.apellido" title="Apellido Responsable2" media="excel"></display:column>
	<display:column property="alumno.responsable2.idVinculo.valor" title="Vinculo RA2" media="excel"></display:column>
	<display:column property="alumno.escuela.nombre" title="Escuela" media="excel"></display:column>
	<display:column property="alumno.anioEscolar.valor" title="Año Escolar" media="excel"></display:column>
	<display:column title="Año Adicional" media="excel">
		<c:if test="${dto.alumno.anioAdicional}">
			Si
		</c:if>
		<c:if test="${!dto.alumno.anioAdicional}">
			No
		</c:if>	
	</display:column>
	<display:column property="alumno.escuela.zonaCimientos.nombre" title="Zona" media="excel"></display:column>
	<display:column property="alumno.ea.datosPersonales.nombre" title="Nombre Encargado" media="excel"></display:column>
	<display:column property="alumno.ea.datosPersonales.apellido" title="Apellido Encargado" media="excel"></display:column>
	<!-- Esto tiene que estar en DTO, para poder hacerlo el nombre del padrino, si empresa es null, entonces se mapea el otro -->
	<display:column title="Padrino" >
		<c:if test="${!empty dto.alumno.beca}">
			<c:choose>
				<c:when test="${empty dto.alumno.beca.padrino.empresa}">
				${dto.alumno.beca.padrino.datosPersonales.apellido},${dto.alumno.beca.padrino.datosPersonales.nombre} 
				</c:when>
				<c:otherwise>
					${dto.alumno.beca.padrino.empresa.denominacion}
				</c:otherwise>
			</c:choose>
		</c:if>
	</display:column>
	 <display:column  title="Id Plat" sortProperty="idPlataforma"  headerClass="sortable">
    	${dto.alumno.beca.padrino.nroCtesPlataformaContable}
    </display:column>
	
	<display:column property="alumno.beca.padrino.tipo.valor" title="Tipo de Padrino" media="excel"></display:column>
	<display:column property="alumno.beca.padrino.datosPersonales.direccion" title="Direccion" media="excel"></display:column>
	<display:column property="alumno.datosPersonales.telefono" title="Telefono" media="excel"></display:column>
	<display:column property="alumno.telefono2" title="Telefono2" media="excel"></display:column>
	<display:column property="alumno.telefono3" title="Telefono3" media="excel"></display:column>
	<display:column property="alumno.datosPersonales.mail" title="Email" media="excel" ></display:column>
				
	<display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.item_name" value="alumnos" />  
    <display:setProperty name="paging.banner.item_names" value="alumnos" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
    <display:setProperty name="export.excel.filename" value="alumnos.xls" />    
</display:table>
</CENTER>
				<br></br>
				
</form>
</body>
</html>