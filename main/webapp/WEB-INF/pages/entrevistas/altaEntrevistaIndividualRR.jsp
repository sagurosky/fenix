<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>..:: Espacio de acompañamiento Individual ::..</title>
<style type="text/css">
	label { width: 10em; float: left; }
	label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
	p { clear: both; }
	.submit { margin-left: 12em; }
	em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/funcionesEntrevista.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
 <link rel="stylesheet" type="text/css"	href="../pages/includes/jquery.tabs.css" />
 <script>
  $(document).ready(function(){
    $("#altaEntrevistaIndividual").validate();
	$("#datepicker").datepicker({
	  	  changeMonth: true,
		  changeYear: true,
	 	  yearRange:'-1:+1'
		  });
	$("#datepicker1").datepicker({
	  	  changeMonth: true,
		  changeYear: true,
	 	  yearRange:'-1:+1'
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
  
 </script>
   <script type="text/javascript">
$(function() {
	 
	$("#escuela").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEscuelaPorEA.do?idEA="${idEA},
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.escuelas, function(item) {
						return {
							label: item.labelEscuelaZona,
							value: item.labelEscuelaZona,
							id: item.id
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#lugarEntrevistaId").val(ui.item.id);
			$("#idProxima").val(ui.item.id);
		}
	});



});

</script>
  
 
</head>
<body onload="cargarDatos();">
<div id="main-content">
<form:form id="altaEntrevistaIndividual" commandName="entrevistaIndividual" modelAttribute="entrevistaIndividual" method="post" action="guardar.do?alumnoId=${alumno.id}&EA=${ea}">
<form:hidden path="id"/>
<form:hidden path="fechaCarga"/>
<form:hidden path="periodoDePago"/>
<h1 id="titulo-informe">Alta Espacio de acompañamiento Individual </h1>
<table id="table-informe">
	<tr >
		<td colspan="2"><h1 id="subtitulo-informe">${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</h1></td>
	</tr>
</table>
<input type="hidden" name="valorGuardar" />
<input type="hidden" name="valorPerfil" />
<br>

<div id="accordion"  style="width:90%" >
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(1)" >Datos generales</a></h3>
	<div id="datosEntrevista1"  style=" height:400px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/entrevistaTab1.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(2)" >Datos escolares</a></h3>
	<div id="datosEntrevista2"  style=" height:450px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/entrevistaTab2.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(3)" >Acompañamiento</a></h3>
	<div id="datosEntrevista3"  style=" height:900px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/entrevistaTab3.jsp" />		  	
	</div>
</div>

<br>
	<table align="left" id="table-botons-small" width="96%">
		<tr>
			<td  width="50">
				<center>
					<input type="button" value="Guardar en construccion" class="ui-state-default ui-corner-all"	onclick="guardar('c','rr');" />
				</center>
			</td>
			<td  width="50">
				<center>
					<input type="button" value="Finalizar" class="ui-state-default ui-corner-all" onclick="guardar('f','rr');" />
				</center>
			</td>
			<td  width="50">
				<center>
					<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
				</center>
			</td>
			<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
		</tr>
	</table>


</form:form>
</div>
</body>
</html>