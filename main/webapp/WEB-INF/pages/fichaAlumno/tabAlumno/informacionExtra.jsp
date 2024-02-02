<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script>
$(document).ready(function(){
$("#todoOculto").hide();
});
</script>
<table>
	<tr>
		<td>Padrino</td>
		<c:choose>
			<c:when test="${perfilAlumno.beca==null}">
				<td>No tiene beca asignada</td>
			</c:when>
			<c:when test="${perfilAlumno.beca.padrino.datosPersonales!=null}">
				<td><input type="text"   readonly name=""id=""  class="form-control" value="${perfilAlumno.beca.padrino.datosPersonales.apellido}, ${perfilAlumno.beca.padrino.datosPersonales.nombre} "></td>
			</c:when>
			<c:otherwise>
				<td><input type="text"   readonly name=""id=""  class="form-control" value="${perfilAlumno.beca.padrino.empresa.denominacion}"></td>
			</c:otherwise>
		</c:choose>
	</tr>
	
	<tr>
		<td>A�o de incorporaci�n a PFE</td>
		
			<%@ page import="java.text.SimpleDateFormat" %>
			<%@page import="org.cimientos.intranet.modelo.perfil.PerfilAlumno"%>
			<%
			   SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
				PerfilAlumno perfilAlumno = (PerfilAlumno) request.getAttribute("perfilAlumno");
			   String year = (perfilAlumno.getFechaAltaBeca() != null) ? sdf.format(perfilAlumno.getFechaAltaBeca()) : "";
			%>
		
		<td><input type="text" name="" id=""  class="form-control" readOnly value="<%= year %>"></td>


	</tr>
	
	<tr>
		<td>Situaci�n escolar al incorporarse</td>
		<td><input type="text" readonly  name=""id=""  class="form-control" value="${entrevistaSeleccion.comoTerminaste}"></td>
	</tr>
	
	<tr>
		<td>Proyecci�n post-escolar al incorporarse</td>
		<td><textarea  type="text" readonly  name=""id=""  class="form-control" >${entrevistaSeleccion.gustaria}</textarea></td>
	
	</tr>
	
	

	
	</table>
	<c:set var="trimestres" value="${perfilAlumno.boletin.previas}" scope="page" />
	<c:set var="materias" value="${perfilAlumno.boletin.materiasPrevias}" scope="page" />
	<table width="200" border="0" align="left" cellpadding="0"
		cellspacing="0" id="table-forms">
		<tr>				
		<td>
			<table>
				<tr>
					<td><label>Materias Previas</label></td>
				</tr>
				<tr>
					<td>
					<table align="left" id="table-boletin" width="100%">
						<thead title="Materias">
							<tr align="center">
								<th width="300px">Materias</th>
								<th width="100px">Ciclo</th>
								<th width="150px">Julio</th>
								<th width="150px">Diciembre</th>
								<th width="150px">Marzo</th>
	
							</tr>
						</thead>
						<tbody>
							<c:forEach varStatus="row" items="${materias}" var="materia">
								<tr>
									<td> ${materia.nombre} </td>
									<c:forEach begin="0" end="0" items="${trimestres}" var="trimestre">
										<td align="center"> ${trimestre.materias[row.index].ciclo!= null ? trimestre.materias[row.index].ciclo : '-'}</td>
									</c:forEach>
									<c:forEach begin="0" end="3" items="${trimestres}" var="trimestre">
										<td align="center"> ${trimestre.materias[row.index].estado != null ? trimestre.materias[row.index].estado.valor : '-'}</td>
									</c:forEach>
								</tr>
							</c:forEach>
								
							</tbody>
	
					</table>
					</td>
				</tr>	
			</table>
			</td>
		</tr>
		<tr>
	     	    <td>&nbsp;</td>
	      	    <td>&nbsp;</td>
     	</tr>								
	</table>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
  						  
					  <label >situaciones de riesgo detectadas al incorporarse: </label>
					  <br>
					  <br>
					<div class="form-check">
						<input type="checkbox"  id="fallecimientoEp" class="ocultarEA"	name="entrevistaSeleccion.fallecimientoEp" <c:if test="${entrevistaSeleccion.fallecimientoEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" >Fallecimiento de una persona significativa</label>
					</div>
					<div class="form-check">
						<input type="checkbox"  id="enfermedadEp"name="entrevistaSeleccion.enfermedadEp" class="ocultarEA"	<c:if test="${entrevistaSeleccion.enfermedadEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" > Enfermedad propia o de una persona significativa</label>
					</div>
					<div class="form-check">
						<input type="checkbox"id="maternidadEp"  name="entrevistaSeleccion.maternidadEp"class="ocultarEA"	<c:if test="${entrevistaSeleccion.maternidadEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" >Maternidad/Paternidad del EP</label>
					</div>
					<div class="form-check">
						<input type="checkbox" id="mudanzaEp"  name="entrevistaSeleccion.mudanzaEp"	class="ocultarEA"<c:if test="${entrevistaSeleccion.mudanzaEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" >Mudanza</label>
					</div>
					<div class="form-check">
						<input type="checkbox" id="cambioEstructuraEp"  name="entrevistaSeleccion.cambioEstructuraEp"class="ocultarEA"	<c:if test="${entrevistaSeleccion.cambioEstructuraEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" >Cambio de estructura familiar/convivientes</label>
					</div>
					<div class="form-check">
						<input type="checkbox" id="economiaEp"  name="entrevistaSeleccion.economicaEp"class="ocultarEA"<c:if test="${entrevistaSeleccion.economicaEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" >Situaci�n de crisis econ�mica en la familia</label>
					</div>
					<div class="form-check">
						<input type="checkbox" id="violenciaEp"  name="entrevistaSeleccion.violenciaEp"class="ocultarEA"	<c:if test="${entrevistaSeleccion.violenciaEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" >Situaci�n de violencia familiar</label>
					</div>
					<div class="form-check">
						<input type="checkbox"id="consumoEp"   name="entrevistaSeleccion.consumoEp"class="ocultarEA"	<c:if test="${entrevistaSeleccion.consumoEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" >Consumo problem�tico</label>
					</div>
					<div class="form-check">
						<input type="checkbox"id="violenciaEscolarEp"   name="entrevistaSeleccion.violenciaEscolarEp"class="ocultarEA"	<c:if test="${entrevistaSeleccion.violenciaEscolarEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" >Situaci�n de violencia escolar</label>
					</div>
					<div class="form-check">
						<input type="checkbox"id="otraSituacionEp"   name="entrevistaSeleccion.otraSituacionEp"class="ocultarEA"	<c:if test="${entrevistaSeleccion.otraSituacionEp=='1'}"> checked="checked"</c:if>>
	  					<label class="form-check-label" >Otra</label>
					</div>
					<br>
