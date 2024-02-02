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
		<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
		<link rel="stylesheet" href="<c:url value="/static/css/displaytags.css"/>" media="all">
		<script type="text/javascript">
			
			$(document).ready( function() {
			    $("#form").validate();
	
			    $("#cicloId").dropdownchecklist({icon: {}, width: 150 });
				$("#tipoInformeId").dropdownchecklist({	icon: {}, 
														width: 150,
														firstItemChecksAll: true});		
				$("#tipoMailId").dropdownchecklist({	icon: {}, 
														width: 150,
														firstItemChecksAll: true});		
			    $("#fechaDesde").datepicker({changeMonth: true, changeYear: true, yearRange:'-5:+1' });
			    $("#fechaHasta").datepicker({changeMonth: true, changeYear: true, yearRange:'-5:+1' });
			    $("#idsMotivoNoRenovacion").dropdownchecklist({icon: {}, 
			    												width: 150, 
			    												maxDropHeight: 150, 
			    												firstItemChecksAll: true});
			    $("#idsMotivoPendiente").dropdownchecklist({icon: {}, 
			    											width: 150, 
			    											maxDropHeight: 150, 
			    											firstItemChecksAll: true}); 
			    
 				$("#tipoInformeId").change(function(){
					var misValores = $("#tipoInformeId").val();
					if (misValores!=null){
						if (misValores.length == 1){
							if (misValores[0] == '${comunicadoNoRenovacion}'){
							    $("#idsMotivoNoRenovacion").dropdownchecklist('enable');
				
							    $("#idsMotivoPendiente").dropdownchecklist('disable');
							    $("#idsMotivoPendiente option:selected").attr('disabled','disabled');
							    
							} else if (misValores[0]=='${comunicadoRenovacionPendiente}'){
							    $("#idsMotivoPendiente").dropdownchecklist('enable');
							    
							    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
							    $("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled');
							}
						} else {
						    $("#idsMotivoPendiente").dropdownchecklist('disable');
						    $("#idsMotivoPendiente option:selected").attr('disabled','disabled');
							
						    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
						    $("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled');
						}
					} else {
					    $("#idsMotivoPendiente").dropdownchecklist('disable');
					    $("#idsMotivoPendiente option:selected").attr('disabled','disabled');
						
					    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
					    $("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled');
					}
				}); 
			});
			
  			function disableAndDisabledRenovacion(){  				
  				if(${tipoInformeExportar != null}){
  					if(${tipoInformeExportar == 'Comunicado de NO Renovación'}){
		 					$("#idsMotivoNoRenovacion").dropdownchecklist('enable');
		 					
		 					$("#idsMotivoPendiente").dropdownchecklist('disable');			    
						    $("#idsMotivoPendiente option:selected").attr('disabled','disabled');
  					}
  					else{
  						if(${tipoInformeExportar == 'Comunicado de Renovación Pendiente'}){
		 					$("#idsMotivoPendiente").dropdownchecklist('enable');	
  			 					
  			 				$("#idsMotivoNoRenovacion").dropdownchecklist('disable');
 		 					$("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled');
  						}
  						else{
  							$("#idsMotivoPendiente").dropdownchecklist('disable');			    
						    $("#idsMotivoPendiente option:selected").attr('disabled','disabled');
						    
						    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
		 					$("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled');
  						}
  					}  						
	  			}
  				else{
  					$("#idsMotivoPendiente").dropdownchecklist('disable');			    
				    $("#idsMotivoPendiente option:selected").attr('disabled','disabled');
				    
				    $("#idsMotivoNoRenovacion").dropdownchecklist('disable');
 					$("#idsMotivoNoRenovacion option:selected").attr('disabled','disabled');
  				}  				
 			}  

			function enviarForm(action, id) {
				if(action=='alta'){
					document.forms['form'].action = "../textos/altaTextoView.do";
				}
				else{
					document.forms['form'].action = "../textos/editarTextoView.do";
					document.forms['form'].idTexto.value = id;
					document.forms['form'].accion.value = "Modificación";			
				}
				document.forms['form'].submit();
			}
	
			
			function reload() {
				document.forms['form'].submit();
			}
			
			function buscarTexto(){
				document.forms['form'].action = "../textos/verTextosMailView.do";
				document.forms['form'].submit();				
			}
			
			function popupVer(id){
			
				//llamar a ajax y cargar el mail
				$.ajax({
					url: "../ajax/generarVisualizacionMail.do",
					data:{
						style: "full",
						idTexto: id  			
					},
			        success: function(datos){			   
			       		$('#div_dinamico').html(datos.mail);
			        }	     
				});
				
				$("#dialog-visualizacion").dialog({
					resizable: true,
					height:400,
					width:550,
					modal: true,
					buttons: {
						"Cerrar": function() {
							$( this ).dialog( "close" );
						}
					}
				});
				
			}
		</script>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Reporte de Textos</title>
	</head>
	<body onload="disableAndDisabledRenovacion()">
		<div id="main-content">
			<br><br>
			<center><h3>Listado de Textos</h3></center>
			<br>
			<form method="post" id="form" name="form" action="<c:url value="/texto/verTextosMailView.do"/>">
				<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">					
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
																
						<tr align="center">
							<td align="left" style="font-size: 13px; font-weight: bold">Usuario:</td>
							<td align="left">
								<input id="usuario" width="150px;" type="text" name="usuario" value="${usuario}" />
							</td>
							<td align="left" style="font-size: 13px; font-weight: bold; width: 130px; size: 200px;">Tipo de Mail:</td>
							<td align="left">					
								<select id="tipoMailId" name="tipoMailId" multiple="multiple" style="width:150px; ">
									<c:choose>
									<c:when test="${mif:contiene(tipoMailId, '0')}">
										<option selected="selected" id="tipoMail" value="0">Todos</option>
									</c:when>
									<c:otherwise>
										<option id="tipoMail" value="0">Todos</option>
									</c:otherwise>	
									</c:choose>	
				
									<c:forEach var="tipoMail" items="${tiposMail}">
										<c:choose>
										<c:when test="${mif:contiene(tipoMailId, tipoMail)}">
											<option selected="selected" id="tipoMail" value="${tipoMail}">${tipoMail}</option>
										</c:when>
										<c:otherwise>
											<option id="tipoMail" value="${tipoMail}">${tipoMail}</option>
										</c:otherwise>	
										</c:choose>	
									</c:forEach>
				 				</select>				
							</td>					
						</tr>
						
 						<tr align="center">
							<td align="left" style="font-size: 13px; font-weight: bold">M. No Renovación:</td>
							<td align="left">
								<select id="idsMotivoNoRenovacion" name="idsMotivoNoRenovacion"  multiple="multiple" style="width:150px;">
									<c:choose>
										<c:when test="${mif:contieneInt(idsMotivoNoRenovacion, 0)}">
											<option selected="selected" id="item" value="0">Todos</option>
										</c:when>
										<c:otherwise>
											<option id="item" value="0">Todos</option>
										</c:otherwise>
									</c:choose>
				
									<c:forEach var="item" items="${motivosNoRenovacion}">
										<c:choose>
										<c:when test="${mif:contieneInt(idsMotivoNoRenovacion, item.id)}">
											<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
										</c:when>
										<c:otherwise>
											<option id="item" value="${item.id}">${item.valor}</option>
										</c:otherwise>
										</c:choose>
									</c:forEach>
				 				</select>
							</td>
						<td align="left" style="font-size: 13px; font-weight: bold; width: 130px; size: 200px;">M. Renov. Pend.:</td>
							<td align="left">					
								<select id="idsMotivoPendiente" name="idsMotivoPendiente"  multiple="multiple" style="width:150px;">
									<c:choose>
									<c:when test="${mif:contieneInt(idsMotivoPendiente, 0)}">
										<option selected="selected" id="item" value="0">Todos</option>
									</c:when>
									<c:otherwise>
										<option id="item" value="0">Todos</option>
									</c:otherwise>
									</c:choose>
				
									<c:forEach var="item" items="${motivosPendiente}">
										<c:choose>
										<c:when test="${mif:contieneInt(idsMotivoPendiente, item.id)}">
											<option selected="selected" id="item" value="${item.id}">${item.valor}</option>
										</c:when>
										<c:otherwise>
											<option id="item" value="${item.id}">${item.valor}</option>
										</c:otherwise>
										</c:choose>
									</c:forEach>
				 				</select>		
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
						<tr align="center">
							<td colspan="4">
								<input align="middle" id="buscar" type="button" onclick="buscarTexto()" value="Buscar" class="ui-state-default ui-corner-all" ></input>
							</td>
						</tr>										
					</table>
				</fieldset>
				<br><br>
				<CENTER style="width: 1100px;">
					<sec:authorize access="hasRole('CPBE') or hasRole('SYS') or hasRole('SuperUsuario') or hasRole('DI')">
						<table align="center" width="150px" >
							<tr>
								<td >
									<input align="middle"  id="buscar" style="width:60px;height:23px;font-size: 15px" class="ui-state-default ui-corner-all" type="button" value="Alta"  onclick="enviarForm('alta','')" ></input>
								</td>
							</tr>
						</table>	
					</sec:authorize>	
					<br>
					<display:table class="displayTags_wrapper" export="true" id="listaTextos" name="listaTextos" requestURI="" pagesize="50" 
						style="font-size: 12px; margin-left: 0px; margin-right: 0px;width:1000px; background-color: #C0C2FF;">  
						<display:column property="id" title="Id Texto" media="excel" />  
					    <display:column property="cicloPrograma.nombre" style="width: 5%" maxLength="5" headerClass="sortable" title="Ciclo Programa"  />  
					    <display:column property="tipoInforme" style="width: 20%" maxLength="30" headerClass="sortable" title="Tipo Informe"  />  
					    <display:column property="motivoNoRenovacion.valor" style="width: 15%" maxLength="30" headerClass="sortable" title="M. No Renovación"/>  
					   	<display:column property="motivoPendiente.valor" style="width: 15%" maxLength="30" headerClass="sortable" title="M. Renov. Pend"/> 
					   	<display:column property="tipoMail" style="width: 10%" maxLength="10" headerClass="sortable" title="Tipo Mail"  /> 
						<display:column headerClass="sortable" style="width: 15%" maxLength="40"  title="Usuario" > 
							${listaTextos.usuario.apellido}, ${listaTextos.usuario.nombre}
						</display:column>
					    <display:column property="fechaCreacion"  style="width: 7%" maxLength="10" headerClass="sortable" title="Fecha Creación" format="{0,date,dd/MM/yyyy}"/>
					    <display:column property="fechaModicacion"   style="width: 7%" maxLength="10" headerClass="sortable" title="Fecha Modificación" format="{0,date,dd/MM/yyyy}"/>
					    <display:column media="html"  headerClass="sortable"  style="width: 6%" title="Acciones">
							<table>
								<tr>									
									<sec:authorize access="hasRole('CPBE') or hasRole('SYS') or hasRole('SuperUsuario') or hasRole('DI')">
										<td>
											<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
												<a onclick="enviarForm('editarTexto','${listaTextos.id}')" title="Editar Texto Mail">   
													<span class="ui-icon ui-icon-pencil" title="Editar Texto Mail"></span>
												</a>				
											</div>
										</td>	
									</sec:authorize>									
									<td>
										<div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
											<a onclick="popupVer('${listaTextos.id}')" title="Pre-visualización">   
												<span class="ui-icon ui-icon-print" title="Pre-visualización"></span>
											</a>				
										</div>
									</td>														
								</tr>
							</table>
					    </display:column>    
					    <display:column property="destinatario" title="Destinatario" media="excel" />  
					    <display:column property="cuerpo" title="Cuerpo" media="excel" />  
					    <display:column property="firma" title="Firma" media="excel" /> 
					     
					    <display:setProperty name="basic.empty.showtable" value="true" />  
					    <display:setProperty name="paging.banner.group_size" value="35" />  
					    <display:setProperty name="paging.banner.item_name" value="textoMails" />  
					    <display:setProperty name="paging.banner.items_names" value="listaTextos" />  
					    <display:setProperty name="paging.banner.onepage" value=" " />
					    <display:setProperty name="export.excel.filename" value="listaTextosMails.xls" />
					</display:table>
				</center>
				<c:if test="${size != 0}">
					<input type="hidden" name="idTexto" value="${listaTextos.id}"></input>
					<input type="hidden" name="accion"></input>
					<input type="hidden" name="urlRegreso" value="/texto/verTextosMail.do"></input>
				</c:if>
				<div id="dialog-visualizacion" title="Pre-visualización" style="display: none">			
					<div id="left-content">
					    <table border="0" align="left" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<div name="div_dinamico" id="div_dinamico"></div>  
								</td>
							</tr>
					 	</table>      
					</div>			
				</div>
			</form>
		</div>
	</body>
</html>