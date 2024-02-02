<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="springl" uri="http://www.springframework.org/tags" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
<c:if test="${!empty evento.id && !empty idEa}">
	..:: Modificar
</c:if> 
<c:if test="${empty evento.id}">
	..:: Alta de
</c:if> 
<c:if test=""></c:if>
Evento Gen&eacute;rico ::..
</title>
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
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>"	media="all">
<script type="text/javascript" src="<c:url  value="/static/js/jquery.validate.js"/>"></script>	
<script type="text/javascript">
function chequearLongitud(obj){
	if (obj.value.length > 10000) {
	obj.value = obj.value.substring(0, 10000);
	}
}
	$(document).ready(function(){
		$("#altaEvento").validate();
		$('#fechaEvento').datepicker({
			changeMonth: true,
			changeYear: true,
		 	yearRange:'-1:+1'
		});
	});	
	
</script>
<script type="text/javascript">
$(function() {
	$("#lugarEncuentro").autocomplete({
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
							label: item.nombre,
							value: item.nombre,
							id: item.id,
							zona: item.zona
						}
					}))
				}
			})
		},
		minLength: 2,
		select: function(event, ui) {
			$("#idEscuela").val(ui.item.id);
			$("#zona").text(ui.item.zona);
		}
	});
});
</script>

<script type="text/javascript">
var oTable2;
var selected =  new Array();
var asInitVals = new Array();

$(document).ready(function() {
	$('#altaEvento').submit( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable2));

		jQuery("#becados").val(selected);
		jQuery("#responsables1").val(responsables1);
		jQuery("#vinculos1").val(vinculos1);
		jQuery("#responsables2").val(responsables2);
		jQuery("#vinculos2").val(vinculos2);
		jQuery("#chekConvocados").val(chekConvocados);
		jQuery("#chekAsistio").val(chekAsistio);
		jQuery("#obser").val(obser);
		
		if(selected == ""){
			alert("Debe seleccionar al menos un evento");
			return false;
		}
		else
			return true;
	} );

	
	 oTable2 = $('#laTabla').dataTable({
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="25">25</option>' +
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
		"sDom": '<"H"l>rt<"F"ip>',
		"aoColumns" : [
					/* idCandidato */{
						"bSortable" : false,
						"bSearchable" : false,
						"bVisible": false
					},
					null,
					null,
		       		null,
		       		null,
		       		null,
		       		null,
		       		null,
		       		null]
		                    		
	});
	
	 $("thead input").keyup( function () {
			/* Filter on the column (the index) of this element */
			oTable2.fnFilter( this.value, $("thead input").index(this)+1 );
		} );
		
		$("thead input").each( function (i) {
			asInitVals[i] = this.value;
		} );
		
		$("thead input").focus( function () {
			if ( this.className == "search_init" )
			{
				this.className = "";
				this.value = "";
			}
		} );
		
		$("thead input").blur( function (i) {
			if ( this.value == "" )
			{
				this.className = "search_init";
				this.value = asInitVals[$("thead input").index(this)];
			}
		} );

		jQuery('thead select').change( function() {
		select_val = jQuery(this).val();
			if (select_val == "All" || select_val == '') {
				oTable2.fnFilter("");
				oTable2.fnDraw();
			} else {
				oTable2.fnFilter(select_val);
			}
			jQuery('thead select').val(select_val);
		});

		
		/* Agrega el manejador del evento click en las filas */
       $('#laTabla').delegate('tr', 'click', function(event) {
             if ( $(this).hasClass('row_selected') )
                        $(this).removeClass('row_selected');
            
            });
			
		
		function fnGetSelected(oTableLocal) {
		    var aReturn = new Array();

		    // fnGetNodes es una funcion predefinida de DataTable 
		    // aTrs == array de filas de la tabla
		    var aTrs = oTableLocal.fnGetNodes();

		    // Se guardan todos los TR con class 'row_selected' en un array
		    for (var i = 0; i < aTrs.length; i++) 
			{
				
		      	aReturn.push(aTrs[i]);
		    }

		    return aReturn;
		}

		
		// Esta funcion recupera el valor de la columna hidden de la tabla 
		//(en la que esta el id)
		function fnGetIdsOfSelectedRows(oSelectedRows) 
		{
		    var aRowIndexes = new Array();
		    var aRowData = new Array();
		    var aReturn = new Array();
		    responsables1 = new Array();
		    vinculos1 = new Array();
		    responsables2 = new Array();
		    vinculos2 = new Array();
		    chekConvocados = new Array();
		    chekAsistio = new Array();
		    obser = new Array();
		    aRowIndexes = oSelectedRows;    

		    // Se recorren las filas seleccionadas y se crea un arreglo 
		    //delimitado por comas de los ids que se envian al controller para procesarlos
		    for(var i = 0; i < aRowIndexes.length; i++)
			{
		        // fnGetData es una funcion predefinida de DataTable
		        // Se obtienen los datos de la fila con index i
		        aRowData = oTable2.fnGetData(aRowIndexes[i]);
				
				var valor = $('#becado', aRowIndexes[i]).val();
		        var respo1 = $('#responsable1', aRowIndexes[i]).val();
		        var vinc1 = $('#vinculo1', aRowIndexes[i]).val();
		        var respo2 = $('#responsable2', aRowIndexes[i]).val();
		        var vinc2 = $('#vinculo2', aRowIndexes[i]).val();
		        var convocado = $('#convocado', aRowIndexes[i]).is(':checked');
		        var asiste = $('#asistio', aRowIndexes[i]).is(':checked');
		        var obs = $('#obs', aRowIndexes[i]).val();

		        respo1 = respo1.replace(",","");
		        responsables1.push(respo1);
				vinculos1.push(vinc1);
				respo2 = respo2.replace(",", "");
				responsables2.push(respo2);
				vinculos2.push(vinc2);
				chekConvocados.push(convocado);
				chekAsistio.push(asiste);
				obser.push(obs);
				aReturn.push(valor);
		    }
		    return aReturn;
		}

} );


