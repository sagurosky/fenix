<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>

    
<ul id="menuV" > 
	<li> 
		<a class="m2">Listados Especiales</a> 
		<ul>
		  	<sec:authorize access="hasRole('EA') or hasRole('RR') or hasRole('CPBE') or hasRole('SEL') 
		  		or hasRole('DI') or hasRole('SYS') or hasRole('ASIST') or hasRole('Visita') or hasRole('SuperUsuario')
		  		or hasRole('ADM')">	
		  				
					<li><a  href='<c:url value="/escuela/listaEscuelas.do" />' >Listado de Escuelas</a></li>				
				
		   		<li>
		   			<a class="mee" href='<c:url value="/exportacionEntrevistas/verExportarEntrevistas.do" />' >Listado de Entrevistas</a>
				</li>
			</sec:authorize>
			<sec:authorize access="hasRole('EA') or hasRole('RR') or hasRole('CPBE') or hasRole('CORR') 
				or hasRole('DI') or hasRole('SYS') or hasRole('ASIST')  or hasRole('Visita') or hasRole('SuperUsuario')
				or hasRole('SEL') or hasRole('ADM')">
				<li>
					<a href='<c:url value="/reporteGeneralInformes/verReporteGeneralInformes.do" />'>Listado de Informes</a>
				</li>
			</sec:authorize>
			<sec:authorize access="hasRole('EA') or hasRole('RR') or hasRole('CPBE') or hasRole('SEL') 
		  		or hasRole('DI') or hasRole('SYS') or hasRole('ASIST')  or hasRole('Visita') or hasRole('SuperUsuario')
		  		or hasRole('ADM')">
				<li>
					<a href='<c:url value="/exportarAlumnos/listaAlumnosExportar.do" />'>Listado de Alumnos</a>
				</li>
				<!-- 
				 -->
				<li>
					<a href='<c:url value="/alumnosInactivos/listaAlumnosInactivos.do" />'>Listado de Alumnos Inactivos</a>
				</li>
				<sec:authorize access="hasRole('SYS')">
					<li>
						<a href='<c:url value="/becadosPorEa/listadoBecadosPorEa.jsp" />'>Listado de Becados por EA</a>
						<a href='<c:url value="/becadosPorEa/pagoDeBecas.jsp" />'>Pago de Becas</a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasRole('RR')">
					<li>						
						<a href='<c:url value="/becadosPorEa/pagoDeBecas.jsp" />'>Pago de Becas</a>
					</li>
					<li>						
						<a href='<c:url value="/becadosPorEa/postPFE.jsp" />'>Listado Post PFE</a>
					</li>
					
				</sec:authorize>
				<sec:authorize access="hasRole('ADM')">
					<li>						
						<a href='<c:url value="/becadosPorEa/pagoDeBecas.jsp" />'>Pago de Becas</a>
					</li>
				</sec:authorize>
				<sec:authorize access="hasRole('SuperUsuario')">
					<li>						
						<a href='<c:url value="/becadosPorEa/pagoDeBecas.jsp" />'>Pago de Becas</a>
					</li>
					<li>						
						<a href='<c:url value="/becadosPorEa/postPFE.jsp" />'>Listado Post PFE</a>
					</li>
				</sec:authorize>
  				<sec:authorize access="hasRole('DI')">
				<li>
					<a href='<c:url value="/escuela/listaEscuelas.do" />'>Listado de Escuelas</a>
				</li>
				</sec:authorize>
				<sec:authorize access="hasRole('EA')">
					<li>						
						<a href='<c:url value="/becadosPorEa/postPFE.jsp" />'>Listado Post PFE</a>
					</li>
				</sec:authorize>
  				<!-- li>
					<a href='<c:url value="/exportarAlumnos/reporteEventosGenericos.do" />'>Listado de Eventos Genéricos</a>
				</li-->
  				
  			</sec:authorize>
  			
		   		<li><a href='<c:url value="/entrevistas/listarEntrevistasGrupales.do" />' >Listado Encuentros Grupales</a></li>
		   		<li> 
			 		<a class="m56" href='<c:url value="/eventoGenerico/listaEventosGenericos.do" />' >Listado Eventos Gen&eacute;ricos</a>
				</li>
		   			
		</ul> 
	</li>
	<sec:authorize access="hasRole('Visita')">
		<li>
			
			<a>Gestión Escolar</a>
				<ul>										
					<li><a  href='<c:url value="/escuela/listaEscuelas.do" />' >Listado y Alta de Escuelas</a></li>				
				</ul> 
		</li>
	</sec:authorize>
</ul> 
<br><br><br>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="lightblue"><strong>CUMPLES DE HOY AB</strong></font>
		<MARQUEE HEIGHT=200 DIRECTION=up SCROLLDELAY=700><br><br>
<font color="white">
<%
Connection cn = null;
CallableStatement cl = null;	
ResultSet rs = null;
cn = null;
cl = null;
rs = null;
String call = "{CALL SP_TraerCumpleanios()}";
cn = Conexion.getConexion();
cl = cn.prepareCall(call);
//La sentencia lo almacenamos en un resulset
rs = cl.executeQuery();
//Consultamos si hay datos para recorrerlo
//e insertarlo en nuestro array
while (rs.next()) {%>	                       		                
       <%=rs.getString("becado")+"-"+rs.getString("edad") %><br>       		             
   <% }
Conexion.cerrarCall(cl);
Conexion.cerrarConexion(cn);%>


</font>
</MARQUEE>

