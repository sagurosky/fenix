<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<table id="table-boletin" width="95%">
		<thead>
			<tr>
				<th>Materias</th>
				
				<th>Final</th>
				
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty ficha.boletinSeleccions }">
					<c:forEach items="${listMaterias }" var="materia">
						<tr align="center">
							<td><input type="hidden" name="idMateria" value="${materia.id}">${materia.nombre} </td>
							
							<td><input type="text" name="notaFinal" readonly="readonly"></td>
							
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ficha.boletinSeleccions }" var="boletin">
						<tr>
							<td><input type="hidden" name="idMateria" value="${boletin.materia.id}">${boletin.materia.nombre} </td>
							
							<td>${boletin.notaFinal}</td>
							
						</tr>
					</c:forEach>	
				</c:otherwise>
			</c:choose>	
	   </tbody>
</table>