</script>
</head>
<body>
<form:form modelAttribute="evento" name="altaEvento" id="altaEvento" commandName="evento" cssClass="cmxform"
	method="post" action="guardarEventoGenerico.do">
<div id="main-content">
	<form:hidden path="id"/>
	<form:hidden id="idEA" path="ea.idPerfilEA"/>
	<form:hidden id="idPersona" path="ea.datosPersonales.id"/>
	<form:hidden id="nombre" path="ea.datosPersonales.nombre"/>
	<form:hidden id="apellido" path="ea.datosPersonales.apellido"/>
	<form:hidden id="idRr" path="ea.rr.idPerfilRR"/>
	
	<h1><c:if test="${!empty evento.id && !empty idEa}">Modificar</c:if>
	<c:if test="${!empty evento.id && !empty idRr}">Aprobar</c:if>
		<c:if test="${empty evento.id}">Alta de</c:if>
		&nbsp;Evento Gen&eacute;rico</h1>
		
    	<table border="0" align="left" cellpadding="0" cellspacing="0" id="table-forms">
		<tr>
		<td width="180">Encargado Acompañamiento</td>
		<td width="600">${evento.ea.datosPersonales.apellido}, ${evento.ea.datosPersonales.nombre}</td>
		</tr>
		
		<tr>
		<td>Responsable Regional</td>
		<td >${evento.ea.rr.datosPersonales.apellido}, ${evento.ea.rr.datosPersonales.nombre}</td>
		</tr>
		
		<tr>
		<td>Fecha Carga del Evento</td>
		<td>	
			<input type="hidden" name="fechaCarga" value="<fmt:formatDate value="${evento.fechaCarga}" pattern="dd/MM/yyyy" />"/>	
			<fmt:formatDate value="${evento.fechaCarga}" pattern="dd/MM/yyyy" />
		</td>		
		</tr>
		
		<tr>
		<td >Fecha del Evento *</td>
		<td >	
		<input name="fechaEvento" id="fechaEvento" value="<fmt:formatDate value="${evento.fechaEvento}" pattern="dd/MM/yyyy"/>" class="required"/> 	
		</td>		
		</tr>
		
		<tr>
		<td >Lugar de Encuentro *</td>
		<td >
			<input type="text" id="lugarEncuentro" name="lugarEncuentro" value="${evento.lugarEncuentro.nombre}" class="required" >
			<input name="idEscuela" id="idEscuela" value="${evento.lugarEncuentro.id}" type="hidden">
