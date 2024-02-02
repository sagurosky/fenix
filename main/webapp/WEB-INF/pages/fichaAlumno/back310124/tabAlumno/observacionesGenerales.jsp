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
TAB ALUMNO
<table>
		<tr>
			<td>
			<label>Problemas de salud del becado?</label>
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
	<p><label>Información complementaria y evaluación</label>
		<form:textarea path="observacionesGenerales" rows="4" cols="40" id="observacionesGenerales" onblur="chequearLongitud(this);" onkeypress="chequearLongitud(this);"/>
	</p>
<br></br>
	<p><label>Uso del tiempo libre</label>
		<select name="tiempoLibre" id="tiempoLibre">
					<c:choose>
    					<c:when test="${perfilAlumno.tiempoLibre == 'Salir con amigos'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos" selected="selected">Salir con amigos</option>															
					    </c:when>
					    <c:when test="${perfilAlumno.tiempoLibre == 'Escuchar música'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música" selected="selected">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>															
					    </c:when>
					    <c:when test="${perfilAlumno.tiempoLibre == 'Estar con la familia'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia" selected="selected">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>																
					    </c:when>
					    <c:when test="${perfilAlumno.tiempoLibre == 'Hacer actividades artísticas'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas" selected="selected">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>														
					    </c:when>
					    <c:when test="${perfilAlumno.tiempoLibre == 'Hacer deporte'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte" selected="selected">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>																
					    </c:when>
					    <c:when test="${perfilAlumno.tiempoLibre == 'Leer'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer" selected="selected">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>													
					    </c:when>
					    <c:when test="${perfilAlumno.tiempoLibre == 'Navegar en internet'}">
       						<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet" selected="selected">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>														
					    </c:when>
					    
					    <c:otherwise>						 									
							<option value=" ">Seleccione una opci&oacute;n:</option>
							<option value="Escuchar música">Escuchar música</option>
							<option value="Estar con la familia">Estar con la familia</option>								
							<option value="Hacer actividades artísticas">Hacer actividades artísticas</option>
							<option value="Hacer deporte">Hacer deporte</option>
							<option value="Leer">Leer</option>
							<option value="Navegar en Internet">Navegar en internet</option>
							<option value="Salir con amigos">Salir con amigos</option>	
					    </c:otherwise>
					</c:choose>
				</select>	
	</p>
		<br></br>
	<p><label>Cuando termine la secundaria me gustaría</label>
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
					<td><label>Año:</label> ${perfilAlumno.boletin.ano.valor}</td>
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
										<th width="80px">1º Trim.</th>
										<th width="80px">2º Trim.</th>
										<th width="80px">3º Trim.</th>
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
										<th width="150px">1º Trim.</th>
										<th width="150px">2º Trim.</th>
										<th width="150px">3º Trim.</th>
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
</body>
</html>