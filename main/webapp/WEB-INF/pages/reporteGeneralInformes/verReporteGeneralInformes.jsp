<%@page import="org.cimientos.intranet.web.controller.AutocompletarDB"%>
<%@page import="org.cimientos.intranet.modelo.ubicacion.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="mif" uri="/list-operator.tld" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function validarFiltros() {
		if($('#ea').val() == ''){
			$('#idEA').removeAttr('value');
		}
	
		if($('#rr').val() == ''){
			$('#idRR').removeAttr('value');
		}
	}

	function enviarForm(action, id, valorPerfil) {
		validarFiltros();
		//alert(valorPerfil);
		if(action=='verInforme'){
			
			document.forms['form'].action = "../reporteGeneralInformes/verInforme.do";
			document.forms['form'].accion.value = "";
			document.forms['form'].valorPerfil.value = valorPerfil;
			document.forms['form'].idInforme.value = id;
			document.forms['form'].submit();
		}
		
		else if(action=='editarInforme'){			
			document.forms['form'].action = "../reporteGeneralInformes/verInforme.do";
			document.forms['form'].accion.value = "edicion";
			document.forms['form'].valorPerfil.value = valorPerfil;
			document.forms['form'].idInforme.value = id;
			document.forms['form'].submit();
		}
		else if(action=='verEscuela'){
			document.forms['form'].action ="<c:url value='/escuela/modificarEscuela.do'/>";
			document.forms['form'].idEscuela.value = id;
			document.forms['form'].idInforme.value = id;
			document.forms['form'].submit();
		}
		else if(action=='aConstruccion'){
			document.forms['form'].action = "../reporteGeneralInformes/informeAConstruccion.do";
			document.forms['form'].idEscuela.value = id;
			document.forms['form'].idInforme.value = id;
			document.forms['form'].submit();
		}
		else if(action=='eliminar'){
			jConfirm('¿Está seguro de que desea eliminar el informe seleccionado?', 'Confirmación', function(result){
			    if (result) {
			    	jConfirm('¿Realmente está seguro de que desea eliminar el informe seleccionado?', 'Confirmación', function(resultado){
			    	    if (resultado) {
							document.forms['form'].action = "../reporteGeneralInformes/eliminarInforme.do";
							document.forms['form'].idInforme.value = id;
							document.forms['form'].submit();
					    } else {
					      return false;
					    }
			    	});
			    }
			    else {
					return false;
				}
			  });
		}
	}
</script>





<script type="text/javascript">
	function reload() {
		document.forms['form'].submit();
	}
	
	function enviarPadrinoForm(idInforme){
		var select = document.getElementById("padrinoSelect");
		var index = select.selectedIndex;
		var valor = select.options[index].value;
		
		document.forms['modificarForm'].becaId.value = valor;
		document.forms['modificarForm'].idInforme.value = idInforme;
		
		document.forms['modificarForm'].submit();
		$.blockUI();	
	}
	
	function popupPadrino(idAlumno, idCiclo, idInforme){
		//llamar a ajax y cargar los padrinos
		$.ajax({
			url: "../ajax/buscarPadrinosPorAlumno.do",
//			data: "idAlumno="+idAlumno+"&idCiclo="+idCiclo,
			data:{
				style: "full",
				idAlumno: idAlumno,
				idCiclo: idCiclo			
			},
	        success: function(datos){
	       		var options = '';
	            $.each(datos, function(val, text) {
	               	for (i=0;i<text.length;i++){
	               		options += '<option value=' + text[i].idBeca +'>'+ text[i].nombre + '</option>';                	
	            	}
	            });
	            $('#padrinoSelect').html(options);
	        }	     
		});
		$( "#dialog-confirmPadrino" ).dialog({
			resizable: false,
			height:160,
			width:550,
			modal: true,
			buttons: {
				"Guardar ": function() {
					$( this ).dialog( "close" );
					enviarPadrinoForm(idInforme);
				},
				"Cancelar": function() {
					$( this ).dialog( "close" );
				}
			}
		});
		
	}
