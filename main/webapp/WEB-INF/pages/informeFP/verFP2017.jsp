<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
	..:: Ficha de Presentacion ::..
</title>
<script type="text/javascript"	src="<c:url value="/static/js/funcionesEntrevista.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript">
$(function() {
	$('#tabla1').dataTable( {
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
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25
	});
	});
</script>
</head>
<body>
<div id="main-content">
<form:form modelAttribute="ficha" id="altaFP" name="altaFP" cssClass="cmxform" commandName="ficha" method="post" action="verInformeFPRevisionSuperUsuarioView.do?idFP=${ficha.id}">
<input type="hidden" name="valorGuardar" />
<input type="hidden" name="valorPerfil" />

<c:set var="urlRegreso" value="/informeFP/verFP.do?idFP=${ficha.id}" ></c:set>
	<h1 id="titulo-informe">:: Ficha de Presentación ::</h1>
	<table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
		
					<tr>
						<td>${ficha.estado.valor}</td>
					</tr>
					
					<tr>
					<td colspan="2"><h1 id="subtitulo-informe"><label>Datos del alumno</label></h1></td>
					</tr>
					
					<tr>
					<td>
					<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
			    	<tr>
					<td width="200"><label>Ciclo lectivo:</label></td>
					<td width="600"><label>${ficha.cicloActual.nombre}</label></td>
					</tr>
					
					<tr>
					<td ><label>Alumno:</label></td>
					<td><label>${ficha.becado.datosPersonales.nombre}&nbsp;${ficha.becado.datosPersonales.apellido}</label></td>
					</tr>
															
					<tr>
					<td ><label>Fecha de nacimiento</label></td>
					<td ><label><fmt:formatDate value="${ficha.becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/></label></td>		
					</tr>
					
					<tr>
					<td ><label>Edad:</label></td>
					<td ><label>${ficha.edad}</label>
					</td>
					</tr>
				
					<tr>
					<td ><label>Localidad donde vive:</label></td>
					<td ><label>${ficha.becado.datosPersonales.localidad.nombre}</label>
					</td>
					</tr>
					
					<tr>
					<td ><label>Año que cursa:</label></td>
					<td ><label>${ficha.becado.anioEscolar.valor}</label>
					</td>
					</tr>
					
					<tr>		
						<td><label>A&ntilde;o adicional:</label></td>
						<td>
							<input type="checkbox" name="anioAdicional"
								<c:if test="${ficha.becado.anioAdicional}"> checked="checked" </c:if> 
							id="anioAdicional"  disabled="true">
						</td>
					</tr>					
					
					<tr>
					<td ><label>Escuela:</label></td>
					<td ><label>${ficha.becado.escuela.nombre}</label>
					</td>
					</tr>
					
					<tr>
					<td ><label>Localidad:</label></td>
					<td ><label>${ficha.becado.escuela.localidad.nombre}</label>
					</td>
					</tr>
					
					<c:if test="${!empty ficha.becado.responsable2}">
						<tr>
							<td><label>Responsable Adulto:</label></td>						
							<td><label>${ficha.becado.responsable2.nombre },&nbsp;${ficha.becado.responsable2.apellido}</label>					
						</tr>
						<c:if test="${!empty ficha.becado.responsable2.idVinculo}">
							<tr>
								<td><label>V&iacute;nculo:</label></td>
								<td><label>${ficha.becado.responsable2.idVinculo.valor}</label></td>
							</tr>
						</c:if>
					</c:if>
					<c:if test="${empty ficha.becado.responsable2}">
						<tr>
							<td><label>Responsable Adulto:</label></td>						
							<td ><label>${ficha.becado.responsable1.nombre },&nbsp;${ficha.becado.responsable1.apellido}</label>					
						</tr>
						<c:if test="${!empty ficha.becado.responsable1.idVinculo}">
							<tr>
								<td><label>V&iacute;nculo:</label></td>
								<td><label>${ficha.becado.responsable1.idVinculo.valor}</label></td>
							</tr>
						</c:if>
					</c:if>	
					
<!-- 					<tr> -->
<!-- 					<td ><label>Responsable Adulto:</label></td> -->
<%-- 					<td ><label>${ficha.becado.responsable1.nombre },&nbsp;${ficha.becado.responsable1.apellido}</label> --%>
<!-- 					</td> -->
<!-- 					</tr> -->
					
