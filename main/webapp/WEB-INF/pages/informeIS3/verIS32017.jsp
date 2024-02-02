<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Ver Informe de Seguimiento Nº3</title>

<style>
	 span{ background-color: yellow; }
</style>
		<style type="text/css">
			.ui-dropdownchecklist-text {
				font-size: 11px;
			}
		</style>
		<script type="text/javascript" src="<c:url  value="/static/js/funcionesIS3.js"/>"></script>
		<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
		<script type="text/javascript" src="<c:url value="/static/js/ui.dropdownchecklist.js"/>"></script>
		<script type="text/javascript">
			function chequearLongitud(obj)
			{
				if (obj.value.length > 10000) 
				{
					obj.value = obj.value.substring(0, 10000);
				}
			}
		</script>
	</head>
	<body>
		<div id="main-content">
			<form id="verInformeIS3" class="cmxform"  action="<c:url value='/informeIS3/verInformeIS3.do' />" method="post">
				<h1 id="titulo-informe">:: Informe de Seguimiento Nº 3 ::</h1>
				<c:set var="urlRegreso" value="${urlRegreso}"></c:set>
				<input type="hidden" id="estadoEntrevista" name="estadoEntrevista" value="${estadoEntrevista}"></input>
				<input type="hidden" id="evalRenovacionBeca" name="evalRenovacionBeca" value="${evalRenovacionBeca}"></input>
				<table border="0" align="left" cellpadding="0" cellspacing="0" id="table-informe">
					<tr>
						<td colspan="2">
							<label>${informe.estado.valor}</label>
						</td>
					</tr>
					<tr>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td>
							<label>Ciclo lectivo</label>
							<label>${informe.cicloActual.nombre}</label>
						</td>
					</tr> 
					<tr>
						<td colspan="2">
							<h1 id="subtitulo-informe">Mis datos</h1>
						</td>
					</tr>
					<tr>
						<td>
							<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">		
								<tr>
									<td colspan="2">
										${becado.datosPersonales.nombre}&nbsp;${becado.datosPersonales.apellido}
									</td>
								</tr>		
								<c:if test="${tieneFoto == true}">
									<tr>				
										<td colspan="2">
											<img src="../fichaAlumno/mostrarImagen.do?dni=${becado.datosPersonales.dni}" width="100px">
										</td>
									</tr>
								</c:if>
								<c:if test="${tieneFoto == false}">			
									<tr>
										<td colspan="2">
											<img src="../fichaAlumno/mostrarImagen.do?dni=0" width="100px">
										</td>
									</tr>
									<tr>
										<td colspan="2">
											<label>
												Recuerda que si no cargaste una foto, ésta es la que se enviará en el Informe al padrino.<img src="../static/images/atencion.gif" width=10>
											</label>
										</td>
									</tr>	
								</c:if>	
								<tr>
									<td colspan="2"> 
										Nací el: <fmt:formatDate value="${becado.datosPersonales.fechaNacimiento}" pattern="dd/MM/yyyy"/>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										Tengo: ${edad} años
									</td>
								</tr>
								<tr>	
									<td colspan="2">
										Vivo en: ${becado.datosPersonales.localidad.nombre}
									</td>
								</tr>
								<tr>	
									<td>
										Mi escuela es: ${informe.becado.escuela.nombre}
									</td>
								</tr>
								<tr>	
									<td colspan="2">
										Curso:
										<c:if test="${empty boletin}">
											${becado.anioEscolar.valor}
										</c:if>
										<c:if test="${!empty boletin}">
											${boletin.ano.valor}
										</c:if>
								</tr>		
								<c:if test="${!empty becado.responsable2}">
									<tr>
										<td colspan="2">
											Viene a las entrevistas:					
											${becado.responsable2.nombre }&nbsp;${becado.responsable2.apellido}
										</td>				
									</tr>
									<c:if test="${!empty becado.responsable2.idVinculo}">
										<tr>
											<td colspan="2">
												V&iacute;nculo: 
												${becado.responsable2.idVinculo.valor}
											</td>
										</tr>
									</c:if>
								</c:if>
								<c:if test="${empty becado.responsable2}">
									<tr>
										<td colspan="2">
											Viene a las entrevistas:				
											${becado.responsable1.nombre }&nbsp;${becado.responsable1.apellido}
										</td>					
									</tr>
									<c:if test="${!empty becado.responsable1.idVinculo}">
										<tr>
											<td colspan="2">
												V&iacute;nculo: 
												${becado.responsable1.idVinculo.valor}
											</td>
										</tr>
									</c:if>
								</c:if>
								<tr>
									<td colspan="2">
										Fecha incorporación al Programa: 
										${periodoFechaPBE}
									</td>
								</tr>	
								<c:if test="${!empty periodoFechaReincorporacionPBE}">
									<tr>
										<td colspan="2">
											Fecha reincorporación al Programa 
											${periodoFechaReincorporacionPBE}
										</td>
									</tr>
								</c:if>	
							</table>
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><h1 id="subtitulo-informe"><label>En el acompañamiento trabajamos ....</label></h1></td>
					</tr>
					<tr>
						<td width="860px">${actividadAcompanamiento}</td>
					</tr>						
					
					<tr>
						<td colspan="2"><h1 id="subtitulo-informe"><label>La beca la usé para ....</label></h1></td>
					</tr>
					<tr>
						<td colspan="2" width="860">
							${informe.utilizacionBeca}				
						</td>
					</tr>
		
					
					<c:choose>
						<c:when test="${estadoEntrevista != '3' && tieneSuspensiones == false}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Tuve suspensión de beca</label></h1></td>
							</tr>
							<tr>
								<td>
									<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
										<tr>
											<td width="50">
												Cantidad:
											</td>
											<td>
												${informe.suspensionesCantidad}
											</td>
										</tr>
										<tr>
											<td>
												Mes/es:
											</td>
											<td>
												${informe.suspensionesPeriodo}
											</td>
										</tr>
										<tr>
											<td>
												Motivo/s:
											</td>
											<td width="800">
												${informe.suspensiones}
											</td>
										</tr>			
									</table>
								</td>
							</tr>						
						</c:when>											
						<c:when test="${estadoEntrevista == '3' && tieneSuspensiones == true}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Tuve suspensión de beca</label></h1></td>
							</tr>
							<tr>
								<td>
									<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
										<tr>
											<td width="50">
												Cantidad:
											</td>
											<td>
												${informe.suspensionesCantidad}
											</td>
										</tr>
										<tr>
											<td>
												Mes/es:
											</td>
											<td>
												${informe.suspensionesPeriodo}
											</td>
										</tr>
										<tr>
											<td>
												Motivo/s:
											</td>
											<td width="800">
												${informe.suspensiones}
											</td>
										</tr>			
									</table>
								</td>
							</tr>						
						</c:when>						
					</c:choose>									
							
					<tr>
						<td colspan="2"><h1 id="subtitulo-informe"><label>Mis preferencias</label></h1></td>
					</tr>
					<tr>
						<td>
							<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
								<tr>
									<td width="200px">Materias que me interesan:</td>
									<td>
										${materiasInteres}
									</td>
								</tr>
								<tr>
									<td>Materias que me cuestan:</td>
									<td>
										${materiasCuestan}
									</td>
								</tr>
								<tr>
									<td>Cantidad materias desaprobadas:</td>
									<td>${cantMateriasDesaprobadas}</td>
								</tr>
								<tr>
									<td>Cantidad inasistencias a la escuela:</td>
									<td>${cantInasistencias}</td>
								</tr>					
							</table>
						</td>
					</tr>
					
					<!-- tr>
						<td colspan="2"><h1 id="subtitulo-informe"><label>Mensaje al padrino</label></h1></td>
					</tr>
					<tr>
						<td>
							<table width="200" border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms"> 
								<tr>
									<td width="120px">Querido padrino:</td>
									<td width="780px" align="justify">${mensajePadrino}</td>
								</tr>
							</table>
						</td>
					</tr-->

					<tr>
						<td colspan="2">
							<input type="hidden" name="mensajePadrino" id="mensajePadrino" value="">
							<h1 id="subtitulo-informe"><label>Resultado Año Escolar</label></h1>
						</td>
					</tr>
					<tr>
						<td colspan="2" width="860">
							${informe.situacionRenovacion}
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><h1 id="subtitulo-informe"><label>Situación renovación</label></h1></td>
					</tr>
					<tr>
						<td colspan="2">
							${informe.evalRenovacionBeca}
						</td>
					</tr>
										
					<c:choose>
						<c:when test="${estadoEntrevista == '3' && evalRenovacionBeca == 'Fin participación PFE'}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Proyección</label></h1></td>
							</tr>
							<tr>
								<td colspan="2">
									${informe.proyAnioProximo}
								</td>
							</tr>							
						</c:when>
						<c:when test="${estadoEntrevista != '3' && evalRenovacionBeca == 'Fin participación PFE'}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Proyección año próximo</label></h1></td>
							</tr>							
							<tr>
								<td colspan="2">
									${informe.proyAnioProximo}
								</td>
							</tr>			
						</c:when>
					</c:choose>
						
					<c:choose>
						<c:when test="${estadoEntrevista == '3' && evalRenovacionBeca == 'No renueva'}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Motivo no renovación</label></h1></td>
							</tr>
							<tr>
								<td colspan="2">
									${informe.motivoNoRenovacion}
								</td>
							</tr>							
						</c:when>
						<c:when test="${estadoEntrevista != '3' && evalRenovacionBeca == 'No renueva'}">
							<tr>
								<td colspan="2"><h1 id="subtitulo-informe"><label>Motivo no renovación</label></h1></td>
							</tr>							
							<tr>
								<td colspan="2">
									${informe.motivoNoRenovacion}
								</td>
							</tr>			
						</c:when>
					</c:choose>
						
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
			</form>
		</div>
	</body>
</html>