<!--			<form:input path="lugarEncuentro" autocomplete=""/>-->
<!--			<input name="idEscuela" id="idEscuela" value="${evento.lugarEncuentro.id}" type="hidden">-->
<!--			-->
		</td>
		</tr>
		<tr>
			<td>
				<b>Otros Participantes:</b><br>
				
					
					<c:if test="${op1=='RA'}">
						<input type="checkbox" name="op1" id="op1" value="RA" checked="checked"> RA<br>
					</c:if>
					<c:if test="${op1==null}">
						<input type="checkbox" name="op1" id="op1" value="RA"> RA<br>
					</c:if>							
					<c:if test="${op2=='Invitado Externo'}">
						<input type="checkbox" name="op2" id="op2" value="Invitado Externo" checked="checked"> Invitado Externo<br>
					</c:if>
					<c:if test="${op2==null}">
						<input type="checkbox" name="op2" id="op2" value="Invitado Externo"> Invitado Externo<br>
					</c:if>
					<c:if test="${op3=='Referentes Escolares'}">
						<input type="checkbox" name="op3" id="op3" value="Referentes Escolares" checked="checked"> Referentes Escolares<br>
					</c:if>
					<c:if test="${op3==null}">
						<input type="checkbox" name="op3" id="op3" value="Referentes Escolares" > Referentes Escolares<br>
					</c:if>
					<c:if test="${op5=='Padrinos'}">
						<input type="checkbox" name="op5" id="op5" value="Padrinos" checked="checked"> Padrinos<br>
					</c:if>
					<c:if test="${op5==null}">
						<input type="checkbox" name="op5" id="op5" value="Padrinos" > Padrinos<br>
					</c:if>
					<c:if test="${op6=='Referentes Escolares'}">
						<input type="checkbox" name="op6" id="op6" value="Egresados" checked="checked"> Egresados<br>
					</c:if>
					<c:if test="${op6==null}">
						<input type="checkbox" name="op6" id="op6" value="Egresados" > Egresados<br>
					</c:if>
					<c:if test="${op4=='Otro'}">
						<input type="checkbox" name="op4" id="op4" value="Otro" checked="checked"> Otro
					</c:if>
					<c:if test="${op4==null}">
						<input type="checkbox" name="op4" id="op4" value="Otro" > Otro
					</c:if>
			</td>
		</tr>	
		<tr>
			<td><b>Indicar Otro Participante</b>	
				<input type="text" name="op" id="op" value="${op}">
			</td>
		</tr>
		
		<tr>
		<td>Zona</td>
		<td>
		<label  id="zona">${evento.lugarEncuentro.localidad.zona.nombre}</label> 
		</td>
		</tr>		

		<tr>
		<td >Tipo de Encuentro *</td>
		<td >
			<form:select path="tipoEvento" cssClass="required"> 
				<form:option value="">Seleccione tipo de evento</form:option>
				<form:options items="${tiposEvento}" itemLabel="valor" itemValue="id" />
			</form:select>
				<input id="tipoEvento" type="hidden" value="${evento.tipoEvento.id}"/>
				
				<input id="contenidos" type="hidden" value="${evento.contenidosAbordados}"/>		
		</td>
		</tr>
		<tr>
		<td valign="top">Objetivo del encuentro y temas desarrollados</td>
		<td >		
		<form:textarea id="otroContenidoAbordado" path="otroContenidoAbordado" rows="5" cssStyle="text-input" onkeypress="chequearLongitud(this);" 
		 onblur="chequearLongitud(this);" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>	
		<tr>
		<td valign="top">Evaluación General del Encuentro</td>
		<td >
			<form:select path="evaluacionEncuentro" cssClass="required"> 
				<form:options items="${evaluaciones}" itemLabel="valor" itemValue="id" />
			</form:select>
				<input id="evaluacionEncuentro" type="hidden" value="${evento.evaluacionEncuentro.id}"/>		
		</td>
		</tr>
		
		<tr>
		<td valign="top">Observaciones</td>
		<td >		
		<form:textarea path="observaciones" rows="5" cssStyle="text-input" onkeypress="chequearLongitud(this);" onblur="chequearLongitud(this);" cssErrorClass="text-input form-error-field"/>
		</td>
		</tr>
		
		<c:if test="${!empty ea}">   	
		<tr>		
			<td>Paga Entrevista</td>
			<td>
				<form:checkbox path="pagaEntrevista" checked="checked"/>
			</td>
		</tr>
		</c:if>
		
		<tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      	</tr>

		<tr>
		<!-- td >Convocados</td-->
		<td colspan="2" >		
			<!-- div  style= width:0.5cm class="ui-state-default ui-corner-all" > 
				<a onclick="openListaConvocados();"> 
				<span class="ui-icon ui-icon-search" title="Lista Convocados"> 
				</span></a>				
			</div-->
