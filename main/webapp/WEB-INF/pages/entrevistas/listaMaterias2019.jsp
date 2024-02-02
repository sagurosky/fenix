<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<table style="margin-left: 0px; margin-right: 0px;" width="850px">
	<tr>
		<td colspan="2">
			<table align="center"  id="tabla1" style="background-color: #C0C2FF"
					width="100%" border="0" >
				<thead title="Materias">
					<tr align="center" valign="middle">
						<th width="225px">Materias</th>
						<th width="80px">1� Trim.</th>
						<th width="80px">2� Trim.</th>
						<th width="80px">3� Trim.</th>
						<th width="80px">Final</th>
						<th width="75px">No Aprueba</th>
						<th width="80px">Diciembre</th>
						<th width="80px">Marzo</th>
					</tr>
				</thead>
				<tbody>					
					<c:forEach varStatus="row" items="${materias}" var="materia">
						<tr align="center">
							<td style="font-weight: bold; vertical-align: middle;">${materia.nombre}</td>							
							<c:forEach begin="0" end="3" items="${trimestres}" var="trimestre">
								<td style="vertical-align: middle;">
									${trimestre.materias[row.index].calificacion.valor != ' ' ? trimestre.materias[row.index].calificacion.valor : '-'}					
								</td>							
							</c:forEach>
							
							<c:forEach begin="6" end="6" items="${trimestres}" var="trimestre">
								<td style="vertical-align: middle;">
									<input type="checkbox" style="_height:25px" value="${row.index}" id="noaprueba${row.index}" 
										<c:if test='${trimestre.materias[row.index].noAprueba}'>checked="checked"</c:if>
									/>
								</td>
							</c:forEach>								
							<c:forEach begin="4" end="5" items="${trimestres}" var="trimestre">
								<td style="vertical-align: middle;">
									${trimestre.materias[row.index].calificacion.valor != ' ' ? trimestre.materias[row.index].calificacion.valor : '-'}					
								</td>
							</c:forEach>															
						</tr>
						<c:if test="${row.index == cantidadMaterias-1}">
							<tr>
								<td style="vertical-align: middle;">
									
								</td>
								<c:forEach begin="0" end="3" items="${trimestres}" var="trimestre">
									<td style="vertical-align: middle;">
										<CENTER>
											<div align="center" style="width: 0.5cm" class="ui-state-default ui-corner-all">	
												<a title="Agregar" onclick="openDialog('${alumno.id}','${trimestre.id}');"> 
													<input type="hidden" name="idTrimestre" value="${trimestre.id}" /> 
													<span class="ui-icon ui-icon-circle-plus"></span> 
												</a>
											</div>
										</center>
									</td>
								</c:forEach>
								<td></td>
								<c:forEach begin="4" end="5" items="${trimestres}" var="trimestre">
									<td style="vertical-align: middle;">
										<CENTER>
											<div align="center" style="width: 0.5cm" class="ui-state-default ui-corner-all">	
												<a title="Agregar" onclick="openDialog('${alumno.id}','${trimestre.id}');"> 
													<input type="hidden" name="idTrimestre" value="${trimestre.id}" /> 
													<span class="ui-icon ui-icon-circle-plus"></span> 
												</a>
											</div>
										</center>
									</td>
								</c:forEach>
							</tr>					
						</c:if>						
					</c:forEach>												
				</tbody>
			</table>
		</td>
	</tr>	
</table>
	