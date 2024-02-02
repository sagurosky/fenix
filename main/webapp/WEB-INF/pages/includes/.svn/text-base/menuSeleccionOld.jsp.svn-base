<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>

<ul id="menuV" >
	<sec:authorize access="hasRole('SEL') or hasRole('CPBE') or hasRole('SYS') or hasRole('RRHH') or hasRole('DI')">
		<sec:authorize access="hasRole('DI')">
			<li><a  href='<c:url value="/escuela/listaEscuelas.do" />' >Listado y Alta de Escuelas</a></li>
		</sec:authorize>
		
		
		
		
		<sec:authorize access="not hasRole('RRHH') "> 
			<li>
			    
			    <a class="m133" href='<c:url value="/panelControl/seleccionPanelControl.do" />' >Panel de Control</a>
				<a>Gestión Escolar</a>
				<ul>			
					
					<li><a  href='<c:url value="/escuela/viewSeleccionEscuelasBecas.do" />' >Selecci&oacute;n de Escuelas</a></li>			
					<li><a  href='<c:url value="/escuela/listaEscuelas.do" />' >Listado y Alta de Escuelas</a></li>				
				</ul>
	
				<a>Selecci&oacute;n</a>
				<ul>
					<li><a class="ms5" href='<c:url value="/objetivoSeleccion/listaObjetivoSeleccionAnioActual.do" />'>Adm. de Objetivo Selecci&oacute;n</a></li>	
					<li><a class="ms5" href='<c:url value="/objetivoSeleccion/listarObjetivoSeleccion.do" />'>Reporte de Objetivos Selecci&oacute;n  </a></li>
					<li><a class="ms6" href='<c:url value="/entrevistaSeleccion/entrevistaSeleccionView.do" />' >Alta Entrevista de Selecci&oacute;n</a></li>
					<li><a class="ms7" href='<c:url value="/entrevistaSeleccion/reporteEntrevistaSeleccion.do" />' >Reporte Entrevistas Selecci&oacute;n</a></li>
					<li><a class="ms9" href='<c:url value="/emitirCarta/listaAlumnosCarta.do" />' >Emisi&oacute;n de Cartas</a></li>
					<li><a class="ms4" href='<c:url value="/convocado/listadoDeConvocados.do" />' >Listado de Candidatos</a></li>	     
				</ul>
	
				<a>Gesti&oacute;n de Becas</a> 
	
				<ul>
					<li><a href='<c:url value="/reporteBecasDisponibles/reporteBecasDisponibles.do" />' >Becas Disponibles</a></li> 
					<li><a href='<c:url value="/renovacionBecas/renovacionAutomaticaView.do" />' >Renovación Automática</a></li>
					<li><a href='<c:url value="/renovacionBecas/renovacionBecasPasoIView.do" />' >Renovación - Paso 1</a></li>				
					<li><a  href='<c:url value="/renovacionBecas/renovacionBecasPasoIIView.do" />' >Renovación - Paso 2</a></li>
					<sec:authorize access="hasRole('SEL') or hasRole('CPBE') or hasRole('SYS')"> 
						<li><a  href='<c:url value="/seleccionBecas/seleccionPeriodosBecasView.do" />'>Asignación de Becas</a></li>
					</sec:authorize>				 
						<li><a  href='<c:url value="/reasignacionBecas/reasignacionBecasView.do" />'>Reasignación de Becas</a></li>
					
				</ul> 		
				
				<a>Gesti&oacute;n de Informes</a>	
				<ul>
					<li><a class="ms13" href='<c:url value="/informeFP/listaInformesFPRevision.do" />' >Fichas de Presentación a Revisar</a></li>
				</ul>			
		    </li>  
	    </sec:authorize>
		    <sec:authorize access="not hasRole('DI')">
			    <li>
			    	<a>Convocatorias</a></li>
			    <li>
				    <ul>
					    <li><a class="ms4" href='<c:url value="/reporteConvocatoria/reporteConvocatoria.do" />' >Reporte de Convocatorias abiertas</a></li>
				    </ul>
			    </li>
    		</sec:authorize>
    </sec:authorize>
    
    
    <sec:authorize access="hasRole('EA') or hasRole('RR') or hasRole('ASIST')">
		<li>
	   		<a>Gestión Escolar</a>
				<ul>			
					<li><a  href='<c:url value="/escuela/viewSeleccionEscuelasBecas.do" />' >Selecci&oacute;n de Escuelas</a></li>			
					<li><a  href='<c:url value="/escuela/listaEscuelas.do" />' >Listado y Alta de Escuelas</a></li>				
				</ul>
	       	<a>Convocatorias</a>
		       <ul>
				    <li><a class="ms4" href='<c:url value="/reporteConvocatoria/reporteConvocatoria.do" />' >Reporte de Convocatorias abiertas</a></li>
			    </ul>
		   	<a>Selecci&oacute;n</a>	   
				<ul>
					<li><a class="ms6" href='<c:url value="/entrevistaSeleccion/entrevistaSeleccionView.do" />' >Alta Entrevista de Selecci&oacute;n</a></li>
					<li><a class="ms7" href='<c:url value="/entrevistaSeleccion/reporteEntrevistaSeleccion.do" />' >Reporte Entrevistas Selecci&oacute;n</a></li>
					<li><a class="ms9" href='<c:url value="/emitirCarta/listaAlumnosCarta.do" />' >Emisi&oacute;n de Cartas</a></li>
					<li><a class="ms4" href='<c:url value="/convocado/listadoDeConvocados.do" />' >Listado de Candidatos</a></li>	     
				</ul>
		</li>
		<sec:authorize access="hasRole('ASIST')">
			<li>
				<a>Gesti&oacute;n de Informes</a>
			</li>	
			<li>	
				<ul>
					<li><a class="ms13" href='<c:url value="/informeFP/listaInformesFPRevision.do" />' >Fichas de Presentación a Revisar</a></li>
				</ul>
			</li>
		</sec:authorize>	
    </sec:authorize>     
</ul>