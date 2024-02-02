<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<style>


.wrap{
	width: 1000px;
	max-width: 90%;
	margin: 30px auto;
}

ul.tabs{
	width: 100%;
	background: #363636;
	list-style: none;
	display: flex;
}

ul.tabs li{
	width: 18%;
}

ul.tabs li a{
	color: #fff;
	text-decoration: none;
	font-size: 16px;
	text-align: center;

	display: block;
	padding: 20px 0px;
}

.active{
	background: #0984CC;
}

ul.tabs li a .tab-text{
	margin-left: 8px;
}

.secciones{
	width: 100%;
	background: #ccc;
}

.secciones article{
	padding: 30px;
}

.secciones article p{
	text-align: justify;
}


@media screen and (max-width: 700px){
	ul.tabs li{
		width: none;
		flex-basis: 0;
		flex-grow: 1;
	}
}

@media screen and (max-width: 450px){
	ul.tabs li a{
		padding: 15px 0px;
	}

	ul.tabs li a .tab-text{
		display: none;
	}

	.secciones article{
		padding: 20px;
	}
}


</style>
<script>
$(document).ready(function(){
	$('ul.tabs li a:first').addClass('active');
	$('.secciones article').hide();
	$('.secciones article:first').show();

	$('ul.tabs li a').click(function(){
		$('ul.tabs li a').removeClass('active');
		$(this).addClass('active');
		$('.secciones article').hide();

		var activeTab = $(this).attr('href');
		$(activeTab).show();
		return false;
	});
});
</script>

	

	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	
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
	<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/funcionesEntrevista.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.blockUI.js"/>"></script>
 <link rel="stylesheet" type="text/css"	href="../pages/includes/jquery.tabs.css" />
 <script type="text/javascript" src="<c:url  value="/static/js/dFilter.js"/>"></script>
 <script>
  $(document).ready(function(){
    $("#altaEntrevistaIndividual").validate({
   		invalidHandler: function(form, validator) {
   			var errors = validator.numberOfInvalids();
   			if (errors) {
   				$.unblockUI();
   			}
   		}
    });
    
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
				url: "../ajax/buscarEscuelaPorEA.do?idEA=" + $("#idEA").val(),
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
		}
	});
});
$(function() {
	 
	$("#lugarProximaEntrevista").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEscuelaPorEA.do?idEA=" + $("#idEA").val(),
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
			$("#idProxima").val(ui.item.id);
		}
	});
});

	function guardarAprobar(valor, valorPerfil){
		//alert("finaliza");
		//alert(document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value);
		//alert(document.forms['altaEntrevistaIndividual'].motivoSuspension.value);
		//return false;
		
		if(document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value==""){			
			jAlert('warning', 'Falta seleccionar Evaluación Cobro Beca', 'Atención!');  
			return false;	
		}
		
		if(document.forms['altaEntrevistaIndividual'].tipoEncuentroAcompanamiento.value=="0" ){
			jAlert('warning', 'Falta seleccionar Principal tipo encuentro acompañamiento', 'Atención!');  
			return;	
		}
		
		if(document.forms['altaEntrevistaIndividual'].participoBecado.value=="2" && document.forms['altaEntrevistaIndividual'].motivoAusencia.value=="0"){
			jAlert('warning', 'Falta seleccionar el Motivo de no participación Becado', 'Atención!');  
			return;	
		}
		if(document.forms['altaEntrevistaIndividual'].hsTrabajarAño.value=="0"){			
			jAlert('warning', 'Falta completar Principal habilidad trabajada en la primera parte del año', 'Atención!');  
			return false;	
		}
		if(document.forms['altaEntrevistaIndividual'].osme.value==""){			
			jAlert('warning', 'Falta completar Observaciones sobre rendimiento escolar y asistencia', 'Atención!');  
			return false;	
		}
		
		
		
		if(document.forms['altaEntrevistaIndividual'].motivoAusenciaRa2.value=="0" ){
			jAlert('warning', 'Falta seleccionar Participación RA', 'Atención!');  
			return;	
		}
		//alert(document.forms['altaEntrevistaIndividual'].periodo.value);
		
		if(document.forms['altaEntrevistaIndividual'].periodo.value=="Julio"){	
			if(document.forms['altaEntrevistaIndividual'].osme.value==""){			
				jAlert('warning', 'Falta completar Observaciones sobre rendimiento escolar y asistencia', 'Atención!');  
				return false;	
			}
			if(document.forms['altaEntrevistaIndividual'].hsTrabajarAño.value=="0"){			
				jAlert('warning', 'Falta completar Principal habilidad trabajada en la primera parte del año', 'Atención!');  
				return false;	
			}
			
			if(document.forms['altaEntrevistaIndividual'].qtam.value==""){			
				jAlert('warning', 'Falta completar Qué trabajaste en el acompañamiento en esta primera parte del año', 'Atención!');  
				return false;	
			}
			if(document.forms['altaEntrevistaIndividual'].propositoAnual.value==""){			
				jAlert('warning', 'Falta completar Seguimiento del propósito anual ', 'Atención!');  
				return false;	
			}
			
		}
		//alert(document.forms['altaEntrevistaIndividual'].objetivoEncuentro.value);
		
		if(document.forms['altaEntrevistaIndividual'].objetivoEncuentro.value==""){			
			jAlert('warning', 'Falta completar Objetivo del encuentro y temas desarrollados', 'Atención!');  
			return false;	
		}
		
		if(document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value=="2"){
			//alert("dentro");
			if(document.forms['altaEntrevistaIndividual'].motivoSuspension.value==""){
				//alert("dentro2");
				jAlert('warning', 'Falta seleccionar Motivo de suspensión', 'Atención!');  
				return false;	
		} 
		}
		
		if(document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value=="4"){
			if(document.forms['altaEntrevistaIndividual'].motivoCesacion.value==""){
				jAlert('warning', 'Falta seleccionar Motivo de cesación', 'Atención!');  
				return false;	
			}
		}
		
		
		

		
		
		
		
		
		
			
			
		
		if (document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value !=1 
				&& document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value !=2
				&& document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value !=3
				&& document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value !=4) {
			jAlert('warning', 'No se puede aprobar una entrevista sin colocar estado en evaluacion cobro beca', 'Atención!');
		}else{
			if (document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value == 3 ) { 
				document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.focus();
     	  		jAlert('warning', 'No se puede aprobar una entrevista en estado Dudoso', 'Atención!');
	  		}
			else{
				document.forms['altaEntrevistaIndividual'].valorPerfil.value = valorPerfil;
				document.forms['altaEntrevistaIndividual'].valorGuardar.value = valor;
				//if (valor == 'f' || valor == 's'){
				//	if (esMayor(document.forms['altaEntrevistaIndividual'].fechaEntrevista.value, document.forms['altaEntrevistaIndividual'].fechaActual.value)){
				//		document.forms['altaEntrevistaIndividual'].fechaEntrevista.focus();
				//		jAlert('warning', '"Fecha Entrevista" no puede ser mayor a la fecha actual', 'Atención!');
				//	}
				//	else{
				//		$.blockUI();
				//		$('#altaEntrevistaIndividual').submit();
				//	}
				//}
				//else{
				$.blockUI();
				//alert();
				document.forms['altaEntrevistaIndividual'].submit();
				//}
			}
		}
	}

	function guardar(valor, valorPerfil){	
		
		document.forms['altaEntrevistaIndividual'].valorPerfil.value = valorPerfil;
		document.forms['altaEntrevistaIndividual'].valorGuardar.value = valor;		
		//alert(document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value);
		//alert(document.forms['altaEntrevistaIndividual'].motivoSuspension.value);
		//return false;
		
		
		
		
		if (valor == 'f'){
			
			
			if (esMayor(document.forms['altaEntrevistaIndividual'].fechaEntrevista.value, document.forms['altaEntrevistaIndividual'].fechaActual.value)){
				document.forms['altaEntrevistaIndividual'].fechaEntrevista.focus();
				jAlert('warning', '"Fecha Entrevista" no puede ser mayor a la fecha actual', 'Atención!')
				
			}
			else{
				if (document.forms['altaEntrevistaIndividual'].evaluacionCobroBeca.value == 4 ){
					$.blockUI();
					$('#altaEntrevistaIndividual').submit();
				}else{
					if(valorPerfil != 'superUsuario'){
						if (!esMayor(document.forms['altaEntrevistaIndividual'].proximaEntrevista.value, document.forms['altaEntrevistaIndividual'].fechaActual.value)){
							document.forms['altaEntrevistaIndividual'].proximaEntrevista.focus();
							jAlert('warning', '"Fecha Proxima Entrevista" debe ser mayor a la fecha actual', 'Atención!')
						}
						else{
							$.blockUI();
							$('#altaEntrevistaIndividual').submit();
						}
					}
					else{
						$.blockUI();
						$('#altaEntrevistaIndividual').submit();
					}
				}
			}	
		}else{
			$.blockUI();
			document.forms['altaEntrevistaIndividual'].submit();
		}
		
	}
	
