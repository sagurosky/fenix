<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>

<ul id="menuV" > 
	<li>
	<a href="#" class="mu1">Usuarios</a>
	     <ul >
             <sec:authorize access="hasRole('SYS') or hasRole('CPBE') ">
             	<li><a href='<c:url value="/usuario/listaUsuarios.do" />'><span>Usuarios</span></a></li>
             	<li><a  href='<c:url value="/perfilStaff/listaPerfilStaff.do" />' >Staff Cimientos</a></li>   
			 </sec:authorize>
			 <li><a href='<c:url value="/usuario/cambioContrasenia.do" />'><span>Cambiá tu contraseña</span></a></li>
			 <!-- 
			 <li><a  href='<c:url value="/perfilTS/listaPerfilTS.do" />' >Trabajadores Sociales</a></li>   
			 <li><a  href='<c:url value="/perfilEA/listaPerfilEA.do" />' >Encargados Acompañamiento</a></li>   
			 <li><a href='<c:url value="/perfilRR/listaPerfilRR.do" />' >Responsables Regionales</a></li>  -->   
<!--			 <li><a  href='<c:url value="/responsable/listaResponsables.do" />' >Responsables Adultos</a></li>-->
<!--             <li><a href='<c:url value="/persona/listaPersona.do" />'><span>Personas Fisicas</span></a></li>-->
	     </ul>
	</li>
</ul>
