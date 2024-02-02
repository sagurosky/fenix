<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Espacio de acompañamiento Renovacion ::..</title>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
<script type="text/javascript" src="<c:url  value="/static/js/funcionesRenovacion.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
 <link rel="stylesheet" type="text/css"	href="../pages/includes/jquery.tabs.css" />
 <script>
  $(document).ready(function(){
    $("#altaEntrevistaRenovacion").validate();
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
				break
			case 4:
				selector = "#datosEntrevista4";
				break	
			case 5:
				selector = "#datosEntrevista5";
			}

			$(selector).toggle("blind");
			
		}

	function guardar(valor, valorPerfil){
		document.forms['altaEntrevistaRenovacion'].valorPerfil.value = valorPerfil;
  		document.forms['altaEntrevistaRenovacion'].valorGuardar.value = valor;
		$.blockUI();
		$('#altaEntrevistaRenovacion').submit();
 	} 
 </script>
 <script>
 
 </script>

 
</head>
<body>
<div id="main-content">

<form:form id="altaEntrevistaRenovacion" commandName="entrevista" modelAttribute="entrevista" method="post" action="guardarRenovacionSuperUsuario.do?alumnoId=${alumno.id}">
<form:hidden path="id"/>
<form:hidden path="fechaCarga"/>
<form:hidden path="periodoDePago"/>
<h1 id="titulo-informe">Entrevista Renovacion - ${entrevista.estadoEntrevista.valor}</h1>
<table id="table-informe">
	<tr >
		<td colspan="2"><h1 id="subtitulo-informe">${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</h1></td>
	</tr>
</table>
<input type="hidden" name="valorGuardar" />
<input type="hidden" name="valorPerfil" />
<br>
<div id="pp">
<div id="accordion" style="width:90%" >
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(1)" >Evaluación Renovación </a></h3>
	<div id="datosEntrevista1"  style=" height:850; ;overflow:scroll;"> 
		<jsp:include page="/WEB-INF/pages/entrevistas/tabEvaluacionRenovacion.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(3)" >Datos Generales</a></h3>
	<div id="datosEntrevista3"  style=" height:370px; ;overflow:scroll;"> 
		<jsp:include page="/WEB-INF/pages/entrevistas/renovacionTab1.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(4)" >Datos Escolares</a></h3>
	<div id="datosEntrevista4"  style=" height:350px; ;overflow:scroll;">  
		<jsp:include page="/WEB-INF/pages/entrevistas/renovacionTab2.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(5)" >Acompañamiento</a></h3>
	<div id="datosEntrevista5"  style=" height:650px; ;overflow:scroll;"> 	
		<jsp:include page="/WEB-INF/pages/entrevistas/renovacionTab3.jsp" />		  	
	</div>
	
</div>
</div>
<script>
    var inputs = document.getElementsByTagName("input"); 
    for (var i = 0; i < inputs.length; i++) { 
        inputs[i].disabled = true;
    } 
    var selects = document.getElementsByTagName("select");
    for (var i = 0; i < selects.length; i++) {
        selects[i].disabled = true;
    }
    var textareas = document.getElementsByTagName("textarea"); 
    for (var i = 0; i < textareas.length; i++) { 
        textareas[i].disabled = true;
    }
    //var buttons = document.getElementsByTagName("button");
    //for (var i = 0; i < buttons.length; i++) {
    //    buttons[i].disabled = true;
    //}
</script> 
<br>
<table align="left" id="table-botons-small" width="96%">
	
	<tr>
		<td  width="50">
		<!--  sec:authorize access="hasRole('SuperUsuario') or hasRole('EA') or hasRole('RR')"-->
			<center>
				<c:if test="${ultimaEntrevista == true}">				
					<input type="button" value="En construcción" class="ui-state-default ui-corner-all"	onclick="guardar('c','superUsuario');" />
				</c:if>
			</center>
		<!--  /sec:authorize-->
		</td>
		<td  width="50">
		<!--  sec:authorize access="hasRole('SuperUsuario') or hasRole('EA') or hasRole('RR')"-->
			<center>
				<c:if test="${ultimaEntrevista == true}">
					<input type="button" value="A Supervisión" class="ui-state-default ui-corner-all" onclick="guardar('f','superUsuario');" />
				</c:if>					
			</center>
		<!-- >/sec:authorize-->
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