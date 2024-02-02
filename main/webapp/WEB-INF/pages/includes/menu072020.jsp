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

<link rel="stylesheet" href="<c:url  value="/static/css/menu.css"/>" media="all">
<link rel="stylesheet" href="<c:url  value="/static/css/menuA.css"/>" media="all">
<script type="text/javascript" src="<c:url  value="/static/js/menu.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.cookie.js"/>"></script>
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

<% Long cantidadCuentas=0L;	%>
<div id="menu">
	<div id="date">
	<sec:authorize access="hasRole('ADM') or hasRole('CPBE') or hasRole('SYS') or hasRole('ASIST') or hasRole('RR')">
  					<sec:authorize access="hasRole('EA')">
		  				<%						
			  				//System.out.println(Globales.id);
		  					cantidadCuentas=0L;
							Connection cn = null;
						    CallableStatement cl = null;
						    ResultSet rs = null;
						    Long becados=0L;
						    Long totalBe=0L;
						    
							cn = null;
						   	cl = null;
						   	rs = null;
						   	String call = "{CALL SP_AlertaCuentasEA(?)}";
							cn = Conexion.getConexion();
						    cl = cn.prepareCall(call); 
						    cl.setLong(1, Globales.id);
						    rs = cl.executeQuery();
						    while (rs.next()) { 
						    	cantidadCuentas=cantidadCuentas+1;	    
						    }
						    Conexion.cerrarCall(cl);
						    Conexion.cerrarConexion(cn);							    
						%>		  		
		  			</sec:authorize>
		  			<sec:authorize access="hasRole('RR')">
		  				<%						
		  					//System.out.println(Globales.id);
		  					cantidadCuentas=0L;
							Connection cn = null;
						    CallableStatement cl = null;
						    ResultSet rs = null;
						    Long becados=0L;
						    Long totalBe=0L;
						    
							cn = null;
						   	cl = null;
						   	rs = null;
						   	String call = "{CALL SP_AlertaCuentasRR(?)}";
							cn = Conexion.getConexion();
						    cl = cn.prepareCall(call); 
						    cl.setLong(1, Globales.id);
						    rs = cl.executeQuery();
						    while (rs.next()) { 
						    	cantidadCuentas=cantidadCuentas+1;	    
						    }
						    Conexion.cerrarCall(cl);
						    Conexion.cerrarConexion(cn);						    
						%>  		
  					</sec:authorize>
  					<sec:authorize access="hasRole('ADM') or hasRole('SYS') or hasRole('ASIST')">
				<%	
					cantidadCuentas=0L;
					Connection cn = null;
				    CallableStatement cl = null;
				    ResultSet rs = null;
				    Long becados=0L;
				    Long totalBe=0L;
				    
					cn = null;
				   	cl = null;
				   	rs = null;
				   	String call = "{CALL SP_AlertaCuentas()}";
					cn = Conexion.getConexion();
				    cl = cn.prepareCall(call); 
				    //cl.setString(1, anio);
				    rs = cl.executeQuery();
				    while (rs.next()) { 
				    	cantidadCuentas=cantidadCuentas+1;	    
				    }
				    Conexion.cerrarCall(cl);
				    Conexion.cerrarConexion(cn);
				%>		
				</sec:authorize>
  					
		  			
				</sec:authorize>
			<%if(cantidadCuentas>0){%>	
		  				<center>
		  				<a  href='<c:url value="/cuenta/verCreacionCuentas.do" />'>
		  				<img src="../static/images/atencion.gif" width=13 title="Hay becados con cuentas no solicitadas o en proceso por más de 15 días" style="border:none;">		
		  				</a>
		  				</center>
		  			<%} %>
	
	
	
	
	</div>
	<ul>
		<sec:authorize access="hasRole('EA') or hasRole('RR') or hasRole('CPBE') or hasRole('SEL') or hasRole('CORR')
			 or hasRole('DI') or hasRole('SYS') or hasRole('ASIST') or hasRole('Visita') or hasRole('SuperUsuario')
			 or hasRole('ADM')"> 
			<sec:authorize access="hasRole('CORR')">
				<li>
					<a href='<c:url value="/reporteGeneralInformes/verReporteGeneralInformes.do" />'>Listados Especiales</a>
					
				</li>
						
			</sec:authorize>
			<sec:authorize access="not hasRole('CORR')">
				
				<li>
					<a href='<c:url value="/exportarAlumnos/listaAlumnosExportar.do" />'>Listados Especiales</a>
				</li>
				
			</sec:authorize>
		</sec:authorize>
		
		<sec:authorize access="hasRole('SEL') or hasRole('CPBE') or hasRole('SYS') or hasRole('RRHH')">
			<sec:authorize access="hasRole('RRHH')">
				<li>
					<a href='<c:url value="/reporteConvocatoria/reporteConvocatoria.do" />'>Selecci&oacute;n</a>
				</li>
			</sec:authorize>
			<sec:authorize access="not hasRole('RRHH')">
				<li>
					<a href='<c:url value="/reporteConvocatoria/reporteConvocatoria.do" />'>Selecci&oacute;n</a>
					<!-- a href='<c:url value="/panelControl/seleccionPanelControl.do" />'>Selecci&oacute;n</a-->
				</li>
			</sec:authorize>
		</sec:authorize>
		
		<sec:authorize access="(hasRole('EA') or hasRole('RR') or hasRole('ASIST')) and not (hasRole('SEL') 
			or hasRole('CPBE') or hasRole('SYS') or hasRole('RRHH'))">
			<li>
				<a href='<c:url value="/reporteConvocatoria/reporteConvocatoria.do" />'>Selecci&oacute;n</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('EA') and not hasRole('RR') ">
			<li>
				<a href='<c:url value="/entrevistas/listarBecados.do" />'>Acompañamiento</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('RR')">
			<li>
				<a href='<c:url value="/entrevistas/listarEas.do" />'>Acompañamiento</a>
			</li>
		</sec:authorize>	
		
		
		
		<sec:authorize access="hasRole('CPBE')">
			<li>
				<a href='<c:url value="/entrevistas/listarTodosEas.do" />'>Monitoreo Coordinador</a>
			</li>
		</sec:authorize>	
		
		<sec:authorize access="hasRole('CPBE') or hasRole('SEL') or hasRole('SYS') or hasRole('RR') or hasRole('ASIST') or hasRole('SuperUsuario')">
				<li>
					<a href='<c:url value="/asignacionEaRr/asignacionEaRrView.do?menuSup=programas" />'> Asignaciones / Ciclos</a>
				</li>
		</sec:authorize>		
		
		<sec:authorize access="hasRole('VOL')">
			<li>
				<a href='<c:url value="/login/menuVoluntariado.do" />'>Voluntariado</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('ADM') or hasRole('CPBE') or hasRole('SYS') or hasRole('ASIST') or hasRole('RR')">
			<li>
				<a href='<c:url value="/pago/verAprobadosNoAprobView.do" />'>Administraci&oacute;n</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('SEL') and not hasRole('ADM')">
			<li>
				<a href='<c:url value="/cuenta/verInformeCuentas.do?idBanco=null" />'>Administraci&oacute;n</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasRole('SYS') or hasRole('CPBE') ">
			<li>
				<a href='<c:url value="/usuario/listaUsuarios.do" />'><span>Usuarios</span></a>
			</li>
		</sec:authorize>
		<sec:authorize access="not hasRole('SYS') and not hasRole('CPBE') ">
			<li>
				<a href='<c:url value="/usuario/cambioContrasenia.do?id=${logeado.usuario}" />'><span>Mis datos</span></a>
				
			</li>
		</sec:authorize>	
		<sec:authorize access="hasRole('SEL') or hasRole('SYS') or hasRole('ASIST') or hasRole('ADM')
			or hasRole('EA') or hasRole('RR') or hasRole('CPBE') or hasRole('CORR')">
			<sec:authorize access="not hasRole('CORR')">
				<li>
					<a href='<c:url value="/banco/listaBancos.do" />'><span>Datos Maestros</span></a>
				</li>
			</sec:authorize>
			<sec:authorize access="hasRole('CORR')">
				<li>
					<a href='<c:url value="/zona/listaZonas.do" />'><span>Datos Maestros</span></a>
				</li>
			</sec:authorize>	
		</sec:authorize>
		
		<sec:authorize access="hasRole('DI') or hasRole('SYS')">
			<sec:authorize access="not hasRole('SYS')">
				<li>
					<a href='<c:url value="/textos/verTextosMailView.do" />'> Asignaciones / Ciclos</a>
				</li>	
			</sec:authorize>	
			<li>
				<a href='<c:url value="/beca/listaBecasView.do" />'>Gestión de Becas</a>
			</li>
			<li>
				<a href='<c:url value="/envioInformes/listaInformes.do" />'>Envío de Informes</a>
			</li>
		</sec:authorize>
	
		<sec:authorize access="hasRole('TS')">
			<li>
				<a href='<c:url value="/entrevistaTrabajadorSocial/reporteEntrevistaTS.do" />'>Trabajador Social</a>
			</li>		
		</sec:authorize>
		
		<sec:authorize access="hasRole('CORR')">
			<li>
				<a href='<c:url value="/informes/listaInformesCorreccion.do" />'>Correctora</a>
			</li>
		</sec:authorize>		
	</ul>
</div>


