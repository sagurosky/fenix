<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    <%@ taglib uri="http://displaytag.sf.net" prefix="display" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    

<script type="text/javascript" 	src="<c:url  value="/static/js/jquery-1.11.1.min.js"/>"></script>
<script type="text/javascript" language="javascript" src="//cdn.datatables.net/1.10.7/js/jquery.dataTables.min.js"></script>


<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.7/css/jquery.dataTables.css">





    
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Listado de Candidatos</title>

<script type="text/javascript">

function popupListTS(idAlumno){
	$( "#dialog-confirm" ).dialog({
		resizable: false,
		height:160,
		width:550,
		modal: true,
		buttons: {
			"Asignar TS ": function() {
				//$( this ).dialog( "close" );
				
				enviarTS(idAlumno);
				$( this ).dialog( "close" );
			},
			"Cancelar": function() {
				$( this ).dialog( "close" );
			}
		}
	});
}	
function enviarTS(idAlumno){
	var select = document.getElementById("perfilTSSelect");
	var index = select.selectedIndex;
	var value = select.options[index].value;
	$('#idPerfilTS').val(value);
	enviarForm('asignarTS',idAlumno,'null');
	
}

$(function() {
	$("#convocatoria").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarConvocatoriaPorZonaYNombre.do?idZona=" + $("#zonaCimientosId").val(),
				dataType: "json",
				data: {
					style: "full",
					maxRows: 12,
					name_startsWith: request.term
				},
				success: function(data) {
					response($.map(data.json, function(item) {
						return {
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							ea: item.nombre
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idConvocatoria").val(ui.item.id);
			$("#convocatoria").text(ui.item.nombre);
		}
	});
});
$(function() {

	$("#zonaCimientos").keypress(function(){
		
		$("#zonaCimientosId").val(0);
		$("#zonaCimientos").autocomplete({
			source: function(request, response) {
				$.ajax({
					url: "../ajax/buscarZonaPorNombre.do",
					dataType: "json",
					data: {
						style: "full",
						name_startsWith: request.term				
					},
					success: function(data) {
						response($.map(data.zonas, function(item) {
							return {
								label: item.nombre,
								value: item.nombre,
								id: item.id
							}
						}))
					}
				})
			},
			select: function(event, ui) {
				$("#zonaCimientosId").val(ui.item.id);
				$("#convocatoria").removeAttr('disabled');
				$("#escuela").removeAttr('disabled');
			}
		});
	});

});
$(function() {
	$("#escuela").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarEscuelaSeleccionNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxResults: 12,
					name_startsWith: request.term,
					idZona:$("#zonaCimientosId").val()
				},
				success: function(data) {
					response($.map(data.escuelas, function(item) {
						return {
							label: item.nombre , 
							value: item.nombre,
							id:item.id
							
						}
					}))
				}
			})
		},
		select: function(event, ui) {
			$("#idEscuela").val(ui.item.id);
		}
	});
});
$(function() {
	$("#ts").autocomplete({
		source: function(request, response) {
			$.ajax({
				url: "../ajax/buscarPerfilTSNombre.do",
				dataType: "json",
				data: {
					style: "full",
					maxResults: 12,
					name_startsWith: request.term
					
				},
				success: function(data) {
					response($.map(data.perfilTSs, function(item) {
						return {
							label: item.nombre , 
							value: item.nombre,
							id:item.id
							
						}
					}))
				}
			})
		},
		select: function(event, ui) {
			$("#idTS").val(ui.item.id);
		}
	});
});

