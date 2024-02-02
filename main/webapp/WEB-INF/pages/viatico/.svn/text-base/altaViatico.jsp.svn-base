<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script src="<c:url value="/static/js/jquery.alerts.js" />" type="text/javascript" ></script>
    
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Alta Viaticos</title>

<style type="text/css">
	table#tabla{
		 background-color: #C0C2FF;
		 border: 0;
	}
</style>

<script type="text/javascript">

var contadorFila = 1;

$(document).ready(function() {
	oTable = $('#tabla').dataTable( {
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
		"sDom": '<"H"l>rt<"F"ip>'
	});
	
} );
	
function agregarFila() {
	$('#tabla').dataTable().fnAddData( [
			"<input type='checkbox' name='check' id='check'/>",
			"<select id='idConceptoViatico' name='idConceptoViatico' class='required'> <option selected='selected'>Seleccione una opcion</option> <c:forEach var='conceptoViatico' items='${listConceptoViatico}'> <option value='${conceptoViatico.id}'>${conceptoViatico.valor}</option> </c:forEach> </select>",									
			"<input type='text' name='comentario' id='comentario' value='${comentario}' maxlength='60' />",
			"<select id='periodo' name='periodo' class='required'> <option selected='selected'>Seleccione una opcion</option> <c:forEach var='periodo' items='${periodos}'> <option value='${periodo.id}'>${periodo.nombre}</option> </c:forEach> </select>",		
			"<input type='text' name='valor' id='valor' value='${valor}' class='digits required' />" ] );
	
	contadorFila++;
}

function eliminarFila(){
	var checks = $(':checkbox');
	for(i = checks.length - 1; i >= 0; i--){
		if(checks[i].checked){
			oTable.fnDeleteRow(i);
		}
	}
}

function isLongitudValidaEntero(num)
{
	var numero = num.indexOf('.');
	if(numero >= 0)
	{
		var arrayOfNumber = num.split(".");
		var entero = arrayOfNumber[0];	
    	if(entero.length <= 7)
    	{
	   	 	return true;
		}
    	else
    	{
	   		return false;
    	}
	}
	else
	{
		var entero = num;	
    	if(entero.length <= 7)
    	{
	   	 	return true;
		}
    	else
    	{
	   		return false;
    	}
	}
}

function isLongitudValidaDecimal(num)
{
	var arrayOfNumber = num.split(".");
    var decimal = arrayOfNumber[1];
    if(decimal.length <= 2)
    {
	   return true;
	}
   	else
   	{
	   	return false;
   	}
}

function isLongitudValida(num)
{
	if(isLongitudValidaEntero(num))
	{
		if(num.indexOf(".") >= 0)
		{
			if(isLongitudValidaDecimal(num))
			{
				return true;
			}
			else
			{
				return false;
			}
		}	
	}
	else
	{
		return false;
	}
}

function validarFormulario(){
	var esCompleto = true;
	var validaNumeros = true;
	var noEsVacio = true;
	var isLongValida = true; 
	
	var arrayConceptos = document.getElementsByName('idConceptoViatico');
	var arrayPeriodos = document.getElementsByName('periodo');
	var arrayMontos = document.getElementsByName('valor');

	for (i = 0; i < arrayConceptos.length; i++) 
	{
		if(arrayConceptos[i].value == ""){
			esCompleto = false;
		}
		if(arrayPeriodos[i].value == ""){
			esCompleto = false;
		} 
		if(arrayMontos[i].value == ""){
			esCompleto = false;
		}
		else
		{
			if(isNaN(arrayMontos[i].value))
			{
				validaNumeros = false;
			
			}
			if(!isNaN(arrayMontos[i].value))
			{
				if(isLongitudValida(arrayMontos[i].value) == false)
				{
					isLongValida = false;
				}
			}
			else
			{
				isLongValida = true;
			}
		}
		  
	}

	var checks = $(':checkbox');
	if(checks.length == 0){
		noEsVacio = false;
	}
	
	if(noEsVacio){
		if(esCompleto){
			if(validaNumeros){
				if(isLongValida)
				{
					$("#reporteForm").submit();
				}else{
					jAlert('warning', 'La cantidad de decimales es 1 a 7 antes del caracter "." y 1 a 2 luego del mismo.', 'Atención!');
				}
			}else{
				jAlert('warning', 'Los montos deben ser números.', 'Atención!');
			}
			
		}else{
			jAlert('warning', 'Debe completar todos los campos.', 'Atención!');
		}	
	}else{
		jAlert('warning', 'Debe agregar al menos 1 viático.', 'Atención!');
	}
	
	
}

