<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
			<c:set var="trimestres" value="${boletin.trimestres}" scope="page" />
			<c:set var="materias" value="${boletin.materias}" scope="page" />
			<table width="200" border="0" align="left" cellpadding="0"
				cellspacing="0" id="table-forms">
				<tr>
					<td><label>Año:</label> ${boletin.ano.valor}</td>
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
											<c:when test="${boletin.inasistenciasPrimerTrimestre == null }">
												<td align="center"><c:out value="Sin Dato"></c:out></td>
											</c:when>
											<c:when test="${boletin.inasistenciasPrimerTrimestre == 0.0 }">
												<td align="center">${boletin.inasistenciasPrimerTrimestre}</td>
											</c:when>
											<c:when test="${boletin.inasistenciasPrimerTrimestre != null}">
												<td align="center"> ${boletin.inasistenciasPrimerTrimestre}</td>
											</c:when >
										</c:choose>
										
										<c:choose>
											<c:when test="${boletin.inasistenciasSegundoTrimestre == null }">
												<td align="center"><c:out value="Sin Dato"></c:out></td>
											</c:when>
											<c:when test="${boletin.inasistenciasSegundoTrimestre == 0.0 }">
												<td align="center">${boletin.inasistenciasSegundoTrimestre}</td>
											</c:when>
											<c:when test="${boletin.inasistenciasSegundoTrimestre != null}">
												<td align="center"> ${boletin.inasistenciasSegundoTrimestre}</td>
											</c:when>
										</c:choose>
										
										<c:choose>
											<c:when test="${boletin.inasistenciasTercerTrimestre == null }">
												<td align="center"><c:out value="Sin Dato"></c:out></td>
											</c:when>
											<c:when test="${boletin.inasistenciasTercerTrimestre == 0.0 }">
												<td align="center">${boletin.inasistenciasTercerTrimestre}</td>
											</c:when>
											<c:when test="${boletin.inasistenciasTercerTrimestre != null}">
												<td align="center"> ${boletin.inasistenciasTercerTrimestre}</td>
											</c:when>
										</c:choose>
										
										<c:choose>
											
											<c:when test="${boletin.inasistenciasTercerTrimestre == null && boletin.inasistenciasPrimerTrimestre == null && boletin.inasistenciasSegundoTrimestre == null}">
												<td align="center"><c:out value="Sin Dato"></c:out></td>
											</c:when>
											
											<c:when test="${boletin.inasistenciasTercerTrimestre == 0.0 && boletin.inasistenciasPrimerTrimestre == 0.0 && boletin.inasistenciasSegundoTrimestre == 0.0}">
												<td align="center"><c:out value="0.0"></c:out></td>
											</c:when>
											
											<c:when test="${boletin.totalInasistencias != null }">
												<td align="center"> ${boletin.totalInasistencias}</td>
											</c:when>
											<c:when test="${boletin.totalInasistencias != 0.0 }">
												<td align="center"> ${boletin.totalInasistencias}</td>
											</c:when>
										</c:choose>
									</tr>
									
									<tr>
										<td> Total d&iacute;as h&aacute;biles</td>
										<c:choose>
										<c:when test="${boletin.diasHabilesPrimerTrimestre == null}">
											<td align="center"><c:out value="Sin Dato"></c:out></td>
										</c:when>
										<c:when test="${boletin.diasHabilesPrimerTrimestre == 0.0}">
											<td align="center">${boletin.diasHabilesPrimerTrimestre}</td>
										</c:when>
										<c:when test="${boletin.diasHabilesPrimerTrimestre != null}">
											<td align="center"> ${boletin.diasHabilesPrimerTrimestre}</td>
										</c:when>
										</c:choose>
										
										<c:choose>
										<c:when test="${boletin.diasHabilesSegundoTrimestre == null}">
											<td align="center"><c:out value="Sin Dato"></c:out></td>
										</c:when>
										<c:when test="${boletin.diasHabilesSegundoTrimestre == 0.0}">
											<td align="center">${boletin.diasHabilesSegundoTrimestre}</td>
										</c:when>
										<c:when test="${boletin.diasHabilesSegundoTrimestre != null}">
											<td align="center"> ${boletin.diasHabilesSegundoTrimestre}</td>
										</c:when>
										</c:choose>
										
										<c:choose>
										<c:when test="${boletin.diasHabilesTercerTrimestre == null}">
											<td align="center"><c:out value="Sin Dato"></c:out></td>
										</c:when>
										<c:when test="${boletin.diasHabilesTercerTrimestre == 0.0}">
											<td align="center">${boletin.diasHabilesTercerTrimestre}</td>
										</c:when>
										<c:when test="${boletin.diasHabilesTercerTrimestre != null}">
											<td align="center"> ${boletin.diasHabilesTercerTrimestre}</td>
										</c:when>
										</c:choose>
										
										<c:choose>
										
										<c:when test="${boletin.diasHabilesTercerTrimestre == null && boletin.diasHabilesSegundoTrimestre == null && boletin.diasHabilesPrimerTrimestre == null}">
											<td align="center"><c:out value="Sin Dato"></c:out></td>
										</c:when>
										<c:when test="${boletin.diasHabilesTercerTrimestre == 0.0 && boletin.diasHabilesSegundoTrimestre == 0.0 && boletin.diasHabilesPrimerTrimestre == 0.0}">
											<td align="center"><c:out value="0.0"></c:out></td>
										</c:when>
										<c:when test="${boletin.totalInasistencias != null}">
											<td align="center"> ${boletin.totalDiasHabiles}</td>
										</c:when>
										<c:when test="${boletin.totalDiasHabiles != 0.0}">
											<td align="center"> ${boletin.totalDiasHabiles}</td>
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
