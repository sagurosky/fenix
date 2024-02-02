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
	var arrayPeriodos = document.getElementsByName('idPeriodo');
	var arrayMontos = document.getElementsByName('valor');

	for (i = 0; i < arrayConceptos.length; i++) {
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
</head>

<body>
<div id="main-content">
<br></br>
<form:form modelAttribute="viatico" commandName="viatico" name="reporteForm" id="reporteForm" method="post" action="guardarViatico.do">                                                                          	
<form:hidden path="id"/>	                                                                            		
<CENTER>				
	<table style="margin-left: 50px; margin-right: 50px;" >	
	<tr>
	<td>
		<!-- Titulo de la Tabla -->
		<div class="ui-state-default ui-corner-all" align="center">
		<h3 align="center">Modificaci&oacute;n de Vi&aacute;ticos</h3>
		</div>
		<!-- Fin titulo -->
		
		<table align="center" class="dataTables_wrapper" id="tabla" width="100%" border="0">
			<thead title="Detalle de Viaticos">			
				<tr>
					<th>Concepto</th>
					<th>Detalle/Comentario</th>
					<th>Periodo</th>	
					<th>Monto</th>						
				</tr>							
			</thead>
			<tbody align="center">					
				<tr>			
				<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px;" >
						<select id="idConceptoViatico" name="idConceptoViatico" class="required">																
								<c:forEach items="${listConceptoViatico}" var="conceptoViatico" >
									<c:choose>
										<c:when test="${viatico.conceptoViatico.id == conceptoViatico.id}">
											<option id="${viatico.id}" value="${viatico.conceptoViatico.id}" selected="selected">${viatico.conceptoViatico.valor}</option>
										</c:when>
										<c:otherwise>
											<option id="${viatico.id}" value="${conceptoViatico.id}">${conceptoViatico.valor}</option>
										</c:otherwise>
									</c:choose>										
								</c:forEach>
						</select>	
				</td>
				<td align="center" valign="middle" style="font-size: 14px">
					<input type="text" name="comentario" id="comentario" value="${viatico.comentario}" maxlength="60" />
				</td>
				<td align="center" valign="middle" style="font-size: 14px">
					<select id="idPeriodo" name="idPeriodo" class="required">
						<option selected="selected">Seleccione una opcion</option>
							<c:forEach var="periodo" items="${periodos}">
								<c:choose>
										<c:when test="${viatico.periodo.id == periodo.id}">
											<option value="${periodo.id}" selected="selected">${periodo.nombre}</option>
										</c:when>
										<c:otherwise>
											<option value="${periodo.id}">${periodo.nombre}</option>
										</c:otherwise>
									</c:choose>	
							</c:forEach>
					</select> 
				</td>	
				<td align="center" valign="middle" style="font-size: 14px">
					<input type="text" name="valor" id="valor" value="${viatico.valor}"  onkeypress="return validarDecimal(event, this);" class="digits required"  />
				</td>	
															
				</tr>
			</tbody>
		</table>
		<div class="ui-state-default ui-corner-all" align="center">
		<table align="center">
			<tr>					
				<td align="center" valign="middle" style="font-size: 14px">									
					<input type="button" value="Guardar" onclick="validarFormulario()" class="ui-state-default ui-corner-all"  />														 								
				</td>			
			</tr>
		</table>
		</div>
	</td>
	</tr>
	</table>
</CENTER>
<input type="hidden" name="estadoPago.id" value="${viatico.estadoPago.id}"></input>
</form:form>	
</div>
</body>
</html>