</script>
 
</head>
<body  onload="cargarDatos();">
<div id="main-content">
<form:form id="altaEntrevistaIndividual" commandName="entrevista" modelAttribute="entrevista" cssClass="cmxform" method="post" action="guardar.do?alumnoId=${alumno.id}&EA=${ea}">
<form:hidden path="id"/>
<form:hidden path="fechaCarga"/>
<form:hidden path="periodoDePago"/>
<h1 id="titulo-informe">Espacio de acompañamiento Individual - ${entrevista.estadoEntrevista.valor}</h1>
<table id="table-informe">
	<tr >
		<td colspan="2"><h1 id="subtitulo-informe" align="center">${alumno.datosPersonales.nombre}&nbsp;${alumno.datosPersonales.apellido}</h1></td>
	</tr>
</table>
<input type="hidden" name="valorGuardar" />
<input type="hidden" name="valorPerfil" />
<br>
<input type="hidden" value="${boletin}">

<c:if test="${boletin=='sinBoletin' && periodo.nombre=='Septiembre'}">						
	<table>	
		<tr>
			<td colspan="2"><b><img src="../static/images/atencion.gif" width=10><font color="red"  size="2">¡Atención! Deberás cargar el primer trimestre completo del boletín para poder generar la entrevista de Septiembre.</font></b> </td>
		</tr>						
		<tr>
			<td colspan="2"><b><font color="red"  size="2"></font></b></td>
		</tr>	
	
	<tr><td></td></tr>
	<tr>
	<td  width="50">
		<center>
			<c:if test="${tipoPerfil == 'rr'}">
				<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listaEntrevistasAprobar.do'; return false;" />
			</c:if>
			<c:if test="${tipoPerfil == 'ea'}">
				<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
			</c:if>	
			<c:if test="${tipoPerfil == 'superUsuario'}">
					<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
			</c:if>	
		</center>
	</td>		
	</tr>
	
	</table>
