<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="s" uri="/softtek-fwk.tld"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="softek" uri="/softtek-fwk.tld"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		color: gray;
		font-style: italic; 
	}
	
	table#laTabla{
		 background-color: #C0C2FF;
		 border: 0;
	}
</style>

<script type="text/javascript">
$(function() {
	TableToolsInit.sSwfPath = '<c:url  value="/static/js/table/tabletools/swf/ZeroClipboard.swf"/>'
		
	oTable = $('#laTabla').dataTable( {
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>'+
		'<option value="50">50</option>'+
		'<option value="75">75</option>'+
		'<option value="100">100</option>'+
		'<option value="-1">Todos</option>'+
		'</select> registros por hoja',
		"sZeroRecords": "No se encontraron registros",
		"sInfo": "Mostrando del _START_ al _END_ de _TOTAL_ registros",
		"sInfoEmtpy": "Mostrando 0 registros",
		"sInfoFiltered": "(filtrado de _MAX_ registros totales)",
		"sSearch": "Buscar",
		"oPaginate": {
			"sFirst":    "Primera",
			"sPrevious": "Anterior",
			"sNext":     "Siguiente",
			"sLast":     "Ultima"
		}
		
		},
		"bJQueryUI": true,
		"sPaginationType": "full_numbers",
		"iDisplayLength": 25,
		"sDom": '<"H"Tl>rt<"F"ip>'
	});
});
</script>
<script type="text/javascript">
//Parche para los filtros para la seleccion multiple
	var  isMultipleSeleccion = true;

</script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/funcionesTabla.js"/>"></script>

<script type="text/javascript">
function submitForm(){
	var select = $('select option:selected');
	var array="";
	if(select.length == 0 ){
		alert("No hay escuelas para el alta de beca");					
	}else{
		for(i=1; i< select.length ; i++){
	      array+= select[i].value+"-" +select[i].id+ ";";
		}
		$("#ids").val(array);
		$("#form").submit();
		}
}
function enabledSelect(id){
	
	if ($(id).val() == 1) {
		$(id).val(2);
	} else {
		$(id).val(1);
	}
	
}
</script>
</head>
<body>
<div id="main-content">
<br>
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td style="vertical-align: top">
<div class="ui-state-default ui-corner-all" >
<h3 align="center">Listado de escuelas candidatas para la asignaci&oacute;n de becas</h3>
</div>
<div class="ui-state-default ui-corner-all" align="center">
	<table align="center">
		<tr>
			<td>
				<input type="button" value="Guardar"  onclick="submitForm()" class="ui-state-default ui-corner-all"  />
			</td>
		</tr>
	</table>
</div>
			<form action="<c:url value='/escuela/guardarSeleccionEscuelas.do'/>" method="post" id="form"  >
				<input type="hidden" name="ids" id="ids" >
							<table id="laTabla" class="dataTables_wrapper" align="center" width="100%" cellspacing="1">
								<thead align="center">
									<!-- Panel de funciones	-->
									<tr id="fxs" style="display: none;">
										<td>
											<div class="ui-state-default ui-corner-all" style="width: auto; height: 40px;">
											</div>
										</td>
										<c:forEach begin="1" end="2" var="loop">
											<td>
												<div class="ui-state-default ui-corner-all" style="height: 40px;">
													<div title="subtotalizar columna"> 
														<a href="#ancla" onclick="subtotalizarColumna(${loop})">subtotalizar</a>				
													</div>
													<div title="agrupar columna"> 
														<a href="#" onclick="agruparColumna(${loop})">agrupar</a>				
													</div>
												</div>
											</td>
										</c:forEach>
										<td>
											<div class="ui-state-default ui-corner-all" style="width: auto; height: 40px;">
											</div>
										</td>
									</tr>
									<!-- Botones para mostrar funciones	-->
									<tr>
										<c:forEach begin="0" end="3">
											<td><div class="ui-state-default ui-corner-all" title="mostrar funciones">
												<a onclick="hacerToggle()"><span class="ui-icon ui-icon-triangle-1-s"> 
												</span></a></div>
											</td>
										</c:forEach>
									</tr>
									<tr>								
										<th>Estado</th>
										<th>Escuela</th>
										<th>Zona</th>
										<th id="acciones">Acciones</th>
									</tr>
									<tr>
										<td></td>
										<td><input name="search_browser" value="Buscar" class="search_init"/></td>
										<td><input name="search_browser" value="Buscar" class="search_init"/></td>
										<td></td>
									</tr>
								</thead>
									<tbody align="center">
										<c:forEach items="${listaEscuelas}" var="escuela" varStatus="index" >
											<tr>																																												
												<td align="left" valign="middle" style="font-size: 14px">
													<select name="${escuela.id}" id="${escuela.id}" class="required">
														<c:forEach items="${listaEstadoEscuela}" var="estadoEscuela">
															<c:choose>
																	<c:when test="${escuela.estadoEscuela.id  == estadoEscuela.id}">
																		<option  id="${escuela.id}" value="${estadoEscuela.id}" selected="selected" >${estadoEscuela.valor}</option>
																		<script>
																		$('#${escuela.id}').attr('disabled', true);
																		</script>
																	</c:when>
																	<c:otherwise>
																		<option id="${escuela.id}" value="${estadoEscuela.id}">${estadoEscuela.valor}</option>
																	</c:otherwise>	
																</c:choose>
														</c:forEach>
													</select>
												</td>
												<td align="left" valign="middle" style="font-size: 14px" class="col1">&nbsp;${escuela.nombre}</td>
												<td align="left" valign="middle" style="font-size: 14px" class="col2">${escuela.localidad.nombre}</td>
												<td>
													<table>
														<tr>
														<td>
															<div  style= width:0.5cm class="ui-state-default ui-corner-all" title="cambiar estado" > 
																<a  onclick="enabledSelect('#${escuela.id}')"> 
																<span class="ui-icon ui-icon-pencil" id="span${escuela.id}"> 
																</span></a>				
															</div>
														</td>
														</tr>
													</table>
												</td>
											</tr>
										</c:forEach>
									</tbody>				
							</table>
							<div class="ui-state-default ui-corner-all" align="center">
							<table align="center">
									<tr>
										<td>
											<input type="button" value="Guardar"  onclick="submitForm()" class="ui-state-default ui-corner-all"  />
										</td>
									</tr>
							</table>
							</div>
				</form>
			</td>
		</tr>
	</table>
	<br><br>
	<a name="ancla"></a>
	<div id="contenedor" style="width: 60%;">
	
	</div>
</CENTER>		 		
</div>	
</body>
</html>