</script>
<script type="text/javascript">
function reloadInputs(){
	if(document.getElementById("zona").value == ""){

		document.getElementById("idZona").value = "";
	}

}

function buscarInforme(){
	if($('#ea').val() == ''){
		$('#idEA').removeAttr('value');
	}

	if($('#rr').val() == ''){
		$('#idRR').removeAttr('value');
	}
	document.forms['form'].action = "../reporteGeneralInformes/verReporteGeneralInformes.do";
	document.forms['form'].submit();
	
}

function exportarInforme() {
	if($('#ea').val() == ''){
		$('#idEA').removeAttr('value');
	}

	if($('#rr').val() == ''){
		$('#idRR').removeAttr('value');
	}	
	if(document.forms['form'].tipoInformeExportar.value.substring(0,10) == "Comunicado" || 
			$("#tipoInformeId").val()=="Comunicado de NO Renovación,Comunicado de Renovación Pendiente"){
		jConfirm('Los comunicados no son exportables', 'Aviso');
	}
	else{
	
	if(document.forms['form'].tipoInformeExportar.value == "" || 
			document.forms['form'].tipoInformeExportar.value != $("#tipoInformeId").val()){
		 jConfirm('Debes seleccionar sólo un tipo de Informe', 'Aviso');
	}
	
	else{
			jConfirm('Esta tarea puede tomar varios minutos, deseas continuar?', 'Confirmación', function(result){
		    if (result) {
				if (document.forms['form'].tipoInformeExportar.value == "Ficha de Presentación"){
		    		document.forms['form'].action = "../reporteGeneralInformes/exportarInformes.do";
		    		document.forms['form'].submit();
				}
				if (document.forms['form'].tipoInformeExportar.value == "Informe de Seguimiento Nº1"){
		    		document.forms['form'].action = "../reporteGeneralInformes/exportarInformes.do";		    		
		    		document.forms['form'].submit();
				}
				if (document.forms['form'].tipoInformeExportar.value == "Informe de Seguimiento Nº2"){
		    		document.forms['form'].action = "../reporteGeneralInformes/exportarInformes.do";		    		
		    		document.forms['form'].submit();
				}
				if (document.forms['form'].tipoInformeExportar.value == "Informe de Seguimiento Nº3"){
		    		document.forms['form'].action = "../reporteGeneralInformes/exportarInformes.do";		    		
		    		document.forms['form'].submit();
				}
				if (document.forms['form'].tipoInformeExportar.value == "Informe de Cesación"){
		    		document.forms['form'].action = "../reporteGeneralInformes/exportarInformes.do";		    		
		    		document.forms['form'].submit();
				}
								
		   	} 
			else{
			      return false;
			}
			  });
			}
	}
}
</script>
<script type="text/javascript" src="<c:url value="/static/js/filtrosUtiles.js"/>"></script>

<script type="text/javascript" src="<c:url value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.widget.js"/>"></script>

<script type="text/javascript" src="<c:url value="/static/js/jquery.js"/>"></script>
<script type="text/javascript" src="<c:url value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">

<script type="text/javascript" src="<c:url value="/static/js/ui.dropdownchecklist.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/static/css/cimientos/ui.dropdownchecklist.themeroller.css"/>" type="text/css">

<script type="text/javascript" src="<c:url value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>

<link rel="stylesheet" href="<c:url value="/static/css/cimientos/multiple-select.css"/>" media="all">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.multiple.select.js"/>"></script>


<script>
        $('select').multipleSelect();
</script>


