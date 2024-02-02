<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

		<table style="margin-left: 30px; margin-right: 50px;" width="850px">
			<tr>
				<td>
				<table align="center" class="dataTables_wrapper" id="laTabla"
					width="100%" border="0" style="background-color: #C0C2FF">
					<thead title="Materias">
						<tr align="center">
							<th>Materia</th>
							<th>Jul/Ago</th>
							<th>Diciembre</th>
							<th>Feb/Mar</th>
							<th>Mesa Adiconal</th>
							<th>Comentarios</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${!empty boletin}">
							<tr align="center">
								<!-- CORRESPONDE AL TH MATERIA -->
								<td align="center" nowrap="nowrap" valign="middle"
									style="font-weight: bold;">
									<c:forEach
									items="${materiasPrevias}" var="materiaPrevia">
										<table>
											<tr>
												<td><div align="center" style="width: 0.5cm"
													class="ui-state-default ui-corner-all"><a
													title="Borrar"
													onclick="borrarMateriaPrevia('${materiaPrevia.materia.id}', '${materiaPrevia.cicloPrevia}');"> <span
													class="ui-icon ui-icon-circle-minus"></span> </a>
													</div>
												</td>
												<td><div align="center" style="width: 0.5cm"
													class="ui-state-default ui-corner-all"><a
													title="Editar"
													onclick="openDialogEdicionMateriaPrevia('${alumno.id}','${materiaPrevia.materia.id}', '${materiaPrevia.cicloPrevia}');"> <span
													class="ui-icon ui-icon-pencil"></span> </a>
													</div>
												</td>												
												<td>${materiaPrevia.materia.nombre} - Año Escolar: ${materiaPrevia.cicloPrevia}</td>
											</tr>
										</table>
									</c:forEach>
								<center>
								<div align="center" style="width: 0.5cm"
									class="ui-state-default ui-corner-all"><a
									title="Agregar"
									onclick="openDialogMateriaPrevia();"> <span
									class="ui-icon ui-icon-circle-plus"></span> </a></div>
								</center>								
								
								</td>
								
								<!-- CORRESPONDE AL TH PREVIAS JULIO -->
								<td align="center" nowrap="nowrap" valign="top"
									style="">
								<c:if test="${!empty boletin.previas}">
								<c:forEach
									items="${boletin.previas[0].materias}" var="previa">
									<table>
										<tr>
											<td>${previa.calificacion == null || previa.calificacion.valor == " " ? "-" : previa.calificacion.valor}</td>
											<td>${previa.estado.valor == " " ? "" : previa.estado.valor}</td>
										</tr>
									</table>

								</c:forEach>
								
								
								<CENTER>
								<div align="center" style="width: 0.5cm"
									class="ui-state-default ui-corner-all"><a
									title="Agregar"
									onclick="openDialogNotaPrevia('${alumno.id}','${boletin.previas[0].id}');"> <input
									type="hidden" name="idTrimestre" value="${boletin.previas[0].id}" /> <span
									class="ui-icon ui-icon-circle-plus"></span> </a></div>
								</CENTER>
								</c:if>
								</td>

								<!-- CORRESPONDE AL TH PREVIAS DICIEMBRE -->
								<td align="center" nowrap="nowrap" valign="top"
									style="">
								<c:if test="${!empty boletin.previas}">	
								<c:forEach
									items="${boletin.previas[1].materias}" var="previa">
									<table>
										<tr>
											<td>${previa.calificacion == null || previa.calificacion.valor == " " ? "-" : previa.calificacion.valor}</td>
											<td>${previa.estado.valor == " " ? "" : previa.estado.valor}</td>
										</tr>
									</table>

								</c:forEach>
								<CENTER>
								<div align="center" style="width: 0.5cm"
									class="ui-state-default ui-corner-all"><a
									title="Agregar"
									onclick="openDialogNotaPrevia('${alumno.id}','${boletin.previas[1].id}');"> <input
									type="hidden" name="idTrimestre" value="${boletin.previas[1].id}" /> <span
									class="ui-icon ui-icon-circle-plus"></span> </a></div>
								</CENTER>
								</c:if>
								</td>
								
								<!-- CORRESPONDE AL TH PREVIAS MARZO -->
								<td align="center" nowrap="nowrap" valign="top"
									style="">
								<c:if test="${!empty boletin.previas}">	
								<c:forEach
									items="${boletin.previas[2].materias}" var="previa">
									<table>
										<tr>
											<td>${previa.calificacion == null || previa.calificacion.valor == " " ? "-" : previa.calificacion.valor}</td>
											<td>${previa.estado.valor == " " ? "" : previa.estado.valor}</td>
										</tr>
									</table>

								</c:forEach>
								
								<CENTER>
								<div align="center" style="width: 0.5cm"
									class="ui-state-default ui-corner-all"><a
									title="Agregar"
									onclick="openDialogNotaPrevia('${alumno.id}','${boletin.previas[2].id}');"> <input
									type="hidden" name="idTrimestre" value="${boletin.previas[2].id}" /> <span
									class="ui-icon ui-icon-circle-plus"></span> </a></div>
								</CENTER>
								</c:if>
								</td>																
								
								
								
								<!-- TODO LO QUE VIENE HAY QUE PONERLO CUANDO TERMINEN DE CARGAR LOS BOLETINES 2017 !!!!! -->
								
								
								<!-- CORRESPONDE AL TH MESA ADICIONAL -->
								<!-- 
								<td align="center" nowrap="nowrap" valign="top"
									style="">
								<c:if test="${!empty boletin.previas}">	
								<c:forEach
									items="${boletin.previas[3].materias}" var="previa">
									<table>
										<tr>
											<td>${previa.calificacion == null || previa.calificacion.valor == " " ? "-" : previa.calificacion.valor}</td>
											<td>${previa.estado.valor == " " ? "" : previa.estado.valor}</td>
										</tr>
									</table>

								</c:forEach>
								
								<CENTER>
								<div align="center" style="width: 0.5cm"
									class="ui-state-default ui-corner-all">
									<a title="Agregar" onclick="openDialogNotaPrevia('${alumno.id}','${boletin.previas[3].id}');"> 
									<input type="hidden" name="idTrimestre" value="${boletin.previas[3].id}" /> <span
									class="ui-icon ui-icon-circle-plus"></span> </a></div>
								</CENTER>
								</c:if>
								</td>		
								
								< CORRESPONDE AL TH COMENTARIOS>
								<td align="center" nowrap="nowrap" valign="top"
									style="">
								<c:if test="${!empty boletin.previas}">	
								<c:forEach
									items="${boletin.previas[4].materias}" var="previa">
									<table>
										<tr>
											
											<td>${previa.nota == " " ? "" : previa.nota}</td>
										</tr>
									</table>

								</c:forEach>
								
								<CENTER>
								<div align="center" style="width: 0.5cm"
									class="ui-state-default ui-corner-all"><a
									title="Agregar"
									onclick="openDialogNotaPrevia('${alumno.id}','${boletin.previas[4].id}');"> <input
									type="hidden" name="idTrimestre" value="${boletin.previas[4].id}" /> <span
									class="ui-icon ui-icon-circle-plus"></span> </a></div>
								</CENTER>
								</c:if>
								</td>		
								<-->
								<td></td>
								<td></td>

							</tr>
						</c:if>
					</tbody>
				</table>
		</td>
		</tr>	
	</table>
<input type="hidden" name="idMateria"/>
<input type="hidden" name="cicloPrevia"/>	