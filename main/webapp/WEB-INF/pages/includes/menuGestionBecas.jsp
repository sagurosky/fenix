<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>

<head>
<script>
 function Abrir_ventana () {
 	alert();
	var opciones="toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=yes, width=700, height=365, top=85, left=140";
	 window.open("cambioMail.jsp","",opciones);
 }
 </script>
</head>



<ul id="menuV" > 
	<li>
	<a href="#" class="mgb">Gestión de Becas</a>
      <ul>    	
		<li><a  href='<c:url value="/perfilPadrino/listaPadrinosView.do" />' >Padrinos</a></li>
		<li><a  href='<c:url value="/empresa/listaEmpresasView.do" />' >Organizaciones</a></li>	
		<li><a  href='<c:url value="/beca/listaBecasView.do" />' >Becas</a></li>			
		<li><a href='<c:url value="/becadosPorEa/reporteBecasDisponibles.jsp" />' >Becas Disponibles Nuevo</a></li>
		<li><a  href='<c:url value="/beca/listaClonarBecas.do" />' >Clonar Beca</a></li>		
		<sec:authorize access="hasRole('SuperUsuario')">
			<!--  li>
				<a  href='<c:url value="/beca/listaClonarBecas.do" />' >Cambio mail envío becas</a>
				<!--  a href="javascript:Abrir_ventana()">Cambio mail envío becas</a-->
			</li-->		
		</sec:authorize>
		
		
      </ul>
    </li>
</ul>