<script>

  $(function() {

    var availableTags = 
		[
			<% ArrayList<ZonaCimientos> lista = AutocompletarDB.obtenerZonas(); 
			for (ZonaCimientos zona : lista) {
				//System.out.println(1);
			%>
			 "<%= zona.getNombre() %>", 
				
			<%}%>
			"Todos"	
		];

    function split( val ) {

      return val.split( /,\s*/ );

    }

    function extractLast( term ) {

      return split( term ).pop();

    }

 

    $( "#tags" )

      // don't navigate away from the field on tab when selecting an item

      .bind( "keydown", function( event ) {

        if ( event.keyCode === $.ui.keyCode.TAB &&

            $( this ).data( "ui-autocomplete" ).menu.active ) {

          event.preventDefault();

        }

      })

      .autocomplete({

        minLength: 0,

        source: function( request, response ) {

          // delegate back to autocomplete, but extract the last term

          response( $.ui.autocomplete.filter(

            availableTags, extractLast( request.term ) ) );

        },

        focus: function() {

          // prevent value inserted on focus

          return false;

        },

        select: function( event, ui ) {

          var terms = split( this.value );

          // remove the current input

          terms.pop();

          // add the selected item

          terms.push( ui.item.value );

          // add placeholder to get the comma-and-space at the end

          terms.push( "" );

          this.value = terms.join( ", " );

          return false;

        }

      });

  });

  </script>



<script type="text/javascript">
	
	$(document).ready( function() {
	    $("#form").validate();

	    $("#cicloId").dropdownchecklist({icon: {}, width: 150 });
		$("#estadoId").dropdownchecklist({	icon: {}, 
											width: 150,
											firstItemChecksAll: true});
		$("#idZona").dropdownchecklist({icon: {}, 
										width: 200, 
										maxDropHeight: 250, 
										firstItemChecksAll: true });
		$("#idPadrino").dropdownchecklist({	icon: {}, 
											width: 200, 
											maxDropHeight: 250,
											firstItemChecksAll: true});
		$("#tipoInformeId").dropdownchecklist({	icon: {}, 
												width: 150,
												firstItemChecksAll: true});
		
	    $("#fechaDesde").datepicker({changeMonth: true, changeYear: true, yearRange:'-5:+1' });
	    $("#fechaHasta").datepicker({changeMonth: true, changeYear: true, yearRange:'-5:+1' });
	});
	
</script>

<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>

<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reporte General Informes</title>

