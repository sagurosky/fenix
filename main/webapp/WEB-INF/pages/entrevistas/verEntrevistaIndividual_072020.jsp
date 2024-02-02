<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Ver Espacio de acompañamiento Individual ::..</title>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script> 
   <script>
  $(document).ready(function(){
    $("#altaEntrevistaIndividual").validate();
	$("#datepicker").datepicker({
	  	  changeMonth: true,
		  changeYear: true
		  });
	$("#datepicker1").datepicker({
	  	  changeMonth: true,
		  changeYear: true
		  });
	$("#container-1").tabs();
  });

  function mostrar(idx){
		var selector;
			switch (idx) {
			case 1:
				selector = "#datosEntrevista1";
				break
			case 2:
				selector = "#datosEntrevista2";
				break
			case 3:
				selector = "#datosEntrevista3";
			}

			$(selector).toggle("blind");
		}
  
	function guardar(valor, valorPerfil){
		document.forms['altaEntrevistaIndividual'].valorPerfil.value = valorPerfil;
  		document.forms['altaEntrevistaIndividual'].valorGuardar.value = valor;
		$.blockUI();
		$('#altaEntrevistaIndividual').submit();
 	} 
	
 </script>
  
</head>
<body>
<div id="main-content">
<form:form id="altaEntrevistaIndividual" commandName="entrevista" modelAttribute="entrevista" method="post" action="guardarMensualSuperUsuario.do?alumnoId=${alumno.id}">
<form:hidden path="id"/>
<h1 id="titulo-informe">Entrevista Individual - ${entrevista.estadoEntrevista.valor}</h1>
<table id="table-informe">
	<tr >
		<td colspan="2"><h1 id="subtitulo-informe">${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</h1></td>
	</tr>
</table>
<input type="hidden" name="valorGuardar" />
<input type="hidden" name="valorPerfil" />
<div id="accordion"  style="width:90%" >
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(1)" >Datos generales</a></h3>
	<div id="datosEntrevista1"  style=" height:470px; ;overflow:scroll;">
		<c:if test="${entrevista.entrevistaGrupal != null}">
			<table id="table-informe">
				<tr>
					<td>
						Entrevista individual generada desde el encuentro grupal el dia <fmt:formatDate value="${entrevista.entrevistaGrupal.fechaCarga}" pattern="yyyy/MM/dd"/> 
					</td>
				</tr>	
			</table>
		</c:if>  	
		<jsp:include page="/WEB-INF/pages/entrevistas/verEntrevistaTab1.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(2)" >Datos escolares</a></h3>
	<div id="datosEntrevista2"  style=" height:410px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/verEntrevistaTab2.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(3)" >Acompañamiento</a></h3>
	<div id="datosEntrevista3"  style=" height:400px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/verEntrevistaTab3.jsp" />		  	
	</div>
</div>

<br>
<table align="left" id="table-botons-small" width="96%">
	
	<tr>
		<td  width="50">
		<sec:authorize access="hasRole('SuperUsuario')">
			<center>
				<c:if test="${ultimaEntrevista == true}">				
					<input type="button" value="En construcción" class="ui-state-default ui-corner-all"	onclick="guardar('c','superUsuario');" />
				</c:if>
			</center>
		</sec:authorize>
		</td>
		<td  width="50">
		<sec:authorize access="hasRole('SuperUsuario')">
			<center>
				<c:if test="${ultimaEntrevista == true}">
					<input type="button" value="A Supervisión" class="ui-state-default ui-corner-all" onclick="guardar('f','superUsuario');" />
				</c:if>					
			</center>
		</sec:authorize>
		</td>
		
		<td  width="50">
			<center>
				<c:if test="${retorno == 'rr'}">
					<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listaEntrevistasPorEa.do?idEA=${entrevista.ea.idPerfilEA}'; return false;" />
				</c:if>
				<c:if test="${retorno == 'ea'}">
					<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
				</c:if>	
				<c:if test="${retorno == 'exportarEntrevista'}">
						<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
				</c:if>	
			</center>
		</td>
		<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
	</tr>
</table>


</form:form>
</div>
</body>
</html>