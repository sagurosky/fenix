<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"
	media="all">

<script type="text/javascript">
var index=19999;
//Variables globales para la validacion de zonas repetidas
var error = false;
var sel= false;
var valueZona;
var arregloError = new Array();
var e = 0;
//fin variables

function autoCompleteZona(index,idPeriodo){
	sel=false; 
	arrayZonaMod = new Array();
	var array = document.getElementsByName('zona');
	var i = 0;
	for(i ; i < array.length;i++){
	arrayZonaMod.push(array[i].value);
	} 
	$('#zona'+index).autocomplete({
		source: function(request, response) {
					$.ajax({
						url: "../ajax/buscarZonaPorNombre.do",
						dataType: "json",
						data: {
							style: "full",
							maxRows: 15,
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
					});
					sel=false; 
				},
				minLength: 2,
				select: function(event, ui) {
					valueZona = ui.item.value;
					$('#idZona'+index).val(ui.item.id);
					var direccion = "../ajax/buscarBecasCesadasDisponerEgreso.do?idZona=" + ui.item.id + "&idPeriodo="+idPeriodo;
					$.ajax({

						type: "POST",
						cache: false,
						url: direccion,
						dataType: "json", 
						processData: false,
						success: function(data){
						//	$("#becadoCes"+index).append("<b>"+data.becasCesadas+"</b>");
						//	$("#becadosADis"+index).append("<b>"+data.becasADisponerEgreso+"</b>");
							$("#becadoCesHidden"+index).val(data.becasCesadas);
							$("#becadosADisHidden"+index).val(data.becasADisponerEgreso);
							
							
						}

					});
					sel=true; 
					
				},
				
				
				open: function() {
					$(this).removeClass("ui-corner-all").addClass("ui-corner-top");
				},
				close: function() {
					$(this).removeClass("ui-corner-top").addClass("ui-corner-all");
					if(error){
						$('#divErrorZona'+index).remove();
					}
					validarZona(valueZona,index);
				}
			});
}	
/**
 * Esta funcion es para generar los input dinamicamente
 */
function generarInput(filaZona,filaCantidadBeca,divEliminar,idPeriodo,filaBecadosCesados,filaBecadosADisponer){
	
	
	
	var zonaHtml ='<tr id="trZona'+index+'" ><td><input type="text" class="required"  name="zona" id="zona'+index+'">'+ 		
			  '<input type="hidden"  name="idZona" id="idZona'+index+'" ></td>'+
			  '<td><div id="errorZona'+index+'"></div></td>';
	
	var eliminarHtml = "<td><a style=\"height: 20px; vertical-align: middle;\" id=\"eliminar"+index+"\" onclick=\"eliminarInput('"+index+"','"+filaZona+"','"+filaCantidadBeca+"','false')\">"+'<span class="ui-icon ui-icon-minusthick" ></span></a></td></tr>';
	
	var becadosCesadosHtml = '<tr id=\"trBecadoCesHidden'+index+'\"><td><input type=\"text\" name=\"cantidadBecasCesadas\" id=\"becadoCesHidden'+index+'\" disabled=\"disabled \"></td></tr>';
	var becadosADisponerEgresoHtml = '<tr id=\"trBecadosADisHidden'+index+'\"><td><input type=\"text\" name=\"cantidadBecasDisponiblesPorEgreso\" id=\"becadosADisHidden'+index+'\" disabled=\"disabled \"></td></tr>';
		
	$(filaZona).append(zonaHtml + eliminarHtml);
	$(filaCantidadBeca).append('<tr id="trCantidadBecas'+index+'"><td><input type="text" name="cantidadBecas" class="required digits" id="cantidadBecas'+index+'"></td></tr>');
	$(filaBecadosCesados).append(becadosCesadosHtml);
	$(filaBecadosADisponer).append(becadosADisponerEgresoHtml);
	
	//Propiedades de autoCompletar
	autoCompleteZona(index,idPeriodo);
	
	//Contador de input
	index++;

	
}
//Esta funcion se llama cuando se tiene modificar inputs 
function callDeleteInput(filaZona,filaCantidadBeca,idInputs,modificar){
	var idObj =$('#idObjetivoSeleccion'+idInputs).val();
	$('#divIdObjDelete').append('<input type="hidden" name="idObjetivoDelete" value="'+idObj+'" />');
	eliminarInput(idInputs,filaZona,filaCantidadBeca,modificar);
}

function verificaError(indexInput){
	var i=0;
	for(i ; i < arregloError.length; i++){
	 if( indexInput == arregloError[i]){
		e = e - 1;
		delete arregloError[i];
		break;
		}
	}
}

function eliminarInput(idInputs,filaZona,filaCantidadBeca,modificar){
	
	$('#trBecadoCesHidden'+idInputs).remove();
	$('#trBecadosADisHidden'+idInputs).remove();
	$('#trCantidadBecas'+idInputs).remove();
	$('#trZona'+idInputs).remove();
	$('#zona'+idInputs).remove();
	$('#idZona'+idInputs).remove();
	$('#cantidadBecas'+idInputs).remove();
	$('#eliminar'+idInputs).remove();
	$('#becadoCesHidden'+idInputs).remove();
	$('#becadosADisHidden'+idInputs).remove();
	verificaError(idInputs);
	
		
}
	</script>


<script type="text/javascript"><!--

var oTable;
var asInitVals = new Array();
//variable para la carga de zonas, cuando se quiera modificar las mismas
var arrayZonaMod = null ;

$(document).ready(function() {
	$('#reporteForm').validate();
	
	//Esto es para validar las zonas, cuando se modifica las mismas
	if(${isAltaObjetivoSeleccion} == false){
		arrayZonaMod = new Array();
		var array = document.getElementsByName('zona');
		var i = 0; 
		for(i ; i < array.length;i++){
			arrayZonaMod.push(array[i].value);
		}
	}
	oTable = $('#tabla1').dataTable( {
		"sDom": '<"H"Tl>rt<"F"ip>',
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
		"aoColumnDefs": [  
			{ "bSortable": false, "aTargets": [ 0 ] },
			{ "bSortable": false, "aTargets": [ 1 ] },
			{ "bSortable": false, "aTargets": [ 2 ] },
			{ "bSortable": false, "aTargets": [ 3 ] },
			{ "bSortable": false, "aTargets": [ 4 ] },
			{ "bSortable": false, "aTargets": [ 5] }
			]
	});

} );

--></script>
<script type="text/javascript">


function enviarForm(action, idPeriodo,idCiclo){
	if(e!=0 && action != 'volver'){
		 jAlert('warning', 'Tiene zonas repetidas o vacías', 'Atención!');
		return ;
	}
	if(action == 'modificar'){
		document.forms['reporteForm'].action = '<c:url value="/objetivoSeleccion/modificarObjetivoSeleccion.do"/>';
		document.forms['reporteForm'].idPeriodo.value = idPeriodo;
		document.forms['reporteForm'].idCiclo.value =idCiclo;
		$("input").removeAttr("disabled");
		$('#reporteForm').submit();
		return;
	}
	if(action == 'enviar'){
		document.forms['reporteForm'].idPeriodo.value = idPeriodo;
		document.forms['reporteForm'].idCiclo.value =idCiclo;
		document.forms['reporteForm'].action = '<c:url value="/objetivoSeleccion/guardarObjetivoSeleccion.do"/>';
		$("input").removeAttr("disabled");
		$('#reporteForm').submit();
		return;
	}
	if(action == 'volver'){
		document.forms['reporteForm'].action = '<c:url value="/objetivoSeleccion/listaObjetivoSeleccionAnioActual.do"/>';
		document.forms['reporteForm'].submit();
		return; 
	}
}
/**
 * Esta funcion valida que las zona no esten repetidas;
 */
function validarZona(value,indexInput){
	var arrayZonas = document.getElementsByName('zona');
	var i=1;
	var k=0;
	if(arrayZonaMod != null ){
			if (!sel){
				$("#errorZona"+indexInput).append('<div id="divErrorZona'+indexInput+'">Este campo es requerido</div>');
				//Variable global para el manejo de errorres
				document.getElementById("zona"+indexInput).value="";
				error = true;
				verificaError(indexInput);
				e = e + 1;
				arregloError.push(indexInput);
				arrayZonaMod = new Array();
				var array = document.getElementsByName('zona');
				var i = 0; 
				for(i ; i < array.length;i++){
					arrayZonaMod.push(array[i].value);
				}
				
			}else{
				var array = document.getElementsByName('zona');
				for(k; k < arrayZonaMod.length ; k++ ){
				var valueZonaMod = arrayZonaMod[k];
				if(value == valueZonaMod){
					$("#errorZona"+indexInput).append('<div id="divErrorZona'+indexInput+'">Zona repetida</div>');
						//Variable global para el manejo de errorres
						error = true;
						verificaError(indexInput);
						e = e + 1;
						arregloError.push(indexInput); 
						break;
				}else{
					verificaError(indexInput);
					error = false;
				}
			}
		}
		if(error==false){
			var i = 0; 
			arrayZonaMod = new Array();
			for(i ; i < array.length ;i++){
				arrayZonaMod.push(array[i].value);
			}
			arrayZonaMod[indexInput] = value;
		}
	}else{
		if(arrayZonas.length > 1  ){
			if(!sel){
				$("#errorZona"+indexInput).append('<div id="divErrorZona'+indexInput+'">Este campo es requerido</div>');
				//Variable global para el manejo de errorres
				document.getElementById("zona"+indexInput).value="";
				error = true;
				verificaError(indexInput);
				e = e + 1;
				arregloError.push(indexInput);
				arrayZonas = new Array();
				var array = document.getElementsByName('zona');
				var i = 0; 
				for(i ; i < array.length;i++){
					arrayZonas.push(array[i].value);
				}
			}else{
				for(i ; i < arrayZonas.length ; i++){
					var valueZona = arrayZonas[parseInt(i-1)].value;
						if(value == valueZona){
							$("#errorZona"+indexInput).append('<div id="divErrorZona'+indexInput+'">Zona repetida</div>');
							//Variable global para el manejo de errorres
							error = true;
							verificaError(indexInput);
							e = e + 1;
							arregloError.push(indexInput);
							break;
								
						}else{
							verificaError(indexInput);
							error = false;
							}
						}
				}
		}else{
			if(!sel){
				$("#errorZona"+indexInput).append('<div id="divErrorZona'+indexInput+'">Zona repetida</div>');
					//Variable global para el manejo de errorres
					error = true;
					verificaError(indexInput);
					e = e + 1;
					arregloError.push(indexInput);
				//	valueZona = arrayZonas[i].value;
			}else{
				verificaError(indexInput);
				error = false;
			}

		}
	} 
}
</script>

</head>

<body>
<div id="main-content">
<form:form id="reporteForm" 	class="cmxform" action="" method="post" commandName="0bjetivoSeleccionDTO"
	modelAttribute="0bjetivoSeleccionDTO">





	<input type="hidden" name="idCiclo" id="idCiclo" value="${cicloSelect}">
	<input type="hidden" name="idPeriodo" id="idPeriodo">

	<CENTER>
	<table style="margin-left: 50px; margin-right: 50px;">
		<tr>
			<td>
				 <!--Aca se verifica si si viene de alta o de modificacion de los objetivos
				para incluir los jsp, correpondientes 
				 -->
				  <c:choose>
					<c:when test="${isAltaObjetivoSeleccion}">
						<jsp:include page="altaObjetivoSeleccion.jsp"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="modificarObjetivoSeleccion.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>
			</td>
		</tr>

	</table>
	</CENTER>
</form:form>
</div>
</body>
</html>