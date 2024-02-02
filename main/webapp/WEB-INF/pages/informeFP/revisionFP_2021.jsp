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
	..:: Revisión de la Ficha de Presentacion ::..
</title>
<script type="text/javascript"	src="<c:url value="/static/js/funcionesEntrevista.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript">
$(document).ready(function()
{
	$("#altaFP").validate({
   		invalidHandler: function(form, validator) {
			var errors = validator.numberOfInvalids();
			if (errors) {
				$.unblockUI();
			}
		}
	});
});


function enviarForm(action,id,valorPerfil)
{
	if(action == 'finalizar'){
		document.forms['altaFP'].action = "../informeFP/actualizarInformeRevision.do?accion=" + action;
	}
	if(action == 'guardar'){
		document.forms['altaFP'].action = "../informeFP/actualizarInformeRevision.do?accion=" + action;
	}
	document.forms['altaFP'].valorPerfil.value = valorPerfil;
	document.forms['altaFP'].idFP.value = id;
	$.blockUI();
	document.forms['altaFP'].submit();
}

</script>
 <script type="text/javascript">
	function chequearLongitud(obj){
		if (obj.value.length > 10000) {
		obj.value = obj.value.substring(0, 10000);
		}
	}
</script>
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
<form:form modelAttribute="ficha" id="altaFP" name="altaFP" cssClass="cmxform" commandName="ficha" method="post" action="corregir.do">
${ficha.estado.valor}
<h1 id="titulo-informe">PROGRAMA FUTUROS EGRESADOS</h1>
			<h1 id="titulo-informe">FICHA DE PRESENTACION
				${ficha.cicloActual.nombre}</h1>
			<h1 id="titulo-informe">
				<label>${ficha.becado.datosPersonales.nombre}&nbsp;${ficha.becado.datosPersonales.apellido}</label>
			</h1>
			<table border="0" align="left" cellpadding="0" cellspacing="0"
				id="table-informe">


				<tr>
					<td colspan="2"><h3 id="subtitulo-informe">
							<label>Acerca del alumno</label>
						</h3></td>
				</tr>

				<tr>
					<td>
						<table width="200" border="0" align="left" cellpadding="0"
							cellspacing="0" id="table-forms">
							<tr>
								<td><label>Localidad:</label></td>
								<td><label>${ficha.becado.datosPersonales.localidad.nombre}</label>
								</td>
							</tr>
							<tr>
								<td><label>Fecha de nacimiento</label></td>
								<td><label><fmt:formatDate
											value="${ficha.becado.datosPersonales.fechaNacimiento}"
											pattern="dd/MM/yyyy" /></label></td>
							</tr>

							<tr>
								<td><label>Edad:</label></td>
								<td><label>${ficha.edad}</label></td>
							</tr>
							<tr>
								<td><label>Escuela:</label></td>
								<td><label>${ficha.becado.escuela.nombre}</label></td>
							</tr>

							<tr>
								<td><label>Año año escolar:</label></td>
								<td><label>${ficha.becado.anioEscolar.valor}</label></td>
							</tr>
							<tr>
								<td><label>Fecha estimada de egreso:</label></td>
								<td><label> <c:if
											test="${ficha.becado.escuela.zonaCimientos.eae=='6/6'}">
											<c:if test="${ficha.becado.anioAdicional}">
										${ficha.cicloActual.nombre+14-ficha.becado.anioEscolar.id+1}
									</c:if>
											<c:if test="${!ficha.becado.anioAdicional}">
										${ficha.cicloActual.nombre+14-ficha.becado.anioEscolar.id}
									</c:if>
										</c:if> <c:if test="${ficha.becado.escuela.zonaCimientos.eae=='7/5'}">
											<c:if test="${ficha.becado.anioAdicional}">
										${ficha.cicloActual.nombre+13-ficha.becado.anioEscolar.id+1}
									</c:if>
											<c:if test="${!ficha.becado.anioAdicional}">
										${ficha.cicloActual.nombre+13-ficha.becado.anioEscolar.id}
									</c:if>
										</c:if>
								</label></td>
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
									<td><label>${ficha.becado.responsable1.nombre },&nbsp;${ficha.becado.responsable1.apellido}</label>
								</tr>
								<c:if test="${!empty ficha.becado.responsable1.idVinculo}">
									<tr>
										<td><label>V&iacute;nculo con el alumno:</label></td>
										<td><label>${ficha.becado.responsable1.idVinculo.valor}</label></td>
									</tr>
								</c:if>
							</c:if>
							<tr>	
								<td><label>Padrino:</label></td>
								<td><label>
									${ficha.padrino.empresa.denominacion}			
									${ficha.padrino.datosPersonales.nombre}&nbsp;${informe.padrino.datosPersonales.apellido}</label>
								</td>
							</tr> 
							


							

							
						</table>
					</td>
				</tr>

				<tr>
					<td><label>¿Cómo te describirías en pocas palabras?:</label>
				</tr>
				<tr>
					<td><textarea id="vosMismo" name="vosMismo" rows=4 cols=100>${ficha.vosMismo}</textarea></td>
				</tr>
				
				
				
				<tr>
					<td><label>Deseos / intereses para cuando termine la secundaria:</label>
				</tr>
				<tr>
					<td><textarea id="cuandoTermine" name="cuandoTermine" rows=4 cols=100>${ficha.cuandoTermine}</textarea></td>
				</tr>



				<c:if test="${!empty ficha.convivientes}">
					<tr>
						<td colspan="2"><h3 id="subtitulo-informe">
								<label>Entorno familiar</label>
							</h3></td>
					</tr>
					<tr>
						<td colspan="2"><label></label>
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
										<c:if
											test="${!empty conviviente.convive.valor && conviviente.convive.valor == 'SI'}">
											<tr align="center">
												<td align="center"><c:if
														test="${!empty conviviente.vinculo.valor}">
										${conviviente.vinculo.valor}
									</c:if> <c:if test="${empty conviviente.vinculo.valor}">
										-
									</c:if></td>
												<td align="center">${conviviente.nombre},${conviviente.apellido}</td>
												<td align="center"><c:if
														test="${!empty conviviente.edad}">
										${conviviente.edad}
									</c:if> <c:if test="${empty conviviente.edad}">
										-
									</c:if></td>
												<td align="center"><c:if
														test="${!empty conviviente.nivelEducativo.valor}">
										${conviviente.nivelEducativo.valor}
									</c:if> <c:if test="${empty conviviente.nivelEducativo.valor}">
										-
									</c:if></td>
												<td align="center"><c:if
														test="${!empty conviviente.ocupacionLaboral}">
										${conviviente.ocupacionLaboral}
									</c:if> <c:if test="${empty conviviente.ocupacionLaboral}">
										-
									</c:if></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table></td>
					</tr>
					
				</c:if>
				<tr><td>La información del grupo familiar es la registrada al momento de la incorporación al programa</td></tr>
				<tr>
					<td colspan="2"><h3 id="subtitulo-informe">
							<label>Situación Escolar</label>
						</h3></td>
				</tr>
				
				


				<c:if test="${!empty ficha.boletinSeleccions}">
					<tr>
						<td colspan="2"><h3 id="subtitulo-informe">
								<label>Datos escolares al momento de ingresar al
									programa</label>
							</h3></td>
					</tr>
					<tr>
						<td><label>Boletín</label></td>
					</tr>

					<tr>
						<td><jsp:include
								page="/WEB-INF/pages/informeFP/boletinSeleccionFP.jsp" /></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>

					<tr>
						<td>
							<table width="300">
								<tr>
									<td nowrap="nowrap" width="150"><label>Incluir el boletín en la FP</label></td>
									<c:choose>
										<c:when test="${ficha.incluirBoletinCheck == true}">
											<td><input type="checkbox" name="incluirBoletinCheck"
												checked="checked" disabled="disabled"
												id="incluirBoletinCheck"></input></td>
										</c:when>
										<c:when test="${ficha.incluirBoletinCheck == false}">
											<td><input type="checkbox" name="incluirBoletinCheck"
												disabled="disabled" id="incluirBoletinCheck"></input></td>
										</c:when>
										<c:otherwise>
											<td><input type="checkbox" name="incluirBoletinCheck"
												disabled="disabled" id="incluirBoletinCheck"></input></td>
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

				
				<tr>
					<td><label>Materias interés:</label></td>													
				</tr>
				<tr>										
					<td><textarea id="materiasInteres" name="materiasInteres" rows=4 cols=100>${ficha.materiasInteres}</textarea></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				
				<tr>
					<td><label>Materias que más le cuestan:</label></td>
				</tr>
				<tr>										
					<td><textarea id="materiasMasCuesta" name="materiasMasCuesta" rows=4 cols=100>${ficha.materiasMasCuesta}</textarea></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><label>Información acerca de la escuela:</label>
				</tr>
				<tr>
					<td>${ficha.becado.escuela.observaciones}</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><label>Espacios de apoyo a la escolaridad con los que cuenta la escuela: :</label></td>													
				</tr>
				<tr>
					<td>
						<form:select path="espacioApoyo" disabled="true">
						<form:options items="${ficha.becado.escuela.espacioApoyo}" itemLabel="valor" itemValue="id"/>				
						</form:select>
					</td>	
				</tr>

				<tr>
					<td>&nbsp;</td>
				</tr>
				<tr>
				<td colspan="2"><h3 id="subtitulo-informe">
								<label>Información adicional</label>
							</h3></td>
				</tr>
				
				<tr>
					<td><label>Actividades que realiza en el tiempo libre:</label></td>
				</tr>
				<tr>
					<td><textarea id="tiempoLibre" name="tiempoLibre" rows=4 cols=100>${ficha.tiempoLibre}</textarea></td>
					
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td><label>Cuando termine la secundaria me gustaría:</label>
				</tr>
				<tr>
					<td><textarea id="cuandoTermine" name="cuandoTermine" rows=4 cols=100>${ficha.cuandoTermine}</textarea></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">Aviso: el contenido de este informe es confidencial y no podrá ser reproducido de ninguna forma sin previa autorización por parte de Cimientos</td>
				</tr>
    	
		<tr>
        	<td colspan="2">
				<table align="left" id="table-botons-small" width="96%">
					<tr>
						<td  width="50">
							<center>
								<c:if test="${valorPerfil == 'superUsuario' && (ficha.estado.valor == estadoRevision || ficha.estado.valor == estadoPendiente)}">
									<input type="button" class="ui-state-default ui-corner-all"	onclick="enviarForm('guardar','${ficha.id}','${valorPerfil}')" value="Guardar"/>
								</c:if>
								<c:if test="${valorPerfil == 'superUsuario' && ficha.estado.valor == estadoFinalizado}">
									<input type="button" class="ui-state-default ui-corner-all"	onclick="enviarForm('guardar','${ficha.id}','${valorPerfil}')" value="Revisión"/>
								</c:if>
								<c:if test="${valorPerfil != 'superUsuario'}">
									<input type="button" class="ui-state-default ui-corner-all"	onclick="enviarForm('guardar','${ficha.id}','${valorPerfil}')" value="Guardar"/>
								</c:if>
							</center>
						</td>
						<td  width="50">
							<center>
								<c:if test="${valorPerfil == 'superUsuario' && ficha.estado.valor == estadoRevision}">
									<input type="button" class="ui-state-default ui-corner-all" onclick="enviarForm('finalizar','${ficha.id}','${valorPerfil}')" value="Finalizar" />
								</c:if>
								<c:if test="${valorPerfil == 'superUsuario' && ficha.estado.valor == estadoFinalizado}">
									<input type="button" class="ui-state-default ui-corner-all" onclick="enviarForm('finalizar','${ficha.id}','${valorPerfil}')" value="Guardar" />
								</c:if>
								<c:if test="${valorPerfil != 'superUsuario' && ficha.estado.valor == estadoRevision}">
									<input type="button" class="ui-state-default ui-corner-all" onclick="enviarForm('finalizar','${ficha.id}','${valorPerfil}')" value="Finalizar" />
								</c:if>								
							</center>
						</td>	
						<td  width="50">
							<center>								
								<c:if test="${valorPerfil == 'superUsuario' && !empty retorno}">
									<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../reporteGeneralInformes/verReporteGeneralInformes.do'; return false;" />
								</c:if>	
								<c:if test="${empty retorno}">
									<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../informeFP/listaInformesFPRevision.do?mensaje='; return false;" />
								</c:if>	
								<c:if test="${valorPerfil != 'superUsuario' && !empty retorno}">
									<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../reporteGeneralInformes/verReporteGeneralInformes.do'; return false;" />
								</c:if>
							</center>
						</td>
						<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
					</tr>
				</table>
				<input type="hidden" name="idFP" ></input>
				<input type="hidden" name="valorPerfil"></input>
  			</td>
</tr>
</table>
</form:form>
</div>
</body>
</html>