</script>


	
<script type="text/javascript">
function validarFiltros(){
	if($('#convocatoria').val() == ''){
		$('#idConvocatoria').removeAttr('value');
	}
	if($('#alumno').val() == ''){
		$('#alumno').removeAttr('value');
	}
	if($('#escuela').val() == ''){
		$('#idEscuela').removeAttr('value');
	}
	if($('#zonaCimientos').val() == ''){
		$('#zonaCimientosId').removeAttr('value');
	}
	if($('#ts').val() == ''){
		$('#idTS').removeAttr('value');
	}
	document.forms['reporteForm'].submit();
	
}
function enviarForm(action, id, valor){
	$('#reporteForm').removeAttr('action');
	document.forms['reporteForm'].idConvocado.value = id;
	if(action == 'asignarTS'){
		document.forms['reporteForm'].action ="<c:url value='guardarPerfilTSAlumno.do'/>";
	}else{
		document.forms['reporteForm'].action ="<c:url value='/convocado/modificarConvocado.do'/>";
	}
	document.forms['reporteForm'].idValor.value = valor;
	document.forms['reporteForm'].submit();
}
function popupRechazo(idAlumno){
	var select = document.getElementById("motivoRechazoSelect");
	var index = select.selectedIndex;
	var valor = select.options[index].value;
	$("#idMotivoRechazo").val(valor);
	$( "#dialog-confirmRechazar" ).dialog({
		resizable: false,
		height:160,
		width:550,
		modal: true,
		buttons: {
			"Enviar ": function() {
				enviarForm('null',idAlumno,'12');
				
			},
			"Cancelar": function() {
				$( this ).dialog( "close" );
			}
		}
	});
	
}
function habilitarInput(){
	if($('#zonaCimientos').val() != ''){
		$("#convocatoria").removeAttr('disabled');
		$("#escuela").removeAttr('disabled');
	}
}			
</script>

<script>
$(document).ready(function() {       
	$('#example').DataTable();
} );

</script>



</head>
<body onload="habilitarInput()">
<div class="ui-state-highlight ui-corner-all"
		style="margin-top: 10px; padding: 0 .7em; width: auto; font: normal; font-size: 13px; vertical-align: middle; height: 20px; display: none"
		id="mens" >
	<p><span class="ui-icon ui-icon-info"
		style="float: left; margin-right: .3em;"> </span> <span id="mensValue"></span></p>
</div>
<div id="main-content">
<br></br>
<center><h3>Listado de Candidatos Nuevo</h3></center>
<br></br>






