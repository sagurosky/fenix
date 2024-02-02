<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
    
<!-- ul class="nav flex-column bg-dark"-->
<div class="nav flex-column nav-pills " id="v-pills-tab" role="tablist" aria-orientation="vertical">
  	<br>
  	<sec:authorize access="hasRole('EA')">
		<li class="nav-item">
			<a class="nav-link active bg-dark" href='<c:url value="/entrevistas/listarBecados.do" />' >Panel de Control EA</a>		 
		</li>
		<br>
	</sec:authorize>
	<sec:authorize access="hasRole('RR')">
		<li class="nav-item">
			<a class="nav-link active bg-dark" href='<c:url value="/entrevistas/listarEas.do" />' >Panel de Control RR</a>		 
		</li>
		<br> 
	</sec:authorize>
	<sec:authorize access="hasRole('CPBE')">
		<li class="nav-item">
			<a class="nav-link active bg-dark" href='<c:url value="/entrevistas/listarTodosEas.do" />' >Panel de Control</a>		 
		</li>
		<br> 
	</sec:authorize>
	<sec:authorize access="hasRole('EA') or hasRole('RR')">								
		<sec:authorize access="hasRole('EA')">
			<li class="nav-item"> 
				<a class="nav-link active bg-dark" href='<c:url value="/informes/listaInformesConstruccion.do" />' >Informes a Actualizar</a>		 
			</li>
			<br>
		</sec:authorize>
		<sec:authorize access="hasRole('RR')">
			<li class="nav-item">
				<a class="nav-link active bg-dark" href='<c:url value="/informes/listaInformesSupervision.do" />' >Informes a Supervisar</a>		 
			</li>
			<br>
		</sec:authorize>
		 			 
		<sec:authorize access="hasRole('RR')">
			<li class="nav-item">
				<a class="nav-link active bg-dark" href='<c:url value="/entrevistas/listaEntrevistasAprobar.do" />'>Entrevistas a Aprobar</a>
			</li>
			<br>
	   	</sec:authorize>
	   	
	   	<sec:authorize access="hasRole('EA') or hasRole('RR')">
	   		<li class="nav-item">
	   			<a class="nav-link active bg-dark" href='<c:url value="/entrevistas/listarEntrevistasGrupales.do" />' >Encuentros Grupales</a>
	   		</li>
	   		<br>
	   		<li class="nav-item"> 
		 		<a class="nav-link active bg-dark" href='<c:url value="/eventoGenerico/listaEventosGenericos.do" />' >Eventos Gen&eacute;ricos</a>
			</li>
			<br>
	   	</sec:authorize>
	   	
	   	<sec:authorize access="hasRole('RR')">
	   		<li class="nav-item">
	   			<a class="nav-link active bg-dark" href='<c:url value="/entrevistas/listarEntrevistasGrupalesRR.do" />' >Encuentros Grupales RR</a>
	   		</li>
	   		<br>
			<li class="nav-item">
				<a class="nav-link active bg-dark" href='<c:url value="/eventoGenerico/listaEventosGenericosRR.do" />'>Eventos Gen&eacute;ricos RR</a>
			</li>
			<br>
	   	</sec:authorize>					
		 
		
		<sec:authorize access="hasRole('EA')">			
			<li class="nav-item">
				<a class="nav-link active bg-dark" href='<c:url value="/reporteBecadosAB/reporteBecadosABPaginadoViewEa.do" />' >Lista Becados EA</a>
			</li>
			<br>
			<li class="nav-item"> 
				<a class="nav-link active bg-dark"  href='<c:url value="/alumno/listaBecadosInactivosEa.do" />' >Alumnos Inactivos EA</a>
			</li>
			<br>								
		</sec:authorize>
		
		<sec:authorize access="hasRole('RR')"> 
			<li class="nav-item">
				<a class="nav-link active bg-dark" href='<c:url value="/reporteBecadosAB/reporteBecadosPaginadoABViewRr.do" />' >Lista Becados RR</a>
			</li>
			<br>	
			<li class="nav-item">
				<a class="nav-link active bg-dark" href='<c:url value="/alumno/listaBecadosInactivosRr.do" />' >Alumnos Inactivos RR</a>
			</li><br>				 
		</sec:authorize>
		
			
		<sec:authorize access="hasRole('EA')">			
			<li class="nav-item">
				<a class="nav-link active bg-dark" href='<c:url value="/viatico/viewViatico.do" />'>Vi&aacute;ticos</a>
			</li>
			<br>
		</sec:authorize>	
		<sec:authorize access="hasRole('RR')">	
			<li class="nav-item">
				<a class="nav-link active bg-dark" href='<c:url value="/viatico/evaluacionViatico.do" />'>Vi&aacute;ticos a aprobar</a>
			</li>
			<br>
		</sec:authorize>
	</sec:authorize>		
</div>