<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="cons"
	class="org.cimientos.intranet.modelo.persona.Persona" scope="page" />
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="org.cimientos.intranet.web.controller.Globales"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>	
	

<head>


<script type="text/javascript" src="<c:url  value="/static/js/jquery.cookie.js"/>"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script>
	function CheckMyKeys(){
		var key = event.keyCode;
		if (key==116){ // F5 key, do something then cancel     
	   	 	return cancel();   
		}	
	}
	// Inline cancel function   
   	function cancel(){    
   		alert('Función deshabilitada intencionalmente por la aplicación.');
   	 	event.cancelBubble=true;    
   	 	event.keyCode=0;    
   	 	return false   
	}
	 
	document.onkeydown = CheckMyKeys;
</script>
</head>

	
	<nav class="navbar navbar-expand-md bg-dark navbar-dark">
		<a class="navbar-brand" href="#">Fénix</a>
	  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
	    		<span class="navbar-toggler-icon"></span>
	  		</button>
	  		<div class="collapse navbar-collapse" id="collapsibleNavbar">
	    		<ul class="navbar-nav">
					<sec:authorize access="hasRole('EA') or hasRole('RR') or hasRole('CPBE') or hasRole('SEL') or hasRole('CORR')
			 			or hasRole('DI') or hasRole('SYS') or hasRole('ASIST') or hasRole('Visita') or hasRole('SuperUsuario')
			 			or hasRole('ADM')"> 
						<sec:authorize access="hasRole('CORR')">
							<li class="nav-item">
        						<a href='<c:url value="/reporteGeneralInformes/verReporteGeneralInformes.do" />' class="nav-link">Listados Especiales</a>
      						</li>	
						</sec:authorize>
						<sec:authorize access="not hasRole('CORR')">
							<li class="nav-item">
        						<a href='<c:url value="/exportarAlumnos/listaAlumnosExportar.do" />' class="nav-link">Listados Especiales</a>
      						</li>
						</sec:authorize>
					</sec:authorize>
					<sec:authorize access="hasRole('SEL') or hasRole('CPBE') or hasRole('SYS') or hasRole('RRHH')">						
						<li class="nav-item">
        					<a href='<c:url value="/reporteConvocatoria/reporteConvocatoria.do" />' class="nav-link">Selecci&oacute;n</a>
      					</li>
					</sec:authorize>
		
		<sec:authorize access="(hasRole('EA') or hasRole('RR') or hasRole('ASIST')) and not (hasRole('SEL') 
			or hasRole('CPBE') or hasRole('SYS') or hasRole('RRHH'))">
			<li class="nav-item">
				<a href='<c:url value="/reporteConvocatoria/reporteConvocatoria.do" />'class="nav-link">Selecci&oacute;n</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('EA') and not hasRole('RR') ">
			<li class="nav-item">	
				<a href='<c:url value="/entrevistas/listarBecados.do" /> ' class="nav-link">Acompañamiento</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('RR')">
			<li class="nav-item">
				<a href='<c:url value="/entrevistas/listarEas.do" />' class="nav-link">Acompañamiento</a>
			</li>
		</sec:authorize>	
		
		
		
		<sec:authorize access="hasRole('CPBE')">
			<li class="nav-item">
				<a href='<c:url value="/entrevistas/listarTodosEas.do" />' class="nav-link">Monitoreo Coordinador</a>
			</li>
		</sec:authorize>	
		
		<sec:authorize access="hasRole('CPBE') or hasRole('SEL') or hasRole('SYS') or hasRole('RR') or hasRole('ASIST') or hasRole('SuperUsuario')">
			<li class="nav-item">
				<a href='<c:url value="/asignacionEaRr/asignacionEaRrView.do?menuSup=programas" />'class="nav-link">Asignaciones / Ciclos</a>
			</li>
		</sec:authorize>		
		
		<sec:authorize access="hasRole('VOL')">
			<li class="nav-item">
				<a href='<c:url value="/login/menuVoluntariado.do" />' class="nav-link">Voluntariado</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ADM') or hasRole('CPBE') or hasRole('SYS') or hasRole('ASIST') or hasRole('RR')">
			<li class="nav-item">
				<a href='<c:url value="/pago/verAprobadosNoAprobView.do" />' class="nav-link">Administraci&oacute;n</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('SEL') and not hasRole('ADM')">
			<li class="nav-item">
				<a href='<c:url value="/cuenta/verInformeCuentas.do?idBanco=null" />' class="nav-link">Administraci&oacute;n</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('SYS') or hasRole('CPBE') ">
			<li class="nav-item">
				<a href='<c:url value="/usuario/listaUsuarios.do" />' class="nav-link">Usuarios</a>
			</li>
		</sec:authorize>
		<sec:authorize access="not hasRole('SYS') and not hasRole('CPBE') ">
			<li class="nav-item">
				<a href='<c:url value="/usuario/cambioContrasenia.do?id=${logeado.usuario}" />' class="nav-link">Mis datos</a>
				
			</li>
		</sec:authorize>	
		<sec:authorize access="hasRole('SEL') or hasRole('SYS') or hasRole('ASIST') or hasRole('ADM')
			or hasRole('EA') or hasRole('RR') or hasRole('CPBE') or hasRole('CORR')">
			<sec:authorize access="not hasRole('CORR')">
				<li class="nav-item">
					<a href='<c:url value="/banco/listaBancos.do" />' class="nav-link">Datos Maestros</a>
				</li>
			</sec:authorize>
			<sec:authorize access="hasRole('CORR')">
				<li class="nav-item">
					<a href='<c:url value="/zona/listaZonas.do" />' class="nav-link">Datos Maestros</a>
				</li>
			</sec:authorize>	
		</sec:authorize>
		
		<sec:authorize access="hasRole('DI') or hasRole('SYS')">
			<sec:authorize access="not hasRole('SYS')">
				<li class="nav-item">
					<a href='<c:url value="/textos/verTextosMailView.do" />' class="nav-link"> Asignaciones / Ciclos</a>
				</li>	
			</sec:authorize>	
			<li class="nav-item">
				<a href='<c:url value="/beca/listaBecasView.do" />' class="nav-link">Gestión de Becas</a>
			</li>
			<li class="nav-item">
				<a href='<c:url value="/envioInformes/listaInformes.do" />' class="nav-link">Envío de Informes</a>
			</li>
		</sec:authorize>
	
		<sec:authorize access="hasRole('TS')">
			<li class="nav-item">
				<a href='<c:url value="/entrevistaTrabajadorSocial/reporteEntrevistaTS.do" />' class="nav-link">Trabajador Social</a>
			</li>		
		</sec:authorize>
		
		<sec:authorize access="hasRole('CORR')">
			<li class="nav-item">
				<a href='<c:url value="/informes/listaInformesCorreccion.do" />' class="nav-link">Correctora</a>
			</li>
		</sec:authorize>		
	</ul>
  </div>  
</nav>


