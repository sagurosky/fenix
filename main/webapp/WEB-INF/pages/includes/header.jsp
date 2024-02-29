<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="org.cimientos.intranet.web.controller.Globales"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>

<style>

#log{
	font-size:14px;
	font-weight:bold;
}

</style>


<% Long cantidadCuentas=0L;	%>
<div id="header">
	<div id="log" align="right">
	<table>
		<tr>
			<td>
				Bienvenido&nbsp;${persona_logueada.nombre}
			</td>
		</tr>		
		<tr>
			<td>						  	
  				<sec:authorize access="hasRole('ADM') or hasRole('CPBE') or hasRole('SYS') or hasRole('ASIST') or hasRole('RR')">
  					<sec:authorize access="hasRole('EA')">
		  				<%						
			  				//System.out.println("hola: " + Globales.id);
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
			</td>
		</tr>
		<tr>
			<td align="right">
				<a href='<c:url value="/logout/logout.do" />'>Cerrar Sesión</a>
			</td>
		</tr>
		</table>
		
	</div>
	
</div>

 



