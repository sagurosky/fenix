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
<title>..:: Ficha de Presentacion ::..</title>
<script type="text/javascript"
	src="<c:url value="/static/js/funcionesEntrevista.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
<script type="text/javascript">
	$(function() {
		$('#tabla1')
				.dataTable(
						{
							"sDom" : '<"H"l>rt<"F"ip>',
							"oLanguage" : {
								"sLengthMenu" : 'Mostrar <select>'
										+ '<option value="25">25</option>'
										+ '<option value="50">50</option>'
										+ '<option value="75">75</option>'
										+ '<option value="100">100</option>'
										+ '<option value="-1">Todos</option>'
										+ '</select> registros por hoja',
								"sZeroRecords" : "No se encontraron registros",
								"sInfo" : "Mostrando del _START_ al _END_ de _TOTAL_ registros",
								"sInfoEmtpy" : "Mostrando 0 registros",
								"sInfoFiltered" : "(filtrado de _MAX_ registros totales)",
								"sSearch" : "Buscar",
								"oPaginate" : {
									"sFirst" : "Primera",
									"sPrevious" : "Anterior",
									"sNext" : "Siguiente",
									"sLast" : "Ultima"
								}

							},
							"bJQueryUI" : true,
							"sPaginationType" : "full_numbers",
							"iDisplayLength" : 25
						});
	});
</script>
</head>
<body>
	<div id="main-content">
		<form:form modelAttribute="ficha" id="altaFP" name="altaFP"
			cssClass="cmxform" commandName="ficha" method="post"
			action="verInformeFPRevisionSuperUsuarioView.do?idFP=${ficha.id}">
			<input type="hidden" name="valorGuardar" />
			<input type="hidden" name="valorPerfil" />
${ficha.estado.valor}
<c:set var="urlRegreso" value="/informeFP/verFP.do?idFP=${ficha.id}"></c:set>
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
							<label>Acerca del Estudiante</label>
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
								<td><label>Año escolar que cursa:</label></td>
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
					<td>${ficha.vosMismo}</td>
				</tr>
				
				
				
				<tr>
					<td><label>Deseos / intereses para cuando termine la secundaria:</label>
				</tr>
				<tr>
					<td>${ficha.cuandoTermine}</td>
				</tr>


				<c:if test="${!empty ficha.convivientes}">
					<tr>
						<td colspan="2"><h3 id="subtitulo-informe">
								<label>Entorno Familiar</label>
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
				
				
				<tr>
					<td colspan="2"><h3 id="subtitulo-informe">
							<label>Información escolar</label>
						</h3></td>
				</tr>
				
				
				<tr>
					<td><label>Matrícula total:</label> ${ficha.becado.escuela.matricula}</td>
					
				</tr>
				<tr>
					<td><label>Orientación:</label> ${ficha.becado.escuela.orientacion}</td>
					
				</tr>
				<tr>
					<td><label>Descripción escuela:</label> ${ficha.becado.escuela.observaciones}</td>
					
				</tr>
				<tr>
					<td><label>El Programa se implementa desde:</label> ${ficha.becado.escuela.comienzoPBE.nombre}</td>
					
				</tr>
				
				<tr>
					<td colspan="2">Aviso: el contenido de este informe es confidencial y no podrá ser reproducido de ninguna forma sin previa autorización por parte de Cimientos</td>
				</tr>
				

				<tr>
					<td colspan="2">
						<table align="left" id="table-botons-small" width="96%">
							<tr>
								<td width="50">
									<center>
										<input type="button" value="Volver"
											class="ui-state-default ui-corner-all"
											onclick="history.back();" />
									</center>
								</td>
								<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
							</tr>
						</table> <input type="hidden" name="idFP"></input>
					</td>
				</tr>
			</table>
		</form:form>
	</div>
</body>
</html>