</head>
<body onload="reloadInputs();">
<div id="main-content">
<br><br>
<center><h3>Listado de Informes</h3></center>
<br>
<form onsubmit="reloadInputs();" method="post" id="form" name="form" action="<c:url value="/reporteGeneralInformes/verReporteGeneralInformes.do"/>">
<center>	
	<fieldset style="font-size: 12px; margin-left: 50px; margin-right: 50px; width:980px;">
		<table id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">
			<tr align="center">
				<td align="left" style="font-size: 13px; font-weight: bold">Ciclo:</td>
				<td align="left">
					<select id="cicloId" name="cicloId" class="required" multiple="multiple" style="width:150px; ">
						<c:forEach var="ciclo" items="${ciclos}">
							<c:choose>
							<c:when test="${mif:contiene(cicloId, ciclo.id)}">
								<option selected="selected" id="ciclo" value="${ciclo.id}">${ciclo.nombre}</option>
							</c:when>
							<c:otherwise>
								<option id="ciclo" value="${ciclo.id}">${ciclo.nombre}</option>
							</c:otherwise>
							</c:choose>	
						</c:forEach>
	 				</select>
				</td>
				<td align="left" style="font-size: 13px; font-weight: bold">Alumno:</td>
				<td align="left">
					<input id="alumno" width="150px;" type="text" name="nombreAlumno" value="${nombreAlumno}" />
				</td>
			</tr>
			
			<tr align="center">
				<td align="left" style="font-size: 13px; font-weight: bold">Zona:</td>
				<td align="left" >
					<select id="idZona" name="idZona" multiple="multiple" style="width:150px; ">
						<c:choose>
						<c:when test="${mif:contiene(idZona, 0)}">
							<option selected="selected" id="zona" value="0">Todos</option>
						</c:when>
						<c:otherwise>
							<option id="zona" value="0">Todos</option>
						</c:otherwise>	
						</c:choose>	
	
						<c:forEach var="zona" items="${zonas}">
							<c:choose>
							<c:when test="${mif:contiene(idZona, zona.id)}">
								<option selected="selected" id="zona" value="${zona.id}">${zona.nombre}</option>
							</c:when>
							<c:otherwise>
								<option id="zona" value="${zona.id}">${zona.nombre}</option>
							</c:otherwise>	
							</c:choose>	
						</c:forEach>
	 				</select>				
	 				
	 				
				</td>
				<td align="left" style="font-size: 13px; font-weight: bold">Padrino:</td>
				<td align="left">
	
					<select id="idPadrino" name="idPadrino" multiple="multiple" style="width:150px; ">
						<c:choose>
						<c:when test="${mif:contiene(idPadrino, 0)}">
							<option selected="selected" id="padrino" value="0">Todos</option>
						</c:when>
						<c:otherwise>
							<option id="padrino" value="0">Todos</option>
						</c:otherwise>	
						</c:choose>	
	
						<c:forEach var="padrino" items="${padrinos}">
							<c:choose>
							<c:when test="${mif:contiene(idPadrino, padrino.id)}">
								<option selected="selected" id="padrino" value="${padrino.id}">${padrino.nombre}</option>
							</c:when>
							<c:otherwise>
								<option id="padrino" value="${padrino.id}">${padrino.nombre}</option>
							</c:otherwise>	
							</c:choose>	
						</c:forEach>
	 				</select>
	
				</td>
			</tr>
			
			<tr align="center">
				<td align="left" style="font-size: 13px; font-weight: bold">Tipo de Padrino:</td>
				<td align="left">
						 <select id="tipoId" name="tipoId" class="required" style="width:150px;">
							<option value="0">Todos</option>
							<c:forEach var="tipo" items="${tipos}">
								<c:if test="${tipo.id == tipoId}">
									<option selected="selected" id="tipo" value="${tipo.id}">${tipo.valor}</option>
								</c:if>
								<c:if test="${tipo.id != tipoId}">
								<option id="tipo" value="${tipo.id}">${tipo.valor}</option>
								</c:if>
							</c:forEach>
	 					</select>
				</td>		
				<td align="left" style="font-size: 13px; font-weight: bold; width: 130px; size: 200px;">Tipo de Informe:</td>
				<td align="left">
	
					<select id="tipoInformeId" name="tipoInformeId" multiple="multiple" style="width:150px; ">
						<c:choose>
						<c:when test="${mif:contiene(tipoInformeId, '0')}">
							<option selected="selected" id="tipo" value="0">Todos</option>
						</c:when>
						<c:otherwise>
							<option id="tipo" value="0">Todos</option>
						</c:otherwise>	
						</c:choose>	
	
						<c:forEach var="tipo" items="${tiposInforme}">
							<c:choose>
							<c:when test="${mif:contiene(tipoInformeId, tipo)}">
								<option selected="selected" id="tipo" value="${tipo}">${tipo}</option>
							</c:when>
							<c:otherwise>
								<option id="tipo" value="${tipo}">${tipo}</option>
							</c:otherwise>	
							</c:choose>	
						</c:forEach>
	 				</select>
	
				</td>
			</tr>
			<tr>
				<td align="left" style="font-size: 13px; font-weight: bold">Estado de Informe:</td>
				<td align="left">
					<select id="estadoId" name="estadoId" multiple="multiple" style="width:150px; ">
						<c:choose>
						<c:when test="${mif:contieneInt(estadoId, 0)}">
							<option selected="selected" id="estado" value="0">Todos</option>
						</c:when>
						<c:otherwise>
							<option id="estado" value="0">Todos</option>
						</c:otherwise>
						</c:choose>
	
						<c:forEach var="estado" items="${estados}">
							<c:choose>
							<c:when test="${mif:contieneInt(estadoId, estado.id)}">
								<option selected="selected" id="estado" value="${estado.id}">${estado.valor}</option>
							</c:when>
							<c:otherwise>
								<option id="estado" value="${estado.id}">${estado.valor}</option>
							</c:otherwise>
							</c:choose>
						</c:forEach>
	 				</select>
				</td>
				
				<td align="left" style="font-size: 13px; font-weight: bold">Año Escolar:</td>
				<td align="left" width="300">
					<select name="idAnioEscolar" id="aniosEscolares">
						<option value="0">Todos</option>
						<c:forEach items="${listAniosEscolares}" var="anioCurrent">
							<c:choose>
								<c:when test="${anioCurrent.id == anioEscolar.id}">
									<option value="${anioEscolar.id}" selected="selected">${anioCurrent.valor}</option>
								</c:when>
								<c:otherwise>
									<option value="${anioCurrent.id}">${anioCurrent.valor}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>				
				</td>				
			</tr>
			
			<tr align="center">
				<td align="left" style="font-size: 13px; font-weight: bold">EA:</td>
				<td align="left" >
					<input type="text" value="${ea}" 	id="ea" name="ea" size="21" >
					<input name="idEA" value="${idEA}" 	id="idEA" type="hidden">
				</td>
				<td align="left" width="200" style="font-size: 13px; font-weight: bold">RR:</td>
				<td align="left" width="300">
					<input type="text" 		value="${rr}" 	id="rr" 	name="rr" size="21"/>
					<input type="hidden" 	value="${idRR}" id="idRR" 	name="idRR"/>
				</td>
			</tr>
			
			<tr align="center">
				<td align="left" width="300" style="font-size: 13px; font-weight: bold">Fecha Creacion Desde:</td>
				<td align="left" width="300">
	        		<input name="fechaDesde" id="fechaDesde" class="text-input date" value="<fmt:formatDate value="${fechaDesde}" pattern="dd/MM/yyyy"/>" />dd/mm/aaaa
	        	</td>
	
				<td align="left" width="300" style="font-size: 13px; font-weight: bold">Fecha Creacion Hasta:</td>
				<td align="left" width="300">
	        		<input name="fechaHasta" id="fechaHasta" class="text-input date" value="<fmt:formatDate value="${fechaHasta}" pattern="dd/MM/yyyy"/>" />dd/mm/aaaa
	        	</td>
			</tr>
			<tr>
				<td align="left" style="font-size: 13px; font-weight: bold">EAE:</td>
				<td align="left">
					<select name="eae" id="eae" style="width:150px;">
					<c:choose>
						<c:when test="${eae == '6/6'}">
							<option value="todos">Todos</option>
							<option value="6/6" selected="selected">6/6</option>
							<option value="7/5">7/5</option>
						</c:when>
						<c:when test="${eae == '7/5'}">
							<option value="todos">Todos</option>
							<option value="6/6">6/6</option>
							<option value="7/5" selected="selected">7/5</option>
						</c:when>
						<c:otherwise>
							<option value="todos" selected="selected">Todos</option>
							<option value="6/6">6/6</option>
							<option value="7/5">7/5</option>
						</c:otherwise>
					</c:choose>
					</select>						
				</td>
			</tr>
			<tr align="center">
				<td colspan="4">
					<input align="middle" id="buscar" type="button" onclick="buscarInforme()" value="Buscar" class="ui-state-default ui-corner-all" ></input>
				</td>
			</tr>
			
		</table>
	</fieldset>
