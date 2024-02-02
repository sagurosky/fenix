<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- Titulo de la Tabla -->
<div class="ui-state-default ui-corner-all">
	<h2 align="center">Alta de objetivos Selecci&oacute;n  </h2>
</div>
<table align="center"  class="dataTables_wrapper" id="tabla1" width="100%" border="0"  >
	<thead align="center">
		<tr>				
			<th style="height: 15px">Ciclo</th>					
			<th>Periodo</th>
			<th>Zona</th>
			<th>Cantidad de Becas</th>	
			<th>Becados Cesados</th>
			<th>Becas a Disponer Por Egreso</th>
		</tr>
	</thead>
	<tbody align="center">
		<c:forEach var="objSelDto" items="${listObjSelDTO}" varStatus="loop">
			<c:set var="periodoId" scope="request" value="${objSelDto.periodo.id}"/>
			<c:set var="cicloId" scope="request" value="${objSelDto.cicloPrograma.id}"></c:set>
				<tr>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${objSelDto.cicloPrograma.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;&nbsp; ${objSelDto.periodo.nombre} </td>
					<td align="left" valign="middle" style="font-size: 14px">
						<table>
							<tr id="fila${loop.index}">
							</tr>
							<tr>
								<td align="center">
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
							</tr>
							<tr >
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>	
					<td align="left" valign="middle" style="font-size: 14px" >
						<table style="width: 100%;height: 100%;" >
							<tr id="filaBecadosCesados${loop.index}" >
							</tr>
							<tr >
								<td>&nbsp;</td>
							</tr>
						</table>
					</td>
					<td align="left" valign="middle" style="font-size: 14px" >
						<table>
							<tr id="filabecasADisponerEgreso${loop.index}">
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
            	<td  align="center" ><input class="ui-state-default ui-corner-all " type="button" value="Guardar" onclick="enviarForm('enviar','${requestScope.periodoId}','${requestScope.cicloId}')" /></td>
            	<td  align="center" ><input class="ui-state-default ui-corner-all " type="button" value="Volver" onclick="enviarForm('volver','','')" /></td>			
		</tr>
	</table>
</div>	