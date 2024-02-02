<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>

<script type="text/javascript"
src="<c:url value="/static/js/jquery.dialog.detail.js"/>"></script>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>	




</head>
<body>
<div id="div03">
<fieldset>
	<table width="80%" align="left" cellspacing="3">
		<tr>
		<td><font color="green"><label>Escuela *</label></font></td>
		<td>
			<input type="hidden" name="idEscuela" id="idEscuela" value="${perfilAlumno.escuela.id}"/>
			<input id="nombreEscuela" name="escuela.nombre" class="required form-control ocultarEA" value="${perfilAlumno.escuela.nombre}" style="width:600px" />
		</td>
		</tr>
		<tr>
			<td><label>Zona Cimientos</label></td>
			<td>
				<input type="hidden" name="escuela.zona.id" id="idZonaCimientos" value="${perfilAlumno.escuela.localidad.zona.id}" />
				<input id="zonaCimientos" class="form-control"name="escuela.zona.nombre" value="${perfilAlumno.escuela.localidad.zona.nombre}"  disabled="disabled" style="width:200px"/>
			</td>
		</tr>
		<tr>	
			<td>EAE:</td>
			<td>
				<input id="eae"class="form-control" name="eae" value="${perfilAlumno.escuela.localidad.zona.eae}"  disabled="disabled"style="width:200px"/>
			</td>
		</tr>
		
		<tr>
		
		<c:choose>			
			<c:when test="${perfilAlumno.escuela.zonaCimientos.eae=='6/6'}">
				<td>
					<font color="green"><label>Año Escolar 6/6*</label></font>	
				</td>
				<td>				
						<select name="anioEscuela" id="anioEscuela" class="required form-control ocultarEA" style="width:200px">
							<option value="">Seleccione una opci&oacute;n:</option>
							<c:forEach items="${listAnioEscolar}" var="anioEscolar">							
								<c:choose>										
									<c:when test="${perfilAlumno.anioEscolar.id == anioEscolar.id}">
										<option  value="${anioEscolar.id}" selected="selected">${anioEscolar.valor}</option>
									</c:when>													
									<c:otherwise>																																			
										<c:choose>
											<c:when test="${anioEscolar.id == 8 }">
												<option value="${anioEscolar.id}" disabled="disabled">${anioEscolar.valor} </option>
											</c:when>
											<c:otherwise>											
												<option value="${anioEscolar.id}">${anioEscolar.valor} </option>																				
											</c:otherwise>	
										</c:choose>								
									</c:otherwise>
								</c:choose>	
							</c:forEach>
						</select>					
					<!-- font color="green"><label>Año Escolar PFE</label></font--> 
					<input type="hidden" id="ae" name="ae" disabled="disabled" value="${perfilAlumno.anioEscolar.valor}">
					<input type="hidden" id="idAe" name="idAe" disabled="disabled" value="${perfilAlumno.anioEscolar}">
				
					<!-- font color="green"><label>Año Escolar</label></font--> 					
				</td>				
			</c:when>
			<c:when test="${perfilAlumno.escuela.zonaCimientos.eae=='7/5'}">
				<td>
					<font color="green"><label>Año Escolar 7/5*</label></font> 
				</td>
				<td>							
							<select name="anioEscuela" id="anioEscuela" class="required form-control ocultarEA" style="width:200px">
								<option value="">Seleccione una opci&oacute;n:</option>
								<c:forEach items="${listAnioEscolar}" var="anioEscolar">							
									<c:choose>										
										<c:when test="${perfilAlumno.anioEscolar.id == anioEscolar.id}">
											<option  value="${anioEscolar.id}" selected="selected">${anioEscolar.valor}</option>
										</c:when>													
										<c:otherwise>																																			
											<c:choose>
												<c:when test="${anioEscolar.id == 15}">
													<option value="${anioEscolar.id}" disabled="disabled">${anioEscolar.valor} </option>
												</c:when>
												<c:otherwise>											
													<option value="${anioEscolar.id}">${anioEscolar.valor} </option>																				
												</c:otherwise>	
											</c:choose>								
										</c:otherwise>
									</c:choose>	
								</c:forEach>
							</select>
					<!-- font color="green"><label>Año Escolar PFE</label></font--> 
					<input type="hidden" id="ae" name="ae" disabled="disabled" value="${perfilAlumno.anioEscolar.valor}">
					<input type="hidden" id="idAe" name="idAe" disabled="disabled" value="${perfilAlumno.anioEscolar}">
				</td>				
			</c:when>
			<c:otherwise>
				<td>
					<font color="green"><label>Año Escolar*</label></font>
					<select name="anioEscuela" id="anioEscuela" class="required" >
						<option value="">Seleccione una opci&oacute;n:</option>
					</select>
				</td>
			</c:otherwise>
		</c:choose>
	</tr>
	<tr>

		

		<c:if test="${!empty perfilAlumno.situacionEscolar}">
			<tr>
				<td>
					<label>Situacion escolar</label>
				</td>
				<td>
					<label>${perfilAlumno.situacionEscolar.valor}</label>
				</td>
			</tr>
		</c:if>
		<tr>
			<td><label>División</label></td>
			<td><input 	name="division"  class="form-control" onchange="this.value=this.value.toUpperCase();" id="alumnoDivision" value="${perfilAlumno.division}"style="width:200px"></td>
		</tr>
		<tr>
			<td><label>Turno</label></td>
			<td>
				<select name="idTurno" id="idTurno" class="required form-control" style="width:200px">
					<c:forEach items="${listTurno}" var="turno">
						<c:choose>
							<c:when test="${perfilAlumno.turno.id == turno.id}">
								<option value="${turno.id}" selected="selected">${turno.valor}</option>
							</c:when>
							<c:otherwise>
								<option value="${turno.id}">${turno.valor}</option>
							</c:otherwise>	
						</c:choose>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>
<!-- 				<label>Año adicional</label> -->
			</td>
			<td>
				<input type="hidden" name="anioAdicional" hidden
				<c:if test="${perfilAlumno.anioAdicional}"> checked="checked"</c:if> id="anioAdicional"  >
			</td>
		</tr>
		<tr>
		</tr>
		
			<tr>
				<td>
					<label>Año estimado de egreso</label>
				</td>
				<td>
				    	<c:if test="${perfilAlumno.escuela.zonaCimientos.eae=='6/6'}">
					    	<c:if test="${perfilAlumno.anioAdicional}">
								${perfilAlumno.beca.ciclo.nombre+14-perfilAlumno.anioEscolar.id+1}
							</c:if>
							<c:if test="${!perfilAlumno.anioAdicional}">
								${perfilAlumno.beca.ciclo.nombre+14-perfilAlumno.anioEscolar.id}
							</c:if>
						</c:if>
						<c:if test="${perfilAlumno.escuela.zonaCimientos.eae=='7/5'}">
					    	<c:if test="${perfilAlumno.anioAdicional}">
								${perfilAlumno.beca.ciclo.nombre+13-perfilAlumno.anioEscolar.id+1}
							</c:if>
							<c:if test="${!perfilAlumno.anioAdicional}">
								${perfilAlumno.beca.ciclo.nombre+13-perfilAlumno.anioEscolar.id}
							</c:if>
						</c:if>
				
				</td>
			</tr>
			
			
		<tr><td style="height: 10px" colspan="2"></td></tr>
	</table>
</fieldset>
</div>		
</body>
</html>