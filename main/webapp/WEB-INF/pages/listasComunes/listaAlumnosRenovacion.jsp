<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<table style="margin-left: 50px; margin-right: 50px;" width="700px">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="tabla2" width="700px" border="0" title="Candidatos" style="background-color: #C0C2FF">
		<thead align="center" style="width: 100%" id="alumno">
			<tr>
				<th></th>				
				<th width="15%">Zona</th>				
				<c:if test="${renovacionPasoII == true}">
					<th width="20%">Candidato</th>
					<th width="20%">Escuela</th>
					<th width="20%">Año Escolar</th>
					<th width="20%">Estado Renovación</th>		
				</c:if>	
					<c:if test="${renovacionPasoII == false}">
					<th width="40%">Candidato</th>
					<th width="40%">Estado Renovación</th>	
				</c:if>	
			</tr>
			<tr>
				<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
				<c:if test="${renovacionPasoII == true}">
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
					<td><input name="search_browser" value="Buscar" class="search_init"/></td>
				</c:if>
				<td><input name="search_browser"  value="Buscar" class="search_init"/></td>
			</tr>	
		</thead>
		<tbody align="center" style="width: 100%; font-size: 14px;">
		
		</tbody>

	
</table>
</td>
</tr>
</table>