<%-- 					<c:if test="${!empty ficha.becado.responsable1.idVinculo}"> --%>
<!-- 						<tr> -->
<!-- 							<td ><label>V&iacute;nculo:</label></td> -->
<%-- 							<td ><label>${ficha.becado.responsable1.idVinculo.valor}</label></td> --%>
<!-- 						</tr> -->
<%-- 					</c:if> --%>
					
					<tr>
					<td ><label>Fecha de incorporación al PFE:</label></td>
					<td ><label><fmt:formatDate value="${ficha.fechaPBE}" pattern="dd/MM/yyyy"/></label></td>
					</tr>
					
					<c:if test="${!empty ficha.fechaReincorporacionPBE}">
						<tr>
							<td><label>Fecha Reincorporación al PFE:</label></td>
							<td><label><fmt:formatDate value="${ficha.fechaReincorporacionPBE}" pattern="dd/MM/yyyy"/></label></td>
						</tr>						
					</c:if>		
		
					<tr>
					<td ><label>Padrino:</label></td>
					<td >
					<label>
						${ficha.padrino.empresa.denominacion}
						${ficha.padrino.datosPersonales.nombre}&nbsp;${ficha.padrino.datosPersonales.apellido}
					</label>
					</td>
					</tr>
					</table>
					</td>
					</tr>
					
		
		
		<c:if test="${!empty ficha.convivientes}">
		<tr>
		<td colspan="2"><h1 id="subtitulo-informe"><label>Características familiares</label></h1></td>
		</tr>
		<tr>
		<td colspan="2"><label>Convivientes</label>
		<br><br>
			<table id="table-boletin" width="95%">
				<thead>
					<tr align="center">
						<th>Vínculo</th>
						<th>Nombre y Apellido</th>
						<th>Edad</th>
						<th>Máximo nivel de estudios alcanzados</th>
						<th>Ocupación</th>
					</tr>
				</thead>
				<tbody>
				   <c:forEach items="${ficha.convivientes}" var="conviviente">
						<c:if test="${!empty conviviente.convive.valor && conviviente.convive.valor == 'SI'}">
							<tr align="center">
								<td align="center">
									<c:if test="${!empty conviviente.vinculo.valor}">
										${conviviente.vinculo.valor}
									</c:if>
									<c:if test="${empty conviviente.vinculo.valor}">
										-
									</c:if>
								</td>
								<td align="center">${conviviente.nombre},${conviviente.apellido}</td>
								<td align="center">
									<c:if test="${!empty conviviente.edad}">
										${conviviente.edad}
									</c:if>
									<c:if test="${empty conviviente.edad}">
										-
									</c:if>
								</td>
								<td align="center">
									<c:if test="${!empty conviviente.nivelEducativo.valor}">
										${conviviente.nivelEducativo.valor}
									</c:if>
									<c:if test="${empty conviviente.nivelEducativo.valor}">
										-
									</c:if>
								</td>
								<td align="center">
									<c:if test="${!empty conviviente.ocupacionLaboral}">
										${conviviente.ocupacionLaboral}
									</c:if>
									<c:if test="${empty conviviente.ocupacionLaboral}">
										-
									</c:if>
								</td>		
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</td>
		</tr>
		</c:if>

		<c:if test="${!empty ficha.boletinSeleccions}">
		<tr>
			<td colspan="2"><h1 id="subtitulo-informe"><label>Datos escolares al momento de ingresar al programa</label></h1></td>
		</tr>
		<tr>
			<td><label>Boletín</label></td>
		</tr>
		
		<tr>
			<td><jsp:include page="/WEB-INF/pages/informeFP/boletinSeleccionFP.jsp" /></td>
		</tr>
		<tr>
				<td>&nbsp;</td>
       	    </tr>
      	
			<tr>
				<td>
					<table width="300">
						<tr>
							<td width="150"><label>Incluir el boletín en la FP</label></td>
							<c:choose>
								<c:when test="${ficha.incluirBoletinCheck == true}">
									<td><input type="checkbox" name="incluirBoletinCheck" checked="checked" disabled="disabled" id="incluirBoletinCheck" ></input></td>
								</c:when>
								<c:when test="${ficha.incluirBoletinCheck == false}">
									<td><input type="checkbox" name="incluirBoletinCheck" disabled="disabled" id="incluirBoletinCheck" ></input></td>
								</c:when>
								<c:otherwise>
									<td><input type="checkbox" name="incluirBoletinCheck" disabled="disabled" id="incluirBoletinCheck" ></input></td>
								</c:otherwise>
							</c:choose>
						</tr>
					</table>
				</td>
			</tr>
		</c:if>
		
		<tr>
      	    <td>&nbsp;</td>
       	    <td>&nbsp;</td>
      	</tr>
      	
      	<c:if test="${!empty ficha.materiasInteres}">
		<tr>
			<td><label>Materias de interés</label></td>
		</tr>
		<tr>
			<td>${ficha.materiasInteres}</td>
		</tr>
		</c:if>
		
		<tr>
        	<td>&nbsp;</td>
     	 </tr>
    	
		<tr>
			<td colspan="2">			
				<table align="left" id="table-botons-small" width="96%">
					<tr>
						<td  width="50">
							<center>
								<input type="button" value="Volver" class="ui-state-default ui-corner-all" onclick="history.back();"/>
							</center>
						</td>
						<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
					</tr>
				</table>
				<input type="hidden" name="idFP" ></input>
			</td>
		</tr>
	</table>
</form:form>
</div>
</body>
</html>