</c:if>
<c:if test="${boletin=='incompleto' && periodo.nombre=='Septiembre'}">						
	<table>	
		<tr>
			<td colspan="2"><b><img src="../static/images/atencion.gif" width=10><font color="red"  size="2">¡Atención! Te faltan completar notas en el primer trimestre del boletín para poder generar la entrevista de Septiembre.</font></b> </td>
		</tr>						
		<tr>
			<td colspan="2"><b><font color="red"  size="2"></font></b></td>
		</tr>	
	
	<tr><td></td></tr>
	<tr>
	<td  width="50">
		<center>
			<c:if test="${tipoPerfil == 'rr'}">
				<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listaEntrevistasAprobar.do'; return false;" />
			</c:if>
			<c:if test="${tipoPerfil == 'ea'}">
				<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
			</c:if>	
			<c:if test="${tipoPerfil == 'superUsuario'}">
					<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
			</c:if>	
		</center>
	</td>		
	</tr>
	
	</table>
	
</c:if>
<c:if test="${periodo.nombre!='Septiembre'|| (boletin=='completo' && periodo.nombre=='Septiembre')}">
    
<div id="accordion"  style="width:90%" >
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(1)" >Datos generales</a></h3>
	<div id="datosEntrevista1"  style=" height:450px; ;overflow:scroll;"> 
		<c:if test="${entrevista.entrevistaGrupal != null}">
			<c:set var="isGrupal" value="true"></c:set>			
		</c:if>
		<c:if test="${entrevista.entrevistaGrupal == null}">
			<c:set var="isGrupal" value="false"></c:set>
		</c:if>
		<jsp:include page="/WEB-INF/pages/entrevistas/entrevistaTab1.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(2)" >Datos escolares</a></h3>
	<div id="datosEntrevista2"  style=" height:310px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/entrevistaTab2.jsp" />		  	
	</div>
	
	<h3  class="ui-accordion-header  ui-state-default ui-corner-all"  align="left" ><a href="#" onclick="mostrar(3)" >Acompañamiento</a></h3>
	<div id="datosEntrevista3"  style=" height:600px; ;overflow:scroll;">  	
		<jsp:include page="/WEB-INF/pages/entrevistas/entrevistaTab3.jsp" />		  	
	</div>
