<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">



<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>



</head>
<body>
<div class="container-fluid mt-3">
<div class="row">
    <div class="col p-3 bg-primary text-white">
    <label><strong>Tipo de Encuentro:</strong></label>
			
				${entrevista.tipoEncuentro}<br>
			
			<label><strong>Fecha Realización:</strong></label>
			
			<fmt:formatDate value="${entrevista.fechaEntrevista}" pattern="dd/MM/yyyy"/><br><br>
			
			<label><strong>Lugar Espacio de acompañamiento:</strong></label>
			
			${entrevista.lugarEntrevista.nombre}/${entrevista.lugarEntrevista.localidad.zona.nombre}<br><br>
			
    		<label><strong>Evaluación General del Encuentro</strong>:</label>			
			${entrevista.temasDesarrollados}
    </div>
    
    <div class="col p-3 bg-dark text-white">	
    	<label><strong>Alumnos:</strong></label>
    	<c:forEach items="${entrevista.entrevistasIndividuales}" var="e">
			<li>${e.perfilAlumno.datosPersonales.nombre}&nbsp;${e.perfilAlumno.datosPersonales.apellido}</li>			
			<c:set var = "ctda" value = "${e.contenidosTrabajarEnElAnio}"/>
			
		</c:forEach>
		
	 </div>
    
    
    <div class="col p-3 bg-primary text-white">
    	<label><strong>Otros Participantes:</strong></label><br>
			
				<c:if test="${entrevista.op1 != null}">
					RA<br>
				</c:if>
				<c:if test="${entrevista.op2 != null}">
					Invitado Externo<br> 
				</c:if>
				<c:if test="${entrevista.op3 != null}">
					Referentes Escolares<br>
				</c:if>
				<c:if test="${entrevista.op5 != null}">
					Padrinos<br>
				</c:if>
				<c:if test="${entrevista.op6 != null}">
					Egresados<br>
				</c:if>
				<c:if test="${entrevista.op4 != null}">
					<strong>Otros:</strong> ${entrevista.op}
				</c:if>
	</div>
    
</div>
<br>
    <div class="row">
    	<div class="col p-3 bg-primary text-white">	
  			<label><strong>Objetivo del encuentro y temas desarrollados:</strong></label><br>
			${entrevista.objetivoEncuentro}
		</div>
		<div class="col p-3 bg-dark text-white">	
  							
			<label><strong>Principal HSE</strong></label><br>			
			${entrevista.hsTrabajarAño}<br><br>
			<label><strong>Otra HSE</strong></label><br>			
			${entrevista.observacionesGenerales}	
		</div>
		<div class="col p-3 bg-primary text-white">	
  			<label><strong>Observaciones generales:</strong></label><br>
			${entrevista.observacionesGrupal}
				
		</div>
  	</div>

<br>

<div class="row">
    	<div class="col p-6 bg-primary text-white">	
  			<label><strong>Principales Contenidos trabajados</strong></label><br>
			${ctda}
		</div>
		<div class="col p-6 bg-dark text-white">	
  							
			<label><strong>Otro contenido trabajado</strong></label><br>			
			${entrevista.motivoInasistencia}<br><br>
			
		</div>
		
</div>
<br>
<!-- center><button type="submit" class="btn btn-primary" 	onclick="location.href='../entrevistas/listarEntrevistasGrupales.do'; return false;">Volver</button></center-->

</div>

<br>
</body>
</html>