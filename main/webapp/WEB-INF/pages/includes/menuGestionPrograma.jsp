<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<ul id="menuV">
	<sec:authorize access="hasRole('CPBE') or hasRole('SEL') or hasRole('SYS') or hasRole('RR') or hasRole('ASIST')">
			
			<li><a class="mgp1" href='<c:url value="/ciclo/listaCiclos.do" />'>Ciclos de programa</a></li>
		
		<li><a class="m2">Asignaciones</a>
			<ul>
				<sec:authorize access="hasRole('CPBE') or hasRole('SYS') or hasRole('RR') or hasRole('ASIST')">
					<li><a href='<c:url value="/asignacionEaRr/asignacionEaRrView.do" />'>Asignación de EAs</a></li>
					<li><a href='<c:url value="/reasignacionEaRr/reasignacionEaRrView.do" />'>Reasignación de EAs</a></li>
					<li><a href='<c:url value="/asignacionBecadosEa/asignacionBecadosEaView.do" />'>Asignar becados a EAs</a></li>					
				</sec:authorize>				
				<sec:authorize access="not hasRole('ASIST')">
					<li><a href='<c:url value="/reasignacionBecadosEa/reasignacionBecadosEaView.do" />'>Reasignar becados a EAs</a></li>
				</sec:authorize>				
				<sec:authorize access="hasRole('SEL') or hasRole('CPBE') or hasRole('SYS')"> 
					<li><a  href='<c:url value="/seleccionBecas/seleccionPeriodosBecasView.do" />'>Asignación de Becas</a></li>
				</sec:authorize>				
			</ul>
		</li>
	</sec:authorize>
	
	<sec:authorize access="hasRole('CPBE') or hasRole('SYS') or hasRole('SuperUsuario') or hasRole('DI')">
		<li><a class="m2">Textos Mail</a>
			<ul>
				<li><a  href='<c:url value="/textos/verTextosMailView.do" />'>Textos de Mail</a></li>
			</ul>
		</li>
	</sec:authorize>
</ul>