</center>
<br><br>

<center>
<display:table class="displayTags_wrapper" export="true"  style="font-size: 12px; margin-left: 0px; margin-right: 0px;width:1100px; background-color: #C0C2FF;" id="listaInformes" name="listaInformes" requestURI="" pagesize="50" >  
    <display:column property="cicloActual"   style="width: 5%" title="Ciclo Lectivo"  />  
    <display:column property="anioEscolar"   style="width: 5%" title="Año Escolar"  /> 
    <display:column property="eae"   style="width: 5%" title="EAE"  />
    <display:column title="Alumno" media="excel"> 
    	${listaInformes.apellidoAlumno}, ${listaInformes.nombreAlumno}
    </display:column>
 	<display:column headerClass="sortable" title="Alumno" media="html">
		 ${listaInformes.apellidoAlumno}, ${listaInformes.nombreAlumno}
    <div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Detalle Alumno">
			<a  href="<c:url value='/fichaAlumno/fichaAlumnoView.do?idAlumno=${listaInformes.idAlumno}&urlRegreso=/reporteGeneralInformes/verReporteGeneralInformes.do'/>"> 
				<span class="ui-icon ui-icon-search" ></span>
			</a>		
		</div>
	</display:column>
	<display:column headerClass="sortable" title="Escuela" media="excel">
		${listaInformes.escuelaNombre}
	</display:column>
    <display:column headerClass="sortable" title="Escuela" media="html">
    	${listaInformes.escuelaNombre}
		<div style= width:0.5cm class="ui-state-default ui-corner-all" > 
			<a onclick="enviarForm('verEscuela','${listaInformes.idEscuelaAlumno}','${tipoPerfil}')"> 
				<span class="ui-icon ui-icon-search" title="Ver Ficha Escuela"></span>
			</a>				
		</div>		
	</display:column>
    <display:column property="zona"  headerClass="sortable" title="Zona" />
	<display:column property="rr"  headerClass="sortable" title="RR" />
	<display:column property="ea"  headerClass="sortable" title="EA" />
    <display:column property="tipoPadrino"  headerClass="sortable" title="Tipo Padrino" />
    <display:column headerClass="sortable"  property="padrino"  title="Padrino" media="excel"/>	   
	 <display:column headerClass="sortable" title="Padrino" media="html">	   
    	${listaInformes.padrino}
		<sec:authorize access="hasRole('SuperUsuario')">
			<div style="width:0.5cm" class="ui-state-default ui-corner-all" title="Modificar Padrino">
				<a onclick="popupPadrino('${listaInformes.idAlumno}','${listaInformes.cicloInforme}','${listaInformes.id}')"> 
					<span class="ui-icon ui-icon-pencil" ></span>
				</a>		
			</div>
		</sec:authorize>
    </display:column>
    <display:column property="tipoInforme" title="Tipo Informe" headerClass="sortable" />
    <display:column property="estadoInforme"  headerClass="sortable" title="Estado Informe" />
    <display:column property="fechaCreacion"  headerClass="sortable" title="Fecha Creación" />
    <display:column  headerClass="sortable" title="Fecha Ultimo Cambio Estado" property="fechaUltimoCambioEstado" >
    	
    	
    	
    	
    	
    </display:column>	
    
    
    <display:column property="fechaEnvio"  headerClass="sortable" title="Fecha Envío" />	
    <display:column media="html"  headerClass="sortable" title="Acciones">
    <c:if test="${listaInformes.tipoInforme != 'Comunicado de Renovación Pendiente' && listaInformes.tipoInforme != 'Comunicado de NO Renovación'}">
    <table>
		<tr>
			<td>
				<div  style="width:0.5cm" class="ui-state-default ui-corner-all">  
					<a onclick="enviarForm('verInforme','${listaInformes.id}','${tipoPerfil}')" title="Informe">  
						<img src="../static/images/lupa.jpg" width=15 style="border:none;" title="Ver Informe">
					</a>
				</div>
			</td>
			<sec:authorize access="hasRole('DI') or hasRole('SYS') or hasRole('SuperUsuario') or hasRole('RR') or hasRole('EA')">
				
					<td>
						<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
							<a onclick="enviarForm('editarInforme','${listaInformes.id}','superUsuario')" title="Informe">   
								<img src="../static/images/editar.png" width=15 style="border:none;" title="Editar Informe">
							</a>				
						</div>
					</td>
					<td>
						<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
							<a onclick="enviarForm('aConstruccion','${listaInformes.id}','superUsuario')" title="A Construcción">   
								<img src="../static/images/construccion.png" width=15 style="border:none;" title="a Construcción">
							</a>				
						</div>
					</td>
				
			</sec:authorize>	
			<sec:authorize access="hasRole('SuperUsuario') or hasRole('SEL') or hasRole('RR')">			
				<c:if test="${listaInformes.tipoInforme == tipoInformeFP && listaInformes.estadoInforme != estadoInformeEnviado}">
					<td>
						<div style= width:0.75cm class="ui-state-error ui-corner-all" >			 
							<a  onclick="enviarForm('eliminar','${listaInformes.id}','superUsuario')" > 
								<img src="../static/images/eliminar.jpg" width=15 style="border:none;" title="Eliminar Informe">
							</a>				
						</div>
					</td>
				</c:if>
			</sec:authorize>
			<sec:authorize access="hasRole('SuperUsuario') or hasRole('RR')">			
				<c:if test="${listaInformes.tipoInforme != tipoInformeFP && listaInformes.estadoInforme != estadoInformeEnviado}">
					<td>
						<div style= width:0.75cm class="ui-state-error ui-corner-all" >							
							<a  onclick="enviarForm('eliminar','${listaInformes.id}','superUsuario')" > 
								<img src="../static/images/eliminar.jpg" width=15 style="border:none;" title="Eliminar Informe">
							</a>				
						</div>		
					</td>
				</c:if>
			</sec:authorize>			
		</tr>
	</table>
	</c:if>
	<c:if test="${listaInformes.tipoInforme == 'Comunicado de Renovación Pendiente' || listaInformes.tipoInforme == 'Comunicado de NO Renovación'}">
	    <table>
			<tr>
				<sec:authorize access="hasRole('SuperUsuario') or hasRole('RR')" >			
					<c:if test="${listaInformes.estadoInforme != estadoInformeEnviado}">
						<td>
							<div style= width:0.75cm class="ui-state-error ui-corner-all" >							
								<a  onclick="enviarForm('eliminar','${listaInformes.id}','superUsuario')" > 
									<img src="../static/images/eliminar.jpg" width=15 style="border:none;" title="Eliminar Informe">
								</a>				
							</div>		
						</td>
					</c:if>
				</sec:authorize>			
			</tr>
		</table>
	</c:if>
    </display:column>    
    <display:setProperty name="basic.empty.showtable" value="true" />  
    <display:setProperty name="paging.banner.group_size" value="35" />  
    <display:setProperty name="paging.banner.item_name" value="informe" />  
    <display:setProperty name="paging.banner.items_names" value="listaInformes" />  
    <display:setProperty name="paging.banner.onepage" value=" " />
    <display:setProperty name="export.excel.filename" value="listaInformes.xls" />
    	
  	