<div id="dialogConvocados" title="Convocados">
<h1>Listado de Convocados</h1>
<table style="margin-left: 5px; margin-right: 5px;"  width="650px">
<tr >
<td >
	<table align="center"  class="dataTables_wrapper" id="laTabla" width="650px" border="0"> 
				<thead align="center">
					<tr>
						<th></th>
						<th>Becado</th>
						<th>Responsable1</th>
						<th>Vinculo1</th>
						<th>Responsable2</th>
						<th>Vinculo2</th>
						<th>Convocado</th>									
						<th>Asisti&oacute;</th>
						<th>Observaciones</th>
					</tr>
				</thead>
				<tbody align="center">
						<c:forEach items="${evento.convocados}" var="asistencia"  varStatus="status">
						<tr>
						<td align="center" valign="top"><input type="hidden" name="convocados[${status.index}].becado.id" value="<c:out value="${asistencia.becado.id}"/>"/></td>
						<td align="center" valign="top" nowrap="nowrap"><input type="hidden" id="becado" name="convocados[${status.index}].becado.id" value="<c:out value="${asistencia.becado.id}"/>"/>${asistencia.becado.datosPersonales.apellido}, ${asistencia.becado.datosPersonales.nombre}</td>
						<td align="center" valign="top" ><input  type="text" id="responsable1" name="convocados[${status.index}].responsable1" value="<c:out value="${asistencia.responsable1}"/>"/></td>
						<td align="center" valign="top" ><input type="text" size="10" id="vinculo1" name="convocados[${status.index}].vinculo1" value="<c:out value="${asistencia.vinculo1}"/>"/></td>
						<td align="center" valign="top" ><input type="text" id="responsable2" name="convocados[${status.index}].responsable2" value="<c:out value="${asistencia.responsable2}"/>"/></td>
						<td align="center" valign="top" ><input type="text" size="10" id="vinculo2" name="convocados[${status.index}].vinculo2" value="<c:out value="${asistencia.vinculo2}"/>"/></td>
						<c:if test="${empty evento.id}">
						<td align="center" valign="top" >
							<input type="checkbox" id="convocado" name="convocados[${status.index}].convocado"/>
						</td>
						</c:if>
						<c:if test="${!empty evento.id}">
						<td align="center" valign="top" >
							<c:if test="${asistencia.convocado == true}">
								<input type="checkbox" id="convocado" checked="checked" name="convocados[${status.index}].convocado"/>
							</c:if>
							<c:if test="${asistencia.convocado == false}">
								<input type="checkbox" id="convocado"  name="convocados[${status.index}].convocado"/>
							</c:if>
						</td>
						</c:if>
						
						<c:if test="${empty evento.id}">
						<td align="center" valign="top" >
							<input type="checkbox" id="asistio" name="convocados[${status.index}].asistenciaAlumno"/>
						</td>
						</c:if>
						<c:if test="${!empty evento.id}">
						<td align="center" valign="top" >
							<c:if test="${asistencia.asistenciaAlumno == true}">
								<input type="checkbox" id="asistio" checked="checked" name="convocados[${status.index}].asistenciaAlumno"/>
							</c:if>
							<c:if test="${asistencia.asistenciaAlumno == false}">
								<input type="checkbox" id="asistio"  name="convocados[${status.index}].asistenciaAlumno"/>
							</c:if>
						</td>
						</c:if>
<!--						<td align="center" valign="top" ><form:checkbox id="asistio" path="convocados[${status.index}].asistenciaAlumno" /></td>-->
						<td align="center" valign="top"><form:textarea id="obs" rows="2" path="convocados[${status.index}].observaciones" onkeypress="chequearLongitud(this);"></form:textarea></td>
						
						
						</tr>
						</c:forEach>
						
			</tbody>
		</table>
</td>
</tr>

</table>
</div>			
		</td>
		</tr>
		<tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      	</tr>
      	<tr>
        <td>&nbsp;</td>
     	   <td>&nbsp;</td>
      	</tr>		
	
       <tr>
        <td colspan="2">
        <table width="900" border="0" align="left" cellpadding="0" cellspacing="0" id="table-botons-small">
          <tr>
          <c:if test="${!empty evento.convocados}"> 
		    <td width="50" height="0" align="center" valign="middle"><input type="submit" value="Guardar" class="ui-state-default ui-corner-all" /></td>
		  </c:if> 
		    <td width="50" height="0" align="center" valign="middle"><input type="button" value="Cancelar" class="ui-state-default ui-corner-all"	onclick="location.href='../eventoGenerico/listaEventosGenericos.do'; return false;"/></td>
		   </tr>	
</table>
</td>
</tr>
</table>
</div>
<input type="hidden" name="becados" id="becados"/>
<input type="hidden" name="responsables1" id="responsables1"/>
<input type="hidden" name="vinculos1" id="vinculos1"/>
<input type="hidden" name="responsables2" id="responsables2"/>
<input type="hidden" name="vinculos2" id="vinculos2"/>
<input type="hidden" name="chekConvocados" id="chekConvocados"/>
<input type="hidden" name="chekAsistio" id="chekAsistio"/>
<input type="hidden" name="obser" id="obser"/>
</form:form>
</body>
</html>