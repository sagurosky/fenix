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
	..:: Ver Ficha de Presentacion ::..
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
							<label>Datos del Estudiante</label>
						</h3></td>
				</tr>

				<tr>
					<td>
						<table width="200" border="0" align="left" cellpadding="0"
							cellspacing="0" id="table-forms">
							
							

							<tr>
								<td><label>Edad:</label></td>
								<td><label>${ficha.edad}</label></td>
							</tr>
							<tr>
								<td><label>Localidad:</label></td>
								<td><label>${ficha.becado.datosPersonales.localidad.nombre}</label>
								</td>
							</tr>
							<tr>
								<td><label>Escuela:</label></td>
								<td><label>${ficha.becado.escuela.nombre}</label></td>
							</tr>

							<tr>
								<td><label>Año año escolar:</label></td>
								<td><label>${ficha.becado.anioEscolar.valor}</label></td>
							</tr>
							
							


							

							
							
							


							

							
						</table>
					</td>
				</tr>

				<tr>
					<td><label>Información Adicional del estudiante:</label>
				</tr>
				<tr>
					<td><textarea id="vosMismo" name="vosMismo" rows=4 cols=100 readonly="readonly">${ficha.observacionesGenerales}</textarea></td>
				</tr>
				
				
				
				



				<c:if test="${!empty ficha.convivientes}">
					<tr>
						<td colspan="2"><h3 id="subtitulo-informe">
								<label>Composición Familiar</label>
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
							<label>Información escolar</label>
						</h3></td>
				</tr>
				
				
				<tr><td><label>Situación Escolar:</label></td></tr>
				<tr><td><textarea id="situacionEscolar" name="situacionEscolar" readonly="readonly"  rows=4 cols=100>${ficha.situacionEscolar}</textarea></td></tr>
					
				
				<tr><td><label>Situación en el programa:</label></td></tr>
				<tr><td><textarea id="incorporacion" name="incorporacion" rows=4 cols=100 readonly="readonly">${ficha.incorporacion}</textarea></td></tr>	
				
				<tr><td><label>Detalle sobre la situación del estudiante:</label></td></tr>
				<tr><td><textarea id="observacionesNoIncorporacion" name="observacionesNoIncorporacion" rows=4 cols=100 readonly="readonly">${ficha.observacionesNoIncorporacion}</textarea></td></tr>	
				
				
				<tr>
					<td colspan="2"><h3 id="subtitulo-informe">
							<label>Acompañamiento</label>
						</h3></td>
				</tr>
				
				
				<tr><td><label>Propósito anual del acompañamiento:</label></td></tr>
				<tr><td><textarea id="propositoAnual" name="propositoAnual" rows=4 cols=100 readonly="readonly">${ficha.propositoAnual}</textarea></td></tr>
				
				
				<tr>
					<td colspan="2"><h3 id="subtitulo-informe">
							<label>Información de la Escuela</label>
						</h3></td>
				</tr>
				
				
				<tr>
					<td><label>Matrícula total:</label> ${ficha.becado.escuela.matricula}</td>
					
				</tr>
				<tr>
					<td><label>Orientaciónes:</label> ${ficha.becado.escuela.orientacion}</td>
					
				</tr>
				<tr>
					<td><label>Cantidad estudiantes en PFE:</label> ${ficha.becado.escuela.orientacion}</td>
					
				</tr>
				<tr>
					<td><label>Descripción de la escuela:</label> ${ficha.becado.escuela.observaciones}</td>
					
				</tr>
				<tr>
					<td><label>Año de inicio de PFE:</label> ${ficha.becado.escuela.comienzoPBE.nombre}<br><br></td>
					
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