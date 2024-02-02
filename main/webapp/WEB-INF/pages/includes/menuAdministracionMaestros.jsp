<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>

<ul id="menuV" >
	<sec:authorize access="hasRole('SEL') or hasRole('SYS') or hasRole('ASIST') or hasRole('ADM')
			or hasRole('EA') or hasRole('RR') or hasRole('CPBE') or hasRole('DI') or hasRole('CORR')">
		<sec:authorize access="not hasRole('CORR')">	 
			<li>
				<a href="#" class="mdm1">Gestión Bancaria</a>
				<ul>
					<li><a  href='<c:url value="/sucursalBanco/listaSucursalBanco.do" />' >Sucursales Bancarias</a></li>
					<li><a  href='<c:url value="/banco/listaBancos.do" />' >Bancos</a></li>
				</ul>
			</li>
		</sec:authorize>
		<sec:authorize access="hasRole('SEL') or hasRole('SYS') or hasRole('ASIST') or hasRole('CORR')">
			<li>	
				<a href="#" class="mdm2">Ubicación</a>
				<ul>
					<li><a  href='<c:url value="/zona/listaZonas.do" />' >Zonas Cimientos</a></li> 
					<li><a  href='<c:url value="/provincia/listaProvincias.do" />' >Provincias</a></li>
					<li><a  href='<c:url value="/localidad/listaLocalidades.do" />' >Localidades</a></li>
				</ul>
			</li>
		</sec:authorize>
	</sec:authorize>
</ul>	 


