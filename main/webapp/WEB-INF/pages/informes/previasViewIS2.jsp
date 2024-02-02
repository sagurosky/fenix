<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="trimestres" value="${boletin.previas}" scope="page" />
<c:set var="materias" value="${boletin.materiasPrevias}" scope="page" />
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