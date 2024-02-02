<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"   %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>

    
<ul id="menuV" >
	<li>
	<a href="#" class="mdm1333">Informes</a>
	<ul>
		<li> 
			<a class="m55" href='<c:url value="/informes/listaInformesCorreccion.do" />' >Informes a Corregir</a>		 
		</li>
	</ul>
	</li>	 
</ul> 