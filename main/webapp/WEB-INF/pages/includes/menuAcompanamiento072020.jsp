<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
    
<ul id="menuV" > 
  	<sec:authorize access="hasRole('EA')">
		<li> 
			<a class="m55" href='<c:url value="/entrevistas/listarBecados.do" />' >Panel de Control EA</a>		 
		</li>
	</sec:authorize>
	<sec:authorize access="hasRole('RR')">
		<li> 
			<a class="m55" href='<c:url value="/entrevistas/listarEas.do" />' >Panel de Control RR</a>		 
		</li> 
	</sec:authorize>
	<sec:authorize access="hasRole('CPBE')">
		<li> 
			<a class="m55" href='<c:url value="/entrevistas/listarTodosEas.do" />' >Panel de Control</a>		 
		</li> 
	</sec:authorize>
	<sec:authorize access="hasRole('EA') or hasRole('RR')">		
		<li> 
			<a class="m55" />Informes</a>
			<ul>
			<sec:authorize access="hasRole('EA')">
			<li> 
			<a class="m55" href='<c:url value="/informes/listaInformesConstruccion.do" />' >Informes a Actualizar</a>		 
			</li>
			</sec:authorize>
			<sec:authorize access="hasRole('RR')">
			<li> 
			<a class="m55" href='<c:url value="/informes/listaInformesSupervision.do" />' >Informes a Supervisar</a>		 
			</li>
			</sec:authorize>
			</ul>		 
		</li>
		<li> 
			<a class="m2">Acompañamiento</a> 
			<ul> 
			<sec:authorize access="hasRole('RR')">
				<li><a href='<c:url value="/entrevistas/listaEntrevistasAprobar.do" />'>Entrevistas a Aprobar</a></li>
		   	</sec:authorize>
		   	<sec:authorize access="hasRole('EA') or hasRole('RR')">
		   		<li><a href='<c:url value="/entrevistas/listarEntrevistasGrupales.do" />' >Encuentros Grupales</a></li>
		   		<li> 
			 		<a class="m56" href='<c:url value="/eventoGenerico/listaEventosGenericos.do" />' >Eventos Gen&eacute;ricos</a>
				</li>
		   	</sec:authorize>
		   	<sec:authorize access="hasRole('RR')">
		   		<li><a href='<c:url value="/entrevistas/listarEntrevistasGrupalesRR.do" />' >Encuentros Grupales RR</a></li>
				<li><a class="m57" href='<c:url value="/eventoGenerico/listaEventosGenericosRR.do" />'>Eventos Gen&eacute;ricos RR</a></li>
		   	</sec:authorize>		
			</ul> 
		</li> 
		 
		<li> 
			<a class="m4">Reportes</a>
				<sec:authorize access="hasRole('EA')">
				<ul>
					<li><a href='<c:url value="/reporteBecadosAB/reporteBecadosABPaginadoViewEa.do" />' >Lista Becados EA</a></li>
					<li><a  href='<c:url value="/alumno/listaBecadosInactivosEa.do" />' >Alumnos Inactivos EA</a></li>					
				</ul>
				</sec:authorize>
				<sec:authorize access="hasRole('RR')">
			<ul> 
				<li><a href='<c:url value="/reporteBecadosAB/reporteBecadosPaginadoABViewRr.do" />' >Lista Becados RR</a></li>	
				<li><a  href='<c:url value="/alumno/listaBecadosInactivosRr.do" />' >Alumnos Inactivos RR</a></li>		
			</ul> 
			</sec:authorize>
		</li>
		<li>
			<a class="m2">Vi&aacute;ticos</a>
			<ul>
			
			<sec:authorize access="hasRole('EA')">
				<li><a class="ms57" href='<c:url value="/viatico/viewViatico.do" />'>Vi&aacute;ticos</a></li>
			</sec:authorize>	
			<sec:authorize access="hasRole('RR')">	
				<li><a class="ms57" href='<c:url value="/viatico/evaluacionViatico.do" />'>Vi&aacute;ticos a aprobar</a></li>
			</sec:authorize>	
			</ul>
		</li>
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
		
		<!-- li>
			<a class="m2">0-800-EAS</a>
			<ul>
				<li>
					<a href=" http://cimientosvirtual.org/aconcagua/" target="_blank"><img src="../static/images/telefono.gif" width=70 alt="Hacé click y entrá a Foro 0800 EAs" border=0 >
			 		<img src="../static/images/foro.jpg" width=80 alt="Hacé click y entrá a Foro 0800 EAs" border=0 ></a> 			
				</li>
			</ul>
		</li-->		
	</sec:authorize>		 	 
</ul>
<!-- a href="http://cimientosvirtual.org/conecta2/login/index.php" target="_blank"><img src="../static/images/aulaCimientos.jpg" width=200 alt="Hacé click y entrá a Aula Cimientos" border=0 ></a>-->
<br>
<!--a href="http://www.cimientos.org/club/" target="_blank"><img src="../static/images/club.jpg" width=200 alt="Hacé click y entrá a Foro becados" border=0 ></a-->
	