<form:form modelAttribute="convocado" commandName="convocado" name="reporteForm" id="reporteForm" method="post" action="listadoDeConvocadosNuevo.do" >
<input type="hidden" name="idConvocado" id="idConvocado">
<input type="hidden" name="idValor" id="idValor">
<input type="hidden" name="idMotivoRechazo" id="idMotivoRechazo" >
<input type="hidden" name="idPerfilTS" id="idPerfilTS" >
<center>
	<fieldset style="font-size: 12px; margin-left: 60px; margin-right: 50px; width:980px;">
		<legend>Filtros de b&uacute;squeda</legend>
			<table id="table-informe" align="center" style="margin-left: 100px; margin-right: 60px; border-style:hidden;" width="600px">
					<tr align="center">
						<td align="left" style="font-size: 13px; font-weight: bold">Ciclos:</td>
						<td align="left">
							<select name="idCiclo" id="ciclo"  >
								<option value="0">Todos</option>
								<c:forEach items="${listaCiclos}" var="ciclo1">
									<c:choose>
										<c:when test="${ciclo.id == ciclo1.id}">
											<option value="${ciclo1.id}" selected="selected">${ciclo1.nombre}</option>
										</c:when>
										<c:otherwise>
											<option value="${ciclo1.id}" >${ciclo1.nombre}</option>
										</c:otherwise>
									</c:choose>
					
								</c:forEach>
							</select>
						
						</td>
						<td align="left" style="font-size: 13px; font-weight: bold">Zona Cimientos:</td>
						<td align="left">
				    		<input type="hidden" name="idZonaCimientos" id="zonaCimientosId" value="${zonaCimientos.id}" />
							<input type="text" id="zonaCimientos" value="${zonaCimientos.nombre}"  />
						</td>
					</tr>
				 	<tr align="center">
						<td align="left" style="font-size: 13px; font-weight: bold">Escuela:</td>
						<td align="left">
								<input type="hidden" name="idEscuela" 	id="idEscuela" value="${escuela.id}"/>
								<input id="escuela" type="text" name="escuela" disabled="disabled" value="${escuela.nombre}" disabled="disabled"/>
						</td>
						<td align="left" style="font-size: 13px; font-weight: bold">Convocatoria:</td>
						<td align="left">
							<input type="hidden" name="idConvocatoria" id="idConvocatoria" value="${convocatoria.idConvocatoria}" />
							<input type="text" id="convocatoria" disabled="disabled" value="${convocatoria.nombre}" />
						
						</td>
					</tr>
					<tr align="center">
						<td align="left" style="font-size: 13px; font-weight: bold">Candidato:</td>
						<td align="left">
								<input id="alumno" type="text" name="nombreAlumno" value="${nombreAlumno}" />
						</td>
						<td align="left" style="font-size: 13px; font-weight: bold">Estado: </td>
						<td align="left">
							<select 	name="idEstadoAlumno" id="estados"  >
								<option value="0">Todos</option>
								<c:forEach items="${listEstadoAlumnos}" var="estado1">
									<c:choose>
										<c:when test="${estado.id == estado1.id}">
											<option value="${estado.id}" selected="selected">${estado1.valor}</option>
										</c:when>
										<c:otherwise>
											<option value="${estado1.id}" >${estado1.valor}</option>
										</c:otherwise>
									</c:choose>
					
								</c:forEach>
							</select>
						
						</td>
						</tr>
						<tr align="center">
							<td align="left" style="font-size: 13px; font-weight: bold">TS Designado:</td>
							<td align="left">
								<input type="hidden" name="idTS" id="idTS" value="${perfilTS.idPerfilTS}" />
								<input type="text" id="ts" value="${perfilTS.datosPersonales.apellidoNombre}" />
							
							</td>
							<td align="left" style="font-size: 13px; font-weight: bold">Motivo de Visita: </td>
							<td align="left">
								<select 	name="idMotivoVisita" id="idMotivoVisita"  >
									<option value="0">Todos</option>
									<c:forEach items="${listMotivoVisita}" var="motivoVisita1">
										<c:choose>
											<c:when test="${motivoVisita.id == motivoVisita1.id}">
												<option value="${motivoVisita.id}" selected="selected">${motivoVisita.valor}</option>
											</c:when>
											<c:otherwise>
												<option value="${motivoVisita1.id}" >${motivoVisita1.valor}</option>
											</c:otherwise>
										</c:choose>
						
									</c:forEach>
								</select>
							
							</td>
							</tr>
							<tr align="center">
								<td align="left" style="font-size: 13px; font-weight: bold">Recomendaci&oacute;n TS: </td>
								<td align="left">
									<select name="idRecomendacionTS" id="idRecomendacionTS"  >
										<option value="0">Todos</option>
										<c:forEach items="${listRecomendacionTS}" var="recomendacionTS1">
											<c:choose>
												<c:when test="${recomendacionTS.id == recomendacionTS1.id}">
													<option value="${recomendacionTS.id}" selected="selected">${recomendacionTS.valor}</option>
												</c:when>
												<c:otherwise>
													<option value="${recomendacionTS1.id}" >${recomendacionTS1.valor}</option>
												</c:otherwise>
											</c:choose>
							
										</c:forEach>
									</select>								
								</td>
								<td align="left" style="font-size: 13px; font-weight: bold">Año Escolar:</td>
								<td align="left">
									<select name="idAnioEscolar" id="aniosEscolares"  >
										<option value="0">Todos</option>
										<c:forEach items="${listAniosEscolares}" var="anio1">
											<c:choose>
												<c:when test="${anio.id == anio1.id}">
													<option value="${anio.id}" selected="selected">${anio1.valor}</option>
												</c:when>
												<c:otherwise>
													<option value="${anio1.id}" >${anio1.valor}</option>
												</c:otherwise>
											</c:choose>					
										</c:forEach>
									</select>							
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
						<td colspan="5">
							<input align="middle" id="buscar" type="button" onclick="validarFiltros()" value="Buscar" class="ui-state-default ui-corner-all" ></input>
						</td>
					</tr>
			</table>
	</fieldset>
</center>
<br><br>
<CENTER style="width: 1100px;">

