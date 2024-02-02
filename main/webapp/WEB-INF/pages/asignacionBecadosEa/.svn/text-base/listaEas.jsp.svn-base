<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<table style="margin-left: 50px; margin-right: 50px;" width="900px">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" width="900px" id="tabla1" border="0" style="background-color: #C0C2FF">

		<thead align="center" id="ea">
			<tr>
				<th></th>
				<th>Zonas</th>
				<th>Encargado Acompa&ntilde;amiento</th>
				<th>Cantidad de becados asignados</th>
			</tr>
			<tr>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
			</tr>				
		</thead>
		<tbody align="center">
			<c:forEach items="${perfileas}" var="ea">
			<c:if test="${ea.datosPersonales.nombre != null || ea.datosPersonales.apellido != null}">
				<tr>
					<td>${ea.idPerfilEA}</td>
					<td align="left" valign="middle" style="font-size: 14px">
						<c:forEach items="${ea.zona}" var="zona">
							&nbsp;${zona.nombre};&nbsp;
						</c:forEach>
					</td>
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;&nbsp;${ea.datosPersonales.apellido},&nbsp;${ea.datosPersonales.nombre}&nbsp;</td>
					<td align="center" valign="middle" style="font-size: 14px">
						&nbsp;${ fn:length(ea.becados) } &nbsp;
					</td>
					<td align="center"  style="border: 0">
				</td>	
			</c:if>	
			</c:forEach>
	</tbody>
</table>
</td>
</tr>
</table>
