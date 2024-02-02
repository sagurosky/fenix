<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<table style="margin-left: 50px; margin-right: 50px;" width="610px">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="tabla1" width="610px" border="0" style="background-color: #C0C2FF">

		<thead align="center" id="rr">
			<tr>
				<th></th>
				<th>Zonas</th>
				<th>Responsable Regional</th>
				<th>Cantidad de EAs asignados</th>
			</tr>
			<tr>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
			</tr>				
		</thead>
		<tbody align="center">
			<c:forEach items="${perfilrrs}" var="rr">
			<c:if test="${rr.datosPersonales.nombre != null || rr.datosPersonales.apellido != null}">
				<tr>
					<td>${rr.idPerfilRR}</td>
					<td align="left" valign="middle" style="font-size: 14px">
						<c:forEach items="${rr.zona}" var="zona">
							&nbsp;${zona.nombre};&nbsp;
						</c:forEach>
					</td>					
					<td align="left" valign="middle" style="font-size: 14px">&nbsp;${rr.datosPersonales.apellido},&nbsp;${rr.datosPersonales.nombre}&nbsp;</td>
					<td align="left" valign="middle" style="font-size: 14px">
						&nbsp;${ fn:length(rr.eas) } &nbsp;
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
