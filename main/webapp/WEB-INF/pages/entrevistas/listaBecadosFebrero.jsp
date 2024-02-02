<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<%@page import="java.util.ArrayList"%>
<%@page import="org.cimientos.intranet.web.controller.Conexion"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Espacio de acompañamiento</title>

<style type="text/css">
	input[name=search_browser]{	
		font-size: x-small;
		width: 80px;
		color: gray;
		font-style: italic; 
	}
	
	table#laTabla{
		 background-color: #C0C2FF;
		 border: 0;
	}
</style>

<script type="text/javascript">

var oTable2;
var selected =  new Array();
var asInitVals = new Array();

$(document).ready(function() {
	$('#becadosForm').submit( function() {
		var selected = fnGetIdsOfSelectedRows(fnGetSelected(oTable2));
		jQuery("#alumnosSeleccionados").val(selected);
		if(selected == ""){
			alert("Debe seleccionar al menos un alumno");
			return false;
		}
		else
			return true;
	} );

	
	 oTable2 = $('#tablaBecados').dataTable({
		"oLanguage": {
		"sLengthMenu": 'Mostrar <select>'+
		'<option value="10">10</option>' +
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
		"iDisplayLength": 100,
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
		       		null
		       		]
		                    		
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
       $('#tablaBecados').delegate('tr', 'click', function(event) {
             if ( $(this).hasClass('row_selected') )
                        $(this).removeClass('row_selected');
             			
                  else
                        $(this).addClass('row_selected');
            });
			
		
		function fnGetSelected(oTableLocal) {
		    var aReturn = new Array();

		    // fnGetNodes es una funcion predefinida de DataTable 
		    // aTrs == array de filas de la tabla
		    var aTrs = oTableLocal.fnGetNodes();

		    // Se guardan todos los TR con class 'row_selected' en un array
		    for (var i = 0; i < aTrs.length; i++) {
		        if ($(aTrs[i]).hasClass('row_selected')) {
		            aReturn.push(aTrs[i]);
		        }
		    }

		    return aReturn;
		}

		// Esta funcion recupera el valor de la columna hidden de la tabla 
		//(en la que esta el id)
		function fnGetIdsOfSelectedRows(oSelectedRows) {
		    var aRowIndexes = new Array();
		    var aRowData = new Array();
		    var aReturn = new Array();

		    aRowIndexes = oSelectedRows;    

		    // Se recorren las filas seleccionadas y se crea un arreglo 
		    //delimitado por comas de los ids que se envian al controller para procesarlos
		    for(var i = 0; i < aRowIndexes.length; i++){
		        // fnGetData es una funcion predefinida de DataTable
		        // Se obtienen los datos de la fila con index i
		        aRowData = oTable2.fnGetData(aRowIndexes[i]);

		        //Se guardan los valores cocatenados en un array
		        aReturn.push(aRowData[0]);
		    }

		    return aReturn;
		}

} );


</script>
<script type="text/javascript">
	function enviarForm(action, id){
		
		if(action=='lista'){
			document.forms['becadosForm'].action = "../entrevistas/registrarEntrevistasView.do?tipo=fe";
		//else if(action=='listaEntrevista'){
		//	document.forms['becadosForm'].action = "../entrevistas/modificarEntrevistaFebreroView.do?entrevistaId=8552448&tipoEntrevistaId=4";	
		} else if(action=='boletin'){
			document.forms['becadosForm'].action = "../entrevistas/registrarBoletinView.do";
			//document.forms['becadosForm'].action = action="<c:url value='../becadosPorEa/modificarDatosBoletin.jsp' />";
		}else if(action=='alta'){
		
			document.forms['becadosForm'].action = "../entrevistas/registrarEntrevistasView.do?tipo=m";
			
		}else if(action=='pagos'){
			document.forms['becadosForm'].action = "../entrevistas/listaPagosView.do";
		}
		
		document.forms['becadosForm'].idAlumno.value = id;
		document.forms['becadosForm'].submit();
	}
	
	
	function modificarEntrevistaFebrero(entrevistaId){
		accion="../entrevistas/modificarEntrevistaFebreroView.do?entrevistaId="+entrevistaId+"&tipoEntrevistaId=4";
		
		document.forms['becadosForm'].action = accion;
		document.forms['becadosForm'].submit();
		
		
	}	
</script>

<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.alerts.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/validador.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery-ui-1.8.5.custom.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.datepicker-es.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.validate.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.tabs.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.draggable.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.effects.core.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.position.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.widget.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/jquery.ui.accordion.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/jquery.dataTables.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/ColVis.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/js/TableTools.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/ZeroClipboard/ZeroClipboard.js"/>"></script>
<script type="text/javascript"
	src="<c:url  value="/static/js/table/tabletools/js/TableTools.min.js"/>"></script>
<link rel="stylesheet"
	href="<c:url  value="/static/css/styles.css"/>" media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/table.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/jquery.ui.accordion.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/cimientos/jquery-ui-1.8.5.custom.css"/>" media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/blitzer/jquery-ui-1.8.5.custom.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/ui-lightness/jquery-ui-1.8.5.custom.css"/>" media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/css/ui-lightness/jquery.alerts.css"/>"	media="all">
<link rel="stylesheet"
	href="<c:url  value="/static/js/table/tabletools/css/TableTools.css"/>"	media="all">
	
</head>
<body style="font-size: 14px;">
<div id="main-content">
<form id="becadosForm" class="becadosForm" action="<c:url value='/entrevistas/registrarEntrevistaGrupalView.do' />" method="post">
	<sql:query var="carsList" dataSource="jdbc/cimientos_prod">
        select e.perfil_alumno,(select zona_cimientos.id from zona_cimientos,escuela where zona_cimientos.id=escuela.zona_cimientos_id and escuela.id=e.escuela_alumno) as zona_id,(select zona_cimientos.nombre from zona_cimientos,escuela where zona_cimientos.id=escuela.zona_cimientos_id and escuela.id=e.escuela_alumno) as zona_nombre,(select concat(persona.apellido, ' ', persona.nombre) from persona where e.perfil_alumno=persona.perfil_alumno) as becado,(select persona.dni from persona where e.perfil_alumno=persona.perfil_alumno) as dni,(select escuela.nombre from escuela where escuela.id=e.escuela_alumno) as escuela,(select anio_escolar.anio_escolar from anio_escolar where anio_escolar.id_anio=e.anio_escolar) as anio_escolar,(select anio_escolar.id_anio from anio_escolar where anio_escolar.id_anio=e.anio_escolar) as anio,(select entrevista.id from entrevista where entrevista.perfil_alumno=e.perfil_alumno and entrevista.periodo_de_pago=2) as entrevista_febrero, (select entrevista.estado_entrevista from entrevista where entrevista.perfil_alumno=e.perfil_alumno and entrevista.periodo_de_pago=2) as estado_entrevista_febrero, (select entrevista.dir_mail from entrevista where entrevista.perfil_alumno=e.perfil_alumno and entrevista.periodo_de_pago=365) as mail, (select entrevista.celular from entrevista where entrevista.perfil_alumno=e.perfil_alumno and entrevista.periodo_de_pago=365) as celular from entrevista e, perfil_alumno pf where e.ea=${idEA} and e.periodo_de_pago=365 and e.perfil_alumno=pf.id and pf.estado_alumno<>4
    </sql:query> 
    
    <center>
		<table>
			<tr>
				<td style="vertical-align: middle;" align="center">
					<!-- Titulo de la Tabla -->
					<div class="ui-state-default ui-corner-all" align="center">
						<h3 align="center">Panel de Control EA - Encuentro adicional Febrero</h3>
					</div>
					<!-- Fin titulo -->
					<table class="dataTables_wrapper" width="102px" border="0" id="tablaBecados" style="background-color: #C0C2FF" cellspacing="1"> 	
						<thead align="center">
							<tr>
								<th>id</th>
								<th>Zona</th>
								<th>Alumno</th>
								<th>Foto</th>
								<th>DNI</th>
								<th>Escuela</th>
								<th>Año Escolar</th>
								<th>Generar Entrevista</th>										
							</tr>
							<tr>
								<c:forEach begin="0" end="4" var="loop">
									<td><input name="search_browser" value="Buscar" class="search_init"/></td>
								</c:forEach>
							</tr>
						</thead>
			 			<tbody>
							 <c:forEach var="car" items="${carsList.rows}">
				                    <tr>
				                        <td><c:out value="${car.perfil_alumno}" /></td>
				                        <td><c:out value="${car.zona_nombre}" /></td>
				                        <td nowrap="nowrap"><c:out value="${car.becado}" /></td>
				                        <td></td>
				                        <td><c:out value="${car.dni}" /></td>
				                        <td nowrap="nowrap"><c:out value="${car.escuela}" /></td>
				                        <td><c:out value="${car.anio_escolar}" /></td>
				                        <td align="center">                        
					                        <c:if test="${car.entrevista_febrero==null}">
									    			<a href="javascript:enviarForm('lista',${car.perfil_alumno})" >
													<img src="<c:url value='/static/images/iconos/red_light.png'></c:url>" width="15px" title='Sin crear'></a>
									    	</c:if>
									    	<c:if test="${car.estado_entrevista_febrero==0}">					    			
								    				<a href="javascript:modificarEntrevistaFebrero(${car.entrevista_febrero})" >
													<img src="<c:url value='/static/images/iconos/yellow_light.png'></c:url>" width="15px" title='En construcción' ></a>	
									    	</c:if>
									    	<c:if test="${car.estado_entrevista_febrero==2}">					    	
									    			<a href="javascript:modificarEntrevistaFebrero(${car.entrevista_febrero})" >
													<img src="<c:url value='/static/images/iconos/green_light.png'></c:url>" width="15px" title='Finalizada'></a>
											</c:if>
				                        </td>
				                    </tr>
				                </c:forEach>
    						</tbody>
			            </table>
       				</td>
       			</tr>
       		</table>
       </center>
       
	
	
		
	<input type="hidden" name="idAlumno" />
	<input type="hidden" id="alumnosSeleccionados" name="alumnosSeleccionados"/>
</form>
</div>
</body>
</html>