</div>

<br>
	<table align="left" id="table-botons-small" width="96%">
		<tr>
			<td  width="50">
				<center>
					<input type="button" value="En construcción" class="ui-state-default ui-corner-all"	onclick="guardar('c','${tipoPerfil}');" />
				</center>
			</td>
			<td  width="50">
				<center>
					<c:if test="${tipoPerfil == 'rr'}">
						<input type="button" value="Aprobar" class="ui-state-default ui-corner-all" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>
					<c:if test="${tipoPerfil == 'ea'}">
						<input type="button" value="Finalizar" class="ui-state-default ui-corner-all" onclick="guardarAprobar('f','${tipoPerfil}');" />
					</c:if>
					<c:if test="${tipoPerfil == 'superUsuario'}">
						<input type="button" value="A Supervisión" class="ui-state-default ui-corner-all" onclick="guardar('f','${tipoPerfil}');" />
					</c:if>					
				</center>
			</td>
			<td  width="50">
				<center>
					<c:if test="${tipoPerfil == 'superUsuario'}">
						<input type="button" value="Aprobar" class="ui-state-default ui-corner-all" onclick="guardarAprobar('s','${tipoPerfil}');" />
					</c:if>
				</center>
			</td>	
			<td  width="50">
				<center>
					<c:if test="${tipoPerfil == 'rr'}">
						<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listaEntrevistasAprobar.do'; return false;" />
					</c:if>
					<c:if test="${tipoPerfil == 'ea'}">
						<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../entrevistas/listarBecados.do'; return false;" />
					</c:if>	
					<c:if test="${tipoPerfil == 'superUsuario'}">
							<input type="button" value="Volver" class="ui-state-default ui-corner-all"	onclick="location.href='../exportacionEntrevistas/verExportarEntrevistas.do'; return false;" />
					</c:if>	
				</center>
			</td>			
			<td width="292" height="30" align="center" valign="middle">&nbsp;</td>
		</tr>
	</table>
</c:if>
<input id="idEA" type="hidden" value="${idEA}"/>
<input id="fechaActual" type="hidden" value="${fechaActual}">
<input id="isGrupal" type="hidden" value="${isGrupal}"/>
</form:form>
</div>
</body>
</html>