<table id="example" class="display" cellspacing="0" width="100%">
					<thead>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</thead>

					<tfoot>
						<tr>
							<th>Name</th>
							<th>Position</th>
							<th>Office</th>
							<th>Age</th>
							<th>Start date</th>
							<th>Salary</th>
						</tr>
					</tfoot>

					<tbody>
						<tr>
							<td>Tiger Nixon</td>
							<td>System Architect</td>
							<td>Edinburgh</td>
							<td>61</td>
							<td>2011/04/25</td>
							<td>$320,800</td>
						</tr>
						<tr>
							<td>Garrett Winters</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>63</td>
							<td>2011/07/25</td>
							<td>$170,750</td>
						</tr>
						<tr>
							<td>Ashton Cox</td>
							<td>Junior Technical Author</td>
							<td>San Francisco</td>
							<td>66</td>
							<td>2009/01/12</td>
							<td>$86,000</td>
						</tr>
						<tr>
							<td>Cedric Kelly</td>
							<td>Senior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2012/03/29</td>
							<td>$433,060</td>
						</tr>
						<tr>
							<td>Airi Satou</td>
							<td>Accountant</td>
							<td>Tokyo</td>
							<td>33</td>
							<td>2008/11/28</td>
							<td>$162,700</td>
						</tr>
						<tr>
							<td>Brielle Williamson</td>
							<td>Integration Specialist</td>
							<td>New York</td>
							<td>61</td>
							<td>2012/12/02</td>
							<td>$372,000</td>
						</tr>
						<tr>
							<td>Herrod Chandler</td>
							<td>Sales Assistant</td>
							<td>San Francisco</td>
							<td>59</td>
							<td>2012/08/06</td>
							<td>$137,500</td>
						</tr>
						<tr>
							<td>Rhona Davidson</td>
							<td>Integration Specialist</td>
							<td>Tokyo</td>
							<td>55</td>
							<td>2010/10/14</td>
							<td>$327,900</td>
						</tr>
						<tr>
							<td>Colleen Hurst</td>
							<td>Javascript Developer</td>
							<td>San Francisco</td>
							<td>39</td>
							<td>2009/09/15</td>
							<td>$205,500</td>
						</tr>
						<tr>
							<td>Sonya Frost</td>
							<td>Software Engineer</td>
							<td>Edinburgh</td>
							<td>23</td>
							<td>2008/12/13</td>
							<td>$103,600</td>
						</tr>
						<tr>
							<td>Jena Gaines</td>
							<td>Office Manager</td>
							<td>London</td>
							<td>30</td>
							<td>2008/12/19</td>
							<td>$90,560</td>
						</tr>
						<tr>
							<td>Quinn Flynn</td>
							<td>Support Lead</td>
							<td>Edinburgh</td>
							<td>22</td>
							<td>2013/03/03</td>
							<td>$342,000</td>
						</tr>
						<tr>
							<td>Charde Marshall</td>
							<td>Regional Director</td>
							<td>San Francisco</td>
							<td>36</td>
							<td>2008/10/16</td>
							<td>$470,600</td>
						</tr>
						<tr>
							<td>Haley Kennedy</td>
							<td>Senior Marketing Designer</td>
							<td>London</td>
							<td>43</td>
							<td>2012/12/18</td>
							<td>$313,500</td>
						</tr>
						<tr>
							<td>Tatyana Fitzpatrick</td>
							<td>Regional Director</td>
							<td>London</td>
							<td>19</td>
							<td>2010/03/17</td>
							<td>$385,750</td>
						</tr>
						<tr>
							<td>Michael Silva</td>
							<td>Marketing Designer</td>
							<td>London</td>
							<td>66</td>
							<td>2012/11/27</td>
							<td>$198,500</td>
						</tr>
						<tr>
							<td>Paul Byrd</td>
							<td>Chief Financial Officer (CFO)</td>
							<td>New York</td>
							<td>64</td>
							<td>2010/06/09</td>
							<td>$725,000</td>
						</tr>
						<tr>
							<td>Gloria Little</td>
							<td>Systems Administrator</td>
							<td>New York</td>
							<td>59</td>
							<td>2009/04/10</td>
							<td>$237,500</td>
						</tr>
						<tr>
							<td>Bradley Greer</td>
							<td>Software Engineer</td>
							<td>London</td>
							<td>41</td>
							<td>2012/10/13</td>
							<td>$132,000</td>
						</tr>
						<tr>
							<td>Dai Rios</td>
							<td>Personnel Lead</td>
							<td>Edinburgh</td>
							<td>35</td>
							<td>2012/09/26</td>
							<td>$217,500</td>
						</tr>
						<tr>
							<td>Jenette Caldwell</td>
							<td>Development Lead</td>
							<td>New York</td>
							<td>30</td>
							<td>2011/09/03</td>
							<td>$345,000</td>
						</tr>
						<tr>
							<td>Yuri Berry</td>
							<td>Chief Marketing Officer (CMO)</td>
							<td>New York</td>
							<td>40</td>
							<td>2009/06/25</td>
							<td>$675,000</td>
						</tr>
						<tr>
							<td>Caesar Vance</td>
							<td>Pre-Sales Support</td>
							<td>New York</td>
							<td>21</td>
							<td>2011/12/12</td>
							<td>$106,450</td>
						</tr>
						<tr>
							<td>Doris Wilder</td>
							<td>Sales Assistant</td>
							<td>Sidney</td>
							<td>23</td>
							<td>2010/09/20</td>
							<td>$85,600</td>
						</tr>
						<tr>
							<td>Angelica Ramos</td>
							<td>Chief Executive Officer (CEO)</td>
							<td>London</td>
							<td>47</td>
							<td>2009/10/09</td>
							<td>$1,200,000</td>
						</tr>
						<tr>
							<td>Gavin Joyce</td>
							<td>Developer</td>
							<td>Edinburgh</td>
							<td>42</td>
							<td>2010/12/22</td>
							<td>$92,575</td>
						</tr>
						<tr>
							<td>Jennifer Chang</td>
							<td>Regional Director</td>
							<td>Singapore</td>
							<td>28</td>
							<td>2010/11/14</td>
							<td>$357,650</td>
						</tr>
						<tr>
							<td>Brenden Wagner</td>
							<td>Software Engineer</td>
							<td>San Francisco</td>
							<td>28</td>
							<td>2011/06/07</td>
							<td>$206,850</td>
						</tr>
						<tr>
							<td>Fiona Green</td>
							<td>Chief Operating Officer (COO)</td>
							<td>San Francisco</td>
							<td>48</td>
							<td>2010/03/11</td>
							<td>$850,000</td>
						</tr>
						<tr>
							<td>Shou Itou</td>
							<td>Regional Marketing</td>
							<td>Tokyo</td>
							<td>20</td>
							<td>2011/08/14</td>
							<td>$163,000</td>
						</tr>
						<tr>
							<td>Michelle House</td>
							<td>Integration Specialist</td>
							<td>Sidney</td>
							<td>37</td>
							<td>2011/06/02</td>
							<td>$95,400</td>
						</tr>
						<tr>
							<td>Suki Burks</td>
							<td>Developer</td>
							<td>London</td>
							<td>53</td>
							<td>2009/10/22</td>
							<td>$114,500</td>
						</tr>
						<tr>
							<td>Prescott Bartlett</td>
							<td>Technical Author</td>
							<td>London</td>
							<td>27</td>
							<td>2011/05/07</td>
							<td>$145,000</td>
						</tr>
						<tr>
							<td>Gavin Cortez</td>
							<td>Team Leader</td>
							<td>San Francisco</td>
							<td>22</td>
							<td>2008/10/26</td>
							<td>$235,500</td>
						</tr>
						<tr>
							<td>Martena Mccray</td>
							<td>Post-Sales support</td>
							<td>Edinburgh</td>
							<td>46</td>
							<td>2011/03/09</td>
							<td>$324,050</td>
						</tr>
						<tr>
							<td>Unity Butler</td>
							<td>Marketing Designer</td>
							<td>San Francisco</td>
							<td>47</td>
							<td>2009/12/09</td>
							<td>$85,675</td>
						</tr>
						<tr>
							<td>Howard Hatfield</td>
							<td>Office Manager</td>
							<td>San Francisco</td>
							<td>51</td>
							<td>2008/12/16</td>
							<td>$164,500</td>
						</tr>
						<tr>
							<td>Hope Fuentes</td>
							<td>Secretary</td>
							<td>San Francisco</td>
							<td>41</td>
							<td>2010/02/12</td>
							<td>$109,850</td>
						</tr>
						<tr>
							<td>Vivian Harrell</td>
							<td>Financial Controller</td>
							<td>San Francisco</td>
							<td>62</td>
							<td>2009/02/14</td>
							<td>$452,500</td>
						</tr>
						<tr>
							<td>Timothy Mooney</td>
							<td>Office Manager</td>
							<td>London</td>
							<td>37</td>
							<td>2008/12/11</td>
							<td>$136,200</td>
						</tr>
						<tr>
							<td>Jackson Bradshaw</td>
							<td>Director</td>
							<td>New York</td>
							<td>65</td>
							<td>2008/09/26</td>
							<td>$645,750</td>
						</tr>
						<tr>
							<td>Olivia Liang</td>
							<td>Support Engineer</td>
							<td>Singapore</td>
							<td>64</td>
							<td>2011/02/03</td>
							<td>$234,500</td>
						</tr>
						<tr>
							<td>Bruno Nash</td>
							<td>Software Engineer</td>
							<td>London</td>
							<td>38</td>
							<td>2011/05/03</td>
							<td>$163,500</td>
						</tr>
						<tr>
							<td>Sakura Yamamoto</td>
							<td>Support Engineer</td>
							<td>Tokyo</td>
							<td>37</td>
							<td>2009/08/19</td>
							<td>$139,575</td>
						</tr>
						<tr>
							<td>Thor Walton</td>
							<td>Developer</td>
							<td>New York</td>
							<td>61</td>
							<td>2013/08/11</td>
							<td>$98,540</td>
						</tr>
						<tr>
							<td>Finn Camacho</td>
							<td>Support Engineer</td>
							<td>San Francisco</td>
							<td>47</td>
							<td>2009/07/07</td>
							<td>$87,500</td>
						</tr>
						<tr>
							<td>Serge Baldwin</td>
							<td>Data Coordinator</td>
							<td>Singapore</td>
							<td>64</td>
							<td>2012/04/09</td>
							<td>$138,575</td>
						</tr>
						<tr>
							<td>Zenaida Frank</td>
							<td>Software Engineer</td>
							<td>New York</td>
							<td>63</td>
							<td>2010/01/04</td>
							<td>$125,250</td>
						</tr>
						<tr>
							<td>Zorita Serrano</td>
							<td>Software Engineer</td>
							<td>San Francisco</td>
							<td>56</td>
							<td>2012/06/01</td>
							<td>$115,000</td>
						</tr>
						<tr>
							<td>Jennifer Acosta</td>
							<td>Junior Javascript Developer</td>
							<td>Edinburgh</td>
							<td>43</td>
							<td>2013/02/01</td>
							<td>$75,650</td>
						</tr>
						<tr>
							<td>Cara Stevens</td>
							<td>Sales Assistant</td>
							<td>New York</td>
							<td>46</td>
							<td>2011/12/06</td>
							<td>$145,600</td>
						</tr>
						<tr>
							<td>Hermione Butler</td>
							<td>Regional Director</td>
							<td>London</td>
							<td>47</td>
							<td>2011/03/21</td>
							<td>$356,250</td>
						</tr>
						<tr>
							<td>Lael Greer</td>
							<td>Systems Administrator</td>
							<td>London</td>
							<td>21</td>
							<td>2009/02/27</td>
							<td>$103,500</td>
						</tr>
						<tr>
							<td>Jonas Alexander</td>
							<td>Developer</td>
							<td>San Francisco</td>
							<td>30</td>
							<td>2010/07/14</td>
							<td>$86,500</td>
						</tr>
						<tr>
							<td>Shad Decker</td>
							<td>Regional Director</td>
							<td>Edinburgh</td>
							<td>51</td>
							<td>2008/11/13</td>
							<td>$183,000</td>
						</tr>
						<tr>
							<td>Michael Bruce</td>
							<td>Javascript Developer</td>
							<td>Singapore</td>
							<td>29</td>
							<td>2011/06/27</td>
							<td>$183,000</td>
						</tr>
						<tr>
							<td>Donna Snider</td>
							<td>Customer Support</td>
							<td>New York</td>
							<td>27</td>
							<td>2011/01/25</td>
							<td>$112,000</td>
						</tr>
					</tbody>
				</table>


</CENTER>
</form:form>
</div>
</body>
</html>