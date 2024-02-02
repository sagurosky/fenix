<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Estado de Pago de Entrevistadores</title>
<script type="text/javascript">
$(document).ready(function() {
	$('#tabla').dataTable( {
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
		"iDisplayLength": 25
	});
	});
</script>

  <script>
  $(document).ready(function() {
    $("#inicio").datepicker();
    $("#inicio").datepicker( "option", "dateFormat", 'yy-mm-dd' );
    $("#inicio").datepicker( "option", "monthNames", ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'] );
    $("#inicio").datepicker( "option", "dayNames", ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']);
    $("#inicio").datepicker( "option", "dayNamesMin", ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'] );
    $("#inicio").datepicker( "option", "dayNamesShort", ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'] );
    $("#inicio").datepicker( "option", "monthNamesShort", ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'] );
  });
  </script>
  <script>
  $(document).ready(function() {
	$("#fin").datepicker();
	$("#fin").datepicker( "option", "dateFormat", 'yy-mm-dd' );
	$("#fin").datepicker( "option", "monthNames", ['Enero','Febrero','Marzo','Abril','Mayo','Junio','Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'] );
	$("#fin").datepicker( "option", "dayNames", ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado']);
	$("#fin").datepicker( "option", "dayNamesMin", ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sa'] );
	$("#fin").datepicker( "option", "dayNamesShort", ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'] );
	$("#fin").datepicker( "option", "monthNamesShort", ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'] );
	  });
 
  </script>
<style type="text/css">
label { width: 10em; float: left; }
label.error { float: none; color: red; padding-left: .5em; vertical-align: top; }
p { clear: both; }
.submit { margin-left: 12em; }
em { font-weight: bold; padding-right: 1em; vertical-align: top; }
</style>
  <script>
  $(document).ready(function(){
    $("#form").validate();
  });
  </script>

</head>
<body>
<div id="main-content">
<br></br>
<center><h1>Reporte de Estado de Pago de Entrevistadores</h1></center>
<br><br>
<form method="post" id="form" action="<c:url value='/pago/listaPagoEntrevistadores.do'></c:url>">
	<table align="center">
		<tr align="center">
			<td class="inicio" align="center" style="font-size: 14px; font-weight: bold">Desde</td>
			<td align="center"><input type="text" id="inicio"  style="z-index: 999999999" name="fechaInicio" ></input></td>
			<td>
				&nbsp;
				&nbsp;
			</td>
			<td align="center" class="fin" style="font-size: 14px; font-weight: bold">Hasta</td>
			<td align="center"><input type="text" id="fin"  style="z-index: 999999999"  name="fechaFin" ></input></td>
			<td>
				&nbsp;
				&nbsp;
			</td>
			<td align="center"><input class="ui-state-default ui-corner-all " type="submit" value="Buscar"></input></td>
		</tr>
	</table>
<br><br>
<CENTER>
<table style="margin-left: 50px; margin-right: 50px;">
<tr >
<td >
<table align="center"  class="dataTables_wrapper" id="tabla" width="100%" border="0" style="background-color: #C0C2FF">
<thead title="Reporte de Estado de Pago de Entrevistadores">
	<tr align="center">
		<th>EA</th>
		<th>Periodo</th>
		<th>Monto</th>
		<th>Estado de Pago</th>
	</tr>
	
</thead>
<tbody>
		
  		<c:if test="${!empty listaPagoEntrevistadores}">
			<c:forEach items="${listaPagoEntrevistadores}" var="pago">
			<tr align="left">
					<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px; ">&nbsp;${pago.ea.datosPersonales.apellido},&nbsp;${pago.ea.datosPersonales.nombre}&nbsp;</td>
					<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px; ">&nbsp;${pago.periodo.nombre}&nbsp;</td>
					<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px">&nbsp;${pago.monto}&nbsp;</td>
					<td align="center" nowrap="nowrap" valign="top" style="font-size: 14px">&nbsp;${pago.estadoPago.valor}&nbsp;</td>					
					
					
			</tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty listaPagoEntrevistadores}">
		<tr>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				<td><c:out value=""/></td>
				
		</tr>
		</c:if>
	</tbody>
</table>
</td>
</tr>
</table>
</CENTER>
</form>
</div>
</body>
</html>