</display:table>
<table align="center">
<tr>
<td>

<input align="middle" id="exportar" type="button" onclick="exportarInforme()" value="Export. especial" class="ui-state-default ui-corner-all" ></input>
</td>
</tr>
</table>
</center>
<c:if test="${size != 0}">
	<input type="hidden" name="idInforme" value="${listaInformes.id}"></input>
	<input type="hidden" name="accion"></input>
	<input type="hidden" name="urlRegreso" value="/reporteGeneralInformes/verReporteGeneralInformes.do"></input>
	<input type="hidden" name="idEscuela" id="idEscuela">
	<input type="hidden" name="tipoInformeExportar" id="tipoInformeExportar" value="${tipoInformeExportar}">
	<input type="hidden" name="valorPerfil"/>

</c:if>
</form>
</div>
<div id="dialog-confirmPadrino" title="Modificar Padrino" style="display: none">
	<form id="modificarForm" name="modificarForm" action="<c:url value="/reporteGeneralInformes/modificarPadrino.do"/>" method="post">
		<input type="hidden" name="idInforme" id="idInforme" >
		<input type="hidden" name="becaId" id="becaId" >
		<div id="left-content">
		    <table border="0" align="left" cellpadding="0" cellspacing="0">
				<tr>
				<td>
					<span>Selecci&oacute;n Padrino </span>
				</td>
				</tr>
				<tr>
					<td width="300">
						<select id="padrinoSelect" >
						</select>
					</td>
				</tr>
		 	</table>      
		</div>	
	</form>
</div>
<center>
</center>
</body>
</html>