</script>


<style type="text/css">
label { width: 10em; float: left; }
label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
p { clear: both; }
.submit { margin-left: 12em; }
em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
</head>

<body>
<div id="main-content">
<br></br>
<form:form modelAttribute="viaticos" commandName="viaticos" name="reporteForm" id="reporteForm" method="post" action="guardarMultiplesViaticos.do">                                                                          	
	                                                                            		
<CENTER>				

	<table style="margin-left: 50px; margin-right: 50px;" >
	<tr>
		<td>
			<!-- Titulo de la Tabla -->
			<div class="ui-state-default ui-corner-all" >
			<h3 align="center">Carga de Vi&aacute;ticos</h3>
			</div>
			<!-- Fin titulo -->
			<table align="center" class="dataTables_wrapper" id="tabla" width="100%" border="0">
				<thead title="Detalle de Viaticos">			
						<tr>
							<th></th>
							<th>Concepto</th>
							<th>Detalle/Comentario</th>
							<th>Periodo</th>	
							<th>Monto</th>					
						</tr>							
				</thead>
				
				<tbody align="center">					
					<tr id="fila1">
						<td>
							<input type="checkbox">
						</td>
								
						<td align="center" valign="middle" style="font-size: 14px">			
								<select id="idConceptoViatico" name="idConceptoViatico" class="required">
									<option selected="selected">Seleccione una opcion</option>
									<c:forEach var="conceptoViatico" items="${listConceptoViatico}">
										<option value="${conceptoViatico.id}">${conceptoViatico.valor}</option>
									</c:forEach>
								</select>					
						</td>
						
						<td align="center" valign="middle" style="font-size: 14px">
							<input type="text" name="comentario" id="comentario" value="${comentario}" maxlength="60" />
						</td>
														
						<td align="center" valign="middle" style="font-size: 14px">
							<select id="periodo" name="periodo" class="required">
								<option selected="selected">Seleccione una opcion</option>
									<c:forEach var="periodo" items="${periodos}">
										<option value="${periodo.id}">${periodo.nombre}</option>
									</c:forEach>
							</select> 
						</td>	
						
						<td align="center" valign="middle" style="font-size: 14px">
							<input type="text" name="valor" id="valor" value="${valor}" onkeypress="return validarDecimal(event, this);" class="digits required"  />
						</td>									
					</tr>
				</tbody>
			</table>
			<!-- Pie de la Tabla -->
			<div class="ui-state-default ui-corner-all" >
				<table align="center">
					<tr>
						<td align="center" valign="middle" style="font-size: 14px">					
							<input type="button" value="Guardar" onclick="validarFormulario()" class="ui-state-default ui-corner-all" />									 								
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
						</td>
						<td align="center" valign="middle" style="font-size: 14px">
							<input type="button" value="Agregar Viatico" onclick="agregarFila()" class="ui-state-default ui-corner-all" align="right" />
						</td>
						<td>
							&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<input type="button" value="Eliminar" onclick="eliminarFila()" class="ui-state-default ui-corner-all">
						</td>						
					</tr>
				</table>
			</div>
			<!-- Fin pie -->
		</td>
	</tr>
	</table>
	
	
	
</CENTER>
</form:form>	

</div>
</body>
</html>