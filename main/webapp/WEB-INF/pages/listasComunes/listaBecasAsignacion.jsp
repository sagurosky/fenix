<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<table style="margin-left: 50px; margin-right: 50px;" width="1000px">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="tabla1" width="1000px" border="0" style="background-color: #C0C2FF">

		<thead align="center" id="beca">
			<tr>
				<th>id</th>
				<th>Zona</th>
				<th>Tipo Beca</th>
				<th>Mes Inc. Beca</th>
				<th>Padrino</th>
				<th>Tipo Padrino</th>
				<th>Estado</th>
				<th>Fecha Baja Becados</th>
				<th>Comentario</th>
				<th>Cantidad Becas</th>
			</tr>
			<tr>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td>
				<select  id="tipoPadrino" name="search_browser"   class="search_init">
					<option value="All">Todos</option>
					<c:forEach var="tipoP" items="${tiposPadrino}">
						<option value="${tipoP.valor}">${tipoP.valor}</option>
					</c:forEach>
				</select></td>
				<td>
				<select  id="estado" name="search_browser"   class="search_init">
					<option value="All">Todos</option>
					<c:forEach var="estado" items="${estadosBeca}">
						<option value="${estado.valor}">${estado.valor}</option>
					</c:forEach>
				</select></td>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser" value="" class="search_init" disabled="disabled" /></td>
				<td></td>
			</tr>
		</thead>
		<tbody align="center">
			<c:forEach items="${becas}" var="beca">
				<tr id="beca_row">
					<td>${beca.id}</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${beca.zona.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${beca.tipo.descripcion}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${beca.periodoPago.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;
					<c:if test="${beca.padrino.datosPersonales != null}">
						${beca.padrino.datosPersonales.apellido},&nbsp;${beca.padrino.datosPersonales.nombre}
					</c:if>	
					<c:if test="${beca.padrino.empresa != null}">
						${beca.padrino.empresa.denominacion}
					</c:if>	
					&nbsp;
					</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${beca.padrino.tipo.valor}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${beca.estado.valor}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;<fmt:formatDate pattern="dd-MM-yyyy" value="${beca.fechaBajaBecado}"/>  &nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${beca.comentarios}&nbsp;</td>
					<td align="center" valign="middle" style="font-size: 14px">
						&nbsp;${beca.cantidadAsignada == null ? '0' : beca.cantidadAsignada} / ${beca.cantidad}&nbsp;
					</td>
				<td align="center"  style="border: 0"></td>
			</c:forEach>
	</tbody>
</table>
</td>
</tr>
</table>