<table>
	<tr>
		<td style="padding:0px 50px 0px 0px">EA</td>
		<td><input type="text"   name=""id=""  class="form-control" readonly value="${perfilAlumno.ea.datosPersonales.apellido}, ${perfilAlumno.ea.datosPersonales.nombre}"></td>
	</tr>
	
	<tr>
		<td>RR</td>
		<td><input type="text"   name=""id=""  class="form-control" readonly value="${perfilAlumno.ea.rr.datosPersonales.apellido}, ${perfilAlumno.ea.rr.datosPersonales.nombre}"></td>
	</tr>


</table>

<!-- DMS 14/12/23 oculto todo lo viejo por si el controlador necesita algo -->
<div id="todoOculto">
		TAB ALUMNO
		<table>
				<tr>
					<td>
					<label>Problemas de salud del becado?????</label>
					Si<input type="radio" id="perfilAlumno.saludBecado" name="perfilAlumno.saludBecado" 
					  <c:if test="${perfilAlumno.saludBecado}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
					No<input type="radio" id="perfilAlumno.saludBecado" name="perfilAlumno.saludBecado"
					  <c:if test="${perfilAlumno.saludBecado == false}"> checked="checked"</c:if> value="false">			
					</td>
				</tr>
				<tr>
					<td>
					<label>Cuales?</label>
						<form:textarea path="saludBecadoCual" rows="4" cols="40" id="saludBecadoCual" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
					
					</td>	
				</tr>
		    		
		</table>
		<table>
				<tr>
					<td>
					<label>Problemas de salud Familiar?</label>
					Si<input type="radio" id="perfilAlumno.saludFamilia" name="perfilAlumno.saludFamilia" 
					  <c:if test="${perfilAlumno.saludFamilia}"> checked="checked"</c:if> onclick="enableDisableInput(this.value)" value="true"> 
					No<input type="radio" id="perfilAlumno.saludFamilia" name="perfilAlumno.saludFamilia"
					  <c:if test="${perfilAlumno.saludFamilia == false}"> checked="checked"</c:if> value="false">			
					</td>
				</tr>
				<tr>	
					<td>
					<label>Cuales?</label>
						<form:textarea path="saludFamiliarCual" rows="4" cols="40" id="saludFamiliarCual" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
					
					</td>	
				</tr>
		    		
		</table>
		<br><br>
		
		<br></br>
			<p><label>Informaci�n complementaria y evaluaci�n</label>
				<form:textarea path="observacionesGenerales" rows="4" cols="40" id="observacionesGenerales" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</p>
		<br></br>
			<p><label>Uso del tiempo libre</label>
				<select name="tiempoLibre" id="tiempoLibre">
							<c:choose>
		    					<c:when test="${perfilAlumno.tiempoLibre == 'Salir con amigos'}">
		       						<option value=" ">Seleccione una opci&oacute;n:</option>
									<option value="Escuchar m�sica">Escuchar m�sica</option>
									<option value="Estar con la familia">Estar con la familia</option>								
									<option value="Hacer actividades art�sticas">Hacer actividades art�sticas</option>
									<option value="Hacer deporte">Hacer deporte</option>
									<option value="Leer">Leer</option>
									<option value="Navegar en Internet">Navegar en internet</option>
									<option value="Salir con amigos" selected="selected">Salir con amigos</option>															
							    </c:when>
							    <c:when test="${perfilAlumno.tiempoLibre == 'Escuchar m�sica'}">
		       						<option value=" ">Seleccione una opci&oacute;n:</option>
									<option value="Escuchar m�sica" selected="selected">Escuchar m�sica</option>
									<option value="Estar con la familia">Estar con la familia</option>								
									<option value="Hacer actividades art�sticas">Hacer actividades art�sticas</option>
									<option value="Hacer deporte">Hacer deporte</option>
									<option value="Leer">Leer</option>
									<option value="Navegar en Internet">Navegar en internet</option>
									<option value="Salir con amigos">Salir con amigos</option>															
							    </c:when>
							    <c:when test="${perfilAlumno.tiempoLibre == 'Estar con la familia'}">
		       						<option value=" ">Seleccione una opci&oacute;n:</option>
									<option value="Escuchar m�sica">Escuchar m�sica</option>
									<option value="Estar con la familia" selected="selected">Estar con la familia</option>								
									<option value="Hacer actividades art�sticas">Hacer actividades art�sticas</option>
									<option value="Hacer deporte">Hacer deporte</option>
									<option value="Leer">Leer</option>
									<option value="Navegar en Internet">Navegar en internet</option>
									<option value="Salir con amigos">Salir con amigos</option>																
							    </c:when>
							    <c:when test="${perfilAlumno.tiempoLibre == 'Hacer actividades art�sticas'}">
		       						<option value=" ">Seleccione una opci&oacute;n:</option>
									<option value="Escuchar m�sica">Escuchar m�sica</option>
									<option value="Estar con la familia">Estar con la familia</option>								
									<option value="Hacer actividades art�sticas" selected="selected">Hacer actividades art�sticas</option>
									<option value="Hacer deporte">Hacer deporte</option>
									<option value="Leer">Leer</option>
									<option value="Navegar en Internet">Navegar en internet</option>
									<option value="Salir con amigos">Salir con amigos</option>														
							    </c:when>
							    <c:when test="${perfilAlumno.tiempoLibre == 'Hacer deporte'}">
		       						<option value=" ">Seleccione una opci&oacute;n:</option>
									<option value="Escuchar m�sica">Escuchar m�sica</option>
									<option value="Estar con la familia">Estar con la familia</option>								
									<option value="Hacer actividades art�sticas">Hacer actividades art�sticas</option>
									<option value="Hacer deporte" selected="selected">Hacer deporte</option>
									<option value="Leer">Leer</option>
									<option value="Navegar en Internet">Navegar en internet</option>
									<option value="Salir con amigos">Salir con amigos</option>																
							    </c:when>
							    <c:when test="${perfilAlumno.tiempoLibre == 'Leer'}">
		       						<option value=" ">Seleccione una opci&oacute;n:</option>
									<option value="Escuchar m�sica">Escuchar m�sica</option>
									<option value="Estar con la familia">Estar con la familia</option>								
									<option value="Hacer actividades art�sticas">Hacer actividades art�sticas</option>
									<option value="Hacer deporte">Hacer deporte</option>
									<option value="Leer" selected="selected">Leer</option>
									<option value="Navegar en Internet">Navegar en internet</option>
									<option value="Salir con amigos">Salir con amigos</option>													
							    </c:when>
							    <c:when test="${perfilAlumno.tiempoLibre == 'Navegar en internet'}">
		       						<option value=" ">Seleccione una opci&oacute;n:</option>
									<option value="Escuchar m�sica">Escuchar m�sica</option>
									<option value="Estar con la familia">Estar con la familia</option>								
									<option value="Hacer actividades art�sticas">Hacer actividades art�sticas</option>
									<option value="Hacer deporte">Hacer deporte</option>
									<option value="Leer">Leer</option>
									<option value="Navegar en Internet" selected="selected">Navegar en internet</option>
									<option value="Salir con amigos">Salir con amigos</option>														
							    </c:when>
							    
							    <c:otherwise>						 									
									<option value=" ">Seleccione una opci&oacute;n:</option>
									<option value="Escuchar m�sica">Escuchar m�sica</option>
									<option value="Estar con la familia">Estar con la familia</option>								
									<option value="Hacer actividades art�sticas">Hacer actividades art�sticas</option>
									<option value="Hacer deporte">Hacer deporte</option>
									<option value="Leer">Leer</option>
									<option value="Navegar en Internet">Navegar en internet</option>
									<option value="Salir con amigos">Salir con amigos</option>	
							    </c:otherwise>
							</c:choose>
						</select>	
			</p>
				<br></br>
			<p><label>Cuando termine la secundaria me gustar�a</label>
				<form:textarea path="cuandoTermine" rows="4" cols="40" id="cuandoTermine" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
			</p>
			<c:set var="trimestres" value="${perfilAlumno.boletin.trimestres}" scope="page" />
					<c:set var="materias" value="${perfilAlumno.boletin.materias}" scope="page" />
					<table width="200" border="0" align="left" cellpadding="0"
						cellspacing="0" id="table-forms">
						<tr>
						<td colspan="2"><h1 id="titulo-informe">Bolet&iacute;n de calificaciones</h1></td>
					</tr>
						<tr>
							<td><label>A�o:</label> ${perfilAlumno.boletin.ano.valor}</td>
						</tr>
						<tr>				
						<td>
							<table>
								<tr>
									<td>
									<table align="left" id="table-boletin" width="100%">
										<thead title="Materias">
											<tr align="center">
												<th width="300px">Materias</th>
												<th width="80px">1� Trim.</th>
												<th width="80px">2� Trim.</th>
												<th width="80px">3� Trim.</th>
												<th width="80px">Final</th>
												<th width="80px">Diciembre</th>
												<th width="80px">Marzo</th>
			
											</tr>
										</thead>
										<tbody>
											<c:forEach varStatus="row" items="${materias}" var="materia">
												<tr>
													<td>${materia.nombre}</td>
												<c:forEach begin="0" end="5" items="${trimestres}" var="trimestre">
													<td align="center"> ${trimestre.materias[row.index].calificacion != null ? trimestre.materias[row.index].calificacion.valor : '-'}</td>
												</c:forEach>
												</tr>
											</c:forEach>
												
											</tbody>
			
									</table>
									</td>
							</table>
							</td>
						</tr>
						<tr>
				      	    <td>&nbsp;</td>
				       	    <td>&nbsp;</td>
				      	</tr>				
						<tr>
							<td><label>Inasistencias</label></td>
						</tr>
						<tr>
						<td>
							<table>
								<tr>
									<td>
									<table align="left" id="table-boletin" width="100%">
										<thead title="Trimestres">
											<tr align="center">
												<th width="150px">&nbsp;</th>
												<th width="150px">1� Trim.</th>
												<th width="150px">2� Trim.</th>
												<th width="150px">3� Trim.</th>
												<th width="150px">Final</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td> Inasistencias</td>
												
												<c:choose>
													<c:when test="${perfilAlumno.boletin.inasistenciasPrimerTrimestre == null }">
														<td align="center"><c:out value="Sin Dato"></c:out></td>
													</c:when>
													<c:when test="${perfilAlumno.boletin.inasistenciasPrimerTrimestre == 0.0 }">
														<td align="center">${perfilAlumno.boletin.inasistenciasPrimerTrimestre}</td>
													</c:when>
													<c:when test="${perfilAlumno.boletin.inasistenciasPrimerTrimestre != null}">
														<td align="center"> ${perfilAlumno.boletin.inasistenciasPrimerTrimestre}</td>
													</c:when >
												</c:choose>
												
												<c:choose>
													<c:when test="${perfilAlumno.boletin.inasistenciasSegundoTrimestre == null }">
														<td align="center"><c:out value="Sin Dato"></c:out></td>
													</c:when>
													<c:when test="${perfilAlumno.boletin.inasistenciasSegundoTrimestre == 0.0 }">
														<td align="center">${perfilAlumno.boletin.inasistenciasSegundoTrimestre}</td>
													</c:when>
													<c:when test="${perfilAlumno.boletin.inasistenciasSegundoTrimestre != null}">
														<td align="center"> ${perfilAlumno.boletin.inasistenciasSegundoTrimestre}</td>
													</c:when>
												</c:choose>
												
												<c:choose>
													<c:when test="${perfilAlumno.boletin.inasistenciasTercerTrimestre == null }">
														<td align="center"><c:out value="Sin Dato"></c:out></td>
													</c:when>
													<c:when test="${perfilAlumno.boletin.inasistenciasTercerTrimestre == 0.0 }">
														<td align="center">${perfilAlumno.boletin.inasistenciasTercerTrimestre}</td>
													</c:when>
													<c:when test="${perfilAlumno.boletin.inasistenciasTercerTrimestre != null}">
														<td align="center"> ${perfilAlumno.boletin.inasistenciasTercerTrimestre}</td>
													</c:when>
												</c:choose>
												
												<c:choose>
													
													<c:when test="${perfilAlumno.boletin.inasistenciasTercerTrimestre == null && perfilAlumno.boletin.inasistenciasPrimerTrimestre == null && perfilAlumno.boletin.inasistenciasSegundoTrimestre == null}">
														<td align="center"><c:out value="Sin Dato"></c:out></td>
													</c:when>
													
													<c:when test="${perfilAlumno.boletin.inasistenciasTercerTrimestre == 0.0 && perfilAlumno.boletin.inasistenciasPrimerTrimestre == 0.0 && perfilAlumno.boletin.inasistenciasSegundoTrimestre == 0.0}">
														<td align="center"><c:out value="0.0"></c:out></td>
													</c:when>
													
													<c:when test="${perfilAlumno.boletin.totalInasistencias != null }">
														<td align="center"> ${perfilAlumno.boletin.totalInasistencias}</td>
													</c:when>
													<c:when test="${perfilAlumno.boletin.totalInasistencias != 0.0 }">
														<td align="center"> ${perfilAlumno.boletin.totalInasistencias}</td>
													</c:when>
												</c:choose>
											</tr>
											
											<tr>
												<td> Total d&iacute;as h&aacute;biles</td>
												<c:choose>
												<c:when test="${perfilAlumno.boletin.diasHabilesPrimerTrimestre == null}">
													<td align="center"><c:out value="Sin Dato"></c:out></td>
												</c:when>
												<c:when test="${perfilAlumno.boletin.diasHabilesPrimerTrimestre == 0.0}">
													<td align="center">${perfilAlumno.boletin.diasHabilesPrimerTrimestre}</td>
												</c:when>
												<c:when test="${perfilAlumno.boletin.diasHabilesPrimerTrimestre != null}">
													<td align="center"> ${perfilAlumno.boletin.diasHabilesPrimerTrimestre}</td>
												</c:when>
												</c:choose>
												
												<c:choose>
												<c:when test="${perfilAlumno.boletin.diasHabilesSegundoTrimestre == null}">
													<td align="center"><c:out value="Sin Dato"></c:out></td>
												</c:when>
												<c:when test="${perfilAlumno.boletin.diasHabilesSegundoTrimestre == 0.0}">
													<td align="center">${perfilAlumno.boletin.diasHabilesSegundoTrimestre}</td>
												</c:when>
												<c:when test="${perfilAlumno.boletin.diasHabilesSegundoTrimestre != null}">
													<td align="center"> ${perfilAlumno.boletin.diasHabilesSegundoTrimestre}</td>
												</c:when>
												</c:choose>
												
												<c:choose>
												<c:when test="${perfilAlumno.boletin.diasHabilesTercerTrimestre == null}">
													<td align="center"><c:out value="Sin Dato"></c:out></td>
												</c:when>
												<c:when test="${perfilAlumno.boletin.diasHabilesTercerTrimestre == 0.0}">
													<td align="center">${perfilAlumno.boletin.diasHabilesTercerTrimestre}</td>
												</c:when>
												<c:when test="${perfilAlumno.boletin.diasHabilesTercerTrimestre != null}">
													<td align="center"> ${perfilAlumno.boletin.diasHabilesTercerTrimestre}</td>
												</c:when>
												</c:choose>
												
												<c:choose>
												
												<c:when test="${perfilAlumno.boletin.diasHabilesTercerTrimestre == null && perfilAlumno.boletin.diasHabilesSegundoTrimestre == null && perfilAlumno.boletin.diasHabilesPrimerTrimestre == null}">
													<td align="center"><c:out value="Sin Dato"></c:out></td>
												</c:when>
												<c:when test="${perfilAlumno.boletin.diasHabilesTercerTrimestre == 0.0 && perfilAlumno.boletin.diasHabilesSegundoTrimestre == 0.0 && perfilAlumno.boletin.diasHabilesPrimerTrimestre == 0.0}">
													<td align="center"><c:out value="0.0"></c:out></td>
												</c:when>
												<c:when test="${perfilAlumno.boletin.totalInasistencias != null}">
													<td align="center"> ${perfilAlumno.boletin.totalDiasHabiles}</td>
												</c:when>
												<c:when test="${perfilAlumno.boletin.totalDiasHabiles != 0.0}">
													<td align="center"> ${perfilAlumno.boletin.totalDiasHabiles}</td>
												</c:when>
												</c:choose>									
											</tr>									
												
										</tbody>
									</table>
									</td>
							</table>
							</td>
						</tr>				
										
					</table>
						
					<c:set var="trimestres" value="${perfilAlumno.boletin.previas}" scope="page" />
					<c:set var="materias" value="${perfilAlumno.boletin.materiasPrevias}" scope="page" />
					<table width="200" border="0" align="left" cellpadding="0"
			cellspacing="0" id="table-forms">
			<tr>				
			<td>
				<table>
					<tr>
						<td><label>Materias Previas</label></td>
					</tr>
					<tr>
						<td>
						<table align="left" id="table-boletin" width="100%">
							<thead title="Materias">
								<tr align="center">
									<th width="300px">Materias</th>
									<th width="100px">Ciclo</th>
									<th width="150px">Julio</th>
									<th width="150px">Diciembre</th>
									<th width="150px">Marzo</th>
		
								</tr>
							</thead>
							<tbody>
								<c:forEach varStatus="row" items="${materias}" var="materia">
									<tr>
										<td> ${materia.nombre} </td>
										<c:forEach begin="0" end="0" items="${trimestres}" var="trimestre">
											<td align="center"> ${trimestre.materias[row.index].ciclo!= null ? trimestre.materias[row.index].ciclo : '-'}</td>
										</c:forEach>
										<c:forEach begin="0" end="3" items="${trimestres}" var="trimestre">
											<td align="center"> ${trimestre.materias[row.index].estado != null ? trimestre.materias[row.index].estado.valor : '-'}</td>
										</c:forEach>
									</tr>
								</c:forEach>
									
								</tbody>
		
						</table>
						</td>
				</table>
				</td>
			</tr>
			<tr>
		     	    <td>&nbsp;</td>
		      	    <td>&nbsp;</td>
		     	</tr>								
		</table>
					
					
			
		<br></br>
		<br></br>

</div>
</body>
</html>