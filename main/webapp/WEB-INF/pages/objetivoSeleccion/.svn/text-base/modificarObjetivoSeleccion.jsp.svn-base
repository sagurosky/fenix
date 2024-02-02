<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all">
	<h2 align="center">Modificar objetivos de selecci&oacute;n</h2>
</div>
<div id="divIdObjDelete"></div>
<table align="center"  class="dataTables_wrapper" id="tabla1" width="100%" border="0"  >

	<thead align="center">
		<tr>				
			<th>Ciclo</th>					
			<th>Periodo</th>
			<th>Zona</th>
			<th>Cantidad de Becas</th>	
			<th>Becados Cesados</th>
			<th>Becas a Disponer Por Egreso</th>
		</tr>
	</thead>
	<tbody align="center">
		<%int conZona=0;%> 
				<c:forEach var="objSelDto" items="${listObjSelDTO}" varStatus="loop">
					<c:set var="periodoId" scope="request" value="${objSelDto.periodo.id}"/>
					<c:set var="cicloId" scope="request" value="${objSelDto.cicloPrograma.id}"></c:set>
						<tr>
							<td align="left" valign="middle" style="font-size: 14px">${objSelDto.cicloPrograma.nombre}
								<!-- For each para cargar los id de objetivo seleccion  -->
								<c:forEach items="${objSelDto.idObjetivoSeleccion }" var ="obj" varStatus="loopObj">
										<input type="hidden"  name="idObjetivoSeleccion" id="idObjetivoSeleccion${loopObj.index}" value="${obj}">
									</c:forEach> 
							</td>
							<td align="left" valign="middle" style="font-size: 14px">&nbsp;&nbsp; ${objSelDto.periodo.nombre}
							
							</td>
							<td align="left" valign="middle" style="font-size: 14px">
							<table>
								<tr id="fila${loop.index}">
									<c:forEach items="${objSelDto.zonaCimientos}" var="zona" varStatus="loopZona" >
											<tr id="trZona${loopZona.index }">
												<td>
													<input type="text" class="required"  name="zona" id="zona${loopZona.index }" value="${zona.nombre}" onkeypress="autoCompleteZona('${loopZona.index }','${objSelDto.periodo.id }');"> 		
					 								<input type="hidden"  name="idZona" id="idZona${loopZona.index }" value="${zona.id }" >
			 								 		<td><div id="errorZona${loopZona.index }"></div></td>
			 								 	</td>
			 								 	<td><a style="height: 20px; vertical-align: middle;" id="eliminar${loopZona.index }" onclick="callDeleteInput('#trZona${loopZona.index }','#filaCantidadBeca${loopZona.index }','${loopZona.index }','true')"><span class="ui-icon ui-icon-minusthick" ></span></a>
			 								 	</td>
			 								</tr>
									</c:forEach>
								</tr>
								<tr>
									<td>
										<a  onclick="generarInput('#fila${loop.index}','#filaCantidadBeca${loop.index}','#divEliminar${loop.index}','${objSelDto.periodo.id}','#filaBecadosCesados${loop.index}','#filabecasADisponerEgreso${loop.index}')">
												<span class="ui-icon ui-icon-circle-plus"></span>
										</a>
										
									</td>
								</tr>
							</table>
						</td>	
						<td align="left" valign="middle" style="font-size: 14px">
						<table >
							<tr id="filaCantidadBeca${loop.index}">
								<c:forEach items="${objSelDto.cantidadBecas}" var="cantidadBecas" varStatus="loopCanBecas">
									<tr id="trCantidadBecas${loopCanBecas.index}">
										<td>
											<input type="text" name="cantidadBecas" class="required digits" id="cantidadBecas${loopCanBecas.index}" value="${cantidadBecas}">
											
										</td>
									</tr>
							
								</c:forEach>
							</tr>
								<tr >
									<td>&nbsp;</td>
								</tr>
						</table>
						</td>	
						<td align="left" valign="middle" style="font-size: 14px" >
						<table style="width: 100%;height: 100%;" >
								<tr id="filaBecadosCesados${loop.index}" >
									<c:forEach items="${objSelDto.cantidadBecasCesadas}" var="cantidadBecasCesadas" varStatus="loopCanBecasCes">
										<% conZona++; %>
										<tr id="trBecadoCesHidden${loopCanBecasCes.index}">
											<td>
												<input type="text" name="cantidadBecasCesadas" id="becadoCesHidden${loopCanBecasCes.index}" value="${cantidadBecasCesadas}" disabled="disabled">
									
											</td>
										</tr>
										<% conZona =0 ; %>		
									</c:forEach>
								</tr>
								<tr >
									<td>&nbsp;</td>
								</tr>
						</table>
						
						</td>
						<td align="left" valign="middle" style="font-size: 14px" >
							<table>
								<tr id="filabecasADisponerEgreso${loop.index}">
								<c:forEach items="${objSelDto.cantidadBecasDisponiblesPorEgreso}" var="cantidadBecasCesadasDisPorEgreso" varStatus="loopCanBecsDis">
									
									<tr id="trBecadosADisHidden${loopCanBecsDis.index }">
										<td>
											<input type="text" name="cantidadBecasDisponiblesPorEgreso" id="becadosADisHidden${loopCanBecsDis.index }" value="${cantidadBecasCesadasDisPorEgreso}" disabled="disabled">
										</td>
									</tr>
									
								</c:forEach>
								</tr>
								<tr >
									<td>&nbsp;</td>
								</tr>
							</table>
						</td>
					</tr>
				</c:forEach>																
					
	</tbody>
</table>
<div class="ui-state-default ui-corner-all" >
	<table align="center">
		<tr>
            	<td  align="center" ><input class="ui-state-default ui-corner-all " type="button" value="Guardar" onclick="enviarForm('modificar','${requestScope.periodoId}','${requestScope.cicloId}')" /></td>
            	<td  align="center" ><input class="ui-state-default ui-corner-all " type="button" value="Volver" onclick="enviarForm('volver','','')" /></td>			
		</tr>
	</table>
</div>	